/**
  *********************************************************************************
  * @file    	    usb_desc.c
  * @author  	    FMD AE
  * @brief   		This file contains  functions  for the usb_desc firmware
  *                 library.   	
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

#include "usb_desc.h"
/* Private Constant --------------------------------------------------------------*/
/* Public Constant ---------------------------------------------------------------*/
const uint8_t USB_FSDeviceDescriptor[] = 
{
  /*---------------------- Device Descriptor ----------------------*/
	0x12,		// bLength                 
	0x01,		// bDescriptorType         
	0x10,		// bcdUSB L               
	0x02,		// bcdUSB H               
	0x00,		// bDeviceClass            
	0x00,		// bDeviceSubClass      
	0x00,		// bDeviceProtocol         
	0x40,		// bMaxPacketSize0       
	0x4F,		// idVendor VID:34D3          
	0x1C,		
	0x72,		// idProduct				
	0x00,		
	0x01,		// bcdDevice 
	0x00,		
	0x01,		// iManufacturer           
	0x02,		// iProduct              
	0x03,		// iSerialNumber          
	0x01 		// bNumConfigurations    
};
const uint16_t USB_FSDeviceDescriptorSize = sizeof(USB_FSDeviceDescriptor);

const uint8_t USB_FSConfigDescriptor[] = 
{

  /*------------------ Configuration Descriptor -------------------  */
	0x09,		// bLength                
	0x02,		// bDescriptorType       
	0x20,		// wTotalLength 
	0x00,		   
	0x01,		// bNumInterfaces         
	0x01,		// bConfigurationValue    
	0x00,		// iConfiguration         
	0x80,		// bmAttributes           
	0x32,		// MaxPower 
	
	//-----------------------------------------------------------------//
	/*---------------- Interface 0 Descriptor -------------------------*/
	0x09,		// bLength               
	0x04,		// bDescriptorType       
	0x00,		// bInterfaceNumber     
	0x00,		// bAlternateSetting     
	0x02,		// bNumEndpoints         
	0xff,		// bInterfaceClass        
	0xf0,		// bInterfaceSubClass    
	0x00,		// bInterfaceProtocol   
	0x04,		// iInterface     

	
  /*------------------- Endpoint Descriptor------------------------*/
	0x07,	    //bLength              
	0x05,     //bDescriptorType      
	0x81,     //bEndpointAddress     
	0x02,     //bmAttributes         
	0x40,     //wMaxPacketSize (Low Byte) 
	0x00,	    //wMaxPacketSize (High Byte)
	0x00,     //bInterval  
  /*------------------- Endpoint Descriptor------------------------*/
  0x07,	    // bLength: Endpoint Descriptor size
  0x05,	    // bDescriptorType: 
  0x02,	    // bEndpointAddress: Endpoint Address (OUT)
  0x02,	    // bmAttributes: Interrupt endpoint
  0x40,	    //wMaxPacketSize (Low Byte)
  0x00,     //wMaxPacketSize (High Byte)  
  0x00,	    // bInterval: Polling Interval (1 ms) 




};
const uint16_t USB_FSConfigDescriptorSize = sizeof(USB_FSConfigDescriptor);

const uint8_t LanguageId[] = 
{
	0x04,		// ±¾ÃèÊö·ûµÄ³¤¶È
	0x03,		// ×Ö·û´®ÃèÊö·û
	0x09,		// 0x0409ÎªÃÀÊ½Ó¢ÓïID
	0x04
};
const uint16_t LanguageIdSize = sizeof(LanguageId);

const uint8_t ManufacturerStringDescriptor[] = 
{
	(5*2 + 2),	// length
	0x03,		    // ×Ö·û´®ÃèÊö·ûµÄÀàÐÍ±àÂë0x03
	'J',0,
	'D',0,
	'-',0,
	'D',0,
	'Z',0,
};
const uint16_t ManufacturerStringDescriptorSize = sizeof(ManufacturerStringDescriptor);

const uint8_t ProductStringDescriptor[] = 
{

	
		(12*2 + 2),//length
		0x03,			//×Ö·û´®ÃèÊö·ûµÄÀàÐÍ±àÂë0x03
		'm',0,
		'f',0,
		'i',0,
		' ',0,
	
		'k',0,
		'e',0,
		'y',0,
		'b',0,
		'o',0,
		'a',0,
		'r',0,
		'd',0
	

};

const uint16_t ProductStringDescriptorSize = sizeof(ProductStringDescriptor);

