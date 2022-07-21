
#include "main.h"
#include "io.h"
//--------------------------------------------------------------------------//
// Port init
//--------------------------------------------------------------------------//
void IOInit(void)
{


}



void set_IO_PinMode(GPIO_TypeDef * port, uint16_t pin, uint8_t mode)
{
	GPIO_InitTypeDef GPIO_InitStructure;
	
	switch(mode)
	{
		case GPIO_ModeIN_Floating:
			GPIO_InitStructure.GPIO_Pin   = pin;
			GPIO_InitStructure.GPIO_Mode  = GPIO_Mode_IN;
			GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
			GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
			GPIO_InitStructure.GPIO_PuPd  = GPIO_PuPd_NOPULL;
		break;
		
		case GPIO_ModeIN_FL_INT:
			GPIO_InitStructure.GPIO_Pin   = pin;
			GPIO_InitStructure.GPIO_Mode  = GPIO_Mode_IN;
			GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
			GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
			GPIO_InitStructure.GPIO_PuPd  = GPIO_PuPd_NOPULL;
		break;
		
		case GPIO_ModeIN_PU_noINT:
			GPIO_InitStructure.GPIO_Pin   = pin;
			GPIO_InitStructure.GPIO_Mode  = GPIO_Mode_IN;
			GPIO_InitStructure.GPIO_OType = GPIO_OType_OD;
			GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
			GPIO_InitStructure.GPIO_PuPd  = GPIO_PuPd_UP;
		break;
		
		case GPIO_ModeIN_PU_INT:
			GPIO_InitStructure.GPIO_Pin   = pin;
			GPIO_InitStructure.GPIO_Mode  = GPIO_Mode_IN;
			GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
			GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
			GPIO_InitStructure.GPIO_PuPd  = GPIO_PuPd_UP;
		break;
		
		case GPIO_ModeOut_noINT:
			GPIO_InitStructure.GPIO_Pin   = pin;
			GPIO_InitStructure.GPIO_Mode  = GPIO_Mode_OUT;
			GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
			GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
			GPIO_InitStructure.GPIO_PuPd  = GPIO_PuPd_NOPULL;
		break;
		
		case GPIO_ModeOut_PU_noINT:
			GPIO_InitStructure.GPIO_Pin   = pin;
			GPIO_InitStructure.GPIO_Mode  = GPIO_Mode_OUT;
			GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
			GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
			GPIO_InitStructure.GPIO_PuPd  = GPIO_PuPd_UP;
		break;
		
		case GPIO_ModeOut_PD_noINT:
			GPIO_InitStructure.GPIO_Pin   = pin;
			GPIO_InitStructure.GPIO_Mode  = GPIO_Mode_OUT;
			GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
			GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
			GPIO_InitStructure.GPIO_PuPd  = GPIO_PuPd_DOWN;
		break;
		case GPIO_ModeIN_PD_noINT:
			GPIO_InitStructure.GPIO_Pin   = pin;
			GPIO_InitStructure.GPIO_Mode  = GPIO_Mode_IN;
			GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
			GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
			GPIO_InitStructure.GPIO_PuPd  = GPIO_PuPd_DOWN;
		break;
		default: break;
	}
	
	GPIO_Init(port, &GPIO_InitStructure);

}

//--------------------------------------------------------------------------//
// Function:  set GPIO Pin Value                                            //
//   Written by Eagle on 2021/05/9                                          //
//                                                                          //
// Parameter Description:                                                   //
//   port: P0-P4                                                            //
//   pin:  Pin0-Pin7                                                        //
//   val:  0 or 1                                                           //
//                                                                          //
//   Return: None                                                           //
//--------------------------------------------------------------------------//
//void set_IO_Pin_value(unsigned char port, unsigned char pin, unsigned char val)
//{
//	unsigned char dat = (unsigned char)(1 << pin);
//	
//	switch(port)
//	{
//		case PORT0:
//			if(val == 0) P0 &= ~dat;
//			else if(val == 1) P0 |= dat;
//		break;
//		
//		case PORT1:
//			if(val == 0) P1 &= ~dat;
//			else if(val == 1) P1 |= dat;
//		break;

//		case PORT2:
//			if(val == 0) P2 &= ~dat;
//			else if(val == 1) P2 |= dat;
//		break;

//		case PORT3:
//			if(val == 0) P3 &= ~dat;
//			else if(val == 1) P3 |= dat;
//		break;
//		
//		case PORT4:
//			if(val == 0) P4 &= ~dat;
//			else if(val == 1) P4 |= dat;
//		break;
//		
//		case PORT5:
//			if(val == 0) P5 &= ~dat;
//			else if(val == 1) P5 |= dat;
//		break;
//		
//		case PORT6:
//			if(val == 0) P6 &= ~dat;
//			else if(val == 1) P6 |= dat;
//		break;
//		
//		default:
//			
//		break;
//	}	
//}

////--------------------------------------------------------------------------//
//// Function:  set GPIO Pin Mode                                             //
////   Written by Eagle on 2021/05/9                                          //
////                                                                          //
//// Parameter Description:                                                   //
////   port: P0-P4                                                            //
////   pin:  Pin0-Pin7                                                        //
////                                                                          //
////   Return:  [P00 - P47] pin value(0 or 1)                                 //
////            If Value = INVALID, that mean some parameter incorrect!       //
////--------------------------------------------------------------------------//
//unsigned char get_IO_Pin_value(unsigned char port, unsigned char pin)
//{
//	unsigned char mask = (unsigned char)(1 << pin);
//	unsigned char temp = 0;
//	
//	switch(port)
//	{
//		case PORT0:
//			if((P0 & mask) == 0) temp = 0;
//			else temp = 1;
//		break;
//		
//		case PORT1:
//			if((P1 & mask) == 0) temp = 0;
//			else temp = 1;
//		break;

//		case PORT2:
//			if((P2 & mask) == 0) temp = 0;
//			else temp = 1;
//		break;

//		case PORT3:
//			if((P3 & mask) == 0) temp = 0;
//			else temp = 1;
//		break;
//		
//		case PORT4:
//			if((P4 & mask) == 0) temp = 0;
//			else temp = 1;
//		break;
//		
//		case PORT5:
//			if((P5 & mask) == 0) temp = 0;
//			else temp = 1;
//		break;
//		
//		case PORT6:
//			if((P6 & mask) == 0) temp = 0;
//			else temp = 1;
//		break;
//		
//		default:
//			temp = INVALID;
//		break;
//	}
//	
//	return temp;
//}

//--------------------------------------------------------------------------//
// Key Row IO Interrupt config                                              //
//--------------------------------------------------------------------------//
//void Row_io_wakeup_config(void)
//{
//	unsigned char i;
//	
//	for(i=0; i < MAXROW; i++)
//	{
//		set_IO_PinMode(row_map[i * 2], row_map[(i * 2) + 1], GPIO_ModeIN_PU_noINT);
//	}
//	
//	for(i=0; i < MAXCOL; i++)
//	{
//		set_IO_PinMode(col_map[i * 2], col_map[(i * 2) + 1], GPIO_ModeIN_Floating);
//	}
//}

//--------------------------------------------------------------------------//
// IO Interrupt                                                             //
//--------------------------------------------------------------------------//
//void P0_Interrupt(void) interrupt INTERRUPT_PORT
//{

//	if(P0IF & 0x01)
//	{
//		if((uUsbState & _U_SUSPEND_) && sleep_flag==1)
//		{		
//			wakeup();
//		}
//	}
//	
//	P0IF = 0x00;
//}




