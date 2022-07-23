/**
  *********************************************************************************
  * @file    	    usb_core.c
  * @author  	    FMD AE
  * @brief   		This file contains  functions for the USB firmware	
  * @version 	    V1.0.0           
  * @data		    2022-01-13
  *********************************************************************************
  * @attention
  * COPYRIGHT (C) 2021 Fremont Micro Devices Corporation All rights reserved.
  *    This software is provided by the copyright holders and contributors,and the
  *software is believed to be accurate and reliable. However, Fremont Micro Devices
  *Corporation assumes no responsibility for the consequences of use of such
  *software or for any infringement of patents of other rights of third parties,
  *which may result from its use. No license is granted by implication or otherwise
  *under any patent rights of Fremont Micro Devices Corporation.
  *  ******************************************************************************
  */

/* Includes ----------------------------------------------------------------------*/
#include "usb_core.h"

#include "ListUsbData.h"

/* Private Constant --------------------------------------------------------------*/
/* Public Constant ---------------------------------------------------------------*/
/* Private typedef ---------------------------------------------------------------*/

// Endpoint 0 status structure
typedef struct  
{
  int   nState;    							/* IDLE/RX/TX */
  int   nBytesLeft;							/* Number of bytes left to send in TX mode */
  void *pData;     							/* Pointer to data to transmit/receive */
  int   nBytesRecv;							/* Number of bytes received in RX mode */
  BYTE  byFAddr;   							/* New function address */
} M_EP0_STATUS;
typedef M_EP0_STATUS*  PM_EP0_STATUS;




extern int b_config;
static uint8_t usbIrqStatus;

// KH Tsai NOTE: Interrupt Enable, for M0
void localIrqEnable(void) {
	NVIC_InitTypeDef NVIC_InitStructure;

	usbIrqStatus = 1;

	  NVIC_InitStructure.NVIC_IRQChannel = USB_IRQn;
  NVIC_InitStructure.NVIC_IRQChannelPriority = 0;
  NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
  NVIC_Init(&NVIC_InitStructure);

}


void localIrqDisable(void) {
	NVIC_InitTypeDef NVIC_InitStructure;

		  NVIC_InitStructure.NVIC_IRQChannel = USB_IRQn;
  NVIC_InitStructure.NVIC_IRQChannelPriority = 0;
  NVIC_InitStructure.NVIC_IRQChannelCmd = DISABLE;
  NVIC_Init(&NVIC_InitStructure);
    usbIrqStatus = 0;
}

void startCriticalSection(void) {
    if(usbIrqStatus) {
        localIrqDisable();
    }
}

void endCriticalSection(void) {
    localIrqEnable();
}


/* Private define ----------------------------------------------------------------*/

/* Private variables -------------------------------------------------------------*/
CLASS_HID_DATA	c_hid_data = {0};
uint8_t 		INCSRDATA;
uint8_t	usb_state = 0;

/* Public variables --------------------------------------------------------------*/

uint32_t	gnDevState = DEVSTATE_DEFAULT;	/* Current device state */

void *gpCurCfg = NULL;						/* Pointer to current configuration descriptor */

PSTD_IF_DSCR	gpCurIf[M_MAXIFS];			/* Pointer to current interface descriptors */

BYTE	gbyCurIfVal[M_MAXIFS];				/* Current alternate interface values */

DEVICE_INFO Device_Info;

DEVICE_INFO *pInformation = &Device_Info;

VarBit	flag1;
uint8_t	ep1_send_buf[64] = {0};

/* Private function prototypes ---------------------------------------------------*/
static void USB_Endpoint0_Command (PM_EP0_STATUS, PCOMMAND);
static void USB_Endpoint0_Tx (PM_EP0_STATUS);
static void USB_StdDev_Req (PM_EP0_STATUS, PCOMMAND);
static uint32_t ConfigureIfs(void);
static void USB_Endpoint0_Rx(PM_EP0_STATUS pep0state);

/* Public function ------ --------------------------------------------------------*/


/******************************************************************************
  * @brief  USB_Init program
  * @param  None
  * @note  
  * @retval None
  *****************************************************************************
*/
void USB_Init(void)
{
  NVIC_InitTypeDef NVIC_InitStructure;

	if(RCC_GetFlagStatus(RCC_FLAG_HSI48RDY) != SET)
	{
		RCC_HSI48Cmd(ENABLE);
		while(RCC_GetFlagStatus(RCC_FLAG_HSI48RDY) != SET);
	}
  RCC_USBCLKConfig(RCC_USBCLK_HSI48);
	RCC_APB1PeriphClockCmd(RCC_APB1Periph_USB,ENABLE);

		
	USB_ITConfig(USB_IT_USB_RESUME_FLAG,ENABLE);
	USB_ITConfig(USB_IT_USB_SUSPEND_FLAG,ENABLE);
	USB_ITConfig(USB_IT_USB_SOF_FLAG,ENABLE);
	USB_ITConfig(USB_IT_USB_RESET_FLAG,ENABLE);
		
  USB_PDCTRLConfig(USB_PDCTRL_PU_ENABLE);
	
  NVIC_InitStructure.NVIC_IRQChannel = USB_IRQn;
  NVIC_InitStructure.NVIC_IRQChannelPriority = 0;
  NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
  NVIC_Init(&NVIC_InitStructure);
	
	RCC_APB1PeriphClockCmd(RCC_APB1Periph_CRS,ENABLE);
	CRS_FrequencyErrorCounterCmd(ENABLE);
	CRS_AutomaticCalibrationCmd(ENABLE);
}

