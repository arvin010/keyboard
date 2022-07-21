/**
  *********************************************************************************
  * @file    	    main.c
  * @author  	    FMD AE
  * @brief   		Main Service Routines.	
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
#include "main.h"
#include "Matrix.h"
#include "keycode.h"
#include "timer.h"







#define KEY_FN	0xAF







uint8_t qty = 0x00;
uint8_t buff[128] = {0x00};
uint32_t NOW = 0X00;






const KeyIOMap rMap[] = {
//	 Port        Pin
	{GPIOA,     GPIO_Pin_0, EXTI_PortSourceGPIOA, EXTI_PinSource0},  		// Row 0  PA0
	{GPIOA,     GPIO_Pin_1, EXTI_PortSourceGPIOA, EXTI_PinSource1},  		// Row 1  PA1
	{GPIOA,     GPIO_Pin_2, EXTI_PortSourceGPIOA, EXTI_PinSource2},  		// Row 2  PA2
	{GPIOA,     GPIO_Pin_3, EXTI_PortSourceGPIOA, EXTI_PinSource3},  		// Row 3  PA3
	{GPIOA,     GPIO_Pin_4, EXTI_PortSourceGPIOA, EXTI_PinSource4},  		// Row 4  PA4
	{GPIOA,     GPIO_Pin_5, EXTI_PortSourceGPIOA, EXTI_PinSource5},  		// Row 5  PA5
	{GPIOA,     GPIO_Pin_6, EXTI_PortSourceGPIOA, EXTI_PinSource6},  		// Row 6  PA6
	{GPIOA,     GPIO_Pin_7, EXTI_PortSourceGPIOA, EXTI_PinSource7},  		// Row 7  PA7
};






const KeyIOMap cMap[] = {
	//	 Port        Pin
	{GPIOB,     GPIO_Pin_0 , EXTI_PortSourceGPIOB, EXTI_PinSource0 },   	// c0  pb0 ,
	{GPIOB,     GPIO_Pin_1 , EXTI_PortSourceGPIOB, EXTI_PinSource1 },   	// c1  pb1 ,
	{GPIOB,     GPIO_Pin_2 , EXTI_PortSourceGPIOB, EXTI_PinSource2 },  		// c2  pb2 ,
	{GPIOB,     GPIO_Pin_10, EXTI_PortSourceGPIOB, EXTI_PinSource10},  		// c3  pb10,
	{GPIOB,     GPIO_Pin_11, EXTI_PortSourceGPIOB, EXTI_PinSource11},   	// c4  pb11,
	{GPIOB,     GPIO_Pin_12, EXTI_PortSourceGPIOB, EXTI_PinSource12},  		// c5  pb12,
	{GPIOB,     GPIO_Pin_13, EXTI_PortSourceGPIOB, EXTI_PinSource13},  		// c6  pb13,
	{GPIOB,     GPIO_Pin_14, EXTI_PortSourceGPIOB, EXTI_PinSource14},  		// c7  pb14,
	{GPIOB,     GPIO_Pin_15, EXTI_PortSourceGPIOB, EXTI_PinSource15},  		// c8  pb15,
	{GPIOA,     GPIO_Pin_15, EXTI_PortSourceGPIOA, EXTI_PinSource15},  		// c9  pa15,
	{GPIOB,     GPIO_Pin_3 , EXTI_PortSourceGPIOB, EXTI_PinSource3 },   	// c10 pb3 ,
	{GPIOB,     GPIO_Pin_4 , EXTI_PortSourceGPIOB, EXTI_PinSource4 },   	// c11 pb4 ,
	{GPIOB,     GPIO_Pin_5 , EXTI_PortSourceGPIOB, EXTI_PinSource5 },   	// c12 pb5 ,
	{GPIOB,     GPIO_Pin_6 , EXTI_PortSourceGPIOB, EXTI_PinSource6 },  		// c13 pb6 ,
	{GPIOB,     GPIO_Pin_7 , EXTI_PortSourceGPIOB, EXTI_PinSource7 },  		// c14 pb7 ,
	{GPIOC,     GPIO_Pin_15, EXTI_PortSourceGPIOC, EXTI_PinSource15},   	// c15 pc15,
	{GPIOF,     GPIO_Pin_0 , EXTI_PortSourceGPIOF, EXTI_PinSource0 },   	// c16 pf0 ,
	{GPIOF,     GPIO_Pin_1 , EXTI_PortSourceGPIOF, EXTI_PinSource1 },   	// c17 pf1 ,
};


//R A2
//C B10


const unsigned char keyMatrix[] = 
{  
 // ROW0  ROW1	ROW2  ROW3	ROW4  ROW5  ROW6  ROW7	
	
    0x00, 0x00, 0x00, 0x00, 0x00, 0xE3, 0x00, 0x00, //  COL0
    0xE6, 0x00, 0xE2, 0x00, 0x00, 0x00, 0x00, 0x00, //  COL1												
    0x00, 0xE7, 0x00, 0x00, 0x00, 0x00, 0xAF, 0x3E, //  COL2
    0x51, 0x00, 0x2C, 0x00, 0x00, 0x00, 0x46, 0x00, //  COL3
    0x4F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, //  COL4
    0x50, 0x00, 0x52, 0x00, 0x00, 0x00, 0x00, 0x00, //  COL5
    0x11, 0x10, 0x0B, 0x0D, 0x18, 0x1C, 0x23, 0x24, //  COL6
    0x00, 0x00, 0x00, 0xE5, 0x00, 0xE1, 0x00, 0x00, //  COL7
    0x00, 0x1B, 0x00, 0x16, 0x1A, 0x39, 0x3A, 0x1F, //  COL8
                                                 
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, //  COL9
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, //  COL10
    0x45, 0x28, 0x44, 0x31, 0x00, 0x2A, 0x42, 0x43, //  COL11
    0x00, 0x37, 0x00, 0x0F, 0x12, 0x40, 0x41, 0x26, //  COL12
	0x00, 0x36, 0x3F, 0x0E, 0x0C, 0x30, 0x2E, 0x25, //  COL13
    0x38, 0xE0, 0x34, 0x33, 0x13, 0x2F, 0x2D, 0x27, //  COL14
    0x00, 0x1D, 0x29, 0x04, 0x14, 0x2B, 0x35, 0x1E, //  COL15
    0x05, 0x19, 0x0A, 0x09, 0x15, 0x17, 0x22, 0x21, //  COL16
    0x98, 0x06, 0x3D, 0x07, 0x08, 0x3C, 0x3B, 0x20  //  COL17		  			  
};








/*F1~F12映射表*/
remap_t remap[] = {
	{KEY_F1, BRIGHT_DOWN},			
	{KEY_F2, BRIGHT_UP},						
	{KEY_F4, WWW_SEARCH},					
	{KEY_F7, PRETRACK},			
	{KEY_F8, PLAY_PAUSE},	
	{KEY_F9, NEXTTRACK},	
	{KEY_F10, MUTE},		
	{KEY_F11, VOL_DOWN},				
	{KEY_F12, VOL_UP},
	{KEY_PRINT, LOCK}	//这里用来表示弹光驱键
};









