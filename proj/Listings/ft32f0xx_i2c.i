# 1 "..\\FTLib\\Src\\ft32f0xx_i2c.c"
















 

 
# 1 "..\\FTLib\\Inc\\ft32f0xx_i2c.h"









 


 







 
# 1 "..\\FTLib\\CMSIS\\inc\\ft32f0xx.h"








 







 









 
# 36 "..\\FTLib\\CMSIS\\inc\\ft32f0xx.h"
                                             

 
# 47 "..\\FTLib\\CMSIS\\inc\\ft32f0xx.h"

# 1 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"










 



 



 
    






  


 
  


 







 







 
   








 







 







 


































 
# 120 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"



 



 




 





 
typedef enum IRQn
{
 
  NonMaskableInt_IRQn         = -14,     
  HardFault_IRQn              = -13,     
  SVC_IRQn                    = -5,      
  PendSV_IRQn                 = -2,      
  SysTick_IRQn                = -1,      
  
 
  WWDG_IRQn                   = 0,       
  PVD_VDDIO2_IRQn             = 1,       
  RTC_IRQn                    = 2,       
  FLASH_IRQn                  = 3,       
  RCC_CRS_IRQn                = 4,       
  EXTI0_1_IRQn                = 5,       
  EXTI2_3_IRQn                = 6,       
  EXTI4_15_IRQn               = 7,       
  DMA1_Channel1_IRQn          = 9,       
  DMA1_Channel2_3_IRQn        = 10,      
  DMA1_Channel4_5_IRQn        = 11,      
  ADC1_COMP_IRQn              = 12,      
  TIM1_BRK_UP_TRG_COM_IRQn    = 13,      
  TIM1_CC_IRQn                = 14,      
  TIM3_IRQn                   = 16,      
  TIM6_DAC_IRQn               = 17,      
  TIM14_IRQn                  = 19,      
  TIM15_IRQn                  = 20,      
  TIM16_IRQn                  = 21,      
  TIM17_IRQn                  = 22,      
  I2C1_IRQn                   = 23,      
  I2C2_IRQn                   = 24,      
  SPI1_IRQn                   = 25,      
  SPI2_IRQn                   = 26,      
  USART1_IRQn                 = 27,      
  USART2_IRQn                 = 28,      
  USB_IRQn                    = 31       
}IRQn_Type;



 

# 1 "..\\FTLib\\CMSIS\\inc\\core_cm0.h"
 







 

























 
























 




 


 

 













# 110 "..\\FTLib\\CMSIS\\inc\\core_cm0.h"


 







# 145 "..\\FTLib\\CMSIS\\inc\\core_cm0.h"

# 1 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"
 
 





 









     
# 27 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"
     











# 46 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"





 

     

     
typedef   signed          char int8_t;
typedef   signed short     int int16_t;
typedef   signed           int int32_t;
typedef   signed       __int64 int64_t;

     
typedef unsigned          char uint8_t;
typedef unsigned short     int uint16_t;
typedef unsigned           int uint32_t;
typedef unsigned       __int64 uint64_t;

     

     
     
typedef   signed          char int_least8_t;
typedef   signed short     int int_least16_t;
typedef   signed           int int_least32_t;
typedef   signed       __int64 int_least64_t;

     
typedef unsigned          char uint_least8_t;
typedef unsigned short     int uint_least16_t;
typedef unsigned           int uint_least32_t;
typedef unsigned       __int64 uint_least64_t;

     

     
typedef   signed           int int_fast8_t;
typedef   signed           int int_fast16_t;
typedef   signed           int int_fast32_t;
typedef   signed       __int64 int_fast64_t;

     
typedef unsigned           int uint_fast8_t;
typedef unsigned           int uint_fast16_t;
typedef unsigned           int uint_fast32_t;
typedef unsigned       __int64 uint_fast64_t;

     




typedef   signed           int intptr_t;
typedef unsigned           int uintptr_t;


     
typedef   signed     long long intmax_t;
typedef unsigned     long long uintmax_t;




     

     





     





     





     

     





     





     





     

     





     





     





     

     






     






     






     

     


     


     


     

     
# 216 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"

     



     






     
    
 



# 241 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"

     







     










     











# 305 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"






 
# 147 "..\\FTLib\\CMSIS\\inc\\core_cm0.h"
# 1 "..\\FTLib\\CMSIS\\inc\\core_cmInstr.h"
 







 

























 






 



 


 









 







 







 






 








 







 







 









 









 

__attribute__((section(".rev16_text"))) static __inline __asm uint32_t __REV16(uint32_t value)
{
  rev16 r0, r0
  bx lr
}








 

__attribute__((section(".revsh_text"))) static __inline __asm int32_t __REVSH(int32_t value)
{
  revsh r0, r0
  bx lr
}










 










 



# 292 "..\\FTLib\\CMSIS\\inc\\core_cmInstr.h"


# 684 "..\\FTLib\\CMSIS\\inc\\core_cmInstr.h"

   

# 148 "..\\FTLib\\CMSIS\\inc\\core_cm0.h"
# 1 "..\\FTLib\\CMSIS\\inc\\core_cmFunc.h"
 







 

























 






 



 


 





 
 






 
static __inline uint32_t __get_CONTROL(void)
{
  register uint32_t __regControl         __asm("control");
  return(__regControl);
}







 
static __inline void __set_CONTROL(uint32_t control)
{
  register uint32_t __regControl         __asm("control");
  __regControl = control;
}







 
static __inline uint32_t __get_IPSR(void)
{
  register uint32_t __regIPSR          __asm("ipsr");
  return(__regIPSR);
}







 
static __inline uint32_t __get_APSR(void)
{
  register uint32_t __regAPSR          __asm("apsr");
  return(__regAPSR);
}







 
static __inline uint32_t __get_xPSR(void)
{
  register uint32_t __regXPSR          __asm("xpsr");
  return(__regXPSR);
}







 
static __inline uint32_t __get_PSP(void)
{
  register uint32_t __regProcessStackPointer  __asm("psp");
  return(__regProcessStackPointer);
}







 
static __inline void __set_PSP(uint32_t topOfProcStack)
{
  register uint32_t __regProcessStackPointer  __asm("psp");
  __regProcessStackPointer = topOfProcStack;
}







 
static __inline uint32_t __get_MSP(void)
{
  register uint32_t __regMainStackPointer     __asm("msp");
  return(__regMainStackPointer);
}







 
static __inline void __set_MSP(uint32_t topOfMainStack)
{
  register uint32_t __regMainStackPointer     __asm("msp");
  __regMainStackPointer = topOfMainStack;
}







 
static __inline uint32_t __get_PRIMASK(void)
{
  register uint32_t __regPriMask         __asm("primask");
  return(__regPriMask);
}







 
static __inline void __set_PRIMASK(uint32_t priMask)
{
  register uint32_t __regPriMask         __asm("primask");
  __regPriMask = (priMask);
}


# 271 "..\\FTLib\\CMSIS\\inc\\core_cmFunc.h"


# 307 "..\\FTLib\\CMSIS\\inc\\core_cmFunc.h"


# 634 "..\\FTLib\\CMSIS\\inc\\core_cmFunc.h"

 