/******************************************************************************
  * @brief  USB_IRQHandler
  * @param  None
  * @note  
  * @retval None
  *****************************************************************************
*/
void USB_IRQHandler(void)
{
	uint8_t usb_intrin = 0,usb_intrusb = 0,usb_introut = 0;
			ListUsbData  *pUsbData;
			uint16 recv_data_len;
	usb_intrin  = USB->INTRIN;									//端点中断标志
	usb_intrusb = USB->INTRUSB;									//USB中断标志RESET、RESUME、SUSPEND、SOF
	usb_introut = USB->INTROUT;
	
	//SEGGER_RTT_printf(0,"USB_IRQHandler ###usb_intrin =0x%02x usb_intrusb =0x%02x ###usb_introut =0x%02x\n",usb_intrin,usb_intrusb,usb_introut);
	if(usb_introut!=0 || usb_intrin!=0)
		{
		//SEGGER_RTT_printf(0,"USB_IRQHandler ###usb_intrin =0x%02x usb_intrusb =0x%02x ###usb_introut =0x%02x\n",usb_intrin,usb_intrusb,usb_introut);
		}
	if(usb_introut!=0)
		{
		   
		 //  SEGGER_RTT_printf(0,"USB_IRQHandler ############################################# usb_introut =0x%02x \n",usb_introut);
		}
	/*Check for resume from suspend mode, Add call to resume routine here */
	if((usb_intrusb & 0x02) != RESET)							//RESUME
	{
		usb_state = USB_RESUME_FLAG;
	}

	if(usb_intrusb & USB_IT_USB_SOF_FLAG)						//SOF
	{
		USB->INTRUSB &= ~0x08;									//sof
		f_sof_flag = 1;
	}
	/* Check for system interrupts */
	if((usb_intrusb &USB_IT_USB_RESET_FLAG) != RESET)
	{
		USB_Reset();
	}

	/* Check for endpoint 0 interrupt */
	if((usb_intrin & USB_IT_IN_EP0_FLAG) != RESET)
	{
//	SEGGER_RTT_printf(0,"USB_Endpoint0(M_EP_NORMAL); 111");
		USB_Endpoint0(M_EP_NORMAL);
	}


	
		

		/* Check for endpoint 5 interrupt */
	if((usb_introut & USB_IT_OUT_EP1_FLAG) != RESET) //huanghanjing
	{
		//USB_EP_Rx(ep_hid_vendor_rx, Vendor_data_Buffer, M_EP_MAXP);
				//SEGGER_RTT_printf(0,"US B_IT_OUT_EP1_FLAG ##   # function=%s line=%d\n",__FUNCTION__,__LINE__);
			recv_data_len = 	USB_EP_Rx(ep_iap2_vendor_rx, Vendor_data_Buffer, M_EP_MAXP);
		pUsbData = (ListUsbData *)malloc(sizeof(ListUsbData));
		pUsbData->pdata = malloc(recv_data_len);
		pUsbData->m_isUsed = 0;
		pUsbData->m_pNext = NULL;
		pUsbData->m_pPre = NULL;
		pUsbData->data_size = recv_data_len;
		

			ListUsbData_AddTail(g_usbdata_list,pUsbData);
		#ifdef _debug_
		//Vendor_data_Buffer[0]++;
		//USB_Transmit_VendorData((uint8_t*)&send, M_EP_MAXP);
		#endif
	}
	
	if((usb_introut & USB_IT_OUT_EP2_FLAG) != RESET) //huanghanjing
	{
	startCriticalSection();
	//SEGGER_RTT_printf(0,"USB_IT_OUT_EP2_FLAG USB_EP_Rx(2 \n");
	recv_data_len = 	USB_EP_Rx(2, Vendor_data_Buffer, M_EP_MAXP);
	//SEGGER_RTT_printf(0,"USB_IT_OUT_EP2_FLAG rr ### function=%s line=%d recv_data_len=%d\n",__FUNCTION__,__LINE__,recv_data_len);
	//for(int i=0;i<recv_data_len;i++)
		//SEGGER_RTT_printf(0,"22 0x%02x ",Vendor_data_Buffer[i]);
		pUsbData = (ListUsbData *)malloc(sizeof(ListUsbData));
		
		//SEGGER_RTT_printf(0,"\n ### function=%s line=%d recv_data_len=%d\n",__FUNCTION__,__LINE__,recv_data_len);
		pUsbData->pdata = malloc(recv_data_len);
		memcpy(pUsbData->pdata,Vendor_data_Buffer,recv_data_len);
	//	SEGGER_RTT_printf(0,"\n ### function=%s line=%d recv_data_len=%d\n",__FUNCTION__,__LINE__,recv_data_len);
		pUsbData->m_isUsed = 0;
		pUsbData->m_pNext = NULL;
		pUsbData->m_pPre = NULL;
		pUsbData->data_size = recv_data_len;
		

			ListUsbData_AddTail(g_usbdata_list,pUsbData);
			endCriticalSection();
	//SEGGER_RTT_printf(0,"\n USB_IT_OUT_EP2_FLAG 222 ### function=%s line=%d recv_data_len=%d\n",__FUNCTION__,__LINE__,recv_data_len);

		#ifdef _debug_
		//Vendor_data_Buffer[0]++;
		//USB_Transmit_VendorData((uint8_t*)&send, M_EP_MAXP);
		#endif
	}
	

	
	/* Check for endpoint 5 interrupt */
	if((usb_introut & USB_IT_OUT_EP5_FLAG) != RESET)
	{
	
	//SEGGER_RTT_printf(0,"USB_IT_OUT_EP2_FLAG ### function=%s line=%d\n",__FUNCTION__,__LINE__);
		USB_EP_Rx(ep_hid_vendor_rx, Vendor_data_Buffer, M_EP_MAXP);
		
		#ifdef _debug_
		//Vendor_data_Buffer[0]++;
		//USB_Transmit_VendorData((uint8_t*)&send, M_EP_MAXP);
		#endif
	}
	
	/* Check for endpoint 7 interrupt */
	if((usb_introut & USB_IT_OUT_EP7_FLAG) != RESET)
	{	
		USB_EP_Rx(7, Vendor_data_Buffer, M_EP_MAXP);
		
		#ifdef _debug_
		Vendor_data_Buffer[0]++;
		USB_EP_Tx(6, Vendor_data_Buffer, M_EP_MAXP);
		#endif
	}

	/* Check for suspend mode */
	/* Add call to suspend routine here*/
	if((usb_intrusb & 0x01) != RESET)
	{
		if(gnDevState > DEVSTATE_ADDRESS)
		{
			usb_state = USB_SUSPEND_FLAG;						//usb suspend
		}
	}
}
/******************************************************************************
  * @brief  USB_Suspend	program
  * @param  None
  * @note  
  * @retval None
  *****************************************************************************
*/
void USB_Suspend(void)
{
	if(usb_state == USB_SUSPEND_FLAG)
	{
		USB->POWER |= 0x01;//允许挂起模块
		
		/*关闭一些时钟省电*/
		
		/*结束*/
		
//		while(USB->POWER & 0x02)								//suspend flag
//		{	
//			GPIOB->ODR ^= GPIO_Pin_2;
////			SysTick_Delay_Ms(500);
//			if(GPIO_ReadInputDataBit(GPIOC,GPIO_Pin_11) == RESET)//按键唤醒
//			{
//				/*remote wakeup*/
//				USB_Remote_Wakeup();
//				
//				f_send_kb = 1;
//				USB->POWER &= ~0x01;							//不允许挂起模块	
//				usb_state = USB_NORMAL;
//			}
//		}
		
		/*重新配置时钟*/	
	}
	else if(usb_state == USB_RESUME_FLAG)						//自动退出suspend
	{
		usb_state = USB_NORMAL;
		/*重新配置时钟*/
	}
}
/******************************************************************************
  * @brief  USB_Reset program
  * @param  None
  * @note  
  * @retval None
  *****************************************************************************
*/
void USB_Reset(void)
{
	M_EPBIN_STATUS  tEpin;
	M_EPBOUT_STATUS tEpout;
	
	/* Set device into default state */
	gnDevState = DEVSTATE_DEFAULT;
//    pInformation->Current_Feature = USB_FSConfigDescriptor[7];
	/* Reset any state machines for each endpoint */
	/* This example assumes 2 bulk IN endpoints with endpoint numbers 1,2, */
	/* and 2 bulk out endpoints with endpoint numbers 1,2 */
	USB_Endpoint0(M_EP_RESET);

	/* Initialise endpoint status structures with endpoint numbers */

	tEpin.byEP = 1;
	tEpin.nBytesLeft = M_EP_NODATA;
	EndpointBulkIn(tEpin, M_EP_RESET);
	
	tEpin.byEP = 2;
	tEpin.nBytesLeft = M_EP_NODATA;
	EndpointBulkIn(tEpin, M_EP_RESET);
	
	tEpin.byEP = 3;
	tEpin.nBytesLeft = M_EP_NODATA;
	EndpointBulkIn(tEpin, M_EP_RESET);
	
	tEpin.byEP = 4;
	tEpin.nBytesLeft = M_EP_NODATA;
	EndpointBulkIn(tEpin, M_EP_RESET);
	
	tEpin.byEP = 6;
	tEpin.nBytesLeft = M_EP_NODATA;
	EndpointBulkIn(tEpin, M_EP_RESET);
	
	//--------------------------------------//
	
	tEpout.byEP = 5;
	tEpout.nBuffLen = M_EP_MAXP;
	tEpout.nBytesRecv = 0;
	EndpointBulkOut(tEpout, M_EP_RESET);
	
	tEpout.byEP = 7;
	tEpout.nBuffLen = M_EP_MAXP;
	tEpout.nBytesRecv = 0;
	EndpointBulkOut(tEpout, M_EP_RESET);
	
	USB->POWER |= 0x01;												//允许挂起模块
}
/******************************************************************************
  * @brief  USB_Remote_Wakeup program
  * @param  None
  * @note  
  * @retval None
  *****************************************************************************
*/
void USB_Remote_Wakeup(void)
{
	USB->POWER |= 0x04;
//	SysTick_Delay_Ms(12);
	USB->POWER &= ~0x04;			
}

/******************************************************************************
  * @brief  EndpointBulkIn program
  * @param  pbistate
  *         nCallState
  * @note   EndpointBulkIn service routine
  *			This routine provides simple handling for bulk in endpoints.
  *			Endpoint MaxP is defined in endpoint.h.
  *			While the nBytesLeft field of the pbostate structure is >= 0
  *			the endpoint will send packets of MaxP, with the residue in the last packet.
  *			If the data to send is an exact multiple of MaxP then a null data packet
  *			will be sent.
  * @retval None
  *****************************************************************************
*/
void EndpointBulkIn(M_EPBIN_STATUS pbistate, int nCallState)
{
	int     nBytes;
	BYTE    byInCSR;

	/* Reset endpoint */
	if(nCallState == M_EP_RESET)
	{
		/*切换端点号*/
		MWRITE_BYTE(M_REG_INDEX, pbistate.byEP);
		/*清除相应端点的数据翻转状态和清空FIFO中要发送的数据*/
		byInCSR = M_INCSR_CDT | M_INCSR_FF;
		MWRITE_BYTE(M_REG_INCSR1, byInCSR);
	}
	else
	{
	
	//SEGGER_RTT_printf(0,"EndpointBulkIn pbistate.nBytesLeft=%d\n",pbistate.nBytesLeft);
		/* Check whether there is any data to send */ 
		if(pbistate.nBytesLeft != M_EP_NODATA)
		{
			/* Determine number of bytes to send */
			if(pbistate.nBytesLeft < M_EP_MAXP)
			{
				nBytes = pbistate.nBytesLeft;
				pbistate.nBytesLeft = M_EP_NODATA;
			}
			else 
			{
				nBytes = M_EP_MAXP;
				pbistate.nBytesLeft -= M_EP_MAXP;
			}
		//	SEGGER_RTT_printf(0,"222 EndpointBulkIn pbistate.nBytesLeft=%d\n",pbistate.nBytesLeft);

			/* Load FIFO */
			FIFOWrite((int)pbistate.byEP, nBytes, pbistate.pData);
			
			//SEGGER_RTT_printf(0,"333 EndpointBulkIn nBytes=%d\n",nBytes);
			pbistate.pData = (BYTE *)pbistate.pData + nBytes;

			MWRITE_BYTE(M_REG_INDEX, pbistate.byEP);
			/*表示要发送的数据已经装入相应端点的FIFO中*/
			byInCSR = M_INCSR_IPR;
			MWRITE_BYTE(M_REG_INCSR1, byInCSR);
		}
	}
}


