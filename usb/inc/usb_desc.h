/**
  ******************************************************************************
  * @file    	    usb_desc.h
  * @author  	    FMD AE
  * @brief   		This file contains all the functions prototypes for the usb_desc 
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
#ifndef _DESCRIPT_H_
#define _DESCRIPT_H_
/* Includes ---------------------------------------------------------------------*/
#include "ft32f0xx.h"

/* Public Constant prototypes----------------------------------------------------*/

/* Public typedef ---------------------------------------------------------------*/
#ifndef BYTE
typedef unsigned char BYTE;
#endif
#ifndef WORD
typedef unsigned short WORD;
#endif

#pragma pack(1)

typedef union
{
	uint16_t w;
	struct BW
	{
	uint8_t bb0;
	uint8_t bb1;
	}
	bw;
} uint16_t_uint8_t;
/* Command structure */
typedef struct COMMAND {
	BYTE  bmRequestType;
	BYTE  bRequest;
	uint16_t_uint8_t  wValue;
	uint16_t_uint8_t  wIndex;
	uint16_t_uint8_t  wLength;
  } COMMAND;	
typedef COMMAND*  PCOMMAND;
/* Standard Device Descriptor */
typedef struct STD_DEV_DSCR 
{
	BYTE  bLength;
	BYTE  bDescriptorType;
	WORD  bcdUSB;
	BYTE  bDeviceClass;
	BYTE  bDeviceSubClass;
	BYTE  bDeviceProtocol;
	BYTE  bMaxPacketSize0;
	WORD  idVendor;
	WORD  idProduct;
	WORD  bcdDevice;
	BYTE  iManufacturer;
	BYTE  iProduct;
	BYTE  iSerialNumber;
	BYTE  bNumConfigurations;
} STD_DEV_DSCR;
typedef STD_DEV_DSCR* PSTD_DEV_DSCR;

/* Standard Configuration Descriptor */
typedef struct STD_CFG_DSCR 
{
	BYTE  bLength;
	BYTE  bDescriptorType;
	WORD  wTotalLength;
	BYTE  bNumInterfaces;
	BYTE  bConfigurationValue;
	BYTE  iConfiguration;
	BYTE  bmAttributes;
	BYTE  bMaxPower;
} STD_CFG_DSCR;
typedef STD_CFG_DSCR* PSTD_CFG_DSCR;

/* Standard Interface Descriptor */
typedef struct STD_IF_DSCR 
{
	BYTE  bLength;
	BYTE  bDescriptorType;
	BYTE  bInterfaceNumber;
	BYTE  bAlternateSetting;
	BYTE  bNumEndpoints;
	BYTE  bInterfaceClass;
	BYTE  bInterfaceSubClass;
	BYTE  bInterfaceProtocol;
	BYTE  iInterface;
} STD_IF_DSCR;
typedef STD_IF_DSCR* PSTD_IF_DSCR;

/* Standard Endpoint Descriptor */
typedef struct STD_EP_DSCR 
{
	BYTE  bLength;
	BYTE  bDescriptorType;
	BYTE  bEndpointAddress;
	BYTE  bmAttributes;
	WORD  wMaxPacketSize;
	BYTE  bInterval;
} STD_EP_DSCR;
typedef STD_EP_DSCR* PSTD_EP_DSCR;
		
typedef struct STD_HID_DSCR 
{
	BYTE  bLength;
	BYTE  bDescriptorTypeHid;
	WORD  bcdHID;
	BYTE	CountryCode;
	BYTE	bNumDescriptors;
	BYTE  bDescriptorType;
	WORD	wDescriptorLength;
} STD_HID_DSCR;
typedef STD_HID_DSCR* PSTD_HID_DSCR;  

