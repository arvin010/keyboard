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
	
	usb_intrin  = USB->INTRIN;									//�˵��жϱ�־
	usb_intrusb = USB->INTRUSB;									//USB�жϱ�־RESET��RESUME��SUSPEND��SOF
	usb_introut = USB->INTROUT;
	
	
	
	
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
		USB_Endpoint0(M_EP_NORMAL);
	}
	
	/* Check for endpoint 5 interrupt */
	if((usb_introut & USB_IT_OUT_EP5_FLAG) != RESET)
	{
		//USB_EP_Rx(ep_hid_vendor_rx, Vendor_data_Buffer, M_EP_MAXP);
		
		#ifdef _debug_
		//Vendor_data_Buffer[0]++;
		//USB_Transmit_VendorData((uint8_t*)&send, M_EP_MAXP);
		#endif
	}
	

	
	/* Check for endpoint 7 interrupt */
	if((usb_introut & USB_IT_OUT_EP7_FLAG) != RESET)
	{	
//		USB_EP_Rx(7, Vendor_data_Buffer, M_EP_MAXP);
//		
//		#ifdef _debug_
//		Vendor_data_Buffer[0]++;
//		USB_EP_Tx(6, Vendor_data_Buffer, M_EP_MAXP);
//		#endif
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
		USB->POWER |= 0x01;//��������ģ��
		
		/*�ر�һЩʱ��ʡ��*/
		
		/*����*/
		
//		while(USB->POWER & 0x02)								//suspend flag
//		{	
//			GPIOB->ODR ^= GPIO_Pin_2;
////			SysTick_Delay_Ms(500);
//			if(GPIO_ReadInputDataBit(GPIOC,GPIO_Pin_11) == RESET)//��������
//			{
//				/*remote wakeup*/
//				USB_Remote_Wakeup();
//				
//				f_send_kb = 1;
//				USB->POWER &= ~0x01;							//����������ģ��	
//				usb_state = USB_NORMAL;
//			}
//		}
		
		
		/*��������ʱ��*/	
	}
	else if(usb_state == USB_RESUME_FLAG)						//�Զ��˳�suspend
	{
		usb_state = USB_NORMAL;
		/*��������ʱ��*/
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
	
	USB->POWER |= 0x01;												//��������ģ��
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
		/*�л��˵��*/
		MWRITE_BYTE(M_REG_INDEX, pbistate.byEP);
		/*�����Ӧ�˵�����ݷ�ת״̬�����FIFO��Ҫ���͵�����*/
		byInCSR = M_INCSR_CDT | M_INCSR_FF;
		MWRITE_BYTE(M_REG_INCSR1, byInCSR);
	}
	else
	{
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

			/* Load FIFO */
			FIFOWrite((int)pbistate.byEP, nBytes, pbistate.pData);
			pbistate.pData = (BYTE *)pbistate.pData + nBytes;

			MWRITE_BYTE(M_REG_INDEX, pbistate.byEP);
			/*��ʾҪ���͵������Ѿ�װ����Ӧ�˵��FIFO��*/
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
void EndpointBulkOut(M_EPBOUT_STATUS pbostate, int nCallState)
{
	int     nBytes;
	BYTE    byOutCSR;

	/* Reset endpoint */
	if(nCallState == M_EP_RESET)
	{
		/***���ö˵��***/
		MWRITE_BYTE(M_REG_INDEX, pbostate.byEP);
		byOutCSR = M_OUTCSR_CDT | M_OUTCSR_FF;
		/***��λ�˵�����ݷ�ת״̬,��ս��� FIFO �е�����***/
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
		/*�˵�FIFO ��������*/
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
				return;
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

	if(nBytes) 
	{
		nAddr = M_FIFO_EP0+(nEP<<2);
		nCount = nBytes;
		pby = (BYTE *)pDst;
		while(nCount) 
		{
			*pby++ = *((BYTE *)nAddr);
			nCount--;
		}
	}
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

	if(nBytes)
	{
		nAddr = M_FIFO_EP0+(nEP<<2);
		nCount = nBytes;
		pby = (BYTE *)pSrc;
		while (nCount)
		{
		 *((BYTE *)nAddr) = *pby++;
			nCount--;
		}
	}
	
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
	MWRITE_BYTE(M_REG_INDEX, 0);							//ѡ��endpoint0
	byCSR0 = MREAD_BYTE(M_REG_CSR0);						//��ȡCSR0������ͨ��״̬

	/* Check for status stage of a request */
	/*���������״̬*/
	if(!(byCSR0 & M_CSR0_OUTPKTRDY)) 
	{
		/* Complete SET_ADDRESS command */
		if(ep0state.byFAddr != 0xFF)
		{
			MWRITE_BYTE(M_REG_FADDR, ep0state.byFAddr);		//�����ַ��ΪFF��reset����ַ����ΪbyFAddr
			if((gnDevState == DEVSTATE_DEFAULT) && ep0state.byFAddr)
			{
				gnDevState = DEVSTATE_ADDRESS;				//��ַ��Ϊ0�����豸״̬Ϊ DEVSTATE_DEFAULT
			}
			else if((gnDevState == DEVSTATE_ADDRESS) && !ep0state.byFAddr)
			{
				gnDevState = DEVSTATE_DEFAULT;				//��ַΪ0�����豸״̬Ϊ DEVSTATE_ADDRESS
			}
		}
	}
	/* Clear pending commands */
	ep0state.byFAddr = 0xFF;	

	/* Check for SentStall */
	if(byCSR0 & M_CSR0_SENTSTALL)
	{
		/*���STALL λ*/
		MWRITE_BYTE(M_REG_CSR0, (byCSR0 & ~M_CSR0_SENDSTALL));
		ep0state.nState = M_EP0_IDLE;
	}

	/* Check for SetupEnd */
	if(byCSR0 & M_CSR0_SETUPEND)
	{
		/*���setupendλ*/
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
			FIFORead(0, 8, &cmd);							//����cmd��ַ������ݵ��ṹ����
			USB_Endpoint0_Command(&ep0state, &cmd);			//���ݽ���
		}
	}
	
	if(ep0state.nState == M_EP0_TX)
	{
		USB_Endpoint0_Tx(&ep0state);
	}
	else if(ep0state.nState == M_EP0_RX)
	{
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
				/*������������*/
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
				/*������������*/
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
	/*������������*/
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
	/*������������*/
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
	/*������������*/
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
	/*������������*/
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
	switch(pcmd->bmRequestType & M_CMD_TYPEMASK)	//�ж�������Ϊ��������
	{
		/***�������豸����׼�������������Ϊ�豸***/
		case M_CMD_STDREQ:
			USB_StdDev_Req(pep0state, pcmd);
			break;

		/***�������豸�����������������Ϊ�豸***/
		case M_CMD_CLASSREQ:
			/* Add call to external routine for handling class requests */
			USB_HID_Class_Req(pep0state,pcmd);
			break;
		/***�������豸���û���������������Ϊ�豸***/
		case M_CMD_VENDREQ:
		/* Add call to external routine for handling vendor requests */
			
		/***����***/
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
	
	switch(pcmd->bRequest) 
	{
		/***�������豸�����ַ***/
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
			
		/***����������ȡ�豸���ض�������***/		
		case GET_DESCRIPTOR:
			/* Decode the required descriptor from the command */
			/***�����������Ľ������ǽӿڣ�pcmd->bmRequestType = 0x81ʱ����HID����������***/
			if(!(pcmd->bmRequestType & M_CMD_STDDEVIN))
			{
				bError = TRUE;
			}
			else 
			{
				switch(pcmd->USBwValue & M_CMD_DESCMASK) 
				{
					/***�豸������***/
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
					/***�豸�޶�������***/	
					case M_CMD_DEVQUAL:
						/* No alternate speed supported */
						bError = TRUE;
						break;
					/***����������***/					
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
					/***�����ٶ�����������***/						
					case M_CMD_OTHERSPEED:
						/* No alternate speed supported */
						bError = TRUE;
						break;
					/***HID����������***/
					case	M_CMD_HID_REPORT_DESC:		//����������		0x2200
						/* Prepare to return Standard Device Descriptor */
						switch(pcmd->USBwIndex)
						{
							case	0:
								//�ӿ�0
								pep0state->nBytesLeft = USB_HID_FSReportDescriptor_1Size;		//�����������ĳ���
								/* Check host is allowing a descriptor this long */
								if (pcmd->USBwLength < pep0state->nBytesLeft)
								{
									pep0state->nBytesLeft = pcmd->USBwLength;
								}
								pep0state->pData = (void*)USB_HID_FSReportDescriptor_1;
								pep0state->nState = M_EP0_TX;
								break;
							case	1:
								//�ӿ�1
								pep0state->nBytesLeft = USB_HID_FSReportDescriptor_2Size;		//�����������ĳ���
								/* Check host is allowing a descriptor this long */
								if (pcmd->USBwLength < pep0state->nBytesLeft)
								{
									pep0state->nBytesLeft = pcmd->USBwLength;
								}
								pep0state->pData = (void*)USB_HID_FSReportDescriptor_2;
								pep0state->nState = M_EP0_TX;
								break;
							case	2:
								//�ӿ�2
								pep0state->nBytesLeft = USB_HID_FSReportDescriptor_3Size;		//�����������ĳ���
								/* Check host is allowing a descriptor this long */
								if (pcmd->USBwLength < pep0state->nBytesLeft)
								{
									pep0state->nBytesLeft = pcmd->USBwLength;
								}
								pep0state->pData = (void*)USB_HID_FSReportDescriptor_3;
								pep0state->nState = M_EP0_TX;
								break;
								case	3:
								//�ӿ�3
								pep0state->nBytesLeft = USB_HID_FSReportDescriptor_4Size;		//�����������ĳ���
								/* Check host is allowing a descriptor this long */
								if (pcmd->USBwLength < pep0state->nBytesLeft)
								{
									pep0state->nBytesLeft = pcmd->USBwLength;
								}
								pep0state->pData = (void*)USB_HID_FSReportDescriptor_4;
								pep0state->nState = M_EP0_TX;
								break;
								case	4:
								//�ӿ�4
								pep0state->nBytesLeft = USB_HID_FSReportDescriptor_5Size;		//�����������ĳ���
								/* Check host is allowing a descriptor this long */
								if (pcmd->USBwLength < pep0state->nBytesLeft)
								{
									pep0state->nBytesLeft = pcmd->USBwLength;
								}
								pep0state->pData = (void*)USB_HID_FSReportDescriptor_5;
								pep0state->nState = M_EP0_TX;
								break;
							default:
								//�ӿ�
								bError = TRUE;
								break;							
						}
						break;
					case	M_CMD_STRING:	//�ַ���������
						switch(pcmd->USBwValue & 0xff)
						{
							case	0:	//��ȡ����ID
								pep0state->nBytesLeft = LanguageIdSize;		
								/* Check host is allowing a descriptor this long */
								if (pcmd->USBwLength < pep0state->nBytesLeft)
								{
									pep0state->nBytesLeft = pcmd->USBwLength;
								}
								pep0state->pData = (void*)LanguageId;
								pep0state->nState = M_EP0_TX;
							break;
							case	1:	//�����ַ�������ֵΪ1����������д1
								pep0state->nBytesLeft = ManufacturerStringDescriptorSize;		
								/* Check host is allowing a descriptor this long */
								if (pcmd->USBwLength < pep0state->nBytesLeft)
								{
									pep0state->nBytesLeft = pcmd->USBwLength;
								}
								pep0state->pData = (void*)ManufacturerStringDescriptor;
								pep0state->nState = M_EP0_TX;
								SEGGER_RTT_printf(0, "ManufacturerStringDescriptorSize.....>>>>>>%s\n",pep0state->pData);
							break;	
							case	2:	//���Ʒ�ַ�������ֵΪ2����������д2
								pep0state->nBytesLeft = ProductStringDescriptorSize;		
								/* Check host is allowing a descriptor this long */
								if (pcmd->USBwLength < pep0state->nBytesLeft)
								{
									pep0state->nBytesLeft = pcmd->USBwLength;
								}
								pep0state->pData = (void*)ProductStringDescriptor;
								pep0state->nState = M_EP0_TX;
							break;			
							case	3:	//���Ʒ���к�����ֵΪ3����������д3
								pep0state->nBytesLeft = SerialNumberSringDescriptorSize;		
								/* Check host is allowing a descriptor this long */
								if (pcmd->USBwLength < pep0state->nBytesLeft)
								{
									pep0state->nBytesLeft = pcmd->USBwLength;
								}
								pep0state->pData = (void*)SerialNumberSringDescriptor;
								pep0state->nState = M_EP0_TX;
							break;
							default:
								bError = TRUE;								
							break;
						}
					break;
					/***����***/
					default: bError = TRUE;
				}
			}
			break;

		/***��������ָʾ�豸���õ�Ҫ�������***/
		case SET_CONFIGURATION:
			byConfig = (BYTE)(pcmd->USBwValue & 0x00FF);
			if(gnDevState == DEVSTATE_DEFAULT)
			{
				bError = TRUE;
			}
			/* Assumes configurations are numbered 1 to NumConfigurations */
			else if(byConfig >USB_FSDeviceDescriptor[USB_FSDeviceDescriptorSize-1])
			{
				bError = TRUE;
			}
			else if(!byConfig)
			{
				gnDevState = DEVSTATE_ADDRESS;
			}
			else
			{
				/* Get pointer to requested configuration descriptor */
				gpCurCfg = (void *)USB_FSConfigDescriptor;
				/* Set all alternate settings to zero */
				for (n=0; n<M_MAXIFS; n++)
					gbyCurIfVal[n] = 0;
				/* Configure endpoints */
				ConfigureIfs();
				gnDevState = DEVSTATE_CONFIG;
				MWRITE_BYTE(M_REG_INDEX, 0);
				bNoData = TRUE;
			}
			break;

		/***��������Ҫ���豸��ĳ���������������ӿ�***/		
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

		/***����������ȡ�豸��ǰ�豸������ֵ***/		
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

		/***���ڻ�ȡ��ǰĳ���ӿ����������***/	
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

		/***�������û򼤻���������ߵ�ĳЩ����***/
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
			
		/***����CLEAR�����ߵ�ĳЩ����***/			
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
			
			
		/***����������ȡ�豸 STATUS***/					
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

			
		/***����ʶ�������***/
		default:
			/* Stall the command if an unrecognized request is received */
			bError = TRUE;
		break;
 }

	/* Stall command if an error occurred */
	if (bError)
	{
		/***���� OUTPKTRDY λ,��ֹ��ǰ����***/
		by = M_CSR0_SVDOUTPKTRDY | M_CSR0_SENDSTALL;
	}
	else if(bNoData)
	{
//		FIFOWrite(0, 0, pep0state->pData);
//		by = M_CSR0_INPKTRDY | M_CSR0_DATAEND;
//		MWRITE_BYTE(M_REG_CSR0, by);
		/***���� OUTPKTRDY λ,�ڷ���ʱ��ʾ����Ҫ���͵�ʱ���һ�����ݣ�����ʱ��Ҫ���յ������һ�����ݣ�***/
		by = M_CSR0_SVDOUTPKTRDY | M_CSR0_DATAEND;
//					pep0state->nBytesLeft = 0;
//					pep0state->nState = M_EP0_TX;			
	}
	else
	{
		/***���� OUTPKTRDY λ***/
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
		/***�����Ѿ�д�� FIFO ��,��Ҫ���͵�ʱ���һ������***/
		by = M_CSR0_INPKTRDY | M_CSR0_DATAEND;
		pep0state->nState = M_EP0_IDLE;
	}
	else
	{
		/***�����Ѿ�д�� FIFO ��***/
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
	uint8_t state = 0x00;
	uint8_t st_led = 0x00;
	BYTE    byOutCSR;
	
	/* Set index register */
	MWRITE_BYTE(M_REG_INDEX, 0);
	/* Read OUT CSR register */
	byOutCSR = MREAD_BYTE(M_REG_CSR0);

	/* Get packet, */
	/* may need to unload more than one packet if double buffering enabled */
	/*�˵�FIFO ��������*/
	while(byOutCSR & M_CSR0_OUTPKTRDY)
	{
		pep0state->nState = M_EP0_IDLE;

		/* Unload FIFO */
		//FIFORead(0, 1, pep0state->pData);//NUM CAP SCRָʾ����Ϣ
		//FIFORead(0, pep0state->nBytesLeft, pep0state->pData);//NUM CAP SCRָʾ����Ϣ
		
		/*����CAPS LOCK��*/
		FIFORead(0, sizeof(state), &state);
		
		st_led = (state & 0x02);
		switch(st_led)
		{
			case 0x00: GPIO_WriteBit(CAPS_PORT, CAPS_PIN, Bit_SET); break;
			case 0x02: GPIO_WriteBit(CAPS_PORT, CAPS_PIN, Bit_RESET); break;
		}

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
	pbyIfVal = (BYTE*)&gbyCurIfVal;	//�ӿ�
	for (byIf=0; byIf < pcfg->bNumInterfaces; byIf++, pbyIfVal++) 
	{
		/* Advance pointer to selected alternate interface descriptor */
		if (*pbyIfVal) 
		{
			for (byAltIf=0; byAltIf<*pbyIfVal; byAltIf++) 
			{
				byNumEPs = pif->bNumEndpoints;
				pby += sizeof(STD_IF_DSCR) + byNumEPs * sizeof(STD_EP_DSCR) + sizeof(STD_HID_DSCR);
				pif  = (PSTD_IF_DSCR)pby;
				/* Check an alternate setting > number of alternates not specified */
				if (!pif->bAlternateSetting)
				{
					return FALSE;
				}
			} 
		}

		/* Store pointer to interface in global array */
		gpCurIf[byIf] = pif;

		/* Loop through all endpoints in interface */
		byNumEPs = pif->bNumEndpoints;
		pby += sizeof(STD_IF_DSCR) + sizeof(STD_HID_DSCR);	//endpoint
		
		for ( byEP = 0; byEP < byNumEPs; byEP++ )
		{
			pep = (PSTD_EP_DSCR)pby;

			/* Configure the endpoint */
			MWRITE_BYTE(M_REG_INDEX, (pep->bEndpointAddress & 0x0F));
			/* Round up max packet size to a multiple of 8 for writing to MaxP registers */
			by = (BYTE)((pep->wMaxPacketSize + 7) >> 3);
			
			if(pep->bEndpointAddress & 0x80)
			{
				MWRITE_BYTE(M_REG_INMAXP, by);
				by = MREAD_BYTE(M_REG_INCSR2);
				
				switch (pep->bmAttributes & M_EP_TFMASK)
				{
					case M_EP_ISO:
						by |= M_INCSR2_ISO;
					break;
					case M_EP_BULK:
					case M_EP_INTR:						
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
				
				switch (pep->bmAttributes & M_EP_TFMASK)
				{
					case M_EP_ISO:
						by |= M_OUTCSR2_ISO;
					break;
					case M_EP_BULK:
					case M_EP_INTR:
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
	
	if(gnDevState > DEVSTATE_ADDRESS)
	{
		tEp0in.byEP = Ep;
		tEp0in.nBytesLeft = data_len;
		tEp0in.pData = ptr;
		EndpointBulkIn(tEp0in, M_EP_NORMAL);

		
		while(MREAD_BYTE(M_REG_INCSR1) & 0x01)
		{
			timeout++;
			if(timeout>=0xffffffff)
			{
				return ERROR;
			}
		}
		return SUCCESS;
	}
	
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
void USB_EP_Rx(uint8_t Ep,uint8_t *ptr,uint8_t data_len)
{
	M_EPBOUT_STATUS    tEp1out;
	
	tEp1out.byEP = Ep;
	tEp1out.nBuffLen = data_len; 	//M_EP_MAXP
	tEp1out.pData = ptr;
	tEp1out.nBytesRecv = 0;

	EndpointBulkOut(tEp1out, M_EP_NORMAL);
}


/*********************** (C) COPYRIGHT JD-DZ.COM ********************END OF FILE****/



