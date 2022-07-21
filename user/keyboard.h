#ifndef __KEYBOARD_H
#define __KEYBOARD_H


extern uint8_t Vendor_data_Buffer[];
extern uint8_t	ep2_send_buf[];






void send_boot_keyboard_code(uint8_t* dat, uint8_t len);
//void send_touchpad_code(uint8_t* dat, uint8_t len);
//void send_consumer_code(uint8_t* dat, uint8_t len);
//void send_sysctrl_code(uint8_t* dat, uint8_t len);


void send_hid_keyboard_code(uint8_t* dat, uint8_t len);

void ep2_send_data(uint8_t rpt_type, uint8_t* dat, uint8_t len);
void USB_Transmit_VendorData(uint8_t* dat, uint8_t len);
void USB_Receive_VendorData(uint8_t* dat, uint8_t len);




#endif /* __KEYBOARD_H */

/************************** (C) COPYRIGHT JD-DZ.COM **********************END OF FILE****/
