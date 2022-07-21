/**
  ******************************************************************************
  * @file    	    main.h
  * @author  	    FMD AE
  * @brief   		This file contains all the functions prototypes for the main 
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
#ifndef __MAIN_H
#define __MAIN_H

/* Includes ---------------------------------------------------------------------*/
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include "ft32f0xx.h"

#include "ft32f0xx_adc.h"
#include "ft32f0xx_comp.h"
#include "ft32f0xx_crc.h"
#include "ft32f0xx_crs.h"
#include "ft32f0xx_dac.h"
#include "ft32f0xx_dma.h"
#include "ft32f0xx_debug.h"
#include "ft32f0xx_exti.h"
#include "ft32f0xx_flash.h"
#include "ft32f0xx_gpio.h"
#include "ft32f0xx_i2c.h"
#include "ft32f0xx_iwdg.h"
#include "ft32f0xx_misc.h"
#include "ft32f0xx_opa.h"
#include "ft32f0xx_pwr.h"
#include "ft32f0xx_rcc.h"
#include "ft32f0xx_rtc.h"
#include "ft32f0xx_spi.h"
#include "ft32f0xx_syscfg.h"
#include "ft32f0xx_tim.h"
#include "ft32f0xx_usart.h"
#include "ft32f0xx_wwdg.h"
#include "ft32f072x8.h"




#include "usb_core.h"
#include "keyboard.h"
#include "SEGGER_RTT.h"
#include "SysTick.h"


#define FN_PORT		GPIOC	
#define FN_PIN		GPIO_Pin_13	
#define CAPS_PORT	GPIOA	
#define CAPS_PIN	GPIO_Pin_9
#define POWER_PORT	GPIOA
#define POWER_PIN	GPIO_Pin_10
#define PWM_PORT	GPIOA
#define PWM_PIN		GPIO_Pin_8



/* Public Constant prototypes----------------------------------------------------*/

/* Public typedef ---------------------------------------------------------------*/

#define _debug_

enum IAP2PacketEnums
{
    /* Start of packet bytes */
    kIAP2PacketSYNC        = 0xFF,
    kIAP2PacketSOP         = 0x5A,
    kIAP2PacketSOPOrig     = 0x55,

    kIAP2PacketSOPLen      = 2,

    kiAP2PacketVersion     = 1,

    /* Packet field index */
    kIAP2PacketIndexSYNC   = 0,   /* Start of packet byte 1 */
    kIAP2PacketIndexSOP    = 1,   /* Start of packet byte 2 */
    kIAP2PacketIndexLEN1   = 2,   /* Packet length MSB */
    kIAP2PacketIndexLEN2   = 3,   /* Packet length LSB */
    kIAP2PacketIndexCTRL   = 4,   /* Control flags */
    kIAP2PacketIndexSEQ    = 5,   /* SEQ number */
    kIAP2PacketIndexACK    = 6,   /* ACK number */
    kIAP2PacketIndexSESSID = 7,   /* Session ID */
    kIAP2PacketIndexCHK    = 8,   /* Header checksum */

    /* iAP 1.0/2.0 packet detect: FF 55 02 00 EE 10 */
    kIAP2PacketDetectLEN    = 0x0200,
    kIAP2PacketDetectCTRL   = 0xEE,
    kIAP2PacketDetectSEQ    = 0x10,

    /* iAP 1.0/2.0 packet detect BAD ACK: FF 55 04 00 02 04 EE 08 */
    kIAP2PacketDetectNACKLEN    = 0x0400,
    kIAP2PacketDetectNACKCTRL   = 0x02,
    kIAP2PacketDetectNACKSEQ    = 0x04,
    kIAP2PacketDetectNACKACK    = 0xEE,
    kIAP2PacketDetectNACKSESSID = 0x08,

    /*
    ** Packet Header Len
    ** SOP(2) + LEN(2) + CONTROL(1) + SEQ(1) + ACK(1) + SESSID(1) + CHK(1)
    */
    kIAP2PacketHeaderLen = 9,
    kIAP2PacketChksumLen = 1,   /* checksum byte length */

    kiAP2PacketLenMax = 0xFFFF,
    kiAP2PacketMaxPayloadSize = (kiAP2PacketLenMax - kIAP2PacketHeaderLen - kIAP2PacketChksumLen),

    /* BitMask defines for bits in control byte */
    kIAP2PacketControlMaskSYN = 0x80,   /* synchronization */
    kIAP2PacketControlMaskACK = 0x40,   /* acknowledgement */
    kIAP2PacketControlMaskEAK = 0x20,   /* extended acknowledgement */
    kIAP2PacketControlMaskRST = 0x10,   /* reset */
    kIAP2PacketControlMaskSUS = 0x08,   /* suspend (sleep) */

    kIAP2PacketSynDataIdxVersion           = 0,
    kIAP2PacketSynDataIdxMaxOutstanding    = 1,
    kIAP2PacketSynDataIdxMaxPacketSize     = 2,
    kIAP2PacketSynDataIdxRetransmitTimeout = 4,
    kIAP2PacketSynDataIdxCumAckTimeout     = 6,
    kIAP2PacketSynDataIdxMaxRetransmit     = 8,
    kIAP2PacketSynDataIdxMaxCumACK         = 9,

    kIAP2PacketSynDataBaseLen              = 10,

    kIAP2PacketSynDataIdxSessionInfo       = 10,

    kIAP2PacketSynSessionIdxID             = 0,
    kIAP2PacketSynSessionIdxType           = 1,
    kIAP2PacketSynSessionIdxVersion        = 2,
    kIAP2PacketSynSessionSize              = 3,

    /* Session ID 0x0 shall not be used for any session types */
    kIAP2PacketReservedSessionID           = 0,

    kIAP2PacketMaxSessions                 = 10,

    kIAP2PacketSynOptionMaskLP             = 0x80,
    kIAP2PacketSynOptionMaskHP             = 0x40
};

typedef enum
{
    kiAP2PacketParseStateSOP1 = 0,
    kiAP2PacketParseStateSOP2,
    kiAP2PacketParseStateLEN1,
    kiAP2PacketParseStateLEN2,
    kiAP2PacketParseStateCTRL,
    kiAP2PacketParseStateSEQ,
    kiAP2PacketParseStateACK,
    kiAP2PacketParseStateSESSID,
    kiAP2PacketParseStateCHK,
    kiAP2PacketParseStatePAYLOAD,
    kiAP2PacketParseStatePAYLOADCHK,
    kiAP2PacketParseStateFINISH,
    kiAP2PacketParseStateDETECT,
    kiAP2PacketParseStateDETECTBAD,

    kiAP2PacketParseStateLAST = kiAP2PacketParseStateDETECTBAD

} kiAP2PacketParseState_t;
/* Public define ----------------------------------------------------------------*/

//#define ApplicationAddress    ((uint32_t)0x08002000)   //APP程序起始地址
//#define IaplicationAddress    ((uint32_t)0x08000000)   //IAP程序起始地址
//#define ApplicaflagAddress    ((uint32_t)0x08002E00)   //APP程序起始标志

/* Public variables prototypes --------------------------------------------------*/
extern uint32_t test_usb;

extern CLASS_HID_DATA	c_hid_data;


/* Public function prototypes----------------------------------------------------*/
void Systick_Init(void);

#endif /* __MAIN_H */

/************************** (C) COPYRIGHT FMD **********************END OF FILE****/