/******************************************************************************
  * @brief  EndpointBulkOut program
  * @param  pbistate
  *         nCallState
  * @note   EndpointBulkOut service routine
  *			This routine provides simple handling for bulk out endpoints.
  *			Endpoint MaxP is defined in endpoint.h.
  *			It assumes a transfer is complete when a packet of less than MaxP is received.
  * @retval None
  *****************************************************************************
*/
int EndpointBulkOut(M_EPBOUT_STATUS pbostate, int nCallState)
{
	int     nBytes;
	BYTE    byOutCSR;

	/* Reset endpoint */
	if(nCallState == M_EP_RESET)
	{
		/***配置端点号***/
		MWRITE_BYTE(M_REG_INDEX, pbostate.byEP);
		byOutCSR = M_OUTCSR_CDT | M_OUTCSR_FF;
		/***复位端点的数据反转状态,清空接收 FIFO 中的数据***/
		MWRITE_BYTE(M_REG_OUTCSR1, byOutCSR);
	}
	else
	{
		/* Set index register */
		MWRITE_BYTE(M_REG_INDEX, pbostate.byEP);

		/* Read OUT CSR register */
		byOutCSR = MREAD_BYTE(M_REG_OUTCSR1);

		/* Get packet, */
		/* may need to unload more than one packet if double buffering enabled */
		/*端点FIFO 中有数据*/
		while(byOutCSR & M_OUTCSR_OPR)
		{
			/* Get packet size */
			nBytes = (int)MREAD_BYTE(M_REG_OUTCOUNT2);
			nBytes <<= 8;
			nBytes |= (int)MREAD_BYTE(M_REG_OUTCOUNT1);

			/* Check there is room in the buffer */
			if(pbostate.nBytesRecv + nBytes > pbostate.nBuffLen)
			{
				/* Call to function to handle buffer over run */
				MWRITE_BYTE(M_REG_OUTCSR1, 0);
				return nBytes;
			}

			/* Unload FIFO */
			FIFORead((int)pbostate.byEP, nBytes, pbostate.pData);

			/* Update status */
			pbostate.nBytesRecv += nBytes;
			pbostate.pData = (BYTE *)pbostate.pData + nBytes;

			/* Check for end of transfer */
			if (nBytes <= M_EP_MAXP) 
			{
				/* Call function to handle received data */	
			}

			/* Clear OutPktRdy */
			MWRITE_BYTE(M_REG_OUTCSR1, 0);

			/* Check for another packet */
			byOutCSR = MREAD_BYTE(M_REG_OUTCSR1);
		}
	}
	return nBytes;
}

/******************************************************************************
  * @brief  USB_ReadRegister program
  * @param  USB_Refister
  * @note  
  * @retval register value
  *****************************************************************************
*/
uint8_t USB_ReadRegister(uint8_t USB_Refister)
{
    __IO uint32_t tmp = 0;

    /* Check the parameters */
    assert_param(IS_USB_REGISTER(USB_Refister));

    tmp = (uint32_t)USB;
    tmp += USB_Refister;

    /* Return the selected register value */
    return (*(__IO uint8_t *) tmp);	
}
/******************************************************************************
  * @brief  USB_PDCTRLConfig program
  * @param  PDCT
  * @note  
  * @retval None
  *****************************************************************************
*/
void USB_PDCTRLConfig(uint8_t PDCT)
{
    uint8_t temp = 0;

    assert_param(IS_USB_PDCTRL(PDCT));

    temp = USB->PDCTRL;
    temp &= ~USB_PDCTRL_FLAG;
    temp |= PDCT;
    USB->PDCTRL = temp;

}
/******************************************************************************
  * @brief  FIFORead program
  * @param  nEP		Endpoint
  *         pDst	Read data buff
  * @note  
  * @retval None
  *****************************************************************************
*/
void FIFORead(int nEP, int nBytes, void * pDst)		
{
	int     nCount;
	BYTE *  pby;
	int     nAddr;
//	int i;
	//SEGGER_RTT_printf(0,"start FIFORead nBytes = %d nEP=%d\n",nBytes,nEP);

	if(nBytes) 
	{
		nAddr = M_FIFO_EP0+(nEP<<2);
		nCount = nBytes;
		pby = (BYTE *)pDst;
		while(nCount) 
		{

		// SEGGER_RTT_printf(0," 0x%02x ",*pby);
		// i++;
		//if(i==10)
		//	SEGGER_RTT_printf(0,"\n");
			*pby++ = *((BYTE *)nAddr);
			
			nCount--;
			
		}
	}
	
	//SEGGER_RTT_printf(0,"\n  end FIFORead nBytes = %d nEP=%d\n",nBytes,nEP);
}

/******************************************************************************
  * @brief  FIFOWrite program
  * @param  nEP		Endpoint
  *			nBytes	Number byte of data;
  *         pSrc	Write data buff
  * @note  
  * @retval None
  *****************************************************************************
*/
void FIFOWrite(int nEP, int nBytes, void * pSrc)
{
	int     nCount;
	BYTE *  pby;
	int     nAddr;
	int i = 0;
	SEGGER_RTT_printf(0,"start FIFOWrite nBytes = %d nEP=%d\n",nBytes,nEP);
	
	if(nBytes)
	{
		nAddr = M_FIFO_EP0+(nEP<<2);
		nCount = nBytes;
		pby = (BYTE *)pSrc;
		while (nCount)
		{
		 SEGGER_RTT_printf(0," 0x%02x ",*pby);
		 *((BYTE *)nAddr) = *pby++;
		 i++;
		if(i==10)
			SEGGER_RTT_printf(0,"\n");
			nCount--;
		}
	}
	
	SEGGER_RTT_printf(0,"\n end FIFOWrite nBytes = %d nEP=%d\n",nBytes,nEP);
	
}

/******************************************************************************
  * @brief  USB_ITConfig program
  * @param  USB_IT	
  *			NewState	
  * @note  
  * @retval None
  *****************************************************************************
*/
void USB_ITConfig(uint32_t USB_IT, FunctionalState NewState)
{
    __IO uint8_t *tmp = (__IO uint8_t *)USB_BASE;
    uint32_t IT_FLAG = 0;

    assert_param(IS_USB_CONFIG_IT(USB_IT));
    assert_param(IS_FUNCTIONAL_STATE(NewState));

    if(USB_IT & 0x00000100)
    {
      tmp = &USB->INTRINE;
      IT_FLAG = USB_IT & 0xfffffeff;
    }
    else if(USB_IT & 0x00000200)
    {
      tmp = &USB->INTROUTE;
      IT_FLAG = USB_IT & 0xfffffdff;
    }
    else if(USB_IT & 0x00000400)
    {
      tmp = &USB->INTRUSBE;
      IT_FLAG = USB_IT & 0xfffffbff;
    }

    if(NewState != DISABLE)
    {
      *((__IO uint8_t *)tmp) |= (uint8_t)IT_FLAG;
    }
    else
    {
      *((__IO uint8_t *)tmp) &= ~((uint8_t)IT_FLAG);
    }
}
/******************************************************************************
  * @brief  USB_GetITStatus	program
  * @param  USB_IT        
  * @note  
  * @retval ITStatus
  *****************************************************************************
*/
ITStatus USB_GetITStatus(uint32_t USB_IT)
{
    __IO uint8_t *tmp = (__IO uint8_t *)USB_BASE;
    uint8_t tmp_flag = 0;
		uint32_t IT_FLAG = 0;
    ITStatus bitstatus = RESET;

    assert_param(IS_USB_CONFIG_IT(USB_IT));

    if(USB_IT & 0x00000100)
    {
      tmp = &USB->INTRIN;
      IT_FLAG = USB_IT & 0xfffffeff;
    }
    else if(USB_IT & 0x00000200)
    {
      tmp = &USB->INTROUT;
      IT_FLAG = USB_IT & 0xfffffdff;
    }
    else if(USB_IT & 0x00000400)
    {
      tmp = &USB->INTRUSB;
      IT_FLAG = USB_IT & 0xfffffbff;
    }

    tmp_flag = *(__IO uint8_t *)tmp;
    if( (tmp_flag & ((uint8_t)IT_FLAG)) != ((uint8_t)RESET))
    {
      bitstatus = SET;
    }
    else
    {
      bitstatus = RESET;
    }

    return bitstatus;
}

