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

#include "GenericTypeDefs.h"


#include "Driver.h"
#include "Iap2CtrlSession.h"
#include "ft32f0xx_i2c.h"
#include "ListUsbData.h"
#include <stdlib.h>
#include "usb_core.h"
#include <string.h>
#include "Iap2Link.h"
#include "Iap2CtrlSession.h"

#include "SEGGER_RTT.h"
#include "SEGGER_RTT_Conf.h"



#define KEY_FN	0xAF

#define FN_PORT		GPIOC	
#define FN_PIN		GPIO_Pin_13	
#define CAPS_PORT	GPIOA	
#define CAPS_PIN	GPIO_Pin_9
#define POWER_PORT	GPIOA
#define POWER_PIN	GPIO_Pin_10


Bool g_start_key = FALSE;

int g_count = 0;

extern Iap2Link* g_pIap2Link;

ListUsbData * g_usbdata,* g_usbdata_list;
uint8_t  g_usbdata_head[9];
uint8_t  g_hid_report[6];
//uint8_t	ep1_send_buf[64] = {0};
//uint8_t	ep2_send_buf[64] = {0};
uint8_t	receive_data_buf[512] = {0};


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
	{GPIOC,     GPIO_Pin_14, EXTI_PortSourceGPIOC, EXTI_PinSource14},   	// c15 pc14,
	{GPIOF,     GPIO_Pin_0 , EXTI_PortSourceGPIOF, EXTI_PinSource0 },   	// c16 pf0 ,
	{GPIOF,     GPIO_Pin_1 , EXTI_PortSourceGPIOF, EXTI_PinSource1 },   	// c17 pf1 ,
};






const unsigned char keyMatrix[] = 
{  
 // ROW0  ROW1	ROW2  ROW3	ROW4  ROW5  ROW6  ROW7	
	
    0x00, 0x00, 0x00, 0x00, 0x00, 0xE3, 0x00, 0x00, //  COL0
    0xE6, 0x00, 0xE2, 0x00, 0x00, 0x00, 0x00, 0x00, //  COL1												
    0x00, 0xE7, 0x00, 0x00, 0x00, 0x00, 0xE0, 0x3E, //  COL2
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
    0x38, 0xAF, 0x34, 0x33, 0x13, 0x2F, 0x2D, 0x27, //  COL14
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, //  COL15
    0x05, 0x19, 0x0A, 0x09, 0x15, 0x17, 0x22, 0x21, //  COL16
    0x98, 0x06, 0x3D, 0x07, 0x08, 0x3C, 0x3B, 0x20  //  COL17		  			  
};








/*F1~F12映射表*/
remap_t remap[] = {
	{KEY_F1, BRIGHT_DOWN},			
	{KEY_F2, BRIGHT_UP},			
	{KEY_F3, WWW_HOME},				
	{KEY_F4, SOFT_KEYBOARD},					
	{KEY_F7, PRETRACK},			
	{KEY_F8, PLAY_PAUSE},	
	{KEY_F9, NEXTTRACK},	
	{KEY_F10, MUTE},		
	{KEY_F11, VOL_DOWN},				
	{KEY_F12, VOL_UP},
	{KEY_PRINT, LOCK}	
};



	




/*上下左右映射表*/
remap_t remap2[] = {
	{KEY_L_ARROW, KEY_HOME},
	{KEY_R_ARROW, KEY_END},
	{KEY_UP_ARROW, KEY_PGUP},
	{KEY_DN_ARROW, KEY_PGDN}
};







matrix_t matrix = {
	.row_qty = sizeof(rMap)/sizeof(KeyIOMap),
    .col_qty = sizeof(cMap)/sizeof(KeyIOMap),
    .row_table = (KeyIOMap*)rMap,
    .col_table = (KeyIOMap*)cMap,
	.map = (uint8_t*)keyMatrix,
	.remap = remap,
	.remap_num = sizeof(remap) / sizeof(remap_t),
	.remap2 = remap2,
	.remap2_num = sizeof(remap2) / sizeof(remap_t)
};


