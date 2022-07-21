#include "SysTick.h"



volatile uint32_t sysTick = 0x00;

/******************************************************************************
  * @brief  Systick_Init program
  * @param  None
  * @note  
  * @retval None
  *****************************************************************************
*/
void Systick_Init(void)
{
	if(SysTick_Config(48000))
	{
		while(1);
	}
	SysTick_CLKSourceConfig(SysTick_CLKSource_HCLK);
	
}


uint32_t GetTime(void)
{
	return sysTick;
}


void SysTick_Handler(void)
{	
	sysTick++;
}