/******************************************************************************
  * @brief  USB_Endpoint0 program
  * @param  nCallState
  * @note  
  * @retval None
  *****************************************************************************
*/
void USB_Endpoint0(int nCallState)
{
	static M_EP0_STATUS	ep0state;
	static COMMAND	cmd;
	BYTE	byCSR0;

	
	//SEGGER_RTT_printf(0,"USB_Endpoint0  xxx nCallState =%d\n",nCallState);
	/* Check for USB reset of endpoint 0 */
	if (nCallState == M_EP_RESET)
	{
		ep0state.nState = M_EP0_IDLE;
		ep0state.byFAddr = 0xFF;
		/* Clear current configuration pointer */
		gpCurCfg = NULL;
		return;
	}

	/* Read CSR0 */
	MWRITE_BYTE(M_REG_INDEX, 0);							//选择endpoint0
	byCSR0 = MREAD_BYTE(M_REG_CSR0);						//读取CSR0，各种通信状态

	/* Check for status stage of a request */
	/*接收已完成状态*/
	if(!(byCSR0 & M_CSR0_OUTPKTRDY)) 
	{
		/* Complete SET_ADDRESS command */
		if(ep0state.byFAddr != 0xFF)
		{
			MWRITE_BYTE(M_REG_FADDR, ep0state.byFAddr);		//如果地址不为FF，reset，地址设置为byFAddr
			if((gnDevState == DEVSTATE_DEFAULT) && ep0state.byFAddr)
			{
			
			//SEGGER_RTT_printf(0,"gnDevState = DEVSTATE_ADDRESS;	 xxx 111\n");
				gnDevState = DEVSTATE_ADDRESS;				//地址不为0，且设备状态为 DEVSTATE_DEFAULT
			}
			else if((gnDevState == DEVSTATE_ADDRESS) && !ep0state.byFAddr)
			{
			
			//SEGGER_RTT_printf(0,"gnDevState = DEVSTATE_ADDRESS;	 222\n");
				gnDevState = DEVSTATE_DEFAULT;				//地址为0，且设备状态为 DEVSTATE_ADDRESS
			}
		}
	}
	/* Clear pending commands */
	ep0state.byFAddr = 0xFF;	

	/* Check for SentStall */
	if(byCSR0 & M_CSR0_SENTSTALL)
	{
		/*清除STALL 位*/
		MWRITE_BYTE(M_REG_CSR0, (byCSR0 & ~M_CSR0_SENDSTALL));
		ep0state.nState = M_EP0_IDLE;
	}

	/* Check for SetupEnd */
	if(byCSR0 & M_CSR0_SETUPEND)
	{
		/*清除setupend位*/
		MWRITE_BYTE(M_REG_CSR0, (byCSR0 | M_CSR0_SVDSETUPEND));
		ep0state.nState = M_EP0_IDLE;
	}

	/* Call relevant routines for endpoint 0 state */
	if(ep0state.nState == M_EP0_IDLE) 
	{
		/* If no packet has been received, */
		/* assume that this was a STATUS phase complete. */
		/* Otherwise load new command */
		if(byCSR0 & M_CSR0_OUTPKTRDY) 
		{
			/* Read the 8-byte command from the FIFO */
			/* There is no need to check that OutCount is set to 8 */
			/* as the MUSBFSFC will reject SETUP packets that are not 8 bytes long. */
			FIFORead(0, 8, &cmd);	
		//	SEGGER_RTT_printf(0,"USB_Endpoint0  aaa\n");
			//传入cmd地址存放数据到结构体中
			USB_Endpoint0_Command(&ep0state, &cmd);			//数据解析
		}
	}
	
	if(ep0state.nState == M_EP0_TX)
	{
	
	//SEGGER_RTT_printf(0,"USB_Endpoint0_Tx 1111\n");
		USB_Endpoint0_Tx(&ep0state);
	}
	else if(ep0state.nState == M_EP0_RX)
	{
	
	//SEGGER_RTT_printf(0,"USB_Endpoint0_Tx 2222\n");
		USB_Endpoint0_Rx(&ep0state);
	}
}

/******************************************************************************
  * @brief  HID_SetReportEvent program
  * @param  pep0state
  *         pcmd
  * @note  
  * @retval None
  *****************************************************************************
*/
void HID_SetReportEvent(PM_EP0_STATUS pep0state,PCOMMAND pcmd)
{
	//if ((pcmd->bmRequestType == HID_REQUEST_SET) && (pcmd->USBwIndex == 1))// Interface 1
	{
		switch(pcmd->USBwValue >>8)
		{
			case	HID_REPORT_INPUT:break;
			case	HID_REPORT_OUTPUT:
				/*保存请求类型*/
				c_hid_data.wHID_Status = HID_REQUEST_SET_REPORT;
			
				pep0state->nBytesLeft = pcmd->USBwLength;
				pep0state->nState = M_EP0_RX;
				pep0state->pData = (void*)&c_hid_data.wHID_SetRptByte[0];
				MWRITE_BYTE(M_REG_CSR0,M_CSR0_SVDOUTPKTRDY);				
				break;
			case	HID_REPORT_FEATURE:break;
		}
	}	
}
/******************************************************************************
  * @brief  HID_GetReportEvent program
  * @param  pep0state
  *         pcmd
  * @note  
  * @retval None
  *****************************************************************************
*/
void HID_GetReportEvent(PM_EP0_STATUS pep0state,PCOMMAND pcmd)
{
	if(gnDevState > DEVSTATE_ADDRESS)
	{
		switch(pcmd->USBwValue >>8)
		{
			case	HID_REPORT_INPUT:
			case	HID_REPORT_FEATURE:
			case	HID_REPORT_OUTPUT:
				/*保存请求类型*/
				c_hid_data.wHID_Status = HID_REQUEST_GET_REPORT;
			
				pep0state->nBytesLeft = 0x01;
				pep0state->pData = (void*)&c_hid_data.wHID_SetRptByte[0];
				pep0state->nState = M_EP0_TX;
				MWRITE_BYTE(M_REG_CSR0,M_CSR0_SVDOUTPKTRDY);
				break;
		}
	}	
}
/******************************************************************************
  * @brief  HID_GetIdleEvent program
  * @param  pep0state
  *         pcmd
  * @note  
  * @retval None
  *****************************************************************************
*/
void HID_GetIdleEvent(PM_EP0_STATUS pep0state,PCOMMAND pcmd)
{
	/*保存请求类型*/
	c_hid_data.wHID_Status = HID_REQUEST_GET_IDLE;
	
	pep0state->nBytesLeft = 0x01;
	pep0state->pData = (void*)&c_hid_data.wHID_IdleTimeIf0ID;
	pep0state->nState = M_EP0_TX;
	MWRITE_BYTE(M_REG_CSR0,M_CSR0_SVDOUTPKTRDY);	
}
/******************************************************************************
  * @brief  HID_SetIdleEvent program
  * @param  pep0state
  *         pcmd
  * @note  
  * @retval None
  *****************************************************************************
*/
void HID_SetIdleEvent(PM_EP0_STATUS pep0state,PCOMMAND pcmd)
{
	/*保存请求类型*/
	c_hid_data.wHID_Status = HID_REQUEST_SET_IDLE;

	pep0state->nState = M_EP0_IDLE;
	c_hid_data.wHID_IdleTimeIf0ID = (pcmd->USBwValue>>8);
	MWRITE_BYTE(M_REG_CSR0,M_CSR0_SVDOUTPKTRDY);		
}

/******************************************************************************
  * @brief  HID_GetProtocolEvent program
  * @param  pep0state
  *         pcmd
  * @note  
  * @retval None
  *****************************************************************************
*/
void HID_GetProtocolEvent(PM_EP0_STATUS pep0state,PCOMMAND pcmd)
{
	/*保存请求类型*/
	c_hid_data.wHID_Status = HID_REQUEST_GET_PROTOCOL;
	
	pep0state->nBytesLeft = 0x01;
	pep0state->pData = (void*)&c_hid_data.wHID_Protocol;
	pep0state->nState = M_EP0_TX;
	MWRITE_BYTE(M_REG_CSR0,M_CSR0_SVDOUTPKTRDY);		
}
/******************************************************************************
  * @brief  HID_SetProtocolEvent program
  * @param  pep0state
  *         pcmd
  * @note  
  * @retval None
  *****************************************************************************
*/
void HID_SetProtocolEvent(PM_EP0_STATUS pep0state,PCOMMAND pcmd)
{
	/*保存请求类型*/
	c_hid_data.wHID_Status = HID_REQUEST_SET_PROTOCOL;

	pep0state->nState = M_EP0_IDLE;
	c_hid_data.wHID_Protocol = (pcmd->USBwValue & 0x00ff);
	MWRITE_BYTE(M_REG_CSR0,M_CSR0_SVDOUTPKTRDY);		
}
/******************************************************************************
  * @brief  USB_HID_Class_Req program
  * @param  pep0state
  *         pcmd
  * @note  
  * @retval None
  *****************************************************************************
*/
void USB_HID_Class_Req(PM_EP0_STATUS pep0state,PCOMMAND pcmd)
{
	switch(pcmd->bRequest)
	{
		case	HID_REQUEST_GET_REPORT:
		{
			HID_GetReportEvent(pep0state,pcmd);
			return;
		}
		case	HID_REQUEST_GET_IDLE:
		{
			HID_GetIdleEvent(pep0state,pcmd);
			return;
		}
		case	HID_REQUEST_GET_PROTOCOL:
		{
			HID_GetProtocolEvent(pep0state,pcmd);
			return;
		}
		case	HID_REQUEST_SET_REPORT:
		{
			HID_SetReportEvent(pep0state,pcmd);
			return;
		}
		case	HID_REQUEST_SET_IDLE:
		{
			HID_SetIdleEvent(pep0state,pcmd);
			return;
		}
		case	HID_REQUEST_SET_PROTOCOL:
		{
			HID_SetProtocolEvent(pep0state,pcmd);
			return;
		}
		default:
		{
			break;
		}
	}
	MWRITE_BYTE(M_REG_CSR0, M_CSR0_SVDOUTPKTRDY | M_CSR0_SENDSTALL);
}
/******************************************************************************
  * @brief  USB_Endpoint0_Command program
  * @param  pep0state
  *         pcmd
  * @note  
  * @retval None
  *****************************************************************************
*/
static void USB_Endpoint0_Command(PM_EP0_STATUS pep0state, PCOMMAND pcmd)
{


	/* Check request type */
	switch(pcmd->bmRequestType & M_CMD_TYPEMASK)	//判断数据中为何种命令
	{
		/***主机到设备，标准请求命令，接收者为设备***/
		case M_CMD_STDREQ:
			USB_StdDev_Req(pep0state, pcmd);
			break;

		/***主机到设备，类请求命令，接收者为设备***/
		case M_CMD_CLASSREQ:
			/* Add call to external routine for handling class requests */
			USB_HID_Class_Req(pep0state,pcmd);
			break;
		/***主机到设备，用户定义的命令，接收者为设备***/
		case M_CMD_VENDREQ:
		/* Add call to external routine for handling vendor requests */
			
		/***保留***/
		default:
			/* Stall the command if a reserved request is received */
			MWRITE_BYTE(M_REG_CSR0, M_CSR0_SVDOUTPKTRDY | M_CSR0_SENDSTALL);
		break;
  }

	return;
}