const uint8_t iapStringDescriptor[] = 
{

	#if 1
		(13*2 + 2),//length
		0x03,			//×Ö·û´®ÃèÊö·ûµÄÀàÐÍ±àÂë0x03
		'i',0,
		'A',0,
		'P',0,
		' ',0,
	
		'I',0,
		'n',0,
		't',0,
		'e',0,
		'r',0,
		'f',0,
		'a',0,
		'c'	,0,
		'e',0
	#else
		(13 + 2),//length
		0x03,			//×Ö·û´®ÃèÊö·ûµÄÀàÐÍ±àÂë0x03
		'i',
		'A',
		'P',
		' ',
	
		'I',
		'n',
		't',
		'e',
		'r',
		'f',
		'a',
		'c'	,
		'e'
	#endif

};
const uint16_t iapStringDescriptorSize = sizeof(iapStringDescriptor);

const uint8_t SerialNumberSringDescriptor[] = 
{
	(10*2 + 2),	// length
	0x03,		    // ×Ö·û´®ÃèÊö·ûµÄÀàÐÍ±àÂë0x03
	'2',0,
	'0',0,
	'2',0,
	'2',0,
	'-',0,
	'0',0,
	'3',0,
	'-',0,
	'2',0,
	'8',0,	
};
const uint16_t SerialNumberSringDescriptorSize = sizeof(SerialNumberSringDescriptor);

const uint8_t USB_HID_FSReportDescriptor_1 [] = 
{
  0x05, 0x01,      		// Usage Page (Generic Desktop Controls)
  0x09, 0x06,      		// Usage (Keyboard)
  0xA1, 0x01,      		// Collection (Application)
  0x05, 0x07,      		// Usage Page (Keyboard)
  0x19, 0xE0,      		// Usage Minimum (Left CTRL)
  0x29, 0xE7,      		// Usage Maximum (Right WIN)
  0x15, 0x00,      		// Logical Minimum (0)
  0x25, 0x01,      		// Logical Maximum (1)
  0x75, 0x01,      		// Report Size (1)
  0x95, 0x08,      		// Report Count (8)
  0x81, 0x02,      		// Input (Var)
  0x95, 0x01,      		// Report Count (1)
  0x75, 0x08,      		// Report Size (8)
  0x81, 0x01,      		// Input (Const)
  0x95, 0x05,      		// Report Count (5)
  0x75, 0x01,      		// Report Size (1)
  0x05, 0x08,      		// Usage Page (LEDs)
  0x19, 0x01,      		// Usage Minimum (1)
  0x29, 0x05,      		// Usage Maximum (5)
  0x91, 0x02,      		// Output (Var)
  0x95, 0x01,      		// Report Count (1)
  0x75, 0x03,      		// Report Size (3)
  0x91, 0x01,      		// Output (Const)
  0x95, 0x06,      		// Report Count (6)
  0x75, 0x08,      		// Report Size (8)
  0x15, 0x00,      		// Logical Minimum (0)
  0x26, 0xFF, 0x00,		// Logical Maximum (255)
  0x05, 0x07,      		// Usage Page (Keyboard)
  0x19, 0x00,      		// Usage Minimum (0)
  0x2A, 0xFF, 0x00,		// Usage Maximum (255)
  0x81, 0x00,      		// Input ()
  0xC0					      // End Collection
};
const uint16_t USB_HID_FSReportDescriptor_1Size = sizeof(USB_HID_FSReportDescriptor_1);

