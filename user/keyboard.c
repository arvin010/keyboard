

/* Includes ----------------------------------------------------------------------*/
#include "main.h"
#include "keycode.h"


/* Public variables --------------------------------------------------------------*/
uint8_t Vendor_data_Buffer[512] = {0};
uint8_t	ep2_send_buf[64] = {0};



/* Private variables -------------------------------------------------------------*/




void send_boot_keyboard_code(uint8_t* dat, uint8_t len)
{
	if( LEN_BOOT_KEYBOARD_DATA == len)
	{
		USB_EP_Tx(ep_boot_keyboard, dat, len);
	}
}

/*
void send_touchpad_code(uint8_t* dat, uint8_t len)
{
	if( LEN_TOUCHPAD_DATA == len)
	{
		ep2_send_buf[0] = RPT_TOUCHPAD;
		memcpy(&ep2_send_buf[1], dat, LEN_TOUCHPAD_DATA);
		USB_EP_Tx(ep_touchpad, ep2_send_buf, len);
	}
}

void send_consumer_code(uint8_t* dat, uint8_t len)
{
	if( LEN_CONSUMER_DATA == len)
	{
		ep2_send_buf[0] = RPT_CONSUMER;
		memcpy(&ep2_send_buf[1], dat, LEN_CONSUMER_DATA);
		USB_EP_Tx(ep_consumer, ep2_send_buf, len);
	}
}

void send_sysctrl_code(uint8_t* dat, uint8_t len)
{
	if( LEN_SYSCTRL_DATA == len)
	{
		ep2_send_buf[0] = RPT_SYSCTRL;
		memcpy(&ep2_send_buf[1], dat, LEN_SYSCTRL_DATA);
		USB_EP_Tx(ep_sysctrl, ep2_send_buf, len);
	}
}
*/

void send_hid_keyboard_code(uint8_t* dat, uint8_t len)
{
//	if( LEN_HID_KEYBOARD_DATA == len)
	{
		USB_EP_Tx(3, dat, len);
	}
}


/******************************************************************************
  * @brief  发送触摸板、多媒体、电源控制和全键无冲键码数据
  * @param  rpt_type: 通道类型   dat: 键码数据    len: 数据长度
  * @note 
  * @retval None
  *****************************************************************************
*/
void ep2_send_data(uint8_t rpt_type, uint8_t* dat, uint8_t len)
{
	switch(rpt_type)
	{
		case RPT_TOUCHPAD:
			if( LEN_TOUCHPAD_DATA == len)  // 如果此行影响发送速度，可注释掉以提高执行速度
			{
				ep2_send_buf[0] = RPT_TOUCHPAD;
				memcpy(&ep2_send_buf[1], dat, LEN_TOUCHPAD_DATA);
				
				USB_EP_Tx(ep_touchpad, ep2_send_buf, len);
			}
		break;
		
		case RPT_CONSUMER:
			if( LEN_CONSUMER_DATA == len)
			{
				ep2_send_buf[0] = RPT_CONSUMER;
				memcpy(&ep2_send_buf[1], dat, LEN_CONSUMER_DATA);
				
				USB_EP_Tx(ep_consumer, ep2_send_buf, len);
			}
		break;
		
		case RPT_SYSCTRL:
			if( LEN_SYSCTRL_DATA == len)
			{
				ep2_send_buf[0] = RPT_SYSCTRL;
				memcpy(&ep2_send_buf[1], dat, LEN_SYSCTRL_DATA);
				
				USB_EP_Tx(ep_sysctrl, ep2_send_buf, len);
			}
		break;
		
		case RPT_HID_KEYBOARD:
			if( LEN_HID_KEYBOARD_DATA == len)
			{
				ep2_send_buf[0] = RPT_HID_KEYBOARD;
				memcpy(&ep2_send_buf[1], dat, LEN_HID_KEYBOARD_DATA);
				
				USB_EP_Tx(ep_hid_keyboard, ep2_send_buf, len);
			}
		break;
		
		default:
			
		break;
	}
}

/******************************************************************************
  * @brief  USB Transmit Vendor Data.
  * @param  dat: Vendor数据    len: 数据长度
  * @note 
  * @retval None
  *****************************************************************************
*/
void USB_Transmit_VendorData(uint8_t* dat, uint8_t len)
{
	USB_EP_Tx(ep_hid_vendor_tx, dat, len);
}


/******************************************************************************
  * @brief  USB Receive Vendor Data.
  * @param  None
  * @note 
  * @retval None
  *****************************************************************************
*/
void USB_Receive_VendorData(uint8_t* dat, uint8_t len)
{
	USB_EP_Rx(ep_hid_vendor_rx, dat, len);
	
//	if(USB_Receive_Buffer[0] ==0x05)
//	{ 
//		__disable_irq();
//		
//		/*Unlock FLASH*/
//		FLASH_Unlock();  
//		 
//		/* Clear All pending flags */
//		FLASH_ClearFlag(FLASH_FLAG_BSY | FLASH_FLAG_EOP | FLASH_FLAG_PGERR | FLASH_FLAG_WRPERR);  
//		FLASH_ErasePage(ApplicaflagAddress);
//		Delay_Nus(100);
//		FLASH_Lock();

//		__NOP();
//		__NOP();
//		SYSCFG_MemoryRemapConfig(SYSCFG_MemoryRemap_Flash);
//		NVIC_SystemReset();
//	}
}


/************************** (C) COPYRIGHT JD-DZ.COM **********************END OF FILE****/
