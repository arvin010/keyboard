/**
  ******************************************************************************
  * @file    	    usb_core.h
  * @author  	    FMD AE
  * @brief   		This file contains all the functions prototypes for the usb firmware
  *                 library.  	
  * @version 	    V1.0.0           
  * @data		    2022-01-13
  ******************************************************************************
  * @attention
  * COPYRIGHT (C) 2021 Fremont Micro Devices Corporation All rights reserved.
  *    This software is provided by the copyright holders and contributors,and the
  *software is believed to be accurate and reliable. However, Fremont Micro Devices
  * Corporation assumes no responsibility for the consequences of use of such
  *software or for any infringement of patents of other rights of third parties,
  *which may result from its use. No license is granted by implication or otherwise
  *under any patent rights of Fremont Micro Devices Corporation.
  *  ******************************************************************************
  */
#ifndef _USB_CORE_H_
#define _USB_CORE_H_

/* Includes ---------------------------------------------------------------------*/
#include "ft32f0xx.h"
#include "usb_desc.h"
#include "main.h"

/* Public Constant prototypes----------------------------------------------------*/

/* Public typedef ---------------------------------------------------------------*/
typedef enum _RESULT
{
	USB_SUCCESS = 0,			/* Process successfully */
	USB_ERROR,
	USB_UNSUPPORT,
	USB_NOT_READY				/* The process has not been finished, endpoint will be
								NAK to further request */
} RESULT;

typedef struct
{
  /* When send data out of the device,
	CopyData() is used to get data buffer 'Length' bytes data
	if Length is 0,
	CopyData() returns the total length of the data
	if the request is not supported, returns 0
	(NEW Feature )
	if CopyData() returns -1, the calling routine should not proceed
	further and will resume the SETUP process by the class device
	if Length is not 0,
	CopyData() returns a pointer to indicate the data location
	Usb_wLength is the data remain to be sent,
	Usb_wOffset is the Offset of original data
	When receive data from the host,
	CopyData() is used to get user data buffer which is capable
	of Length bytes data to copy data from the endpoint buffer.
	if Length is 0,
	CopyData() returns the available data length,
	if Length is not 0,
	CopyData() returns user buffer address
	Usb_rLength is the data remain to be received,
	Usb_rPointer is the Offset of data buffer
  */
	uint16_t  Usb_wLength;
	uint16_t  Usb_wOffset;
	uint16_t  PacketSize;
	uint8_t   *(*CopyData)(uint16_t Length);
}ENDPOINT_INFO;	
	
typedef struct{
	uint8_t ControlState;				/* of type CONTROL_STATE */
	uint8_t Current_Feature;
	uint8_t Current_Configuration;		/* Selected configuration */
	uint8_t Current_Interface;			/* Selected interface of current configuration */
	uint8_t Current_AlternateSetting;	/* Selected Alternate Setting of current                                    interface*/
	ENDPOINT_INFO Ctrl_Info;	
}DEVICE_INFO;


typedef	struct
{
	uint32_t	bit0:	1;
	uint32_t	bit1:	1;
	uint32_t	bit2:	1;
	uint32_t	bit3:	1;
	uint32_t	bit4:	1;
	uint32_t	bit5:	1;
	uint32_t	bit6:	1;
	uint32_t	bit7:	1;
	uint32_t	bit8:	1;
	uint32_t	bit9:	1;
	uint32_t	bit10:	1;
	uint32_t	bit11:	1;
	uint32_t	bit12:	1;
	uint32_t	bit13:	1;
	uint32_t	bit14:	1;
	uint32_t	bit15:	1;	
	uint32_t	bit16:	1;
	uint32_t	bit17:	1;
	uint32_t	bit18:	1;
	uint32_t	bit19:	1;
	uint32_t	bit20:	1;
	uint32_t	bit21:	1;
	uint32_t	bit22:	1;
	uint32_t	bit23:	1;
	uint32_t	bit24:	1;
	uint32_t	bit25:	1;
	uint32_t	bit26:	1;
	uint32_t	bit27:	1;
	uint32_t	bit28:	1;
	uint32_t	bit29:	1;
	uint32_t	bit30:	1;
	uint32_t	bit31:	1;
}VarBit;


/* Bulk In Endpoint status structure */
typedef struct M_EPBIN_STATUS {
	void *pData;     		/* Pointer to data to transmit */
	int   nBytesLeft;		/* Number of bytes left to send */
	BYTE  byEP;      		/* Endpoint number */
} M_EPBIN_STATUS;
typedef M_EPBIN_STATUS* PM_EPBIN_STATUS;

/* Bulk Out Endpoint status structure */
typedef struct M_EPBOUT_STATUS {
  void *pData;     			/* Pointer to data buffer */
  int   nBuffLen;  			/* Length of data buffer */
  int   nBytesRecv;			/* Number of bytes received */
  BYTE  byEP;      			/* Endpoint number */
  } M_EPBOUT_STATUS;
typedef M_EPBOUT_STATUS* PM_EPBOUT_STATUS;
	