matrix_t matrix = {
	.row_qty = sizeof(rMap)/sizeof(KeyIOMap),
    .col_qty = sizeof(cMap)/sizeof(KeyIOMap),
    .row_table = (KeyIOMap*)rMap,
    .col_table = (KeyIOMap*)cMap,
	.map = (uint8_t*)keyMatrix,
	.remap = remap,
	.remap_num = sizeof(remap) / sizeof(remap_t),
	.fn_led_status = 0x01
};













static void remap_fun(matrix_t* matrix, remap_t* remap, uint8_t num)
{
	int i;
	for(i = 0; i < num; ++i)
	{
		if(get_key(&(matrix->buf), remap[i].key))
		{
			key_up(&(matrix->buf), remap[i].key);
			key_down(&(matrix->buf), remap[i].remap);
		}
	}
}







void hotKey(matrix_t* matrix)
{
	static uint8_t b_flag = 0x00;
	static uint8_t lock_flag = 0x00;
	
	if(lock_flag == 0x00 && get_key(&(matrix->buf), KEY_FN))
	{
		lock_flag = 0x01;
		matrix->fn_led_status ^= 1;
		key_up(&(matrix->buf), KEY_FN);
		GPIO_WriteBit(FN_PORT, FN_PIN, (BitAction)matrix->fn_led_status);
		return ;
	}else if(lock_flag == 0x01 && !get_key(&(matrix->buf), KEY_FN))
	{
		lock_flag = 0x00;
		key_up(&(matrix->buf), KEY_FN);
		return ;
	}
	
	if(matrix->fn_led_status)
	{
		remap_fun(matrix, matrix->remap, matrix->remap_num);
		
		if(get_key(&matrix->buf, KEY_F3))
		{
			key_up(&matrix->buf, KEY_F3);
			key_down(&matrix->buf, KEY_L_WIN);
			key_down(&matrix->buf, KEY_TAB);
		}
		
		/*背光调节*/
		if(get_key(&matrix->buf, KEY_F6) && b_flag == 0x00)
		{
			b_flag = 0x01;
		}
		else if(get_key(&matrix->buf, KEY_F6) == 0x00 && b_flag == 0x01)
		{
			b_flag = 0x00;
			set_bright_light();
		}
		
		key_up(&matrix->buf, KEY_F6);
	}

}