const uint8_t USB_HID_FSReportDescriptor_2 [] = 
{
/* mouse  (63 byte) */
    0x05, 0x01,                      //   Usage Page (Generic Desktop)
    0x09, 0x02,                      //   Usage (Mouse)
    0xA1, 0x01,                      //   Collection (Application)
    0x85, 0x01,                      //   Report ID (1)
    0x09, 0x01,                      //   Usage (Pointer)
    0xA1, 0x00,                      //   Collection (Physical)
    0x05, 0x09,                      //   Usage Page (Button)
    0x19, 0x01,                      //   Usage Minimum (Button 1)
    0x29, 0x05,                      //   Usage Maximum (Button 5)
    0x15, 0x00,                      //   Logical Minimum (0)
    0x25, 0x01,                      //   Logical Maximum (1)
    0x95, 0x05,                      //   Report Count (5)
    0x75, 0x01,                      //   Report Size (1)
    0x81, 0x02,                      //   Input (Data,Var,Abs,NWrp,Lin,Pref,NNul,Bit)
    0x95, 0x01,                      //   Report Count (1)
    0x75, 0x03,                      //   Report Size (3)
    0x81, 0x03,                      //   Input (Cnst,Var,Abs,NWrp,Lin,Pref,NNul,Bit)

    0x05, 0x01,                      //   Usage Page (Generic Desktop)
    0x09, 0x30,                      //   Usage (X)
    0x09, 0x31,                      //   Usage (Y)
    0x09, 0x38,                      //   Usage (Wheel)
    0x15, 0x81,                      //   Logical Minimum (-127)
    0x25, 0x7F,                      //   Logical Maximum (127)
    0x75, 0x08,                      //   Report Size (8)
    0x95, 0x03,                      //   Report Count (3)
    0x81, 0x06,                      //   Input (Data,Var,Rel,NWrp,Lin,Pref,NNul,Bit)
    0x05, 0x0C,                      //   Usage Page (Consumer Devices)
    0x0A, 0x38, 0x02,                //   Usage (AC Pan)
    0x95, 0x01,                      //   Report Count (1)
    0x81, 0x06,                      //   Input (Data,Var,Rel,NWrp,Lin,Pref,NNul,Bit)
    0xC0, 0xC0,                      // END_COLLECTION	


    /* system control (24 byte) */
    0x05, 0x01,                      // USAGE_PAGE (Generic Desktop)
    0x09, 0x80,                      // USAGE (System Control)
    0xa1, 0x01,                      // COLLECTION (Application)
    0x85, 0x02,                      //   REPORT_ID (2)
    0x15, 0x01,                      //   LOGICAL_MINIMUM (0x1)
    0x26, 0xb7, 0x00,                //   LOGICAL_MAXIMUM (0xb7)
    0x19, 0x01,                      //   USAGE_MINIMUM (0x1)
    0x29, 0xb7,                      //   USAGE_MAXIMUM (0xb7)
    0x75, 0x10,                      //   REPORT_SIZE (16)
    0x95, 0x01,                      //   REPORT_COUNT (1)
    0x81, 0x00,                      //   INPUT (Data,Array,Abs)
    0xc0,                            // END_COLLECTION

    /* consumer (25 byte)*/
    0x05, 0x0c,                      // USAGE_PAGE (Consumer Devices)
    0x09, 0x01,                      // USAGE (Consumer Control)
    0xa1, 0x01,                      // COLLECTION (Application)
    0x85, 0x03,                      //   REPORT_ID (3)
    0x15, 0x01,                      //   LOGICAL_MINIMUM (0x1)
    0x26, 0x9c, 0x08,                //   LOGICAL_MAXIMUM (0x29c)
    0x19, 0x01,                      //   USAGE_MINIMUM (0x1)
    0x2a, 0x9c, 0x08,                //   USAGE_MAXIMUM (0x29c)
    0x75, 0x10,                      //   REPORT_SIZE (16)
    0x95, 0x01,                      //   REPORT_COUNT (1)
    0x81, 0x00,                      //   INPUT (Data,Array,Abs)
    0xc0,                            // END_COLLECTION
		
		//  Keyboard (112key) 25 Bytes
		0x05, 0x01,   // Usage Page (Generic Desktop)                   
		0x09, 0x06,   // Usage (Keyboard)                               
		0xA1, 0x01,   // Collection (Application)                       
		0x85, 0x06,   //    Report ID (6)                              
		0x05, 0x07,   //    Usage Page (Keyboard/Keypad)               
		0x19, 0x04,   //    Usage Minimum (Keyboard a and A)           
		0x29, 0x73,   //    Usage Maximum (Keyboard F24)               
		0x15, 0x00,   //    Logical Minimum (0)                        
		0x25, 0x01,   //    Logical Maximum (1)                        
		0x75, 0x01,   //    Report Size (1)                            
		0x95, 0x78,   //    Report Count (120)                         
		0x81, 0x02,   //    Input (Data,Var,Abs,NWrp,Lin,Pref,NNul,Bit)
		0xC0,         // End Collection
		
		/* Vendor Defined (37 Bytes) */
//    0x06, 0x00, 0xFF,                      // Usage Page (Vendor Defined)
//    0x0A, 0x00, 0xFF,                      // Usage Page (Vendor Defined)
//    0xA1, 0x01,                            // COLLECTION (Application)
//    0x85, 0x38,                            // Report ID (Vendor Defined)
//    0x15, 0x00,                            // Logical Minimum
//    0x26, 0xFF, 0x00,                      // Logical Maximum
//    0x75, 0x08,                            // Report Size
//    0x95, 0x40,                            // Report Count
//    0x09, 0x01,                            // Vendor Usage
//    0x81, 0x00,                            // Input (Data,Var,Abs)

//    0x09, 0x01,                            // Vendor Usage
//    0x15, 0x00,                            // Logical Minimum
//    0x26, 0xFF, 0x00,                      // Logical Maximum
//    0x75, 0x08,                            // Report Size
//    0x95, 0x40,                            // Report Count
//    0x91 ,0x00,                            // Ouput (Data,Var,Abs)
//    0xC0,	
};
const uint16_t USB_HID_FSReportDescriptor_2Size = sizeof(USB_HID_FSReportDescriptor_2);