/*HID CLASS REQUEST DATA*/
typedef struct
{
	uint8_t	wHID_SetRptByte[16];
	uint8_t	wHID_IdleTimeIf0ID;
	uint8_t	wHID_Protocol;
	uint8_t	wHID_SetReportFeature;
	uint32_t	wHID_Setreportfeature[16];
	uint32_t	wHID_Status;
}CLASS_HID_DATA;
/*
  Define configuration structures
  The configuration structures need to be modified to match the required configuration
  Each configuration should start with a configuration descriptor
  followed by 1 or more interface descriptors (each of which is followed by
  endpoint descriptors for all the endpoints in that interface).
  The interface descriptors should start with interface 0, alternate setting 0.
  Followed by any alternate settings for interface 0.
  Then interface 1 (if more than 1 interface in the configuration), followed
  by any alternate settings for interface 1.
  This arrangement should be repeated for all interfaces in the configuration.
*/

/* Configuration 1 */
typedef struct M_CFG_1 {
	STD_CFG_DSCR  stdcfg;			/* Required Standard Configuration Descriptor */
	STD_IF_DSCR   stdif00;			/* Interface 0 Descriptor */
	STD_HID_DSCR	stdhid;			/* HID Descriptor*/
	STD_EP_DSCR   stdep00_0;		/* 1st Endpoint Descriptor for Interface 0 */
} M_CFG_1;
typedef M_CFG_1* PM_CFG_1;

/* Configuration 2 */
typedef struct M_CFG_2 {
	STD_CFG_DSCR  stdcfg;			/* Required Standard Configuration Descriptor */
	STD_IF_DSCR   stdif00;			/* Interface 0 Descriptor */
	STD_EP_DSCR   stdep00_0;		/* 1st Endpoint Descriptor for Interface 0 */
	STD_EP_DSCR   stdep00_1;		/* 2nd Endpoint Descriptor for Interface 0 */
	STD_IF_DSCR   stdif10;			/* Interface 1 Descriptor */
	STD_EP_DSCR   stdep10_0;		/* 1st Endpoint Descriptor for Interface 1 */
	STD_EP_DSCR   stdep10_1;		/* 2nd Endpoint Descriptor for Interface 1 */
} M_CFG_2;
typedef M_CFG_2* PM_CFG_2;

/* Top level structure containing pointers to each configuration */
typedef struct M_CFG {
	PM_CFG_1      pcfg1;			/* Pointer to M_CFG_1 */
	PM_CFG_2      pcfg2;			/* Pointer to M_CFG_2 */
  } M_CFG;
typedef M_CFG* PM_CFG;
  



/* Public define ----------------------------------------------------------------*/
#define StatusInfo0 			StatusInfo.bw.bb1 /* Reverse bb0 & bb1 */
#define StatusInfo1 			StatusInfo.bw.bb0
		
#define USBwValue 				wValue.w
#define USBwValue0 				wValue.bw.bb0
#define USBwValue1 				wValue.bw.bb1
#define USBwIndex 				wIndex.w
#define USBwIndex0 				wIndex.bw.bb0
#define USBwIndex1 				wIndex.bw.bb1
#define USBwLength 				wLength.w
#define USBwLength0				wLength.bw.bb0
#define USBwLength1 			wLength.bw.bb1
	
/* Command bit fields */
#define M_CMD_DATADIR   		0x80

/* Request Type Field */
#define M_CMD_TYPEMASK  		0x60
#define M_CMD_STDREQ    		0x00
#define M_CMD_CLASSREQ  		0x20
#define M_CMD_VENDREQ   		0x40
#define M_CMD_STDDEVIN  		0x80
#define M_CMD_STDDEVOUT 		0x00
#define M_CMD_STDIFIN   		0x81
#define M_CMD_STDIFOUT  		0x01
#define M_CMD_STDEPIN   		0x82
#define M_CMD_STDEPOUT  		0x02

/* Standard Request Codes */
#define GET_STATUS              0x00
#define CLEAR_FEATURE           0x01
#define SET_FEATURE             0x03
#define SET_ADDRESS             0x05
#define GET_DESCRIPTOR          0x06
#define SET_DESCRIPTOR          0x07
#define GET_CONFIGURATION       0x08
#define SET_CONFIGURATION       0x09
#define GET_INTERFACE           0x0A
#define SET_INTERFACE           0x0B
#define SYNCH_FRAME             0x0C