/******************************************************************************
  * @brief  USB_StdDev_Req program
  * @param  pep0state
  *         pcmd
  * @note   Standard Device Request
  *		    This routine is called when a standard device request has been received.
  *         The bRequest field of the received command is decoded.
  * @retval None
  *****************************************************************************
*/
static void USB_StdDev_Req(PM_EP0_STATUS pep0state, PCOMMAND pcmd)
{
	int	bError = FALSE, bNoData = FALSE, n;
	BYTE	by;
	BYTE	byConfig;
	PSTD_CFG_DSCR	pcfg;	
	
	uint8_t Related_Endpoint;
	uint8_t wIndex0 = pcmd->USBwIndex0;
	Related_Endpoint = (wIndex0 & 0x0f);		
	uint8_t srbuff;
	uint8_t txdat[2] = {0};
	
	//SEGGER_RTT_printf(0,"USB_StdDev_Req;  333 pcmd->bRequest=%d\n",pcmd->bRequest);
	switch(pcmd->bRequest) 
	{
		/***用来给设备分配地址***/
		case SET_ADDRESS:
			/* Store device function address until status stage of request */
			if (pcmd->bmRequestType != M_CMD_STDDEVOUT)
			{
				bError = TRUE;
			}
			else if (gnDevState <= DEVSTATE_ADDRESS) 
			{
				pep0state->byFAddr = (BYTE)pcmd->USBwValue;
				bNoData = TRUE;
			}
			else
			{
				bError = TRUE;
			}
			break;
			
		/***用于主机获取设备的特定描述符***/		
		case GET_DESCRIPTOR:
			/* Decode the required descriptor from the command */
			/***报告描述符的接受者是接口，pcmd->bmRequestType = 0x81时传输HID报告描述符***/
			if(!(pcmd->bmRequestType & M_CMD_STDDEVIN))
			{
				bError = TRUE;
			}
			else 
			{
				switch(pcmd->USBwValue & M_CMD_DESCMASK) 
				{
					/***设备描述符***/
					case M_CMD_DEVICE:
						/* Prepare to return Standard Device Descriptor */
						pep0state->nBytesLeft = USB_FSDeviceDescriptorSize;
						/* Check host is allowing a descriptor this long */
						if(pcmd->USBwLength < pep0state->nBytesLeft)
						{
							pep0state->nBytesLeft = pcmd->USBwLength;
						}
						
						pep0state->pData = (void*)USB_FSDeviceDescriptor;
						pep0state->nState = M_EP0_TX;
						break;
					/***设备限定描述符***/	
					case M_CMD_DEVQUAL:
						/* No alternate speed supported */
						bError = TRUE;
						break;
					/***配置描述符***/					
					case M_CMD_CONFIG:
						byConfig = (BYTE)(pcmd->USBwValue & 0x00FF);
						if(byConfig>USB_FSDeviceDescriptor[USB_FSDeviceDescriptorSize-1])
						{
							bError = TRUE;
						}
						else
						{
							/* Get pointer to requested configuration descriptor */
							/* Prepare to return Configuration Descriptors */
							pep0state->nBytesLeft = USB_FSConfigDescriptorSize;
							pep0state->pData = (void*)USB_FSConfigDescriptor;
							pep0state->nState = M_EP0_TX;
							/* Check host is allowing a descriptor this long */
							if (pcmd->USBwLength < pep0state->nBytesLeft)
							{
								pep0state->nBytesLeft = pcmd->USBwLength;
							}
						}
						break;
					/***其它速度配置描述符***/						
					case M_CMD_OTHERSPEED:
						/* No alternate speed supported */
						bError = TRUE;
						break;
					/***HID报告描述符***/
					case	M_CMD_HID_REPORT_DESC:		//报告描述符		0x2200
						/* Prepare to return Standard Device Descriptor */
						switch(pcmd->USBwIndex)
						{
							case	0:
								//接口0
								pep0state->nBytesLeft = USB_HID_FSReportDescriptor_1Size;		//报告描述符的长度
								/* Check host is allowing a descriptor this long */
								if (pcmd->USBwLength < pep0state->nBytesLeft)
								{
									pep0state->nBytesLeft = pcmd->USBwLength;
								}
								pep0state->pData = (void*)USB_HID_FSReportDescriptor_1;
								pep0state->nState = M_EP0_TX;
								break;
							case	1:
								//接口1
								pep0state->nBytesLeft = USB_HID_FSReportDescriptor_2Size;		//报告描述符的长度
								/* Check host is allowing a descriptor this long */
								if (pcmd->USBwLength < pep0state->nBytesLeft)
								{
									pep0state->nBytesLeft = pcmd->USBwLength;
								}
								pep0state->pData = (void*)USB_HID_FSReportDescriptor_2;
								pep0state->nState = M_EP0_TX;
								break;
							case	2:
								//接口2
								pep0state->nBytesLeft = USB_HID_FSReportDescriptor_3Size;		//报告描述符的长度
								/* Check host is allowing a descriptor this long */
								if (pcmd->USBwLength < pep0state->nBytesLeft)
								{
									pep0state->nBytesLeft = pcmd->USBwLength;
								}
								pep0state->pData = (void*)USB_HID_FSReportDescriptor_3;
								pep0state->nState = M_EP0_TX;
								break;
								case	3:
								//接口3
								pep0state->nBytesLeft = USB_HID_FSReportDescriptor_4Size;		//报告描述符的长度
								/* Check host is allowing a descriptor this long */
								if (pcmd->USBwLength < pep0state->nBytesLeft)
								{
									pep0state->nBytesLeft = pcmd->USBwLength;
								}
								pep0state->pData = (void*)USB_HID_FSReportDescriptor_4;
								pep0state->nState = M_EP0_TX;
								break;
								case	4:
								//接口4
								pep0state->nBytesLeft = USB_HID_FSReportDescriptor_5Size;		//报告描述符的长度
								/* Check host is allowing a descriptor this long */
								if (pcmd->USBwLength < pep0state->nBytesLeft)
								{
									pep0state->nBytesLeft = pcmd->USBwLength;
								}
								pep0state->pData = (void*)USB_HID_FSReportDescriptor_5;
								pep0state->nState = M_EP0_TX;
								break;
							default:
								//接口
								bError = TRUE;
								break;							
						}
						break;
					case	M_CMD_STRING:	//字符串描述符

						//SEGGER_RTT_printf(0,"USB_StdDev_Req;  333 pcmd->USBwValue=%d\n",pcmd->USBwValue);
						switch(pcmd->USBwValue & 0xff)
						{
							case	0:	//获取语言ID
								pep0state->nBytesLeft = LanguageIdSize;		
								/* Check host is allowing a descriptor this long */
								if (pcmd->USBwLength < pep0state->nBytesLeft)
								{
									pep0state->nBytesLeft = pcmd->USBwLength;
								}
								pep0state->pData = (void*)LanguageId;
								pep0state->nState = M_EP0_TX;
							break;
							case	1:	//因厂商字符串索引值为1，所以这里写1
								pep0state->nBytesLeft = ManufacturerStringDescriptorSize;		
								/* Check host is allowing a descriptor this long */
								if (pcmd->USBwLength < pep0state->nBytesLeft)
								{
									pep0state->nBytesLeft = pcmd->USBwLength;
								}
								pep0state->pData = (void*)ManufacturerStringDescriptor;
								pep0state->nState = M_EP0_TX;
							break;	
							case	2:	//因产品字符串索引值为2，所以这里写2
								pep0state->nBytesLeft = ProductStringDescriptorSize;		
								/* Check host is allowing a descriptor this long */
								if (pcmd->USBwLength < pep0state->nBytesLeft)
								{
									pep0state->nBytesLeft = pcmd->USBwLength;
								}
								pep0state->pData = (void*)ProductStringDescriptor;
								pep0state->nState = M_EP0_TX;
							break;			
							case	3:	//因产品序列号索引值为3，所以这里写3
								pep0state->nBytesLeft = SerialNumberSringDescriptorSize;		
								/* Check host is allowing a descriptor this long */
								if (pcmd->USBwLength < pep0state->nBytesLeft)
								{
									pep0state->nBytesLeft = pcmd->USBwLength;
								}
								pep0state->pData = (void*)SerialNumberSringDescriptor;
								pep0state->nState = M_EP0_TX;
							break;

							case	4:	//因产品字符串索引值为2，所以这里写4
								pep0state->nBytesLeft = iapStringDescriptorSize;		
								/* Check host is allowing a descriptor this long */
								
							//	SEGGER_RTT_printf(0,"USB_StdDev_Req;  444 pcmd->USBwLength=%d\n",pcmd->USBwLength);
							///	
							//	SEGGER_RTT_printf(0,"USB_StdDev_Req;  444 pcmd->nBytesLeft=%d\n",pep0state->nBytesLeft);
								if (pcmd->USBwLength < pep0state->nBytesLeft)
								{
									pep0state->nBytesLeft = pcmd->USBwLength;
								}
								pep0state->pData = (void*)iapStringDescriptor;
								pep0state->nState = M_EP0_TX;
							break;		
							default:
								bError = TRUE;								
							break;
						}
					break;
					/***保留***/
					default: bError = TRUE;
				}
			}
			break;

		/***用于主机指示设备采用的要求的配置***/
		case SET_CONFIGURATION:
			byConfig = (BYTE)(pcmd->USBwValue & 0x00FF);
			if(gnDevState == DEVSTATE_DEFAULT)
			{
		//	SEGGER_RTT_printf(0,"gnDevState = DEVSTATE_ADDRESS;	 777 byConfig=%d\n",byConfig);
				bError = TRUE;
			}
			/* Assumes configurations are numbered 1 to NumConfigurations */
			else if(byConfig >USB_FSDeviceDescriptor[USB_FSDeviceDescriptorSize-1])
			{
			//SEGGER_RTT_printf(0,"gnDevState = DEVSTATE_ADDRESS;	 666 byConfig=%d\n",byConfig);
				bError = TRUE;
			}
			else if(!byConfig)
			{
			
			//SEGGER_RTT_printf(0,"gnDevState = DEVSTATE_ADDRESS;	 333\n");
				gnDevState = DEVSTATE_ADDRESS;
			}
			else
			{
			
			//SEGGER_RTT_printf(0,"gnDevState = DEVSTATE_ADDRESS;	 555 byConfig=%d\n",byConfig);
				/* Get pointer to requested configuration descriptor */
				gpCurCfg = (void *)USB_FSConfigDescriptor;
				/* Set all alternate settings to zero */
				for (n=0; n<M_MAXIFS; n++)
					gbyCurIfVal[n] = 0;
				/* Configure endpoints */
				ConfigureIfs();
				
				//SEGGER_RTT_printf(0,"gnDevState = DEVSTATE_ADDRESS;  444\n");
				gnDevState = DEVSTATE_CONFIG;
				MWRITE_BYTE(M_REG_INDEX, 0);
				bNoData = TRUE;
			}
			
			//SEGGER_RTT_printf(0,"b_config == 1\n");
			b_config = 1;
			break;

		/***用于主机要求设备用某个描述符来描述接口***/		
		case SET_INTERFACE:
			if(gnDevState > DEVSTATE_ADDRESS)
			{
				n = (int)pcmd->USBwIndex;
				pcfg = (PSTD_CFG_DSCR)gpCurCfg;
				if((BYTE)n >= pcfg->bNumInterfaces)
				{
					bError = TRUE;
				}
				else 
				{
					gbyCurIfVal[n] = (BYTE)pcmd->USBwValue;
					if (ConfigureIfs() == FALSE)
					{
						bError = TRUE;
					}
					
					MWRITE_BYTE(M_REG_INDEX, 0);
					bNoData = TRUE;
				}
			}
			else
			{
				bError = TRUE;
			}
			break;

		/***用于主机获取设备当前设备的配置值***/		
		case GET_CONFIGURATION:
			if ((gnDevState == DEVSTATE_ADDRESS) && (!pcmd->USBwValue))
			{
				/* Prepare to return zero */
				pep0state->nBytesLeft = 1;
				pep0state->pData = (void*)&pcmd->USBwValue;
				pep0state->nState = M_EP0_TX;
			}
			else if(gnDevState > DEVSTATE_ADDRESS)
			{
				/* Prepare to return configuration value */
				pcfg = (PSTD_CFG_DSCR)gpCurCfg;
				pep0state->nBytesLeft = 1;
				pep0state->pData = (void*)&pcfg->bConfigurationValue;
				pep0state->nState = M_EP0_TX;
			}
			else
			{
				bError = TRUE;
			}
			break;

		/***用于获取当前某个接口描述符编号***/	
		case GET_INTERFACE:
			if(gnDevState > DEVSTATE_ADDRESS)
			{
				n = (int)pcmd->USBwIndex;
				pcfg = (PSTD_CFG_DSCR)gpCurCfg;
				if((BYTE)n >= pcfg->bNumInterfaces)
				{
					bError = TRUE;
				}
				else 
				{
					/* Prepare to return interface value */
					pep0state->nBytesLeft = 1;
					pep0state->pData = (void*)&gpCurIf[n]->bInterfaceNumber;
					pep0state->nState = M_EP0_TX;
				}
			}
			else
				bError = TRUE;
			break;

		/***用来启用或激活命令接收者的某些特性***/
		case SET_FEATURE:
			switch (pcmd->bmRequestType) 
			{
					case M_CMD_STDDEVOUT:
						switch (pcmd->USBwValue) 
						{
							case M_FTR_DEVREMWAKE:
							pInformation->Current_Feature = pInformation->Current_Feature | (0x1<<5);	
							bNoData = TRUE;	
							break;	
							default:
							bError = TRUE;
							break;
						}
					break;
						
					case M_CMD_STDIFOUT:

					/* SET FEATURE for EndPoint*/
					case M_CMD_STDEPOUT:

						switch (pcmd->USBwValue0) 
						{						
							case M_FTR_EPHALT:
	
							MWRITE_BYTE(M_REG_INDEX,Related_Endpoint);	
							if (pcmd->USBwIndex0 & 0x80)
							{
								if(Related_Endpoint)/* IN endpoint */
								{
									srbuff = *((uint8_t*)M_REG_INCSR1);	
									srbuff = srbuff |(0x1<<4);
									MWRITE_BYTE(M_REG_INCSR1,srbuff);
									INCSRDATA = MREAD_BYTE(M_REG_INCSR1);	
									__ASM("NOP");
								}
								
								else
								{
									srbuff = *((uint8_t*)M_REG_CSR0);	
									*((uint8_t*)M_REG_CSR0) = srbuff |(0x1<<5);
									srbuff = *((uint8_t*)M_REG_CSR0);	
								}
							
							}

							else
							{
						/* OUT endpoint */
								if(Related_Endpoint)
								{
									srbuff = *((uint8_t*)M_REG_OUTCSR1);	
									*((uint8_t*)M_REG_OUTCSR1) = srbuff |(0x1<<5);
									srbuff = *((uint8_t*)M_REG_OUTCSR1);								
								}
								
								else
								{
									srbuff = *((uint8_t*)M_REG_CSR0);	
									*((uint8_t*)M_REG_CSR0) = srbuff |(0x1<<5);
									srbuff = *((uint8_t*)M_REG_CSR0);								
								}
													
							}
							bNoData = TRUE;	
							MWRITE_BYTE(M_REG_INDEX,0);	
							break;
							default:
							bError = TRUE;
							break;
						}
					break;
						
					default:
					bError = TRUE;
					break;
			}
		break;
			
		/***用来CLEAR接收者的某些特性***/			
		case CLEAR_FEATURE:
			switch (pcmd->bmRequestType) 
			{
					case M_CMD_STDDEVOUT:
						switch (pcmd->USBwValue) 
						{
							case M_FTR_DEVREMWAKE:
							pInformation->Current_Feature = pInformation->Current_Feature & (~(0x1<<5));
							bNoData = TRUE;	
							break;
							default:
							bError = TRUE;
							break;
						}
					break;
						
					case M_CMD_STDIFOUT:

					/* CLEAR FEATURE for EndPoint*/
					case M_CMD_STDEPOUT:
						switch (pcmd->USBwValue0) 
						{
							case M_FTR_EPHALT:						
							MWRITE_BYTE(M_REG_INDEX,Related_Endpoint);	
							if (pcmd->USBwIndex0 & 0x80)
							{/* IN endpoint */
								if(Related_Endpoint)
								{
//									*((uint8_t*)M_REG_INCSR1) = *((uint8_t*)M_REG_INCSR1) & (~(0x01<<6));
									srbuff = *((uint8_t*)M_REG_INCSR1);	
									*((uint8_t*)M_REG_INCSR1) = srbuff & (~(0x01<<6));
									srbuff = *((uint8_t*)M_REG_INCSR1);											
									
//									*((uint8_t*)M_REG_INCSR1) = *((uint8_t*)M_REG_INCSR1) & (~(0x01<<4));
									srbuff = *((uint8_t*)M_REG_INCSR1);	
									*((uint8_t*)M_REG_INCSR1) = srbuff & (~(0x01<<4));	
									INCSRDATA = *((uint8_t*)M_REG_INCSR1);	
									__ASM("NOP");
								}
								
								else
								{
//									*((uint8_t*)M_REG_CSR0) = *((uint8_t*)M_REG_CSR0) & (~(0x01<<5));
									srbuff = *((uint8_t*)M_REG_CSR0);	
									*((uint8_t*)M_REG_CSR0) = srbuff & (~(0x01<<5));
									srbuff = *((uint8_t*)M_REG_CSR0);										
									
								}
									
							}

							else
							{
								/* OUT endpoint */
								if(Related_Endpoint)
								{
//									*((uint8_t*)M_REG_OUTCSR1) = *((uint8_t*)M_REG_OUTCSR1) & (~(0x01<<7));
//									*((uint8_t*)M_REG_OUTCSR1) = *((uint8_t*)M_REG_OUTCSR1) & (~(0x01<<5));
									srbuff = *((uint8_t*)M_REG_OUTCSR1);	
									*((uint8_t*)M_REG_OUTCSR1) = srbuff & (~(0x01<<7));
									srbuff = *((uint8_t*)M_REG_OUTCSR1);											
									
									srbuff = *((uint8_t*)M_REG_OUTCSR1);	
									*((uint8_t*)M_REG_OUTCSR1) = srbuff & (~(0x01<<5));
									srbuff = *((uint8_t*)M_REG_OUTCSR1);				
									
								}
								
								else
								{
//									*((uint8_t*)M_REG_CSR0) = *((uint8_t*)M_REG_CSR0)  & (~(0x01<<5));
									srbuff = *((uint8_t*)M_REG_CSR0);	
									*((uint8_t*)M_REG_CSR0) = srbuff & (~(0x01<<5));
									srbuff = *((uint8_t*)M_REG_CSR0);											
								}
													
							}
								bNoData = TRUE;	
								MWRITE_BYTE(M_REG_INDEX,0);
								break;
						
							default:
							bError = TRUE;
							break;
						}
				break;
						
				default:
				bError = TRUE;
				break;		
			}
		break;	
			
			
		/***用于主机获取设备 STATUS***/					
		case GET_STATUS:	
		
			switch (pcmd->bmRequestType) 
			{

				 /* GET STATUS for Device*/
					case M_CMD_STDDEVIN:
						
					if (pInformation->Current_Feature & (0x1<<5))
					{
						txdat[0] |=(0x1<<1);						
					}
					else
					{
						txdat[0] &= ~(0x1<<1);	
					} 
					if (pInformation->Current_Feature & (0x1<<6))
					{
						txdat[0] |=(0x1<<0);						
					}
					else
					{
						txdat[0] &= ~(0x1<<0);	
					} 					
					
					txdat[1]=0;
					pep0state->nBytesLeft = 2;
					pep0state->pData = txdat;
					pep0state->nState = M_EP0_TX;	
					break;
					
				/* GET STATUS for Interface*/		
					case M_CMD_STDIFIN:
					pep0state->nBytesLeft = 2;
					pep0state->pData = txdat;
					pep0state->nState = M_EP0_TX;	
					break;
				/* GET STATUS for EndPoint*/
					case M_CMD_STDEPIN:									
					
					if (pcmd->USBwIndex0 & 0x80)
					{	
						if(Related_Endpoint){
							MWRITE_BYTE(M_REG_INDEX,Related_Endpoint);
							INCSRDATA = MREAD_BYTE(M_REG_INCSR1);
							if(INCSRDATA & (0x1<<4))
								txdat[0] = 1;	
							else txdat[0] = 0;	
						}
						else
							if(*((uint8_t*)M_REG_CSR0) & (0x1<<2))
							txdat[0] = 1;	
							else txdat[0] = 0;								
					}

					else
					{
						if(Related_Endpoint){
							if(*((uint8_t*)M_REG_OUTCSR1) & (0x1<<5))
								txdat[0] = 1;	
							else txdat[0] = 0;	
						}
						else
							if(*((uint8_t*)M_REG_CSR0) & (0x1<<2))
							txdat[0] = 1;	
							else txdat[0] = 0;								
					}		
					txdat[1]=0;
					pep0state->nBytesLeft = 2;
					pep0state->pData = txdat;
					pep0state->nState = M_EP0_TX;	
					MWRITE_BYTE(M_REG_INDEX,0);	
					break;
					
					default:
					bError = TRUE;
					break;
				
			}
		break;	

			
		/***不可识别的请求***/
		default:
			/* Stall the command if an unrecognized request is received */
			bError = TRUE;
		break;
 }

	/* Stall command if an error occurred */
	if (bError)
	{
		/***清零 OUTPKTRDY 位,终止当前传输***/
		by = M_CSR0_SVDOUTPKTRDY | M_CSR0_SENDSTALL;
	}
	else if(bNoData)
	{
//		FIFOWrite(0, 0, pep0state->pData);
//		by = M_CSR0_INPKTRDY | M_CSR0_DATAEND;
//		MWRITE_BYTE(M_REG_CSR0, by);
		/***清零 OUTPKTRDY 位,在发送时表示，将要发送的时最后一包数据；接收时将要接收的是最后一包数据；***/
		by = M_CSR0_SVDOUTPKTRDY | M_CSR0_DATAEND;
//					pep0state->nBytesLeft = 0;
//					pep0state->nState = M_EP0_TX;			
	}
	else
	{
		/***清零 OUTPKTRDY 位***/
		by = M_CSR0_SVDOUTPKTRDY;
	}
	
	MWRITE_BYTE(M_REG_CSR0, by);

	return;
	
}

