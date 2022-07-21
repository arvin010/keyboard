#ifndef __SysTick_h__
#define __SysTick_h__

#include "main.h"



void SysTick_Delay_Ms(__IO uint32_t nTime);

void Systick_Init(void);
uint32_t GetTime(void);

#endif