const uint8_t USB_HID_FSReportDescriptor_3 [] = 
{
		//  Keyboard (112key) 23 Bytes
		0x05, 0x01,   // Usage Page (Generic Desktop)                   
		0x09, 0x06,   // Usage (Keyboard)                               
		0xA1, 0x01,   // Collection (Application)                                                  
		0x05, 0x07,   //    Usage Page (Keyboard/Keypad)               
		0x19, 0x04,   //    Usage Minimum (Keyboard a and A)           
		0x29, 0x73,   //    Usage Maximum (Keyboard F24)               
		0x15, 0x00,   //    Logical Minimum (0)                        
		0x25, 0x01,   //    Logical Maximum (1)                        
		0x75, 0x01,   //    Report Size (1)                            
		0x95, 0x78,   //    Report Count (120)                         
		0x81, 0x02,   //    Input (Data,Var,Abs,NWrp,Lin,Pref,NNul,Bit)
		0xC0,         // End Collection	
};
const uint16_t USB_HID_FSReportDescriptor_3Size = sizeof(USB_HID_FSReportDescriptor_3);


const uint8_t USB_HID_FSReportDescriptor_4 [] = 
{
		/* Vendor Defined (35 Bytes) */
    0x06, 0x00, 0xFF,                      // Usage Page (Vendor Defined)
    0x0A, 0x00, 0xFF,                      // Usage Page (Vendor Defined)
    0xA1, 0x01,                            // COLLECTION (Application)
    0x15, 0x00,                            // Logical Minimum
    0x26, 0xFF, 0x00,                      // Logical Maximum
    0x75, 0x08,                            // Report Size
    0x95, 0x40,                            // Report Count
    0x09, 0x01,                            // Vendor Usage
    0x81, 0x00,                            // Input (Data,Var,Abs)

    0x09, 0x01,                            // Vendor Usage
    0x15, 0x00,                            // Logical Minimum
    0x26, 0xFF, 0x00,                      // Logical Maximum
    0x75, 0x08,                            // Report Size
    0x95, 0x40,                            // Report Count
    0x91 ,0x00,                            // Ouput (Data,Var,Abs)
		0xC0,
};
const uint16_t USB_HID_FSReportDescriptor_4Size = sizeof(USB_HID_FSReportDescriptor_4);


const uint8_t USB_HID_FSReportDescriptor_5 [] = 
{
		/* Vendor Defined (35 Bytes) */
    0x06, 0x00, 0xFF,                      // Usage Page (Vendor Defined)
    0x0A, 0x00, 0xFF,                      // Usage Page (Vendor Defined)
    0xA1, 0x01,                            // COLLECTION (Application)
//		0x85, 0x38,                            // Report ID (Vendor Defined)
    0x15, 0x00,                            // Logical Minimum
    0x26, 0xFF, 0x00,                      // Logical Maximum
    0x75, 0x08,                            // Report Size
    0x95, 0x20,                            // Report Count
    0x09, 0x01,                            // Vendor Usage
    0x81, 0x00,                            // Input (Data,Var,Abs)

    0x09, 0x01,                            // Vendor Usage
    0x15, 0x00,                            // Logical Minimum
    0x26, 0xFF, 0x00,                      // Logical Maximum
    0x75, 0x08,                            // Report Size
    0x95, 0x20,                            // Report Count
    0x91 ,0x00,                            // Ouput (Data,Var,Abs)
    0xC0,	
};
const uint16_t USB_HID_FSReportDescriptor_5Size = sizeof(USB_HID_FSReportDescriptor_5);



/************************** (C) COPYRIGHT JD-DZ.COM **********************END OF FILE****/

