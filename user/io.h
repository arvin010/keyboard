

#ifndef __IO_H__
#define __IO_H__

#include "FT32f0xx.h"

#define INVALID 0xff

#define LOW    Bit_RESET
#define HIGH   Bit_SET

#define NONE   (-1)

#define GPIO_ModeIN_Floating   0x00
#define GPIO_ModeIN_FL_INT     0x01
#define GPIO_ModeIN_PU_noINT   0x02
#define GPIO_ModeIN_PU_INT     0x03
#define GPIO_ModeOut_noINT     0x04
#define GPIO_ModeOut_PU_noINT  0x05
#define GPIO_ModeOut_PD_noINT  0x06
#define GPIO_ModeIN_PD_noINT   0x07

#define PIN0   0x00
#define PIN1   0x01
#define PIN2   0x02
#define PIN3   0x03
#define PIN4   0x04
#define PIN5   0x05
#define PIN6   0x06
#define PIN7   0x07

#define PIN0_BIT_MASK   0x01
#define PIN1_BIT_MASK   0x02
#define PIN2_BIT_MASK   0x04
#define PIN3_BIT_MASK   0x08
#define PIN4_BIT_MASK   0x10
#define PIN5_BIT_MASK   0x20
#define PIN6_BIT_MASK   0x40
#define PIN7_BIT_MASK   0x80



#pragma pack(1)
typedef struct{
	GPIO_TypeDef*  port;
	uint32_t       pin;
	int8_t        int_PortSrc;
	int8_t        int_PinSrc;
}KeyIOMap;
#pragma pack()



/*GPIO 模式*/
typedef enum{
	ModeIN_Floating  = 0x00,
	ModeIN_FL_INT    = 0x01,
	ModeIN_PU_noINT  = 0x02,
	ModeIN_PU_INT    = 0x03,
	ModeOut_noINT    = 0x04,
	ModeOut_PU_noINT = 0x05,
	ModeOut_PD_noINT = 0x06,
	ModeIN_PD_noINT  = 0x07,
}gpioMode_t;





void IOInit(void);
void IOInit_Off(void);
void Row_io_wakeup_config(void);

void set_IO_PinMode(GPIO_TypeDef * port, uint16_t pin, uint8_t mode);



#endif