int g_ParseState_t = kiAP2PacketParseStateSOP1;
int buffer_offset = 0;
uint8_t *g_packets = NULL;;
uint16_t g_packetLen ;

int iAP2PacketParseBuffer ( uint8_t*  buffer,
                                uint32_t        bufferLen
                               )

{
	  uint8_t* pbuffer = buffer;
	  int pbuffer_len =0;
	  
	  SEGGER_RTT_printf(0,"### function=%s line=%d\n",__FUNCTION__,__LINE__);
	  if(pbuffer ==NULL)
	  	{
	  	
		SEGGER_RTT_printf(0,"### function=%s line=%d pbuffer ==NULL\n",__FUNCTION__,__LINE__);
		return -1;
	  	}
	  
	 SEGGER_RTT_printf(0,"### function=%s line=%d pbuffer_len=%d,bufferLen%d\n",__FUNCTION__,__LINE__,pbuffer_len,bufferLen);
	 for(int i=0;i< bufferLen;i++)
	 	 SEGGER_RTT_printf(0,"0x%02x ",buffer[i]);

	  	 SEGGER_RTT_printf(0,"\n iAP2PacketParseBuffer\n");
		while(pbuffer_len < bufferLen)
		{
		
		SEGGER_RTT_printf(0,"### function=%s line=%d pbuffer_len=%d,bufferLen=%d\n",__FUNCTION__,__LINE__,pbuffer_len,bufferLen);
		SEGGER_RTT_printf(0,"### function=%s line=%d g_ParseState_t=%d\n",__FUNCTION__,__LINE__,g_ParseState_t);
	   switch(g_ParseState_t)
		{ 
		  case kiAP2PacketParseStateSOP1:
				memset(g_usbdata_head,0,9);
				buffer_offset = 0;
				g_packetLen = 0;
			if(*pbuffer==kIAP2PacketSYNC )
				{
					g_ParseState_t	= kiAP2PacketParseStateSOP2;
					g_usbdata_head[kIAP2PacketIndexSYNC]=(uint8)kIAP2PacketSYNC;
				}
						
				
				pbuffer++;
				break;
				
		   case kiAP2PacketParseStateSOP2:
				 if(*pbuffer==kIAP2PacketSOP)
				 {
								g_ParseState_t	= kiAP2PacketParseStateLEN1;
					 g_usbdata_head[kIAP2PacketIndexSOP]=(uint8)kIAP2PacketSOP;
					
					 pbuffer++;
				 }
			else if(*pbuffer==kIAP2PacketSOPOrig )
				{
						g_ParseState_t	= kiAP2PacketParseStateLEN1;
					
					g_usbdata_head[kIAP2PacketIndexSOP]=(uint8)kIAP2PacketSOPOrig;
					pbuffer++;
				}		
				else if(*pbuffer==kIAP2PacketSYNC )
				{
					 g_ParseState_t = kiAP2PacketParseStateSOP1 ; 
				}  
				
				break;
			 
				case  kiAP2PacketParseStateLEN1:
					g_packetLen = (((uint16_t) *pbuffer) << 8);
				g_ParseState_t	= kiAP2PacketParseStateLEN2;
								g_usbdata_head[kIAP2PacketIndexLEN1]=(uint8)*pbuffer;
	
				   pbuffer++;
					break;
				case  kiAP2PacketParseStateLEN2:
				g_packetLen += ((uint16_t) *pbuffer);
				//g_ParseState_t  = kiAP2PacketParseStateLEN2;
				  // pbuffer++;
				if (((g_packetLen <= 65535) &&
							g_packetLen >= kIAP2PacketHeaderLen) ||
							kIAP2PacketDetectLEN == g_packetLen ||
							kIAP2PacketDetectNACKLEN == g_packetLen)
				{
					  g_ParseState_t = kiAP2PacketParseStateCTRL;
							g_usbdata_head[kIAP2PacketIndexLEN2]=(uint8)*pbuffer;
					   pbuffer++;
				}
				else
				{
					 g_ParseState_t = kiAP2PacketParseStateSOP1;
				}
				
					break;
				
				   case kiAP2PacketParseStateCTRL:
						 g_usbdata_head[kIAP2PacketIndexCTRL]=(uint8)*pbuffer;
					 pbuffer++;
						 g_ParseState_t = kiAP2PacketParseStateSEQ;
						 break;
					 case kiAP2PacketParseStateSEQ:
						 g_usbdata_head[kIAP2PacketIndexCTRL]=(uint8)*pbuffer;
						 if(g_usbdata_head[kIAP2PacketIndexLEN1] == 0x20 && g_usbdata_head[kIAP2PacketIndexLEN1] == 0x00 &&
									 g_usbdata_head[kIAP2PacketIndexCTRL] == 0xee && 0x10==  *pbuffer	 )
							{
								//huanghanjing	todo usb package
								
									 g_ParseState_t = kiAP2PacketParseStateSOP1 ; 
								Driver_RxDone(g_usbdata_head,6);
							}
							else	
							{							
						 g_ParseState_t = kiAP2PacketParseStateACK;
								 g_usbdata_head[kIAP2PacketIndexSEQ] =* pbuffer;
							}
							 pbuffer++;
						 break;
					  case kiAP2PacketParseStateACK:
						 g_ParseState_t = kiAP2PacketParseStateSESSID;
						 g_usbdata_head[kIAP2PacketIndexACK] =* pbuffer;
						pbuffer++;
						 break;
						case kiAP2PacketParseStateSESSID:
						{
					   
						g_ParseState_t = kiAP2PacketParseStateCHK;
						 g_usbdata_head[kIAP2PacketIndexSESSID] =* pbuffer;
						pbuffer++;
							
					   
					}
							break;
						case kiAP2PacketParseStateCHK:
					
									{
										 g_usbdata_head[kIAP2PacketIndexCHK] =* pbuffer;
										
												if(  (g_usbdata_head[kIAP2PacketIndexLEN1] == 0x04 &&
											g_usbdata_head[kIAP2PacketIndexLEN1] == 0x00 &&
				kIAP2PacketDetectNACKCTRL	== g_usbdata_head[kIAP2PacketIndexCTRL] &&
				kIAP2PacketDetectNACKSEQ	== g_usbdata_head[kIAP2PacketIndexSEQ] &&
				kIAP2PacketDetectNACKACK	== g_usbdata_head[kIAP2PacketIndexACK]	&&
				kIAP2PacketDetectNACKSESSID == g_usbdata_head[kIAP2PacketIndexSESSID]))
										{
												//huanghanjing	todo usb package
											  g_ParseState_t = kiAP2PacketParseStateSOP1 ; 
													Driver_RxDone(g_usbdata_head,8);
										} 
										else{
										g_ParseState_t = kiAP2PacketParseStatePAYLOAD;
												
											g_usbdata->data_size = g_packetLen;
											if(g_usbdata->pdata!=NULL)
												free(g_usbdata->pdata);
										g_usbdata->pdata = malloc(g_usbdata->data_size);
											memset(g_usbdata->pdata,0,g_usbdata->data_size);
											memcpy(g_usbdata->pdata,g_usbdata_head,9);
											buffer_offset = 9;
										}
								pbuffer++;
										
						
					}
						 break;
						 
					 case kiAP2PacketParseStatePAYLOAD:
					{
										g_usbdata->pdata[buffer_offset]= *pbuffer;
										buffer_offset++;
										pbuffer++;
										if(buffer_offset == g_packetLen)
										{
											g_ParseState_t =  kiAP2PacketParseStateSOP1;
											Driver_RxDone(g_usbdata->pdata,g_packetLen);
											//huanghanjing	todoi
											
											
										}
									}
					 break;
					case kiAP2PacketParseStateFINISH:
					case kiAP2PacketParseStateDETECT:
					case kiAP2PacketParseStateDETECTBAD:
						break;
				
					 
		}
		}
	
	  return 0;
	}




