#ifndef __timer_h__
#define __timer_h__

#include "main.h"


typedef struct
{
	uint16_t v;
	uint16_t d;
}br_t;



void set_bright_light(void);
void TIM_Config(void);


#endif