/******************************************************************************
  * @brief  USB_Endpoint0_Tx program
  * @param  pep0state
  * @note   USB Endpoint 0 Tx
  *         This routine is called when data is to be sent to the host.
  * @retval None
  *****************************************************************************
*/
static void USB_Endpoint0_Tx(PM_EP0_STATUS pep0state)
{
	int	nBytes;
	BYTE	by;

	/* Determine number of bytes to send */
	if(pep0state->nBytesLeft <= M_EP0_MAXP)
	{
		nBytes = pep0state->nBytesLeft;
		pep0state->nBytesLeft = 0;
	}
	else
	{
		nBytes = M_EP0_MAXP;
		pep0state->nBytesLeft -= M_EP0_MAXP;
	}

	FIFOWrite(0, nBytes, pep0state->pData);
	pep0state->pData = (BYTE *)pep0state->pData + nBytes;
	if(nBytes < M_EP0_MAXP)
	{
		/***数据已经写入 FIFO 中,将要发送的时最后一包数据***/
		by = M_CSR0_INPKTRDY | M_CSR0_DATAEND;
		pep0state->nState = M_EP0_IDLE;
	}
	else
	{
		/***数据已经写入 FIFO 中***/
		by = M_CSR0_INPKTRDY;
	}
	
	MWRITE_BYTE(M_REG_CSR0, by);
}

