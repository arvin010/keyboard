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