static void handle_super_key(matrix_t* matrix)
{
	uint8_t i;
	
	for(i = 0; i < 8; ++i)
	{
		if(get_key(&(matrix->buf), 0xE0 + i))
		{
			key_up(&(matrix->buf), 0xE0 + i);
			matrix->send[0] |= 1 << i;
		}
	}
}








void build_keycode(matrix_t* matrix)
{
	uint8_t t_buff[128] = {0x00};
	uint8_t i, q = 0x00, index = 2;

	handle_super_key(matrix);
	q = get_key_down_list(&(matrix->buf), t_buff, sizeof(t_buff));
	
	for(i = 0; i < q && index < 8; ++i)
	{
		switch(t_buff[i])
		{
			case BRIGHT_DOWN:			
			case BRIGHT_UP:			
			case WWW_SEARCH:								
			case PRETRACK:			
			case PLAY_PAUSE:	
			case NEXTTRACK:	
			case MUTE:
			case VOL_DOWN:				
			case VOL_UP:
			case LOCK: //这里临时用来表示弹光驱键
				if(matrix->acpi_send_flag == 0x00)
				{
					matrix->acpi_send[0] = t_buff[i];
					matrix->acpi_send_flag = 0x01;
				}
			break;	
			default: matrix->send[index++] = t_buff[i];
		}	
	
	}
	
	if(matrix->acpi_send_flag == 0x02 && !get_key(&matrix->buf, matrix->acpi_send[0]))
	{
		memset(matrix->acpi_send, 0x00, sizeof(matrix->acpi_send));
		matrix->acpi_send_flag = 0x03;
	}
	
	key_clear(&(matrix->buf));
}








void send_keycode(matrix_t* matrix)
{
	uint8_t flag = 0;
	
	for(uint8_t i = 0; i < 8; ++i)
	{
		if(matrix->send_last[i] == matrix->send[i])
		{
			flag++;
		}
	}
	
	if(flag < 8)
	{

		uint8_t key_send_buff[8] = {0x00};
		memcpy(key_send_buff, matrix->send, sizeof(matrix->send));
				
		//发送
		USB_EP_Tx(ep_boot_keyboard, key_send_buff, sizeof(key_send_buff));

		//更新
		memcpy(matrix->send_last, matrix->send, sizeof(matrix->send_last));
	}
	
	memset(matrix->send, 0x00, sizeof(matrix->send));
}