/******************************************************************************
  * @brief  USB_Endpoint0_Rx program
  * @param  pep0state
  * @note   USB Endpoint 0 Rx
  *         This routine is called when data is to be reseive from the host.
  * @retval None
  *****************************************************************************
*/
static void USB_Endpoint0_Rx(PM_EP0_STATUS pep0state)
{
	BYTE    byOutCSR;
	
	/* Set index register */
	MWRITE_BYTE(M_REG_INDEX, 0);
	/* Read OUT CSR register */
	byOutCSR = MREAD_BYTE(M_REG_CSR0);

	/* Get packet, */
	/* may need to unload more than one packet if double buffering enabled */
	/*端点FIFO 中有数据*/
	while(byOutCSR & M_CSR0_OUTPKTRDY)
	{
		pep0state->nState = M_EP0_IDLE;

		/* Unload FIFO */
		//FIFORead(0, 1, pep0state->pData);//NUM CAP SCR指示灯信息
		FIFORead(0, pep0state->nBytesLeft, pep0state->pData);//NUM CAP SCR指示灯信息
		
		/*Cear flag*/
		MWRITE_BYTE(M_REG_CSR0,M_CSR0_SVDOUTPKTRDY);
		/* Check for another packet */
		byOutCSR = MREAD_BYTE(M_REG_CSR0);
	}
		
}