/* Public define ----------------------------------------------------------------*/
#define TRUE  1
#define FALSE 0
#ifndef NULL
#define NULL 0
#endif

/* Define MUSBFSFC register addresses */
#define BASE_ADDR 0x40005c00

#define M_REG_FADDR     			BASE_ADDR
#define M_REG_POWER     			BASE_ADDR+1
#define M_REG_INTRIN1   			BASE_ADDR+2
#define M_REG_INTRIN2   			BASE_ADDR+3
#define M_REG_INTROUT1  			BASE_ADDR+4
#define M_REG_INTROUT2  			BASE_ADDR+5
#define M_REG_INTRUSB   			BASE_ADDR+6
#define M_REG_INTRIN1E  			BASE_ADDR+7
#define M_REG_INTRIN2E  			BASE_ADDR+8
#define M_REG_INTROUT1E 			BASE_ADDR+9
#define M_REG_INTROUT2E 			BASE_ADDR+10
#define M_REG_INTRUSBE  			BASE_ADDR+11
#define M_REG_FRAME1    			BASE_ADDR+12
#define M_REG_FRAME2    			BASE_ADDR+13
#define M_REG_INDEX     			BASE_ADDR+14			
			
#define M_REG_CSR0      			BASE_ADDR+17
#define M_REG_INMAXP    			BASE_ADDR+16
#define M_REG_INCSR1    			BASE_ADDR+17
#define M_REG_INCSR2    			BASE_ADDR+18
#define M_REG_OUTMAXP   			BASE_ADDR+19
#define M_REG_OUTCSR1   			BASE_ADDR+20
#define M_REG_OUTCSR2   			BASE_ADDR+21
#define M_REG_OUTCOUNT1 			BASE_ADDR+22
#define M_REG_OUTCOUNT2 			BASE_ADDR+23
			
#define M_FIFO_EP0      			BASE_ADDR+32


/* Interrupt register bit masks */
#define M_INTR_SUSPEND  			0x01
#define M_INTR_RESUME   			0x02
#define M_INTR_RESET    			0x04
#define M_INTR_EP0      			0x0001
	
/* CSR0 bit masks */	
#define M_CSR0_OUTPKTRDY        	0x01
#define M_CSR0_INPKTRDY         	0x02
#define M_CSR0_SENTSTALL        	0x04
#define M_CSR0_DATAEND          	0x08
#define M_CSR0_SETUPEND         	0x10
#define M_CSR0_SENDSTALL        	0x20
#define M_CSR0_SVDOUTPKTRDY     	0x40
#define M_CSR0_SVDSETUPEND      	0x80

/* Endpoint CSR register bits */
#define M_INCSR2_ISO    			0x40
#define M_INCSR2_MODE   			0x20
#define M_INCSR_CDT     			0x40
#define M_INCSR_FF      			0x08
#define M_INCSR_IPR     			0x01
#define M_OUTCSR2_ISO   			0x40
#define M_OUTCSR_CDT    			0x80
#define M_OUTCSR_FF     			0x10
#define M_OUTCSR_OPR    			0x01

/**
  * @brief USB_PDCTRL
  */
#define	USB_PDCTRL_FLAG 			((uint8_t)(0x03))	
	
#define	USB_PDCTRL_PD_DISABLE		((uint8_t)(0x00))
#define	USB_PDCTRL_PD_ENABLE		((uint8_t)(0x02))
	
#define	USB_PDCTRL_PU_DISABLE		((uint8_t)(0x00))
#define	USB_PDCTRL_PU_ENABLE		((uint8_t)(0x01))
	
#define	IS_USB_PDCTRL(PDCTRL)		(((PDCTRL) == USB_PDCTRL_PD_DISABLE) || \
									((PDCTRL) == USB_PDCTRL_PD_ENABLE) || \
									((PDCTRL) == USB_PDCTRL_PU_DISABLE) || \
									((PDCTRL) == USB_PDCTRL_PU_ENABLE))

/**
  * @brief   USB_IT_FLAG
  */
#define	USB_IT_IN_EP0_FLAG			((uint32_t) 0x00000101)
#define	USB_IT_IN_EP1_FLAG			((uint32_t) 0x00000102)
#define	USB_IT_IN_EP2_FLAG			((uint32_t) 0x00000104)
#define	USB_IT_IN_EP3_FLAG			((uint32_t) 0x00000108)
#define	USB_IT_IN_EP4_FLAG			((uint32_t) 0x00000110)
#define	USB_IT_IN_EP5_FLAG			((uint32_t) 0x00000120)
#define	USB_IT_IN_EP6_FLAG			((uint32_t) 0x00000140)
#define	USB_IT_IN_EP7_FLAG			((uint32_t) 0x00000180)

#define	USB_IT_OUT_EP1_FLAG			((uint32_t) 0x00000202)
#define	USB_IT_OUT_EP2_FLAG			((uint32_t) 0x00000204)
#define	USB_IT_OUT_EP3_FLAG			((uint32_t) 0x00000208)
#define	USB_IT_OUT_EP4_FLAG			((uint32_t) 0x00000210)
#define	USB_IT_OUT_EP5_FLAG			((uint32_t) 0x00000220)
#define	USB_IT_OUT_EP6_FLAG			((uint32_t) 0x00000240)
#define	USB_IT_OUT_EP7_FLAG			((uint32_t) 0x00000280)