void usb_send_data_buffer(uint8_t *pdata, uint16 data_size )
{
    if(data_size > 0)
    	{
    	#if 1 //printf debug msg
		SEGGER_RTT_printf(0,"usb_send_data_buffer data_size=%d\n",data_size);
    	for(int i = 0;i<data_size;i++)
    		{ 
    		SEGGER_RTT_printf(0,"0x%02x ",pdata[i]);
    		}
		SEGGER_RTT_printf(0," \n usb_send_data_buffer \n");
		#endif 
		
		if(USB_EP_Tx(1,pdata,data_size) != SUCCESS)
			{
					SEGGER_RTT_printf(0," \n usb_send_data_buffer error \n");
				//f_send_kb = 0;
			}
		SEGGER_RTT_printf(0," \n usb_send_data_buffer suceessful \n");
			//SysTick_Delay_Ms(100);
    	}
	}	





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
	static uint8_t lock_flag = 0x00;
		
	if(get_key(&(matrix->buf), KEY_FN))
	{
		/*抬起FN键*/
		key_up(&(matrix->buf), KEY_FN);
		
		/*FN+ESC Fn锁切换判断*/
		if(get_key(&(matrix->buf), KEY_ESC) && !lock_flag)
		{
			lock_flag = 0x01;
			matrix->fn_led_status ^= 1;
			/*操作FN指示灯*/
			GPIO_WriteBit(FN_PORT, GPIO_Pin_13, (BitAction)(matrix->fn_led_status));
			
		}else if(get_key(&(matrix->buf), KEY_ESC) == 0x00 && lock_flag)
		{
			lock_flag = 0x00;
		}
		
		key_up(&(matrix->buf), KEY_ESC);
		
		
		/*FN组合亮灯, 输出图标功能*/
		if(matrix->fn_led_status)
		{		
			remap_fun(matrix, matrix->remap, matrix->remap_num);
		}
		
		/*映射上下左右*/
		remap_fun(matrix, matrix->remap2, matrix->remap2_num);
	}
	else
	{
		/*没按下FN键*/
		if(!(matrix->fn_led_status))
		{
			/*单按灭灯,输入图标功能*/
			remap_fun(matrix, matrix->remap, matrix->remap_num);
		}
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
			case WWW_HOME:				
			case SOFT_KEYBOARD:					
			case PRETRACK:			
			case PLAY_PAUSE:	
			case NEXTTRACK:	
			case MUTE:
			case VOL_DOWN:				
			case VOL_UP:
			case LOCK:
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
			
		/*锁屏*/
		case LOCK:			
			media_buffer[1] = 0x30; 
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
		
		/*主页*/
		case WWW_HOME:		
			media_buffer[1] = 0x23; 
			media_buffer[2] = 0x02; 
		break;
			
		/*软键盘*/
		case SOFT_KEYBOARD:		
			media_buffer[1] = 0xAE; 
			media_buffer[2] = 0x01; 
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
		
		//SEGGER_RTT_printf(0, "%02x %02x %02x %02x\n", matrix->acpi_send[0], media_buffer[0], media_buffer[1], media_buffer[2]);
		
		USB_EP_Tx(ep_consumer, media_buffer, sizeof(media_buffer));
		matrix->acpi_send_flag = 0x02;
		
	}
	else if(matrix->acpi_send_flag == 0x03)
	{
		//发送抬起包
		USB_EP_Tx(ep_consumer, media_buffer, sizeof(media_buffer));
		matrix->acpi_send_flag = 0x00;
	}
	
}