/* Standard Descriptor Types */
#define M_DST_DEVICE     		  0x01
#define M_DST_CONFIG     		  0x02
#define M_DST_STRING     		  0x03
#define M_DST_INTERFACE  		  0x04
#define M_DST_ENDPOINT   		  0x05
#define M_DST_DEVQUAL    		  0x06
#define M_DST_OTHERSPEED 		  0x07
#define M_DST_POWER      		  0x08
#define	M_DST_HID_REPORT_DESC	0x22
#define M_CMD_DESCMASK   		  0xFF00
#define M_CMD_DEVICE			    (M_DST_DEVICE<<8)
#define M_CMD_CONFIG			    (M_DST_CONFIG<<8)
#define M_CMD_STRING			    (M_DST_STRING<<8)
#define M_CMD_DEVQUAL			    (M_DST_DEVQUAL<<8)
#define M_CMD_OTHERSPEED		  (M_DST_OTHERSPEED<<8)
#define	M_CMD_HID_REPORT_DESC	(M_DST_HID_REPORT_DESC<<8)

/* Endpoint transfer types */
#define M_EP_TFMASK     		0x03
#define M_EP_CONTROL    		0x00
#define M_EP_ISO        		0x01
//#define M_EP_BULK       		0x10
//#define M_EP_INTR       		0x11
#define M_EP_BULK       		0x02
#define M_EP_INTR       		0x03

/* Standard Device Feature Selectors */
#define M_FTR_EPHALT			  0x0000
#define M_FTR_DEVREMWAKE 		0x0001
#define M_FTR_TESTMODE 			0x0002


#define RPT_TOUCHPAD        0x01  // report id for touchpad
#define RPT_CONSUMER        0x03  // report id for consumer
#define RPT_SYSCTRL         0x02  // report id for system control
#define RPT_HID_KEYBOARD    0x06  // report id for È«¼üÎÞ³å

/* Public variables prototypes --------------------------------------------------*/
extern uint16_t_uint8_t StatusInfo; 
extern const uint8_t LanguageId[];
extern const uint8_t ManufacturerStringDescriptor[];
extern const uint8_t ProductStringDescriptor[];

extern const uint8_t iapStringDescriptor[];

extern const uint8_t SerialNumberSringDescriptor[];
extern const uint8_t USB_FSDeviceDescriptor[];
extern const uint8_t USB_FSConfigDescriptor[];
extern const uint8_t USB_HID_FSReportDescriptor_1[]; 
extern const uint8_t USB_HID_FSReportDescriptor_2[];
extern const uint8_t USB_HID_FSReportDescriptor_3[];
extern const uint8_t USB_HID_FSReportDescriptor_4[];
extern const uint8_t USB_HID_FSReportDescriptor_5[];
	
extern const uint16_t USB_FSDeviceDescriptorSize;
extern const uint16_t USB_FSConfigDescriptorSize;
extern const uint16_t LanguageIdSize;
extern const uint16_t ManufacturerStringDescriptorSize;
extern const uint16_t iapStringDescriptorSize;

extern const uint16_t ProductStringDescriptorSize;
extern const uint16_t SerialNumberSringDescriptorSize;
extern const uint16_t USB_HID_FSReportDescriptor_1Size;
extern const uint16_t USB_HID_FSReportDescriptor_2Size;
extern const uint16_t USB_HID_FSReportDescriptor_3Size;
extern const uint16_t USB_HID_FSReportDescriptor_4Size;
extern const uint16_t USB_HID_FSReportDescriptor_5Size;
/* Public function prototypes----------------------------------------------------*/

#endif /* _DESCRIPT_H_ */
/************************* (C) COPYRIGHT FMD *****END OF FILE*********************/