# 149 "..\\FTLib\\CMSIS\\inc\\core_cm0.h"








 
# 174 "..\\FTLib\\CMSIS\\inc\\core_cm0.h"

 






 
# 190 "..\\FTLib\\CMSIS\\inc\\core_cm0.h"

 










 


 





 


 
typedef union
{
  struct
  {

    uint32_t _reserved0:27;               





    uint32_t Q:1;                         
    uint32_t V:1;                         
    uint32_t C:1;                         
    uint32_t Z:1;                         
    uint32_t N:1;                         
  } b;                                    
  uint32_t w;                             
} APSR_Type;



 
typedef union
{
  struct
  {
    uint32_t ISR:9;                       
    uint32_t _reserved0:23;               
  } b;                                    
  uint32_t w;                             
} IPSR_Type;



 
typedef union
{
  struct
  {
    uint32_t ISR:9;                       

    uint32_t _reserved0:15;               





    uint32_t T:1;                         
    uint32_t IT:2;                        
    uint32_t Q:1;                         
    uint32_t V:1;                         
    uint32_t C:1;                         
    uint32_t Z:1;                         
    uint32_t N:1;                         
  } b;                                    
  uint32_t w;                             
} xPSR_Type;



 
typedef union
{
  struct
  {
    uint32_t nPRIV:1;                     
    uint32_t SPSEL:1;                     
    uint32_t FPCA:1;                      
    uint32_t _reserved0:29;               
  } b;                                    
  uint32_t w;                             
} CONTROL_Type;

 






 


 
typedef struct
{
  volatile uint32_t ISER[1];                  
       uint32_t RESERVED0[31];
  volatile uint32_t ICER[1];                  
       uint32_t RSERVED1[31];
  volatile uint32_t ISPR[1];                  
       uint32_t RESERVED2[31];
  volatile uint32_t ICPR[1];                  
       uint32_t RESERVED3[31];
       uint32_t RESERVED4[64];
  volatile uint32_t IP[8];                    
}  NVIC_Type;

 






 


 
typedef struct
{
  volatile const  uint32_t CPUID;                    
  volatile uint32_t ICSR;                     
       uint32_t RESERVED0;
  volatile uint32_t AIRCR;                    
  volatile uint32_t SCR;                      
  volatile uint32_t CCR;                      
       uint32_t RESERVED1;
  volatile uint32_t SHP[2];                   
  volatile uint32_t SHCSR;                    
} SCB_Type;

 















 



























 















 









 






 



 






 


 
typedef struct
{
  volatile uint32_t CTRL;                     
  volatile uint32_t LOAD;                     
  volatile uint32_t VAL;                      
  volatile const  uint32_t CALIB;                    
} SysTick_Type;

 












 



 



 









 








 
 






 

 










 









 

 



 




 

 
 










 
static __inline void NVIC_EnableIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ISER[0] = (1 << ((uint32_t)(IRQn) & 0x1F));
}







 
static __inline void NVIC_DisableIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ICER[0] = (1 << ((uint32_t)(IRQn) & 0x1F));
}











 
static __inline uint32_t NVIC_GetPendingIRQ(IRQn_Type IRQn)
{
  return((uint32_t) ((((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ISPR[0] & (1 << ((uint32_t)(IRQn) & 0x1F)))?1:0));
}







 
static __inline void NVIC_SetPendingIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ISPR[0] = (1 << ((uint32_t)(IRQn) & 0x1F));
}







 
static __inline void NVIC_ClearPendingIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ICPR[0] = (1 << ((uint32_t)(IRQn) & 0x1F));  
}










 
static __inline void NVIC_SetPriority(IRQn_Type IRQn, uint32_t priority)
{
  if(IRQn < 0) {
    ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->SHP[( ((((uint32_t)(IRQn) & 0x0F)-8) >> 2) )] = (((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->SHP[( ((((uint32_t)(IRQn) & 0x0F)-8) >> 2) )] & ~(0xFF << ( (((uint32_t)(IRQn) ) & 0x03) * 8 ))) |
        (((priority << (8 - 2)) & 0xFF) << ( (((uint32_t)(IRQn) ) & 0x03) * 8 )); }
  else {
    ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->IP[( ((uint32_t)(IRQn) >> 2) )] = (((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->IP[( ((uint32_t)(IRQn) >> 2) )] & ~(0xFF << ( (((uint32_t)(IRQn) ) & 0x03) * 8 ))) |
        (((priority << (8 - 2)) & 0xFF) << ( (((uint32_t)(IRQn) ) & 0x03) * 8 )); }
}












 
static __inline uint32_t NVIC_GetPriority(IRQn_Type IRQn)
{

  if(IRQn < 0) {
    return((uint32_t)(((((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->SHP[( ((((uint32_t)(IRQn) & 0x0F)-8) >> 2) )] >> ( (((uint32_t)(IRQn) ) & 0x03) * 8 ) ) & 0xFF) >> (8 - 2)));  }  
  else {
    return((uint32_t)(((((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->IP[ ( ((uint32_t)(IRQn) >> 2) )] >> ( (((uint32_t)(IRQn) ) & 0x03) * 8 ) ) & 0xFF) >> (8 - 2)));  }  
}





 
static __inline void NVIC_SystemReset(void)
{
  __dsb(0xF);                                                     
 
  ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR  = ((0x5FA << 16)      |
                 (1UL << 2));
  __dsb(0xF);                                                      
  while(1);                                                     
}

 



 




 

















 
static __inline uint32_t SysTick_Config(uint32_t ticks)
{
  if ((ticks - 1) > (0xFFFFFFUL << 0))  return (1);       

  ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->LOAD  = ticks - 1;                                   
  NVIC_SetPriority (SysTick_IRQn, (1<<2) - 1);   
  ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->VAL   = 0;                                           
  ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->CTRL  = (1UL << 2) |
                   (1UL << 1)   |
                   (1UL << 0);                     
  return (0);                                                   
}



 








# 183 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"
# 1 "..\\FTLib\\CMSIS\\inc\\ft32f0xx.h"








 

# 92 "..\\FTLib\\CMSIS\\inc\\ft32f0xx.h"


 



 
  



 
# 184 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"
# 1 "..\\FTLib\\CMSIS\\inc\\system_ft32f0xx.h"









 
  


 







extern uint32_t SystemCoreClock;           

extern void SystemInit(void);
extern void SystemCoreClockUpdate(void);


 









 
  


   
 
# 185 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"
# 186 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"



   


  
typedef enum 
{
  RESET = 0, 
  SET = !RESET
} FlagStatus, ITStatus;

typedef enum 
{
  DISABLE = 0, 
  ENABLE = !DISABLE
} FunctionalState;


typedef enum 
{
  ERROR = 0, 
  SUCCESS = !ERROR
} ErrorStatus;




    



 

typedef struct
{
  volatile uint32_t ISR;           
  volatile uint32_t IER;           
  volatile uint32_t CR;            
  volatile uint32_t CFGR1;         
  volatile uint32_t CFGR2;         
  volatile uint32_t SMPR;          
  uint32_t   RESERVED1;        
  uint32_t   RESERVED2;        
  volatile uint32_t TR;            
  uint32_t   RESERVED3;        
  volatile uint32_t CHSELR;        
  uint32_t   RESERVED4[5];     
   volatile uint32_t DR;           
} ADC_TypeDef;

typedef struct
{
  volatile uint32_t CCR;					 
  volatile uint32_t CR2; 					 
} ADC_Common_TypeDef;



 

typedef struct
{
	volatile uint32_t RESERVED[7];      
  volatile uint32_t CSR;    				  
} COMP_TypeDef;


 
typedef struct
{
	volatile uint32_t RESERVED[12];      
  volatile uint32_t CR;    				  
} OPA_TypeDef;



 
typedef struct
{
	volatile uint32_t RESERVED[8];     
  volatile uint32_t CTRL;            
  volatile uint32_t DATA1;           
  volatile uint32_t DATA2;           
}DAC_TypeDef;



 

typedef struct
{
  volatile uint32_t DR;           
	volatile uint32_t IDR;          
  volatile uint32_t CR;            
  uint32_t      RESERVED2;    
  volatile uint32_t INIT;         
  volatile uint32_t RESERVED3;    
} CRC_TypeDef;



 
typedef struct 
{
volatile uint32_t CR;      
volatile uint32_t CFGR;    
volatile uint32_t ISR;     
volatile uint32_t ICR;     
} CRS_TypeDef;



 

typedef struct
{
  volatile uint32_t IDCODE;        
  volatile uint32_t CR;            
  volatile uint32_t APB1FZ;        
  volatile uint32_t APB2FZ;        
}DBGMCU_TypeDef;



 

typedef struct
{
  volatile uint32_t CCR;           
  volatile uint32_t CNDTR;         
  volatile uint32_t CPAR;          
  volatile uint32_t CMAR;          
} DMA_Channel_TypeDef;

typedef struct
{
  volatile uint32_t ISR;           
  volatile uint32_t IFCR;          
}DMA_TypeDef;



 

typedef struct
{
  volatile uint32_t IMR;           
  volatile uint32_t EMR;           
  volatile uint32_t RTSR;          
  volatile uint32_t FTSR;          
  volatile uint32_t SWIER;         
  volatile uint32_t PR;            
}EXTI_TypeDef;



 
typedef struct
{
  volatile uint32_t ACR;           
  volatile uint32_t KEYR;          
  volatile uint32_t OPTKEYR;       
  volatile uint32_t SR;            
  volatile uint32_t CR;            
  volatile uint32_t AR;            
  volatile uint32_t RESERVED;      
  volatile uint32_t OBR;           
  volatile uint32_t WRPR;          
} FLASH_TypeDef;




 
typedef struct
{
  volatile uint32_t USER_RDP;           
  volatile uint32_t DATA1_DATA0;        
  volatile uint32_t WRP1_WRP0;          
  volatile uint32_t WRP3_WRP2;          
} OB_TypeDef;
  



 

typedef struct
{
  volatile uint32_t MODER;         
  volatile uint16_t OTYPER;        
  uint16_t RESERVED0;          
  volatile uint32_t OSPEEDR;       
  volatile uint32_t PUPDR;         
  volatile uint16_t IDR;           
  uint16_t RESERVED1;          
  volatile uint16_t ODR;           
  uint16_t RESERVED2;          
  volatile uint32_t BSRR;          
  volatile uint32_t LCKR;          
  volatile uint32_t AFR[2];        
  volatile uint16_t BRR;           
  uint32_t RESERVED3;          
  volatile uint32_t LEDM;          
}GPIO_TypeDef;



 

typedef struct
{
  volatile uint32_t CFGR1;           
       uint32_t RESERVED;        
  volatile uint32_t EXTICR[4];       
  volatile uint32_t CFGR2;                 
}SYSCFG_TypeDef;



 

typedef struct
{
  volatile uint32_t CR1;       
  volatile uint32_t CR2;       
  volatile uint32_t OAR1;      
  volatile uint32_t OAR2;      
  volatile uint32_t TIMINGR;   
  volatile uint32_t TIMEOUTR;  
  volatile uint32_t ISR;       
  volatile uint32_t ICR;       
  volatile uint32_t PECR;      
  volatile uint32_t RXDR;      
  volatile uint32_t TXDR;      
}I2C_TypeDef;




 
typedef struct
{
  volatile uint32_t KR;    
  volatile uint32_t PR;    
  volatile uint32_t RLR;   
  volatile uint32_t SR;    
  volatile uint32_t WINR;  
} IWDG_TypeDef;



 
typedef struct
{ 
	volatile uint8_t FADDR;       
	volatile uint8_t POWER;       
	volatile uint8_t INTRIN;      
	volatile uint8_t RES1; 		  
	volatile uint8_t INTROUT;     
	volatile uint8_t RES2;		  
	volatile uint8_t INTRUSB;     
	volatile uint8_t INTRINE;     
	volatile uint8_t RES3; 		  
	volatile uint8_t INTROUTE;    
	volatile uint8_t RES4; 		  
	volatile uint8_t INTRUSBE;    
	volatile uint8_t FRAM1;       
	volatile uint8_t FRAM2;       
	volatile uint8_t INDEX;       
	volatile uint8_t PDCTRL;      
	volatile uint8_t INMAXP;	  
	union 
	{
		volatile uint8_t INCSR0;  
		volatile uint8_t INCSR1;  
	}INCSR;
	
	volatile uint8_t RES;         
	volatile uint8_t OUTMAXP;     
	volatile uint8_t OUTCSR1;     	
	volatile uint8_t OUTCSR2;      
	volatile uint8_t OUTCOUNTER;  
	volatile uint8_t RES5; 		  
	volatile uint8_t RES6; 		  
	volatile uint8_t RES7; 		  
	volatile uint8_t FIFO0;       
	volatile uint8_t RES8; 		  
	volatile uint8_t RES9; 		  
	volatile uint8_t RES10; 	  	
	volatile uint8_t FIFO1;       
	volatile uint8_t RES11; 	  
	volatile uint8_t RES12; 	  
	volatile uint8_t RES13; 	  	
	volatile uint8_t FIFO2;       
	volatile uint8_t RES14; 	  
	volatile uint8_t RES15; 	  
	volatile uint8_t RES16; 	  	
	volatile uint8_t FIFO3;       
	volatile uint8_t RES17; 	  
	volatile uint8_t RES18; 	  
	volatile uint8_t RES19; 	  	
	volatile uint8_t FIFO4;       
	volatile uint8_t RES20; 	  
	volatile uint8_t RES21; 	  
	volatile uint8_t RES22; 	  	
	volatile uint8_t FIFO5;       
	volatile uint8_t RES23; 	  
	volatile uint8_t RES24; 	  
	volatile uint8_t RES25; 	  	
	volatile uint8_t FIFO6;       
	volatile uint8_t RES26; 	  
	volatile uint8_t RES27; 	  
	volatile uint8_t RES28; 	  	
	volatile uint8_t FIFO7;       
}USB_TypeDef;



 

typedef struct
{
  volatile uint32_t CR;    
  volatile uint32_t CSR;   
} PWR_TypeDef;




 
typedef struct
{
  volatile uint32_t CR;          
  volatile uint32_t CFGR;        
  volatile uint32_t CIR;         
  volatile uint32_t APB2RSTR;    
  volatile uint32_t APB1RSTR;    
  volatile uint32_t AHBENR;      
  volatile uint32_t APB2ENR;     
  volatile uint32_t APB1ENR;     
  volatile uint32_t BDCR;         
  volatile uint32_t CSR;         
  volatile uint32_t AHBRSTR;     
  volatile uint32_t CFGR2;       
  volatile uint32_t CFGR3;       
  volatile uint32_t CR2;         
  volatile uint32_t HSECFG;       
  volatile uint32_t CFGR4;       
  volatile uint32_t TRIM;         
} RCC_TypeDef;



 

typedef struct
{
  volatile uint32_t TR;          
  volatile uint32_t DR;          
  volatile uint32_t CR;                                                                                                      
  volatile uint32_t ISR;         
  volatile uint32_t PRER;        
       uint32_t RESERVED1;   
       uint32_t RESERVED2;   
  volatile uint32_t ALRMAR;      
       uint32_t RESERVED3;   
  volatile uint32_t WPR;         
  volatile uint32_t SSR;         
  volatile uint32_t SHIFTR;      
  volatile uint32_t TSTR;        
  volatile uint32_t TSDR;        
  volatile uint32_t TSSSR;       
  volatile uint32_t CALR;        
  volatile uint32_t TAFCR;       
  volatile uint32_t ALRMASSR;    
} RTC_TypeDef;

 




 
  
typedef struct
{
  volatile uint16_t CR1;       
  uint16_t  RESERVED0;     
  volatile uint16_t CR2;       
  uint16_t  RESERVED1;     
  volatile uint16_t SR;        
  uint16_t  RESERVED2;     
  volatile uint16_t DR;        
  uint16_t  RESERVED3;     
  volatile uint16_t CRCPR;     
  uint16_t  RESERVED4;     
  volatile uint16_t RXCRCR;    
  uint16_t  RESERVED5;     
  volatile uint16_t TXCRCR;    
  uint16_t  RESERVED6;      
 
 
 
  
} SPI_TypeDef;




 
typedef struct
{
  volatile uint16_t CR1;              
  uint16_t      RESERVED0;        
  volatile uint16_t CR2;              
  uint16_t      RESERVED1;        
  volatile uint16_t SMCR;             
  uint16_t      RESERVED2;        
  volatile uint16_t DIER;             
  uint16_t      RESERVED3;        
  volatile uint16_t SR;               
  uint16_t      RESERVED4;        
  volatile uint16_t EGR;              
  uint16_t      RESERVED5;        
  volatile uint16_t CCMR1;            
  uint16_t      RESERVED6;        
  volatile uint16_t CCMR2;            
  uint16_t      RESERVED7;        
  volatile uint16_t CCER;             
  uint16_t      RESERVED8;        
  volatile uint32_t CNT;              
  volatile uint16_t PSC;              
  uint16_t      RESERVED10;       
  volatile uint32_t ARR;              
  volatile uint16_t RCR;              
  uint16_t      RESERVED12;       
  volatile uint32_t CCR1;             
  volatile uint32_t CCR2;             
  volatile uint32_t CCR3;             
  volatile uint32_t CCR4;             
  volatile uint16_t BDTR;             
  uint16_t      RESERVED17;       
  volatile uint16_t DCR;              
  uint16_t      RESERVED18;       
  volatile uint16_t DMAR;             
  uint16_t      RESERVED19;       
  volatile uint16_t OR;               
  uint16_t      RESERVED20;       
} TIM_TypeDef;



 

typedef struct
{
  volatile uint32_t CR;           
  volatile uint32_t CFGR;         
}TSC_TypeDef;



 
  
typedef struct
{
  volatile uint32_t CR1;      
  volatile uint32_t CR2;      
  volatile uint32_t CR3;     
  volatile uint16_t BRR;     
  
  
  
  uint32_t  RESERVED2;   
  volatile uint32_t RTOR;      
  volatile uint16_t RQR;     
  uint16_t  RESERVED3;   
  volatile uint32_t ISR;     
  volatile uint32_t ICR;     
  volatile uint16_t RDR;     
  uint16_t  RESERVED4;   
  volatile uint16_t TDR;     
  uint16_t  RESERVED5;   
} USART_TypeDef;




 
typedef struct
{
  volatile uint32_t CR;    
  volatile uint32_t CFR;   
  volatile uint32_t SR;    
} WWDG_TypeDef;



 
  


 





 








# 717 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"






# 733 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"

# 742 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"
















 
  


   

# 779 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"

# 794 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"

# 803 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"







# 816 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"



 



 
  
  

 
    
 
 
 
 
 
 
 
 
 
# 844 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"

 


 
# 855 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"

 


 






 
# 894 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"

 


 




 



 





 





 



 



 
# 948 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"

 


 



 
 
 
 
 
 
 
# 977 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"

 
# 987 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"

# 995 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"

 
 
 
 
 
 


 


 









 


 


 
 
 
 
 

 
# 1038 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"

 
# 1050 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"

 
# 1061 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"

 





 
 
 
 
 
 
# 1080 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"






 
 
 
 
 

 






















# 1132 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"



 



 

# 1149 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"


 





 
 
 
 
 

 
# 1184 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"









 
# 1214 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"









 
# 1232 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"















 


 






 






 


























































































































































 
 
 
 
 
 
# 1457 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"

 
# 1491 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"

 
# 1512 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"




 
# 1536 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"




 
# 1560 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"




 
# 1584 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"




 
 
 
 
 
 





 


 


 



                                                               




 






 
# 1634 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"

 


 
















 


 


 


 

 



 



 



 



 



 



 
 
 
 
 
 
# 1744 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"

 
# 1762 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"

 
# 1812 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"

 
# 1862 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"

 
# 1912 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"

 
# 1930 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"

 
# 1948 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"

 
# 1982 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"

 
# 2001 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"

 
# 2011 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"

 
# 2021 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"

 
# 2031 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"

 
# 2041 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"

 
# 2059 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"

# 2076 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"

 
# 2084 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"


# 2093 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"
 
 
 
 
 

 
# 2110 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"

# 2120 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"

 
# 2133 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"

 




 




 






 






 
# 2176 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"

 
# 2187 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"

 


 


 


 
 
 
 
 
 


 





 


 




 


 
 
 
 
 

 






# 2241 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"

 
# 2259 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"




 


 














 

 
 
 
 
 

 
# 2300 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"

 



 








 










 
# 2335 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"





 













# 2361 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"





 


 






# 2391 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"

 






# 2414 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"






 
# 2430 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"

# 2440 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"

# 2450 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"



 
# 2460 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"

# 2477 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"

 




# 2491 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"

 


 




















 

















                                              

 



 




# 2553 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"

 



 




















 













 










   
# 2616 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"

 

 








 







  
 
 






# 2661 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"

 





                                                                   
# 2685 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"
 















 
# 2710 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"

 
 
 
 
 
          
# 2744 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"

        
# 2774 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"

         













# 2796 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"




 



 







# 2818 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"



 



 


 
# 2869 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"

 


 



 



 
# 2909 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"

 
# 2929 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"

 



 
# 2948 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"

 
# 2963 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"

 
# 2983 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"








 


 
# 3001 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"

 


 


 


 


 


 
 
 
 
 
 
# 3040 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"

 
# 3058 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"

 




# 3075 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"

 


 


 


 


 















 




 
 
 
 
 
 
# 3121 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"


























 







 







 









  









 









 







 







 









 









 









 







 







 








 









 









 






 







 








 








 








 






 



 


 







































































 
 
 
 
 
 
















 









# 3452 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"

 



























 
# 3497 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"

 
# 3511 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"

 
# 3521 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"

 




























 





















 




























 





















 
# 3639 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"
 


 


 


 


 


 


 


 


 
# 3673 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"





# 3684 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"

 
# 3692 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"

# 3699 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"

 


 





 
 
 
 
 
 
# 3744 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"


 

 



# 3771 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"





 






# 3793 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"









 




 




 



 






 
# 3832 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"





# 3843 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"




 
# 3857 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"




 


 


 
 
 
 
 

 
# 3882 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"



 
# 3894 "..\\FTLib\\CMSIS\\inc\\ft32f072x8.h"







 






 

 

  







 


 
  








 

  

 

 
# 54 "..\\FTLib\\CMSIS\\inc\\ft32f0xx.h"






 





 




 






















 



 
  



 
# 23 "..\\FTLib\\Inc\\ft32f0xx_i2c.h"




 

 



 

typedef struct
{
  uint32_t I2C_Timing;              
 

  uint32_t I2C_AnalogFilter;        
 

  uint32_t I2C_DigitalFilter;       
 

  uint32_t I2C_Mode;                
 

  uint32_t I2C_OwnAddress1;         
 

  uint32_t I2C_Ack;                 
 

  uint32_t I2C_AcknowledgedAddress; 
 
}I2C_InitTypeDef;

 




 



                                         




 








 



 




 



 










 



 








 



 








  



 




 



 








 



 







 



 




 




 





 



 

# 200 "..\\FTLib\\Inc\\ft32f0xx_i2c.h"

# 209 "..\\FTLib\\Inc\\ft32f0xx_i2c.h"



 



 





 



 

# 239 "..\\FTLib\\Inc\\ft32f0xx_i2c.h"

# 251 "..\\FTLib\\Inc\\ft32f0xx_i2c.h"


 



 

# 266 "..\\FTLib\\Inc\\ft32f0xx_i2c.h"





 



 

# 292 "..\\FTLib\\Inc\\ft32f0xx_i2c.h"



# 303 "..\\FTLib\\Inc\\ft32f0xx_i2c.h"



 




 

# 326 "..\\FTLib\\Inc\\ft32f0xx_i2c.h"


                               
# 336 "..\\FTLib\\Inc\\ft32f0xx_i2c.h"
                               



 



 





                              



                               



 



 






                              




                               



 



 

 
 


 
void I2C_DeInit(I2C_TypeDef* I2Cx);
void I2C_Init(I2C_TypeDef* I2Cx, I2C_InitTypeDef* I2C_InitStruct);
void I2C_StructInit(I2C_InitTypeDef* I2C_InitStruct);
void I2C_Cmd(I2C_TypeDef* I2Cx, FunctionalState NewState);
void I2C_SoftwareResetCmd(I2C_TypeDef* I2Cx);
void I2C_ITConfig(I2C_TypeDef* I2Cx, uint32_t I2C_IT, FunctionalState NewState);
void I2C_StretchClockCmd(I2C_TypeDef* I2Cx, FunctionalState NewState);
void I2C_DualAddressCmd(I2C_TypeDef* I2Cx, FunctionalState NewState);
void I2C_OwnAddress2Config(I2C_TypeDef* I2Cx, uint16_t Address, uint8_t Mask);
void I2C_GeneralCallCmd(I2C_TypeDef* I2Cx, FunctionalState NewState);
void I2C_SlaveByteControlCmd(I2C_TypeDef* I2Cx, FunctionalState NewState);
void I2C_SlaveAddressConfig(I2C_TypeDef* I2Cx, uint16_t Address);
void I2C_10BitAddressingModeCmd(I2C_TypeDef* I2Cx, FunctionalState NewState);

 
void I2C_AutoEndCmd(I2C_TypeDef* I2Cx, FunctionalState NewState);
void I2C_ReloadCmd(I2C_TypeDef* I2Cx, FunctionalState NewState);
void I2C_NumberOfBytesConfig(I2C_TypeDef* I2Cx, uint8_t Number_Bytes);
void I2C_MasterRequestConfig(I2C_TypeDef* I2Cx, uint16_t I2C_Direction);
void I2C_GenerateSTART(I2C_TypeDef* I2Cx, FunctionalState NewState);
void I2C_GenerateSTOP(I2C_TypeDef* I2Cx, FunctionalState NewState);
void I2C_10BitAddressHeaderCmd(I2C_TypeDef* I2Cx, FunctionalState NewState);
void I2C_AcknowledgeConfig(I2C_TypeDef* I2Cx, FunctionalState NewState);
uint8_t I2C_GetAddressMatched(I2C_TypeDef* I2Cx);
uint16_t I2C_GetTransferDirection(I2C_TypeDef* I2Cx);
void I2C_TransferHandling(I2C_TypeDef* I2Cx, uint16_t Address, uint8_t Number_Bytes, uint32_t ReloadEndMode, uint32_t StartStopMode);

 
void I2C_SMBusAlertCmd(I2C_TypeDef* I2Cx, FunctionalState NewState);
void I2C_ClockTimeoutCmd(I2C_TypeDef* I2Cx, FunctionalState NewState);
void I2C_ExtendedClockTimeoutCmd(I2C_TypeDef* I2Cx, FunctionalState NewState);
void I2C_IdleClockTimeoutCmd(I2C_TypeDef* I2Cx, FunctionalState NewState);
void I2C_TimeoutAConfig(I2C_TypeDef* I2Cx, uint16_t Timeout);
void I2C_TimeoutBConfig(I2C_TypeDef* I2Cx, uint16_t Timeout);
void I2C_CalculatePEC(I2C_TypeDef* I2Cx, FunctionalState NewState);
void I2C_PECRequestCmd(I2C_TypeDef* I2Cx, FunctionalState NewState);
uint8_t I2C_GetPEC(I2C_TypeDef* I2Cx);

 
uint32_t I2C_ReadRegister(I2C_TypeDef* I2Cx, uint8_t I2C_Register);

 
void I2C_SendData(I2C_TypeDef* I2Cx, uint8_t Data);
uint8_t I2C_ReceiveData(I2C_TypeDef* I2Cx);

 
void I2C_DMACmd(I2C_TypeDef* I2Cx, uint32_t I2C_DMAReq, FunctionalState NewState);

 
FlagStatus I2C_GetFlagStatus(I2C_TypeDef* I2Cx, uint32_t I2C_FLAG);
void I2C_ClearFlag(I2C_TypeDef* I2Cx, uint32_t I2C_FLAG);
ITStatus I2C_GetITStatus(I2C_TypeDef* I2Cx, uint32_t I2C_IT);
void I2C_ClearITPendingBit(I2C_TypeDef* I2Cx, uint32_t I2C_IT);


int i2c_senddata(I2C_TypeDef * i2c,uint8_t slave_addr,uint8_t addr,uint8_t *pBuffer, uint32_t bufferSize);
int i2c_readdata(I2C_TypeDef * i2c,uint8_t slave_addr,uint8_t addr,uint8_t *pBuffer, uint32_t bufferSize);









 



 

 
# 21 "..\\FTLib\\Src\\ft32f0xx_i2c.c"
# 1 "..\\FTLib\\Inc\\ft32f0xx_rcc.h"









 


 







 
# 23 "..\\FTLib\\Inc\\ft32f0xx_rcc.h"




 

 

typedef struct
{
  uint32_t SYSCLK_Frequency;
  uint32_t HCLK_Frequency;
  uint32_t PCLK_Frequency;
  uint32_t ADCCLK_Frequency;
  uint32_t CECCLK_Frequency;
  uint32_t I2C1CLK_Frequency;
  uint32_t USART1CLK_Frequency;
  uint32_t USART2CLK_Frequency; 
  uint32_t USART3CLK_Frequency; 
  uint32_t USBCLK_Frequency;  
}RCC_ClocksTypeDef;

 



 



 









  
 


 














  



 

# 111 "..\\FTLib\\Inc\\ft32f0xx_rcc.h"


 



 
# 134 "..\\FTLib\\Inc\\ft32f0xx_rcc.h"

# 143 "..\\FTLib\\Inc\\ft32f0xx_rcc.h"


 
 


 












 



 

# 182 "..\\FTLib\\Inc\\ft32f0xx_rcc.h"


  



 

# 198 "..\\FTLib\\Inc\\ft32f0xx_rcc.h"


 
  


 

 









 




 



 








 




 








 



 

















# 282 "..\\FTLib\\Inc\\ft32f0xx_rcc.h"



 
         


 

# 299 "..\\FTLib\\Inc\\ft32f0xx_rcc.h"












 
  


 








 



 










 



 

# 351 "..\\FTLib\\Inc\\ft32f0xx_rcc.h"


 
  


 

# 371 "..\\FTLib\\Inc\\ft32f0xx_rcc.h"






 



 

# 395 "..\\FTLib\\Inc\\ft32f0xx_rcc.h"





  



 

# 425 "..\\FTLib\\Inc\\ft32f0xx_rcc.h"




 



 

# 445 "..\\FTLib\\Inc\\ft32f0xx_rcc.h"








  



 
# 467 "..\\FTLib\\Inc\\ft32f0xx_rcc.h"

# 477 "..\\FTLib\\Inc\\ft32f0xx_rcc.h"


  



 
# 499 "..\\FTLib\\Inc\\ft32f0xx_rcc.h"

# 508 "..\\FTLib\\Inc\\ft32f0xx_rcc.h"






 



 

 
 

 
void RCC_DeInit(void);

 
void RCC_HSEConfig(uint8_t RCC_HSE);
ErrorStatus RCC_WaitForHSEStartUp(void);
void RCC_AdjustHSICalibrationValue(uint8_t HSICalibrationValue);
void RCC_HSICmd(FunctionalState NewState);
void RCC_AdjustHSI14CalibrationValue(uint8_t HSI14CalibrationValue);
void RCC_HSI14Cmd(FunctionalState NewState);
void RCC_HSI14ADCRequestCmd(FunctionalState NewState);
void RCC_LSEConfig(uint32_t RCC_LSE);
void RCC_LSEDriveConfig(uint32_t RCC_LSEDrive);
void RCC_LSICmd(FunctionalState NewState);
void RCC_PLLConfig(uint32_t RCC_PLLSource, uint32_t RCC_PLLMul);
void RCC_PLLCmd(FunctionalState NewState);
void RCC_HSI48Cmd(FunctionalState NewState);
uint32_t RCC_GetHSI48CalibrationValue(void); 
void RCC_PREDIV1Config(uint32_t RCC_PREDIV1_Div);
void RCC_ClockSecuritySystemCmd(FunctionalState NewState);



void RCC_MCOConfig(uint8_t RCC_MCOSource,uint32_t RCC_MCOPrescaler);


 
void RCC_SYSCLKConfig(uint32_t RCC_SYSCLKSource);
uint8_t RCC_GetSYSCLKSource(void);
void RCC_HCLKConfig(uint32_t RCC_SYSCLK);
void RCC_PCLKConfig(uint32_t RCC_HCLK);
void RCC_ADCCLKConfig(uint32_t RCC_ADCCLK); 

 
void RCC_CECCLKConfig(uint32_t RCC_CECCLK);
void RCC_I2CCLKConfig(uint32_t RCC_I2CCLK);
void RCC_USARTCLKConfig(uint32_t RCC_USARTCLK);
void RCC_USBCLKConfig(uint32_t RCC_USBCLK); 
void RCC_GetClocksFreq(RCC_ClocksTypeDef* RCC_Clocks);

 
void RCC_RTCCLKConfig(uint32_t RCC_RTCCLKSource);
void RCC_RTCCLKCmd(FunctionalState NewState);
void RCC_BackupResetCmd(FunctionalState NewState);

void RCC_AHBPeriphClockCmd(uint32_t RCC_AHBPeriph, FunctionalState NewState);
void RCC_APB2PeriphClockCmd(uint32_t RCC_APB2Periph, FunctionalState NewState);
void RCC_APB1PeriphClockCmd(uint32_t RCC_APB1Periph, FunctionalState NewState);

void RCC_AHBPeriphResetCmd(uint32_t RCC_AHBPeriph, FunctionalState NewState);
void RCC_APB2PeriphResetCmd(uint32_t RCC_APB2Periph, FunctionalState NewState);
void RCC_APB1PeriphResetCmd(uint32_t RCC_APB1Periph, FunctionalState NewState);

 
void RCC_ITConfig(uint8_t RCC_IT, FunctionalState NewState);
FlagStatus RCC_GetFlagStatus(uint8_t RCC_FLAG);
void RCC_ClearFlag(void);
ITStatus RCC_GetITStatus(uint8_t RCC_IT);
void RCC_ClearITPendingBit(uint8_t RCC_IT);









 



  

 
# 22 "..\\FTLib\\Src\\ft32f0xx_i2c.c"















 
void I2C_DeInit(I2C_TypeDef* I2Cx)
{
   
  ((void)0);

  if (I2Cx == ((I2C_TypeDef *) (((uint32_t)0x40000000) + 0x00005400)))
  {
     
    RCC_APB1PeriphResetCmd(((uint32_t)0x00200000), ENABLE);
     
    RCC_APB1PeriphResetCmd(((uint32_t)0x00200000), DISABLE);
  }
  else
  {
     
    RCC_APB1PeriphResetCmd(((uint32_t)0x00400000), ENABLE);
     
    RCC_APB1PeriphResetCmd(((uint32_t)0x00400000), DISABLE);
  }
}








 
void I2C_Init(I2C_TypeDef* I2Cx, I2C_InitTypeDef* I2C_InitStruct)
{
  uint32_t tmpreg = 0;

   
  ((void)0);
  ((void)0);
  ((void)0);
  ((void)0);
  ((void)0);
  ((void)0);
  ((void)0);

   
  I2Cx->CR1 &= (uint32_t)~((uint32_t)((uint32_t)0x00000001));

   
   
  tmpreg = I2Cx->CR1;
   
  tmpreg &= ((uint32_t)0x00CFE0FF);
   
   
   
  tmpreg |= (uint32_t)I2C_InitStruct->I2C_AnalogFilter |(I2C_InitStruct->I2C_DigitalFilter << 8);

   
  I2Cx->CR1 = tmpreg;

   
   
   
   
  I2Cx->TIMINGR = I2C_InitStruct->I2C_Timing & ((uint32_t)0xF0FFFFFF);

   
  I2Cx->CR1 |= ((uint32_t)0x00000001);

   
   
  tmpreg = 0;
   
  I2Cx->OAR1 = (uint32_t)tmpreg;
   
  I2Cx->OAR2 = (uint32_t)tmpreg;
   
   
   
  tmpreg = (uint32_t)((uint32_t)I2C_InitStruct->I2C_AcknowledgedAddress |                       (uint32_t)I2C_InitStruct->I2C_OwnAddress1);

   
  I2Cx->OAR1 = tmpreg;
   
  I2Cx->OAR1 |= ((uint32_t)0x00008000);

   
   
   
  tmpreg = I2C_InitStruct->I2C_Mode;
   
  I2Cx->CR1 |= tmpreg;

   
   
  tmpreg = I2Cx->CR2;
   
  tmpreg &= ((uint32_t)0x07FF7FFF);
   
   
  tmpreg |= I2C_InitStruct->I2C_Ack;
   
  I2Cx->CR2 = tmpreg;
}





 
void I2C_StructInit(I2C_InitTypeDef* I2C_InitStruct)
{
   
   
  I2C_InitStruct->I2C_Timing = 0;
   
  I2C_InitStruct->I2C_AnalogFilter = ((uint32_t)0x00000000);
   
  I2C_InitStruct->I2C_DigitalFilter = 0;
   
  I2C_InitStruct->I2C_Mode = ((uint32_t)0x00000000);
   
  I2C_InitStruct->I2C_OwnAddress1 = 0;
   
  I2C_InitStruct->I2C_Ack = ((uint32_t)0x00008000);
   
  I2C_InitStruct->I2C_AcknowledgedAddress = ((uint32_t)0x00000000);
}







 
void I2C_Cmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
{
   
  ((void)0);
  ((void)0);
  if (NewState != DISABLE)
  {
     
    I2Cx->CR1 |= ((uint32_t)0x00000001);
  }
  else
  {
     
    I2Cx->CR1 &= (uint32_t)~((uint32_t)((uint32_t)0x00000001));
  }
}





 
void I2C_SoftwareResetCmd(I2C_TypeDef* I2Cx)
{
   
  ((void)0);

   
  I2Cx->CR1 &= (uint32_t)~((uint32_t)((uint32_t)0x00000001));

  
 
  *(volatile uint32_t *)(uint32_t)I2Cx; 

   
  I2Cx->CR1 |= ((uint32_t)0x00000001);
}
















 
void I2C_ITConfig(I2C_TypeDef* I2Cx, uint32_t I2C_IT, FunctionalState NewState)
{
   
  ((void)0);
  ((void)0);
  ((void)0);
  
  if (NewState != DISABLE)
  {
     
    I2Cx->CR1 |= I2C_IT;
  }
  else
  {
     
    I2Cx->CR1 &= (uint32_t)~((uint32_t)I2C_IT);
  }
}







 
void I2C_StretchClockCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
{
   
  ((void)0);
  ((void)0);
  
  if (NewState != DISABLE)
  {
     
    I2Cx->CR1 &= (uint32_t)~((uint32_t)((uint32_t)0x00020000));    
  }
  else
  {
     
    I2Cx->CR1 |= ((uint32_t)0x00020000);
  }
}







 
void I2C_DualAddressCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
{
   
  ((void)0);
  ((void)0);
  
  if (NewState != DISABLE)
  {
     
    I2Cx->OAR2 |= ((uint32_t)0x00008000);
  }
  else
  {
     
    I2Cx->OAR2 &= (uint32_t)~((uint32_t)((uint32_t)0x00008000));
  }
}    
















 
void I2C_OwnAddress2Config(I2C_TypeDef* I2Cx, uint16_t Address, uint8_t Mask)
{
  uint32_t tmpreg = 0;

   
  ((void)0);
  ((void)0);
  ((void)0);
  
   
  tmpreg = I2Cx->OAR2;

   
  tmpreg &= (uint32_t)~((uint32_t)(((uint32_t)0x000000FE) | ((uint32_t)0x00000700)));

   
  tmpreg |= (uint32_t)(((uint32_t)Address & ((uint32_t)0x000000FE)) |             (((uint32_t)Mask << 8) & ((uint32_t)0x00000700))) ;


   
  I2Cx->OAR2 = tmpreg;
}







 
void I2C_GeneralCallCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
{
   
  ((void)0);
  ((void)0);
  
  if (NewState != DISABLE)
  {
     
    I2Cx->CR1 |= ((uint32_t)0x00080000);
  }
  else
  {
     
    I2Cx->CR1 &= (uint32_t)~((uint32_t)((uint32_t)0x00080000));
  }
} 







 
void I2C_SlaveByteControlCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
{
   
  ((void)0);
  ((void)0);
  
  if (NewState != DISABLE)
  {
     
    I2Cx->CR1 |= ((uint32_t)0x00010000);
  }
  else
  {
     
    I2Cx->CR1 &= (uint32_t)~((uint32_t)((uint32_t)0x00010000));
  }
}







 
void I2C_SlaveAddressConfig(I2C_TypeDef* I2Cx, uint16_t Address)
{
  uint32_t tmpreg = 0;

   
  ((void)0);
  ((void)0);
               
   
  tmpreg = I2Cx->CR2;

   
  tmpreg &= (uint32_t)~((uint32_t)((uint32_t)0x000003FF));

   
  tmpreg |= (uint32_t)((uint32_t)Address & ((uint32_t)0x000003FF));

   
  I2Cx->CR2 = tmpreg;
}
  







 
void I2C_10BitAddressingModeCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
{
   
  ((void)0);
  ((void)0);
  
  if (NewState != DISABLE)
  {
     
    I2Cx->CR2 |= ((uint32_t)0x00000800);
  }
  else
  {
     
    I2Cx->CR2 &= (uint32_t)~((uint32_t)((uint32_t)0x00000800));
  }
} 



 

  








 
void I2C_AutoEndCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
{
   
  ((void)0);
  ((void)0);
  
  if (NewState != DISABLE)
  {
     
    I2Cx->CR2 |= ((uint32_t)0x02000000);
  }
  else
  {
     
    I2Cx->CR2 &= (uint32_t)~((uint32_t)((uint32_t)0x02000000));
  }
} 







 
void I2C_ReloadCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
{
   
  ((void)0);
  ((void)0);
  
  if (NewState != DISABLE)
  {
     
    I2Cx->CR2 |= ((uint32_t)0x01000000);
  }
  else
  {
     
    I2Cx->CR2 &= (uint32_t)~((uint32_t)((uint32_t)0x01000000));
  }
}






 
void I2C_NumberOfBytesConfig(I2C_TypeDef* I2Cx, uint8_t Number_Bytes)
{
  uint32_t tmpreg = 0;

   
  ((void)0);

   
  tmpreg = I2Cx->CR2;

   
  tmpreg &= (uint32_t)~((uint32_t)((uint32_t)0x00FF0000));

   
  tmpreg |= (uint32_t)(((uint32_t)Number_Bytes << 16 ) & ((uint32_t)0x00FF0000));

   
  I2Cx->CR2 = tmpreg;
}  
  








 
void I2C_MasterRequestConfig(I2C_TypeDef* I2Cx, uint16_t I2C_Direction)
{
 
  ((void)0);
  ((void)0);
  
   
  if (I2C_Direction == ((uint16_t)0x0000))
  {
     
    I2Cx->CR2 &= (uint32_t)~((uint32_t)((uint32_t)0x00000400));
  }
  else
  {
     
    I2Cx->CR2 |= ((uint32_t)0x00000400);
  }
}  
  






 
void I2C_GenerateSTART(I2C_TypeDef* I2Cx, FunctionalState NewState)
{
   
  ((void)0);
  ((void)0);
  
  if (NewState != DISABLE)
  {
     
    I2Cx->CR2 |= ((uint32_t)0x00002000);
  }
  else
  {
     
    I2Cx->CR2 &= (uint32_t)~((uint32_t)((uint32_t)0x00002000));
  }
}  
  






 
void I2C_GenerateSTOP(I2C_TypeDef* I2Cx, FunctionalState NewState)
{
   
  ((void)0);
  ((void)0);
  
  if (NewState != DISABLE)
  {
     
    I2Cx->CR2 |= ((uint32_t)0x00004000);
  }
  else
  {
     
    I2Cx->CR2 &= (uint32_t)~((uint32_t)((uint32_t)0x00004000));
  }
}  









 
void I2C_10BitAddressHeaderCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
{
   
  ((void)0);
  ((void)0);
  
  if (NewState != DISABLE)
  {
     
    I2Cx->CR2 |= ((uint32_t)0x00001000);
  }
  else
  {
     
    I2Cx->CR2 &= (uint32_t)~((uint32_t)((uint32_t)0x00001000));
  }
}    







 
void I2C_AcknowledgeConfig(I2C_TypeDef* I2Cx, FunctionalState NewState)
{
   
  ((void)0);
  ((void)0);
  
  if (NewState != DISABLE)
  {
     
    I2Cx->CR2 &= (uint32_t)~((uint32_t)((uint32_t)0x00008000));    
  }
  else
  {
     
    I2Cx->CR2 |= ((uint32_t)0x00008000);
  }
}





 
uint8_t I2C_GetAddressMatched(I2C_TypeDef* I2Cx)
{
   
  ((void)0);
  
   
  return (uint8_t)(((uint32_t)I2Cx->ISR & ((uint32_t)0x00FE0000)) >> 16) ;
}





 
uint16_t I2C_GetTransferDirection(I2C_TypeDef* I2Cx)
{
  uint32_t tmpreg = 0;
  uint16_t direction = 0;
  
   
  ((void)0);
  
   
  tmpreg = (uint32_t)(I2Cx->ISR & ((uint32_t)0x00010000));
  
   
  if (tmpreg == 0)
  {
     
    direction = ((uint16_t)0x0000);
  }
  else
  {
     
    direction = ((uint16_t)0x0400);
  }  
  return direction;
}



















 
void I2C_TransferHandling(I2C_TypeDef* I2Cx, uint16_t Address, uint8_t Number_Bytes, uint32_t ReloadEndMode, uint32_t StartStopMode)
{
  uint32_t tmpreg = 0;
  
   
  ((void)0);
  ((void)0);  
  ((void)0);
  ((void)0);
    
   
  tmpreg = I2Cx->CR2;
  
   
  tmpreg &= (uint32_t)~((uint32_t)(((uint32_t)0x000003FF) | ((uint32_t)0x00FF0000) | ((uint32_t)0x01000000) | ((uint32_t)0x02000000) | ((uint32_t)0x00000400) | ((uint32_t)0x00002000) | ((uint32_t)0x00004000)));
  
   
  tmpreg |= (uint32_t)(((uint32_t)Address & ((uint32_t)0x000003FF)) | (((uint32_t)Number_Bytes << 16 ) & ((uint32_t)0x00FF0000)) |             (uint32_t)ReloadEndMode | (uint32_t)StartStopMode);

  
   
  I2Cx->CR2 = tmpreg;  
}



 







 
void I2C_SMBusAlertCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
{
   
  ((void)0);
  ((void)0);
  
  if (NewState != DISABLE)
  {
     
    I2Cx->CR1 |= ((uint32_t)0x00400000);   
  }
  else
  {
         
    I2Cx->CR1 &= (uint32_t)~((uint32_t)((uint32_t)0x00400000)); 
  }
}







 
void I2C_ClockTimeoutCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
{
   
  ((void)0);
  ((void)0);
  
  if (NewState != DISABLE)
  {
     
    I2Cx->TIMEOUTR |= ((uint32_t)0x00008000);   
  }
  else
  {
         
    I2Cx->TIMEOUTR &= (uint32_t)~((uint32_t)((uint32_t)0x00008000)); 
  }
}







 
void I2C_ExtendedClockTimeoutCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
{
   
  ((void)0);
  ((void)0);
  
  if (NewState != DISABLE)
  {
     
    I2Cx->TIMEOUTR |= ((uint32_t)0x80000000);   
  }
  else
  {
         
    I2Cx->TIMEOUTR &= (uint32_t)~((uint32_t)((uint32_t)0x80000000)); 
  }
}








 
void I2C_IdleClockTimeoutCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
{
   
  ((void)0);
  ((void)0);
  
  if (NewState != DISABLE)
  {
     
    I2Cx->TIMEOUTR |= ((uint32_t)0x00001000);   
  }
  else
  {
         
    I2Cx->TIMEOUTR &= (uint32_t)~((uint32_t)((uint32_t)0x00001000)); 
  }
}







 
void I2C_TimeoutAConfig(I2C_TypeDef* I2Cx, uint16_t Timeout)
{
  uint32_t tmpreg = 0;

   
  ((void)0);
  ((void)0);
    
   
  tmpreg = I2Cx->TIMEOUTR;

   
  tmpreg &= (uint32_t)~((uint32_t)((uint32_t)0x00000FFF));

   
  tmpreg |= (uint32_t)((uint32_t)Timeout & ((uint32_t)0x00000FFF)) ;

   
  I2Cx->TIMEOUTR = tmpreg;
}






 
void I2C_TimeoutBConfig(I2C_TypeDef* I2Cx, uint16_t Timeout)
{
  uint32_t tmpreg = 0;

   
  ((void)0);
  ((void)0);

   
  tmpreg = I2Cx->TIMEOUTR;

   
  tmpreg &= (uint32_t)~((uint32_t)((uint32_t)0x0FFF0000));

   
  tmpreg |= (uint32_t)(((uint32_t)Timeout << 16) & ((uint32_t)0x0FFF0000)) ;

   
  I2Cx->TIMEOUTR = tmpreg;
}







 
void I2C_CalculatePEC(I2C_TypeDef* I2Cx, FunctionalState NewState)
{
   
  ((void)0);
  ((void)0);
  
  if (NewState != DISABLE)
  {
     
    I2Cx->CR1 |= ((uint32_t)0x00800000);   
  }
  else
  {
         
    I2Cx->CR1 &= (uint32_t)~((uint32_t)((uint32_t)0x00800000)); 
  }
}







 
void I2C_PECRequestCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
{
   
  ((void)0);
  ((void)0);
  
  if (NewState != DISABLE)
  {
     
    I2Cx->CR2 |= ((uint32_t)0x04000000);   
  }
  else
  {
         
    I2Cx->CR2 &= (uint32_t)~((uint32_t)((uint32_t)0x04000000)); 
  }
}





 
uint8_t I2C_GetPEC(I2C_TypeDef* I2Cx)
{
   
  ((void)0);
  
   
  return (uint8_t)((uint32_t)I2Cx->PECR & ((uint32_t)0x000000FF));
}



   



  
















 
uint32_t I2C_ReadRegister(I2C_TypeDef* I2Cx, uint8_t I2C_Register)
{
  volatile uint32_t tmp = 0;

   
  ((void)0);
  ((void)0);

  tmp = (uint32_t)I2Cx;
  tmp += I2C_Register;

   
  return (*(volatile uint32_t *) tmp);
}



   
  





 
void I2C_SendData(I2C_TypeDef* I2Cx, uint8_t Data)
{
   
  ((void)0);
  
   
  I2Cx->TXDR = (uint8_t)Data;
}





 
uint8_t I2C_ReceiveData(I2C_TypeDef* I2Cx)
{
   
  ((void)0);
  
   
  return (uint8_t)I2Cx->RXDR;
}  



  
    










 
void I2C_DMACmd(I2C_TypeDef* I2Cx, uint32_t I2C_DMAReq, FunctionalState NewState)
{
   
  ((void)0);
  ((void)0);
  ((void)0);

  if (NewState != DISABLE)
  {
     
    I2Cx->CR1 |= I2C_DMAReq;
  }
  else
  {
     
    I2Cx->CR1 &= (uint32_t)~I2C_DMAReq;
  }
}


   





















 
FlagStatus I2C_GetFlagStatus(I2C_TypeDef* I2Cx, uint32_t I2C_FLAG)
{
  uint32_t tmpreg = 0;
  FlagStatus bitstatus = RESET;
  
   
  ((void)0);
  ((void)0);
  
   
  tmpreg = I2Cx->ISR;
  
   
  tmpreg &= I2C_FLAG;
  
  if(tmpreg != 0)
  {
     
    bitstatus = SET;
  }
  else
  {
     
    bitstatus = RESET;
  }
  return bitstatus;
} 
















 
void I2C_ClearFlag(I2C_TypeDef* I2Cx, uint32_t I2C_FLAG)
{ 
   
  ((void)0);
  ((void)0);

   
  I2Cx->ICR = I2C_FLAG;
}




















 
ITStatus I2C_GetITStatus(I2C_TypeDef* I2Cx, uint32_t I2C_IT)
{
  uint32_t tmpreg = 0;
  ITStatus bitstatus = RESET;
  uint32_t enablestatus = 0;

   
  ((void)0);
  ((void)0);

   
   
  if ((uint32_t)(I2C_IT & ((uint32_t)0x00003F00)))
  {
    enablestatus = (uint32_t)((((uint32_t)0x00000080)) & (I2Cx->CR1));
  }
   
  else if ((uint32_t)(I2C_IT & ((uint32_t)0x000000C0)))
  {
    enablestatus = (uint32_t)((((uint32_t)0x00000040)) & (I2Cx->CR1));
  }
  else
  {
    enablestatus = (uint32_t)((I2C_IT) & (I2Cx->CR1));
  }
  
   
  tmpreg = I2Cx->ISR;

   
  tmpreg &= I2C_IT;

   
  if((tmpreg != RESET) && enablestatus)
  {
     
    bitstatus = SET;
  }
  else
  {
     
    bitstatus = RESET;
  }

   
  return bitstatus;
}
















 
void I2C_ClearITPendingBit(I2C_TypeDef* I2Cx, uint32_t I2C_IT)
{
   
  ((void)0);
  ((void)0);

   
  I2Cx->ICR = I2C_IT;
}


int i2c_readdata(I2C_TypeDef * i2c,uint8_t slave_addr,uint8_t addr, uint8_t *pBuffer, uint32_t bufferSize)
{
	  I2C_GenerateSTART(((I2C_TypeDef *) (((uint32_t)0x40000000) + 0x00005400)),ENABLE);
  
    
	I2C_MasterRequestConfig(((I2C_TypeDef *) (((uint32_t)0x40000000) + 0x00005400)),((uint16_t)0x0000));
	I2C_SlaveAddressConfig(((I2C_TypeDef *) (((uint32_t)0x40000000) + 0x00005400)),slave_addr); 
 
    
    I2C_SendData(((I2C_TypeDef *) (((uint32_t)0x40000000) + 0x00005400)),addr);

    
    I2C_GenerateSTART(((I2C_TypeDef *) (((uint32_t)0x40000000) + 0x00005400)),ENABLE);
	    
	I2C_MasterRequestConfig(((I2C_TypeDef *) (((uint32_t)0x40000000) + 0x00005400)),((uint16_t)0x0400));
	I2C_SlaveAddressConfig(((I2C_TypeDef *) (((uint32_t)0x40000000) + 0x00005400)),slave_addr); 
	
    while(bufferSize)
    {
        bufferSize--;
        if(bufferSize == 0)
        {
        	
            I2C_AcknowledgeConfig(((I2C_TypeDef *) (((uint32_t)0x40000000) + 0x00005400)), DISABLE);
        }
        
       
        *pBuffer = I2C_ReceiveData(((I2C_TypeDef *) (((uint32_t)0x40000000) + 0x00005400)));
        pBuffer++;
    }
	
    I2C_GenerateSTOP(((I2C_TypeDef *) (((uint32_t)0x40000000) + 0x00005400)),ENABLE);
    
    I2C_AcknowledgeConfig(((I2C_TypeDef *) (((uint32_t)0x40000000) + 0x00005400)), ENABLE);
		
	  return 0;
}
int i2c_senddata(I2C_TypeDef * i2c,uint8_t slave_addr,uint8_t addr, uint8_t *pBuffer, uint32_t bufferSize)
{
	I2C_GenerateSTART(((I2C_TypeDef *) (((uint32_t)0x40000000) + 0x00005400)),ENABLE);
  
    
	I2C_MasterRequestConfig(((I2C_TypeDef *) (((uint32_t)0x40000000) + 0x00005400)),((uint16_t)0x0000));
	I2C_SlaveAddressConfig(((I2C_TypeDef *) (((uint32_t)0x40000000) + 0x00005400)),slave_addr); 
 
    
    I2C_SendData(((I2C_TypeDef *) (((uint32_t)0x40000000) + 0x00005400)),addr);

    
    while(bufferSize--)
    {
        I2C_SendData(((I2C_TypeDef *) (((uint32_t)0x40000000) + 0x00005400)),*pBuffer);
        pBuffer++;
       
    }
    
    I2C_GenerateSTOP(((I2C_TypeDef *) (((uint32_t)0x40000000) + 0x00005400)),ENABLE);
		return 0;
}



   
  


 



 



 

 