/******************************************************************************
  * @brief  ConfigureIfs program
  * @param  None
  * @note   ConfigureIfs
  *         This routine is called when a SET_CONFIGURATION or SET_INTERFACE
  *         command is received and will set the gpCurIF pointers
  *         to the selected interface descriptors and will set the
  *         maximum packet size and operating mode for the endpoints in
  *         the selected interfaces.
  * @retval FALSE or TRUE
  *****************************************************************************
*/
static uint32_t ConfigureIfs(void)
{
	PSTD_CFG_DSCR	pcfg;
	BYTE		byIf, byAltIf, byEP, byNumEPs, by;
	BYTE		*pby;
	BYTE		*pbyIfVal;
	PSTD_IF_DSCR	pif;
	PSTD_EP_DSCR	pep;

	/* Set pointer to first interface descriptor in current configuration */
	pby = (BYTE *)(gpCurCfg) + sizeof(STD_CFG_DSCR);
	pif = (PSTD_IF_DSCR)pby;

	/* Loop through all interfaces in the current configuration */
	pcfg = (PSTD_CFG_DSCR)gpCurCfg;
	pbyIfVal = (BYTE*)&gbyCurIfVal;	//接口

	//SEGGER_RTT_printf(0,"ConfigureIfs;  pcfg->bNumInterfaces=%d\n",pcfg->bNumInterfaces);
	for (byIf=0; byIf < pcfg->bNumInterfaces; byIf++, pbyIfVal++) 
	{
		//SEGGER_RTT_printf(0,"ConfigureIfs; byIf=%d	byAltIf=%d pbyIfVal=%d\n",byIf,byAltIf ,*pbyIfVal);
		/* Advance pointer to selected alternate interface descriptor */
		if (*pbyIfVal) 
		{
		
	
			for (byAltIf=0; byAltIf<*pbyIfVal; byAltIf++) 
			{
				byNumEPs = pif->bNumEndpoints;
				
				//SEGGER_RTT_printf(0,"ConfigureIfs; byAltIf=%d	byNumEPs=%d\n",byNumEPs,byAltIf);
				pby += sizeof(STD_IF_DSCR) + byNumEPs * sizeof(STD_EP_DSCR) /*+ sizeof(STD_HID_DSCR)*/;
				pif  = (PSTD_IF_DSCR)pby;
				/* Check an alternate setting > number of alternates not specified */
				if (!pif->bAlternateSetting)
				{
				
				//SEGGER_RTT_printf(0,"ConfigureIfs; byAltIf=%d	byNumEPs=%d !pif->bAlternateSetting\n",byNumEPs,byAltIf);
					return FALSE;
				}
			} 
		}

		/* Store pointer to interface in global array */
		gpCurIf[byIf] = pif;
		//SEGGER_RTT_printf(0,"aa ConfigureIfs;	pif->bNumEndpoints=%d\n",pif->bNumEndpoints);

		/* Loop through all endpoints in interface */
		byNumEPs = pif->bNumEndpoints;
		
		//SEGGER_RTT_printf(0,"bbb ConfigureIfs;	pif->bNumEndpoints=%d\n",pif->bNumEndpoints);
		pby += sizeof(STD_IF_DSCR) /*+ sizeof(STD_HID_DSCR)*/;	//endpoint
		
		//SEGGER_RTT_printf(0,"ccc ConfigureIfs;	pif->bNumEndpoints=%d\n",pif->bNumEndpoints);
		for ( byEP = 0; byEP < byNumEPs; byEP++ )
		{
		
		//SEGGER_RTT_printf(0,"ddd ConfigureIfs;	pep->bEndpointAddress=0x%02x\n",pep->bEndpointAddress);
			pep = (PSTD_EP_DSCR)pby;
			//SEGGER_RTT_printf(0,"ee ConfigureIfs;	pep->bEndpointAddress=0x%02x\n",pep->bEndpointAddress);

			/* Configure the endpoint */
			MWRITE_BYTE(M_REG_INDEX, (pep->bEndpointAddress & 0x0F));
			
			//SEGGER_RTT_printf(0,"ff ConfigureIfs;	pep->bEndpointAddress=0x%02x\n",pep->bEndpointAddress);
			/* Round up max packet size to a multiple of 8 for writing to MaxP registers */
			by = (BYTE)((pep->wMaxPacketSize + 7) >> 3);
			
			//SEGGER_RTT_printf(0,"33 ConfigureIfs;	pep->bEndpointAddress=0x%02x\n",pep->bEndpointAddress);
			if(pep->bEndpointAddress & 0x80)
			{
			
			//SEGGER_RTT_printf(0,"444 ConfigureIfs;	pep->bEndpointAddress=0x%02x\n",pep->bEndpointAddress);
				MWRITE_BYTE(M_REG_INMAXP, by);
				by = MREAD_BYTE(M_REG_INCSR2);
				
				//SEGGER_RTT_printf(0,"66 ConfigureIfs;	pep->bmAttributes=0x%02x\n",pep->bmAttributes);
				
				//SEGGER_RTT_printf(0,"66 ConfigureIfs;	pep->bmAttributes=0x%02x\n",(pep->bmAttributes & M_EP_TFMASK));
				switch (pep->bmAttributes & M_EP_TFMASK)
				{
					case M_EP_ISO:
						
					//	SEGGER_RTT_printf(0,"555 ConfigureIfs;	pep->bEndpointAddress=0x%02x\n",pep->bEndpointAddress);
						by |= M_INCSR2_ISO;
					break;
					case M_EP_BULK:
					case M_EP_INTR:		
						
					//	SEGGER_RTT_printf(0,"777 ConfigureIfs;	pep->bmAttributes=0x%02x\n",pep->bmAttributes);
						by &= ~M_INCSR2_ISO;
					break;
				}
				
				/* Set mode bit high (only strictly necessary if sharing a FIFO) */
				by |= M_INCSR2_MODE;
				
				MWRITE_BYTE(M_REG_INCSR2, by);
				
				/* Other configuration for an IN endpoint */
				/* e.g. AutoClr, DMA */
				/* should be added here */
			}
			else
			{
				MWRITE_BYTE(M_REG_OUTMAXP, by);
				by = MREAD_BYTE(M_REG_OUTCSR2);
				
				//SEGGER_RTT_printf(0,"999 ConfigureIfs;	pep->bmAttributes=0x%02x\n",pep->bmAttributes);
				switch (pep->bmAttributes & M_EP_TFMASK)
				{
					case M_EP_ISO:
						
					//	SEGGER_RTT_printf(0,"hhh ConfigureIfs;	pep->bmAttributes=0x%02x\n",pep->bmAttributes);
						by |= M_OUTCSR2_ISO;
					break;
					case M_EP_BULK:
					case M_EP_INTR:
						
					///	SEGGER_RTT_printf(0,"ffff ConfigureIfs;	pep->bmAttributes=0x%02x\n",pep->bmAttributes);
						by &= ~M_OUTCSR2_ISO;
					break;
				}
				MWRITE_BYTE(M_REG_OUTCSR2, by);
				/* Other configuration for an OUT endpoint */
				/* e.g. AutoSet, DMA */
				/* should be added here */
			}
			
			pby += sizeof(STD_EP_DSCR);	
		}
	}

	return TRUE;
}

/******************************************************************************
  * @brief  USB_EP_Tx program
  * @param  Ep
  *         ptr
  *         data_len
  * @note   This routine is called when data is to be sent to the host.
  * @retval FALSE or TRUE
  *****************************************************************************
*/
ErrorStatus USB_EP_Tx(uint8_t Ep,uint8_t *ptr,uint8_t data_len)
{
	M_EPBIN_STATUS tEp0in;
	uint32_t timeout = 0;
	
	//SEGGER_RTT_printf(0,"USB_EP_Tx gnDevState=%d\n",gnDevState);
	if(gnDevState > DEVSTATE_ADDRESS)
	{
	
	//SEGGER_RTT_printf(0,"2 USB_EP_Tx gnDevState=%d\n",gnDevState);
		tEp0in.byEP = Ep;
		tEp0in.nBytesLeft = data_len;
		tEp0in.pData = ptr;
		EndpointBulkIn(tEp0in, M_EP_NORMAL);

		
		//SEGGER_RTT_printf(0,"3 USB_EP_Tx MREAD_BYTE(M_REG_INCSR1)=0x%02x\n",MREAD_BYTE(M_REG_INCSR1));
		while(MREAD_BYTE(M_REG_INCSR1) & 0x01)
		{
		
		//SEGGER_RTT_printf(0,"4 USB_EP_Tx timeout=%d\n",timeout);
			timeout++;
			if(timeout>=0xffffffff)
			{
			
			//SEGGER_RTT_printf(0,"5 USB_EP_Tx timeout=%d\n",timeout);
				return ERROR;
			}
		}
		
		//SEGGER_RTT_printf(0,"6 USB_EP_Tx gnDevState=%d\n",gnDevState);
		return SUCCESS;
	}
	
	//SEGGER_RTT_printf(0,"7 USB_EP_Tx gnDevState=%d\n",gnDevState);
	return ERROR;
}

/******************************************************************************
  * @brief  USB EP RX program.
  * @param  Ep
  * @param  ptr
  * @param  data_len
  * @note   This routine is called when data is to be sent to the host. 
  * @retval ERROR OR SUCCESS
  *****************************************************************************
*/
int USB_EP_Rx(uint8_t Ep,uint8_t *ptr,uint8_t data_len)
{
	M_EPBOUT_STATUS    tEp1out;
	
	tEp1out.byEP = Ep;
	tEp1out.nBuffLen = data_len; 	//M_EP_MAXP
	tEp1out.pData = ptr;
	tEp1out.nBytesRecv = 0;

	return EndpointBulkOut(tEp1out, M_EP_NORMAL);
	//return tEp1out.nBytesRecv;
}


/*********************** (C) COPYRIGHT JD-DZ.COM ********************END OF FILE****/