#define	USB_IT_USB_SUSPEND_FLAG		((uint32_t) 0x00000401)
#define	USB_IT_USB_RESUME_FLAG		((uint32_t) 0x00000402)
#define	USB_IT_USB_RESET_FLAG		((uint32_t) 0x00000404)
#define	USB_IT_USB_SOF_FLAG			((uint32_t) 0x00000408)


/* Register read/write macros */
#define MREAD_BYTE(addr) *((BYTE *)(addr))
#define MWRITE_BYTE(addr,data) *((BYTE *)(addr)) = data


/* Endpoint 0 states */
#define M_EP0_IDLE      			0  	//¿ÕÏÐ×´Ì¬
#define M_EP0_RX        			1  
#define M_EP0_TX        			2

/* Define maximum packet size for endpoint 0 */
#define M_EP0_MAXP      			64

/* Define maximum number of interfaces in a configuration */
#define M_MAXIFS        			7

/* HID Request Types */
#define HID_REQUEST_SET				0x21
#define HID_REQUEST_GET				0xA1

/* HID Request Codes */
#define HID_REQUEST_GET_REPORT		0x01
#define HID_REQUEST_GET_IDLE		  0x02
#define HID_REQUEST_GET_PROTOCOL	0x03
#define HID_REQUEST_SET_REPORT		0x09
#define HID_REQUEST_SET_IDLE		  0x0A
#define HID_REQUEST_SET_PROTOCOL	0x0B

/* HID Report Types */
#define HID_REPORT_INPUT			  0x01
#define HID_REPORT_OUTPUT			  0x02
#define HID_REPORT_FEATURE			0x03

/* Define device states */
#define DEVSTATE_DEFAULT        	0		//¸´Î»×´Ì¬
#define DEVSTATE_ADDRESS        	1		//µØÖ·×´Ì¬
#define DEVSTATE_CONFIG         	2		//ÅäÖÃ×´Ì¬
/* Define endpoint call status values */
#define M_EP_NORMAL     			0
#define M_EP_RESET      			1


#define	usb_ep1_flag				flag1.bit0
#define	f_send_kb					  flag1.bit2
#define	f_usb_suspend				flag1.bit3
#define	f_sof_flag					flag1.bit4
		
/*usb_state FLAG*/		
#define	USB_NORMAL					  0x00
#define	USB_SUSPEND_FLAG			0x01
#define	USB_RESUME_FLAG				0x02

/**
  * @brief   USB_FLAG
  */
//#define	USB_FADDR_UPDATE_FLAG		  ((uint32_t) 0x00000180)

//#define	USB_POWER_RESET_FLAG		  ((uint32_t) 0x00000208)
//#define	USB_POWER_SUSPENDM_FLAG		((uint32_t) 0x00000202)
	

#define ep_boot_keyboard  0x01
#define ep_touchpad       0x02
#define ep_consumer       0x02
#define ep_sysctrl        0x02
#define ep_hid_keyboard   0x02
#define ep_hid_vendor_tx  0x04
#define ep_hid_vendor_rx  0x05

#define ep_iap2_vendor_tx  0x01
#define ep_iap2_vendor_rx  0x00


#define LEN_BOOT_KEYBOARD_DATA   8
#define LEN_TOUCHPAD_DATA        5
#define LEN_CONSUMER_DATA        2
#define LEN_SYSCTRL_DATA         2
#define LEN_HID_KEYBOARD_DATA    15


#define M_EP_NODATA    		-1
/* Define maximum packet size for bulk endpoints */
#define M_EP_MAXP       	64

/* Public variables prototypes --------------------------------------------------*/

extern DEVICE_INFO *pInformation;	
extern uint32_t		gnDevState;
extern PSTD_IF_DSCR	gpCurIf[M_MAXIFS];

/* Public function prototypes----------------------------------------------------*/

void USB_Init(void);
void USB_FS_IRQHandler(void);
void USB_Suspend(void);
void USB_Reset(void);
void EndpointBulkIn(M_EPBIN_STATUS, int);
int EndpointBulkOut(M_EPBOUT_STATUS, int);

void USB_Endpoint0(int);
void USB_Remote_Wakeup(void);
ErrorStatus USB_EP_Tx(uint8_t Ep,uint8_t *ptr,uint8_t data_len);
int USB_EP_Rx(uint8_t Ep,uint8_t *ptr,uint8_t data_len);

uint8_t USB_ReadRegister(uint8_t USB_Refister);
void USB_PDCTRLConfig(uint8_t PDCT);
void FIFORead(int, int, void*);
void FIFOWrite(int, int, void*);
void USB_ITConfig(uint32_t USB_IT, FunctionalState NewState);
ITStatus USB_GetITStatus(uint32_t USB_IT);

#endif /* _USB_CORE_H_ */

/************************* (C) COPYRIGHT JD-DZ.COM *****END OF FILE*********************/

