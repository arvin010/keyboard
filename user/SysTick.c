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

void SysTick_Delay_Ms(__IO uint32_t nTime)
{
    uint32_t tmpTime = GetTime();
	uint32_t tmpTime2;

	
	//Ê±ÖÓµÎ´ðÊý
	while(1)
	{
	tmpTime2 = GetTime();
	if(tmpTime2 < tmpTime)
		{
		    if((tmpTime2 + (0xffffffff - tmpTime)) > nTime)
			break;
		}
		else  if ((tmpTime2 - tmpTime) > nTime)
			break;
		
	}		
}


void SysTick_Handler(void)
{	
	
	if(sysTick== 0xffffffff)
		sysTick = 0;
	else sysTick++;
}