void build_media_key(matrix_t* matrix, uint8_t* media_buffer, uint8_t len)
{
	media_buffer[0] = 0x03;
	switch(matrix->acpi_send[0])
	{
		/*下一曲*/
		case NEXTTRACK:		
			media_buffer[1] = 0xB5; 
			media_buffer[2] = 0x00; 
		break;
			
		/*上一曲*/
		case PRETRACK: 		
			media_buffer[1] = 0xB6; 
			media_buffer[2] = 0x00; 
		break;
			
		/*播放-暂停*/
		case PLAY_PAUSE:	
			media_buffer[1] = 0xCD; 
			media_buffer[2] = 0x00; 
		break;
		
		/*静音*/
		case MUTE: 			
			media_buffer[1] = 0xE2; 
			media_buffer[2] = 0x00; 
		break;
			
		/*音量+*/
		case VOL_UP:		
			media_buffer[1] = 0xE9; 
			media_buffer[2] = 0x00; 
		break;
			
		/*音量-*/
		case VOL_DOWN:		
			media_buffer[1] = 0xEA; 
			media_buffer[2] = 0x00; 
		break; 
			
		/*锁屏 //这里临时用来表示弹光驱键*/
		case LOCK:			
			media_buffer[1] = 0xB8; 
			media_buffer[2] = 0x00; 
		break;
			
		/*背光-*/
		case BRIGHT_DOWN:	
			media_buffer[1] = 0x70; 
			media_buffer[2] = 0x00;
		break;
			
		/*背光+*/
		case BRIGHT_UP:		
			media_buffer[1] = 0x6F; 
			media_buffer[2] = 0x00; 
		break;        
			
		/*搜索*/
		case WWW_SEARCH:		
			media_buffer[1] = 0x21; 
			media_buffer[2] = 0x02; 
		break;
	}
}





void send_acpi_media_keycode(matrix_t* matrix)
{
	uint8_t media_buffer[3] = {0x03, 0x00, 0x00};
		
	//发送多媒体键，ACPI键
	if(matrix->acpi_send_flag == 0x01)
	{
		//发送多媒体键
		build_media_key(matrix, media_buffer, sizeof(media_buffer));		
		USB_EP_Tx(ep_consumer, media_buffer, sizeof(media_buffer));
		matrix->acpi_send_flag = 0x02;
		SEGGER_RTT_printf(0,">>>>>>>>>>>>>>>>>>>>");
		
	}
	else if(matrix->acpi_send_flag == 0x03)
	{
		//发送抬起包
		USB_EP_Tx(ep_consumer, media_buffer, sizeof(media_buffer));
		matrix->acpi_send_flag = 0x00;
	}
	
}






void init_light_pin(void)
{
	set_IO_PinMode(CAPS_PORT, CAPS_PIN, GPIO_ModeOut_PD_noINT);
	set_IO_PinMode(FN_PORT, FN_PIN, GPIO_ModeOut_PD_noINT);
	set_IO_PinMode(POWER_PORT, POWER_PIN, GPIO_ModeOut_PD_noINT);
	GPIO_WriteBit(CAPS_PORT, CAPS_PIN, Bit_SET);
	GPIO_WriteBit(FN_PORT, FN_PIN, Bit_SET);
	GPIO_WriteBit(POWER_PORT, POWER_PIN, Bit_RESET);
}




void init_device_rcc(void)
{
	RCC_AHBPeriphClockCmd(RCC_AHBPeriph_GPIOA, ENABLE);
	RCC_AHBPeriphClockCmd(RCC_AHBPeriph_GPIOB, ENABLE);
	RCC_AHBPeriphClockCmd(RCC_AHBPeriph_GPIOC, ENABLE);
	RCC_AHBPeriphClockCmd(RCC_AHBPeriph_GPIOF, ENABLE);
}






/* Public function ---------------------------------------------------------------*/
/******************************************************************************
  * @brief  main program
  * @param  
  * @note   
  * @retval 
  *****************************************************************************
*/
int main(void)
{

	init_device_rcc();
	
	Systick_Init();
	USB_Init();

	init_light_pin();
	
	//pwm_timer_Init();
	TIM_Config();
	
	SEGGER_RTT_printf(0, "start\n");
 
	while (1)
	{


		matrix_scan_key(&matrix);
		matrix_scan_again(&matrix);
		matrix_key_handle(&matrix);

		/*处理热键*/
		hotKey(&matrix);
		
		/*KeyCode处理格式*/
		build_keycode(&matrix);
		
		/*发送按键码*/
		send_keycode(&matrix);
		
		/*发送多媒体键*/
		send_acpi_media_keycode(&matrix);
		
	}
}