/* Public function ---------------------------------------------------------------*/
/******************************************************************************
  * @brief  main program
  * @param  
  * @note   
  * @retval 
  *****************************************************************************
*/
uint8_t  g_hid_report[6];
int b_config = 0;
int main(void)
{
	I2C_InitTypeDef* g_I2C_1_InitStruct;
//    int usb_receive_len;
	 uint8 data_offset=0;
	int list_data_count = 0;
	 ListUsbData * usbdata = NULL;


	
	Systick_Init();
	I2C_DeInit(I2C1);
	I2C_StructInit(g_I2C_1_InitStruct);
	I2C_Init(I2C1,g_I2C_1_InitStruct);
	I2C_Cmd(I2C1,ENABLE);
	USB_Init();


	RCC_AHBPeriphClockCmd(RCC_AHBPeriph_GPIOA, ENABLE);
	RCC_AHBPeriphClockCmd(RCC_AHBPeriph_GPIOB, ENABLE);
	RCC_AHBPeriphClockCmd(RCC_AHBPeriph_GPIOC, ENABLE);
	RCC_AHBPeriphClockCmd(RCC_AHBPeriph_GPIOF, ENABLE);
	
	
	SEGGER_RTT_printf(0, "g2g start\n");
	ListUsbData_Init(g_usbdata);
	
	ListUsbData_Init(g_usbdata_list);
	
   while(1)
   	{
   	  SysTick_Delay_Ms(5000);
			break;
   	}

   
   SEGGER_RTT_printf(0,"xxxx b_config == 1\n");
	//USB_Init();
//	ListUsbData_Init(g_usbdata);
	
	//	I2C_Init(I2C_TypeDef * I2Cx,I2C_InitTypeDef * I2C_InitStruct)
		
		//Test_IO_Config();
		
		//GPIO_SetBits(GPIOA,GPIO_Pin_5);
		
		
		Iap2CtrlSession g_Iap2CtrlSession;
		Iap2Link_Init(g_pIap2Link, (Iap2LinkTransferFn)Driver_TransferStart);
		Iap2CtrlSession_Init(&g_Iap2CtrlSession);
		//Iap2Link_RegSession(g_pIap2Link, &g_Iap2CtrlSession);
		Iap2Link_Start(g_pIap2Link);


	
	while (1)
	{
		SEGGER_RTT_printf(0,"### function=%s line=%d\n",__FUNCTION__,__LINE__);
		usbdata = NULL;

	//  Iap2Link_Start(g_pIap2Link);
	
#if 1
		Driver_Check();

				//SEGGER_RTT_printf(0,"### function=%s line=%d\n",__FUNCTION__,__LINE__);
		data_offset =0;
			//	SEGGER_RTT_printf(0,"### function=%s line=%d\n",__FUNCTION__,__LINE__);
		memset(g_hid_report,0,6);
				//SEGGER_RTT_printf(0,"### function=%s line=%d\n",__FUNCTION__,__LINE__);

		//Iap2Link_Run(g_pIap2Link);
		list_data_count = ListUsbData_Count();
		SEGGER_RTT_printf(0,"### function=%s line=%d list_data_count=%d\n",__FUNCTION__,__LINE__,list_data_count);
		//	SEGGER_RTT_printf(0,"### function=%s line=%d ListUsbData_Count=%d\n",__FUNCTION__,__LINE__,ListUsbData_Count());
#else

         if(ListUsbData_Count()> 0)
         {
				//usb_receive_len = USB_EP_Rx(1,receive_data_buf,512);
				startCriticalSection();
				usbdata = ListUsbData_Remove(g_usbdata_list);
				endCriticalSection();
				}
						SEGGER_RTT_printf(0,"### function=%s line=%d\n",__FUNCTION__,__LINE__);
		if(usbdata!=NULL )
			{
			
			SEGGER_RTT_printf(0,"### function=%s line=%d\n",__FUNCTION__,__LINE__);
			iAP2PacketParseBuffer(usbdata->pdata,usbdata->data_size);
					SEGGER_RTT_printf(0,"### function=%s line=%d\n",__FUNCTION__,__LINE__);
			free(usbdata->pdata);
					SEGGER_RTT_printf(0,"### function=%s line=%d\n",__FUNCTION__,__LINE__);
			free(usbdata);
					SEGGER_RTT_printf(0,"### function=%s line=%d\n",__FUNCTION__,__LINE__);
			}

				SEGGER_RTT_printf(0,"### function=%s line=%d\n",__FUNCTION__,__LINE__);
		//
		#endif
		if(!g_start_key)
			{
			SEGGER_RTT_printf(0,"continue \n");
			SysTick_Delay_Ms(1000);
				continue;
			}

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








