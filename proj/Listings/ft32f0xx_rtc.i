# 1 "..\\FTLib\\Src\\ft32f0xx_rtc.c"





















 


 
# 1 "..\\FTLib\\Inc\\ft32f0xx_rtc.h"









 


 







 
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






 





 




 






















 



 
  



 
# 23 "..\\FTLib\\Inc\\ft32f0xx_rtc.h"





  

 



  
typedef struct
{
  uint32_t RTC_HourFormat;   
 
  
  uint32_t RTC_AsynchPrediv; 
 
  
  uint32_t RTC_SynchPrediv;  
 
}RTC_InitTypeDef;



 
typedef struct
{
  uint8_t RTC_Hours;    


 

  uint8_t RTC_Minutes;  
 
  
  uint8_t RTC_Seconds;  
 

  uint8_t RTC_H12;      
 
}RTC_TimeTypeDef; 



 
typedef struct
{
  uint8_t RTC_WeekDay; 
 
  
  uint8_t RTC_Month;   
 

  uint8_t RTC_Date;     
 
  
  uint8_t RTC_Year;     
 
}RTC_DateTypeDef;



 
typedef struct
{
  RTC_TimeTypeDef RTC_AlarmTime;      

  uint32_t RTC_AlarmMask;            
 

  uint32_t RTC_AlarmDateWeekDaySel;  
 
  
  uint8_t RTC_AlarmDateWeekDay;      



 
}RTC_AlarmTypeDef;

 



  




  






  



  

 


  




  




  



  







  



  






  



  




  



  
# 191 "..\\FTLib\\Inc\\ft32f0xx_rtc.h"



  



  
  
# 214 "..\\FTLib\\Inc\\ft32f0xx_rtc.h"


  




  
# 230 "..\\FTLib\\Inc\\ft32f0xx_rtc.h"



  




  








  




  
# 260 "..\\FTLib\\Inc\\ft32f0xx_rtc.h"



  



  






  



  
# 328 "..\\FTLib\\Inc\\ft32f0xx_rtc.h"


  



  
  




  



  



  






  



  



 






  



  






  




  






  



  
# 407 "..\\FTLib\\Inc\\ft32f0xx_rtc.h"
                                          


  



  
# 422 "..\\FTLib\\Inc\\ft32f0xx_rtc.h"



  



  




  



  











  



  
# 463 "..\\FTLib\\Inc\\ft32f0xx_rtc.h"



  



  


# 483 "..\\FTLib\\Inc\\ft32f0xx_rtc.h"


  



  
# 514 "..\\FTLib\\Inc\\ft32f0xx_rtc.h"
                                           


 

  

  
# 530 "..\\FTLib\\Inc\\ft32f0xx_rtc.h"







 



  
# 549 "..\\FTLib\\Inc\\ft32f0xx_rtc.h"



 



  







  



  






  



  




  



  



  






  



  
# 618 "..\\FTLib\\Inc\\ft32f0xx_rtc.h"

# 627 "..\\FTLib\\Inc\\ft32f0xx_rtc.h"



  



  
# 642 "..\\FTLib\\Inc\\ft32f0xx_rtc.h"










  



  


 
 
 
ErrorStatus RTC_DeInit(void);


 
ErrorStatus RTC_Init(RTC_InitTypeDef* RTC_InitStruct);
void RTC_StructInit(RTC_InitTypeDef* RTC_InitStruct);
void RTC_WriteProtectionCmd(FunctionalState NewState);
ErrorStatus RTC_EnterInitMode(void);
void RTC_ExitInitMode(void);
ErrorStatus RTC_WaitForSynchro(void);
ErrorStatus RTC_RefClockCmd(FunctionalState NewState);
void RTC_BypassShadowCmd(FunctionalState NewState);

 
ErrorStatus RTC_SetTime(uint32_t RTC_Format, RTC_TimeTypeDef* RTC_TimeStruct);
void RTC_TimeStructInit(RTC_TimeTypeDef* RTC_TimeStruct);
void RTC_GetTime(uint32_t RTC_Format, RTC_TimeTypeDef* RTC_TimeStruct);
uint32_t RTC_GetSubSecond(void);
ErrorStatus RTC_SetDate(uint32_t RTC_Format, RTC_DateTypeDef* RTC_DateStruct);
void RTC_DateStructInit(RTC_DateTypeDef* RTC_DateStruct);
void RTC_GetDate(uint32_t RTC_Format, RTC_DateTypeDef* RTC_DateStruct);

 
void RTC_SetAlarm(uint32_t RTC_Format, uint32_t RTC_Alarm, RTC_AlarmTypeDef* RTC_AlarmStruct);
void RTC_AlarmStructInit(RTC_AlarmTypeDef* RTC_AlarmStruct);
void RTC_GetAlarm(uint32_t RTC_Format, uint32_t RTC_Alarm, RTC_AlarmTypeDef* RTC_AlarmStruct);
ErrorStatus RTC_AlarmCmd(uint32_t RTC_Alarm, FunctionalState NewState);
void RTC_AlarmSubSecondConfig(uint32_t RTC_Alarm, uint32_t RTC_AlarmSubSecondValue, uint8_t RTC_AlarmSubSecondMask);
uint32_t RTC_GetAlarmSubSecond(uint32_t RTC_Alarm);

 
void RTC_DayLightSavingConfig(uint32_t RTC_DayLightSaving, uint32_t RTC_StoreOperation);
uint32_t RTC_GetStoreOperation(void);

 
void RTC_OutputConfig(uint32_t RTC_Output, uint32_t RTC_OutputPolarity);

 
void RTC_CalibOutputCmd(FunctionalState NewState);
void RTC_CalibOutputConfig(uint32_t RTC_CalibOutput);
ErrorStatus RTC_SmoothCalibConfig(uint32_t RTC_SmoothCalibPeriod, 
                                  uint32_t RTC_SmoothCalibPlusPulses,
                                  uint32_t RTC_SmouthCalibMinusPulsesValue);

 
void RTC_TimeStampCmd(uint32_t RTC_TimeStampEdge, FunctionalState NewState);
void RTC_GetTimeStamp(uint32_t RTC_Format, RTC_TimeTypeDef* RTC_StampTimeStruct, RTC_DateTypeDef* RTC_StampDateStruct);
uint32_t RTC_GetTimeStampSubSecond(void);

 
void RTC_TamperTriggerConfig(uint32_t RTC_Tamper, uint32_t RTC_TamperTrigger);
void RTC_TamperCmd(uint32_t RTC_Tamper, FunctionalState NewState);
void RTC_TamperFilterConfig(uint32_t RTC_TamperFilter);
void RTC_TamperSamplingFreqConfig(uint32_t RTC_TamperSamplingFreq);
void RTC_TamperPinsPrechargeDuration(uint32_t RTC_TamperPrechargeDuration);
void RTC_TimeStampOnTamperDetectionCmd(FunctionalState NewState);
void RTC_TamperPullUpCmd(FunctionalState NewState);

 
void RTC_OutputTypeConfig(uint32_t RTC_OutputType);
 
 
ErrorStatus RTC_SynchroShiftConfig(uint32_t RTC_ShiftAdd1S, uint32_t RTC_ShiftSubFS);

 
void RTC_ITConfig(uint32_t RTC_IT, FunctionalState NewState);
FlagStatus RTC_GetFlagStatus(uint32_t RTC_FLAG);
void RTC_ClearFlag(uint32_t RTC_FLAG);
ITStatus RTC_GetITStatus(uint32_t RTC_IT);
void RTC_ClearITPendingBit(uint32_t RTC_IT);









  



  

 
# 27 "..\\FTLib\\Src\\ft32f0xx_rtc.c"


 
# 38 "..\\FTLib\\Src\\ft32f0xx_rtc.c"







static uint8_t RTC_ByteToBcd2(uint8_t Value);
static uint8_t RTC_Bcd2ToByte(uint8_t Value);









 
ErrorStatus RTC_DeInit(void)
{
  ErrorStatus status = ERROR;
  
   
  ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->WPR = 0xCA;
  ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->WPR = 0x53;

   
  if (RTC_EnterInitMode() == ERROR)
  {
    status = ERROR;
  }  
  else
  {
     
    ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->TR        = (uint32_t)0x00000000;
    ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->DR        = (uint32_t)0x00002101;
    ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->CR        &= (uint32_t)0x00000000;
    ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->PRER      = (uint32_t)0x007F00FF;
    ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->ALRMAR    = (uint32_t)0x00000000;
    ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->SHIFTR    = (uint32_t)0x00000000;
    ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->CALR       = (uint32_t)0x00000000;
    ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->ALRMASSR  = (uint32_t)0x00000000;

     
    ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->ISR = (uint32_t)0x00000000;
    
     
    ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->TAFCR = 0x00000000;
      
     
    if (RTC_WaitForSynchro() == ERROR)
    {
      status = ERROR;
    }
    else
    {
      status = SUCCESS;
    }

  }

   
  ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->WPR = 0xFF;  

  return status;
}











 
ErrorStatus RTC_Init(RTC_InitTypeDef* RTC_InitStruct)
{
  ErrorStatus status = ERROR;

   
  ((void)0);
  ((void)0);
  ((void)0);

   
  ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->WPR = 0xCA;
  ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->WPR = 0x53;

   
  if (RTC_EnterInitMode() == ERROR)
  {
    status = ERROR;
  }
  else
  {
     
    ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->CR &= ((uint32_t)~(((uint32_t)0x00000040)));
     
    ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->CR |=  ((uint32_t)(RTC_InitStruct->RTC_HourFormat));
  
     
    ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->PRER = (uint32_t)(RTC_InitStruct->RTC_SynchPrediv);
    ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->PRER |= (uint32_t)(RTC_InitStruct->RTC_AsynchPrediv << 16);

     
    RTC_ExitInitMode();

    status = SUCCESS;
  }
   
  ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->WPR = 0xFF;

  return status;
}






 
void RTC_StructInit(RTC_InitTypeDef* RTC_InitStruct)
{
   
  RTC_InitStruct->RTC_HourFormat = ((uint32_t)0x00000000);

   
  RTC_InitStruct->RTC_AsynchPrediv = (uint32_t)0x7F;

   
  RTC_InitStruct->RTC_SynchPrediv = (uint32_t)0xFF; 
}










 
void RTC_WriteProtectionCmd(FunctionalState NewState)
{
   
  ((void)0);

  if (NewState != DISABLE)
  {
     
    ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->WPR = 0xFF;
  }
  else
  {
     
    ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->WPR = 0xCA;
    ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->WPR = 0x53;
  }
}









 
ErrorStatus RTC_EnterInitMode(void)
{
  volatile uint32_t initcounter = 0x00;
  ErrorStatus status = ERROR;
  uint32_t initstatus = 0x00;

   
  if ((((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->ISR & ((uint32_t)0x00000040)) == (uint32_t)RESET)
  {
     
    ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->ISR = (uint32_t)((uint32_t)0xFFFFFFFF);
    
     
    do
    {
      initstatus = ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->ISR & ((uint32_t)0x00000040);
      initcounter++;  
    } while((initcounter != ((uint32_t) 0x00004000)) && (initstatus == 0x00));
    
    if ((((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->ISR & ((uint32_t)0x00000040)) != RESET)
    {
      status = SUCCESS;
    }
    else
    {
      status = ERROR;
    }
  }
  else
  {
    status = SUCCESS;
  }

  return (status);
}









 
void RTC_ExitInitMode(void)
{
   
  ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->ISR &= (uint32_t)~((uint32_t)0x00000080);
	
	 
	while((((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->ISR & ((uint32_t)0x00000040)) != RESET)
	{
		;
	}
}
















 
ErrorStatus RTC_WaitForSynchro(void)
{
  volatile uint32_t synchrocounter = 0;
  ErrorStatus status = ERROR;
  uint32_t synchrostatus = 0x00;

  if ((((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->CR & ((uint32_t)0x00000020)) != RESET)
  {
     
    status = SUCCESS;
  }
  else
  {
     
    ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->WPR = 0xCA;
    ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->WPR = 0x53;

     
    ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->ISR &= (uint32_t)((uint32_t)0xFFFFFF5F);

     
    do
    {
      synchrostatus = ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->ISR & ((uint32_t)0x00000020);
      synchrocounter++;  
    } while((synchrocounter != ((uint32_t) 0x00008000)) && (synchrostatus == 0x00));

    if ((((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->ISR & ((uint32_t)0x00000020)) != RESET)
    {
      status = SUCCESS;
    }
    else
    {
      status = ERROR;
    }

     
    ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->WPR = 0xFF;
  }

  return (status);
}








 
ErrorStatus RTC_RefClockCmd(FunctionalState NewState)
{
  ErrorStatus status = ERROR;

   
  ((void)0);

   
  ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->WPR = 0xCA;
  ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->WPR = 0x53;

   
  if (RTC_EnterInitMode() == ERROR)
  {
    status = ERROR;
  }
  else
  {
    if (NewState != DISABLE)
    {
       
      ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->CR |= ((uint32_t)0x00000010);
    }
    else
    {
       
      ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->CR &= ~((uint32_t)0x00000010);
    }
     
    RTC_ExitInitMode();

    status = SUCCESS;
  }

   
  ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->WPR = 0xFF;

  return status;
}








 
void RTC_BypassShadowCmd(FunctionalState NewState)
{
   
  ((void)0);

   
  ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->WPR = 0xCA;
  ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->WPR = 0x53;
  
  if (NewState != DISABLE)
  {
     
    ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->CR |= (uint8_t)((uint32_t)0x00000020);
  }
  else
  {
     
    ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->CR &= (uint8_t)~((uint32_t)0x00000020);
  }

   
  ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->WPR = 0xFF;
}



 












 
ErrorStatus RTC_SetTime(uint32_t RTC_Format, RTC_TimeTypeDef* RTC_TimeStruct)
{
  uint32_t tmpreg = 0;
  ErrorStatus status = ERROR;

   
  ((void)0);
  
  if (RTC_Format == ((uint32_t)0x000000000))
  {
    if ((((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->CR & ((uint32_t)0x00000040)) != (uint32_t)RESET)
    {
      ((void)0);
      ((void)0);
    }
    else
    {
      RTC_TimeStruct->RTC_H12 = 0x00;
      ((void)0);
    }
    ((void)0);
    ((void)0);
  }
  else
  {
    if ((((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->CR & ((uint32_t)0x00000040)) != (uint32_t)RESET)
    {
      tmpreg = RTC_Bcd2ToByte(RTC_TimeStruct->RTC_Hours);
      ((void)0);
      ((void)0); 
    } 
    else
    {
      RTC_TimeStruct->RTC_H12 = 0x00;
      ((void)0);
    }
    ((void)0);
    ((void)0);
  }
  
   
  if (RTC_Format != ((uint32_t)0x000000000))
  {
    tmpreg = (((uint32_t)(RTC_TimeStruct->RTC_Hours) << 16) |              ((uint32_t)(RTC_TimeStruct->RTC_Minutes) << 8) |              ((uint32_t)RTC_TimeStruct->RTC_Seconds) |              ((uint32_t)(RTC_TimeStruct->RTC_H12) << 16)); 



  }
  else
  {
    tmpreg = (uint32_t)(((uint32_t)RTC_ByteToBcd2(RTC_TimeStruct->RTC_Hours) << 16) |                    ((uint32_t)RTC_ByteToBcd2(RTC_TimeStruct->RTC_Minutes) << 8) |                    ((uint32_t)RTC_ByteToBcd2(RTC_TimeStruct->RTC_Seconds)) |                    (((uint32_t)RTC_TimeStruct->RTC_H12) << 16));



  } 

   
  ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->WPR = 0xCA;
  ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->WPR = 0x53;

   
  if (RTC_EnterInitMode() == ERROR)
  {
    status = ERROR;
  } 
  else
  {
     
    ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->TR = (uint32_t)(tmpreg & ((uint32_t)0x007F7F7F));

     
    RTC_ExitInitMode(); 
	
     
    if ((((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->CR & ((uint32_t)0x00000020)) == RESET)
    {
      if (RTC_WaitForSynchro() == ERROR)
      {
        status = ERROR;
      }
      else
      {
        status = SUCCESS;
      }
    }
    else
    {
      status = SUCCESS;
    }
  
  }
   
  ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->WPR = 0xFF;
    
  return status;
}







 
void RTC_TimeStructInit(RTC_TimeTypeDef* RTC_TimeStruct)
{
   
  RTC_TimeStruct->RTC_H12 = ((uint8_t)0x00);
  RTC_TimeStruct->RTC_Hours = 0;
  RTC_TimeStruct->RTC_Minutes = 0;
  RTC_TimeStruct->RTC_Seconds = 0; 
}










 
void RTC_GetTime(uint32_t RTC_Format, RTC_TimeTypeDef* RTC_TimeStruct)
{
  uint32_t tmpreg = 0;

   
  ((void)0);

   
  tmpreg = (uint32_t)(((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->TR & ((uint32_t)0x007F7F7F)); 
  
   
  RTC_TimeStruct->RTC_Hours = (uint8_t)((tmpreg & (((uint32_t)0x00300000) | ((uint32_t)0x000F0000))) >> 16);
  RTC_TimeStruct->RTC_Minutes = (uint8_t)((tmpreg & (((uint32_t)0x00007000) | ((uint32_t)0x00000F00))) >>8);
  RTC_TimeStruct->RTC_Seconds = (uint8_t)(tmpreg & (((uint32_t)0x00000070) | ((uint32_t)0x0000000F)));
  RTC_TimeStruct->RTC_H12 = (uint8_t)((tmpreg & (((uint32_t)0x00400000))) >> 16);  

   
  if (RTC_Format == ((uint32_t)0x000000000))
  {
     
    RTC_TimeStruct->RTC_Hours = (uint8_t)RTC_Bcd2ToByte(RTC_TimeStruct->RTC_Hours);
    RTC_TimeStruct->RTC_Minutes = (uint8_t)RTC_Bcd2ToByte(RTC_TimeStruct->RTC_Minutes);
    RTC_TimeStruct->RTC_Seconds = (uint8_t)RTC_Bcd2ToByte(RTC_TimeStruct->RTC_Seconds);
  }
}







 
uint32_t RTC_GetSubSecond(void)
{
  uint32_t tmpreg = 0;
  
   
  tmpreg = (uint32_t)(((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->SSR);
  
   
  (void) (((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->DR);
  
  return (tmpreg);
}












 
ErrorStatus RTC_SetDate(uint32_t RTC_Format, RTC_DateTypeDef* RTC_DateStruct)
{
  uint32_t tmpreg = 0;
  ErrorStatus status = ERROR;
  
   
  ((void)0);

  if ((RTC_Format == ((uint32_t)0x000000000)) && ((RTC_DateStruct->RTC_Month & 0x10) == 0x10))
  {
    RTC_DateStruct->RTC_Month = (RTC_DateStruct->RTC_Month & (uint32_t)~(0x10)) + 0x0A;
  }  
  if (RTC_Format == ((uint32_t)0x000000000))
  {
    ((void)0);
    ((void)0);
    ((void)0);
  }
  else
  {
    ((void)0);
    tmpreg = RTC_Bcd2ToByte(RTC_DateStruct->RTC_Month);
    ((void)0);
    tmpreg = RTC_Bcd2ToByte(RTC_DateStruct->RTC_Date);
    ((void)0);
  }
  ((void)0);

   
  if (RTC_Format != ((uint32_t)0x000000000))
  {
    tmpreg = ((((uint32_t)RTC_DateStruct->RTC_Year) << 16) |               (((uint32_t)RTC_DateStruct->RTC_Month) << 8) |               ((uint32_t)RTC_DateStruct->RTC_Date) |               (((uint32_t)RTC_DateStruct->RTC_WeekDay) << 13)); 



  }  
  else
  {
    tmpreg = (((uint32_t)RTC_ByteToBcd2(RTC_DateStruct->RTC_Year) << 16) |               ((uint32_t)RTC_ByteToBcd2(RTC_DateStruct->RTC_Month) << 8) |               ((uint32_t)RTC_ByteToBcd2(RTC_DateStruct->RTC_Date)) |               ((uint32_t)RTC_DateStruct->RTC_WeekDay << 13));



  }

   
  ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->WPR = 0xCA;
  ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->WPR = 0x53;

   
  if (RTC_EnterInitMode() == ERROR)
  {
    status = ERROR;
  } 
  else
  {
     
    ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->DR = (uint32_t)(tmpreg & ((uint32_t)0x00FFFF3F));

     
    RTC_ExitInitMode(); 

     
    if ((((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->CR & ((uint32_t)0x00000020)) == RESET)
    {
      if (RTC_WaitForSynchro() == ERROR)
      {
        status = ERROR;
      }
      else
      {
        status = SUCCESS;
      }
    }
    else
    {
      status = SUCCESS;
    }
  }
   
  ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->WPR = 0xFF;
  
  return status;
}







 
void RTC_DateStructInit(RTC_DateTypeDef* RTC_DateStruct)
{
   
  RTC_DateStruct->RTC_WeekDay = ((uint8_t)0x01);
  RTC_DateStruct->RTC_Date = 1;
  RTC_DateStruct->RTC_Month = ((uint8_t)0x01);
  RTC_DateStruct->RTC_Year = 0;
}










 
void RTC_GetDate(uint32_t RTC_Format, RTC_DateTypeDef* RTC_DateStruct)
{
  uint32_t tmpreg = 0;

   
  ((void)0);
  
   
  tmpreg = (uint32_t)(((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->DR & ((uint32_t)0x00FFFF3F)); 

   
  RTC_DateStruct->RTC_Year = (uint8_t)((tmpreg & (((uint32_t)0x00F00000) | ((uint32_t)0x000F0000))) >> 16);
  RTC_DateStruct->RTC_Month = (uint8_t)((tmpreg & (((uint32_t)0x00001000) | ((uint32_t)0x00000F00))) >> 8);
  RTC_DateStruct->RTC_Date = (uint8_t)(tmpreg & (((uint32_t)0x00000030) | ((uint32_t)0x0000000F)));
  RTC_DateStruct->RTC_WeekDay = (uint8_t)((tmpreg & (((uint32_t)0x0000E000))) >> 13);  

   
  if (RTC_Format == ((uint32_t)0x000000000))
  {
     
    RTC_DateStruct->RTC_Year = (uint8_t)RTC_Bcd2ToByte(RTC_DateStruct->RTC_Year);
    RTC_DateStruct->RTC_Month = (uint8_t)RTC_Bcd2ToByte(RTC_DateStruct->RTC_Month);
    RTC_DateStruct->RTC_Date = (uint8_t)RTC_Bcd2ToByte(RTC_DateStruct->RTC_Date);
    RTC_DateStruct->RTC_WeekDay = (uint8_t)(RTC_DateStruct->RTC_WeekDay);   
  }
}



 














 
void RTC_SetAlarm(uint32_t RTC_Format, uint32_t RTC_Alarm, RTC_AlarmTypeDef* RTC_AlarmStruct)
{
  uint32_t tmpreg = 0;
  
   
  ((void)0);
  ((void)0);
  ((void)0);
  ((void)0);

  if (RTC_Format == ((uint32_t)0x000000000))
  {
    if ((((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->CR & ((uint32_t)0x00000040)) != (uint32_t)RESET)
    {
      ((void)0);
      ((void)0);
    } 
    else
    {
      RTC_AlarmStruct->RTC_AlarmTime.RTC_H12 = 0x00;
      ((void)0);
    }
    ((void)0);
    ((void)0);
    
    if(RTC_AlarmStruct->RTC_AlarmDateWeekDaySel == ((uint32_t)0x00000000))
    {
      ((void)0);
    }
    else
    {
      ((void)0);
    }
  }
  else
  {
    if ((((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->CR & ((uint32_t)0x00000040)) != (uint32_t)RESET)
    {
      tmpreg = RTC_Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours);
      ((void)0);
      ((void)0);
    } 
    else
    {
      RTC_AlarmStruct->RTC_AlarmTime.RTC_H12 = 0x00;
      ((void)0);
    }
    
    ((void)0);
    ((void)0);
    
    if(RTC_AlarmStruct->RTC_AlarmDateWeekDaySel == ((uint32_t)0x00000000))
    {
      tmpreg = RTC_Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmDateWeekDay);
      ((void)0);    
    }
    else
    {
      tmpreg = RTC_Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmDateWeekDay);
      ((void)0);      
    }    
  }

   
  if (RTC_Format != ((uint32_t)0x000000000))
  {
    tmpreg = (((uint32_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours) << 16) |               ((uint32_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes) << 8) |               ((uint32_t)RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds) |               ((uint32_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_H12) << 16) |               ((uint32_t)(RTC_AlarmStruct->RTC_AlarmDateWeekDay) << 24) |               ((uint32_t)RTC_AlarmStruct->RTC_AlarmDateWeekDaySel) |               ((uint32_t)RTC_AlarmStruct->RTC_AlarmMask)); 
# 833 "..\\FTLib\\Src\\ft32f0xx_rtc.c"
  }  
  else
  {
    tmpreg = (((uint32_t)RTC_ByteToBcd2(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours) << 16) |               ((uint32_t)RTC_ByteToBcd2(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes) << 8) |               ((uint32_t)RTC_ByteToBcd2(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds)) |               ((uint32_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_H12) << 16) |               ((uint32_t)RTC_ByteToBcd2(RTC_AlarmStruct->RTC_AlarmDateWeekDay) << 24) |               ((uint32_t)RTC_AlarmStruct->RTC_AlarmDateWeekDaySel) |               ((uint32_t)RTC_AlarmStruct->RTC_AlarmMask)); 
# 843 "..\\FTLib\\Src\\ft32f0xx_rtc.c"
  }

   
  ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->WPR = 0xCA;
  ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->WPR = 0x53;

   
  ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->ALRMAR = (uint32_t)tmpreg;

   
  ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->WPR = 0xFF;
}








 
void RTC_AlarmStructInit(RTC_AlarmTypeDef* RTC_AlarmStruct)
{
   
  RTC_AlarmStruct->RTC_AlarmTime.RTC_H12 = ((uint8_t)0x00);
  RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours = 0;
  RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes = 0;
  RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds = 0;

   
  RTC_AlarmStruct->RTC_AlarmDateWeekDaySel = ((uint32_t)0x00000000);
  RTC_AlarmStruct->RTC_AlarmDateWeekDay = 1;

   
  RTC_AlarmStruct->RTC_AlarmMask = ((uint32_t)0x00000000);
}













 
void RTC_GetAlarm(uint32_t RTC_Format, uint32_t RTC_Alarm, RTC_AlarmTypeDef* RTC_AlarmStruct)
{
  uint32_t tmpreg = 0;

   
  ((void)0);
  ((void)0); 

   
  tmpreg = (uint32_t)(((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->ALRMAR);

   
  RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours = (uint32_t)((tmpreg & (((uint32_t)0x00300000) |                                                      ((uint32_t)0x000F0000))) >> 16);

  RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes = (uint32_t)((tmpreg & (((uint32_t)0x00007000) |                                                      ((uint32_t)0x00000F00))) >> 8);

  RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds = (uint32_t)(tmpreg & (((uint32_t)0x00000070) |                                                      ((uint32_t)0x0000000F)));

  RTC_AlarmStruct->RTC_AlarmTime.RTC_H12 = (uint32_t)((tmpreg & ((uint32_t)0x00400000)) >> 16);
  RTC_AlarmStruct->RTC_AlarmDateWeekDay = (uint32_t)((tmpreg & (((uint32_t)0x30000000) | ((uint32_t)0x0F000000))) >> 24);
  RTC_AlarmStruct->RTC_AlarmDateWeekDaySel = (uint32_t)(tmpreg & ((uint32_t)0x40000000));
  RTC_AlarmStruct->RTC_AlarmMask = (uint32_t)(tmpreg & ((uint32_t)0x80808080));

  if (RTC_Format == ((uint32_t)0x000000000))
  {
    RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours = RTC_Bcd2ToByte(RTC_AlarmStruct->                                                         RTC_AlarmTime.RTC_Hours);

    RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes = RTC_Bcd2ToByte(RTC_AlarmStruct->                                                         RTC_AlarmTime.RTC_Minutes);

    RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds = RTC_Bcd2ToByte(RTC_AlarmStruct->                                                         RTC_AlarmTime.RTC_Seconds);

    RTC_AlarmStruct->RTC_AlarmDateWeekDay = RTC_Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmDateWeekDay);
  }  
}











 
ErrorStatus RTC_AlarmCmd(uint32_t RTC_Alarm, FunctionalState NewState)
{
  volatile uint32_t alarmcounter = 0x00;
  uint32_t alarmstatus = 0x00;
  ErrorStatus status = ERROR;
    
   
  ((void)0);
  ((void)0);

   
  ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->WPR = 0xCA;
  ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->WPR = 0x53;

   
  if (NewState != DISABLE)
  {
    ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->CR |= (uint32_t)RTC_Alarm;

    status = SUCCESS;    
  }
  else
  { 
     
    ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->CR &= (uint32_t)~RTC_Alarm;
   
     
    do
    {
      alarmstatus = ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->ISR & (RTC_Alarm >> 8);
      alarmcounter++;  
    } while((alarmcounter != ((uint32_t) 0x00004000)) && (alarmstatus == 0x00));
    
    if ((((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->ISR & (RTC_Alarm >> 8)) == RESET)
    {
      status = ERROR;
    } 
    else
    {
      status = SUCCESS;
    }        
  } 

   
  ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->WPR = 0xFF;
  
  return status;
}











































 
void RTC_AlarmSubSecondConfig(uint32_t RTC_Alarm, uint32_t RTC_AlarmSubSecondValue, uint8_t RTC_AlarmSubSecondMask)
{
  uint32_t tmpreg = 0;

   
  ((void)0);
  ((void)0);
  ((void)0);
  
   
  ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->WPR = 0xCA;
  ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->WPR = 0x53;
  
   
  tmpreg = (uint32_t) (((uint32_t)(RTC_AlarmSubSecondValue)) | ((uint32_t)(RTC_AlarmSubSecondMask) << 24));
  
   
  ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->ALRMASSR = tmpreg;

   
  ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->WPR = 0xFF;

}








 
uint32_t RTC_GetAlarmSubSecond(uint32_t RTC_Alarm)
{
  uint32_t tmpreg = 0;
  
   
  tmpreg = (uint32_t)((((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->ALRMASSR) & ((uint32_t)0x00007FFF));

  return (tmpreg);
}



 













 
void RTC_DayLightSavingConfig(uint32_t RTC_DayLightSaving, uint32_t RTC_StoreOperation)
{
   
  ((void)0);
  ((void)0);

   
  ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->WPR = 0xCA;
  ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->WPR = 0x53;

   
  ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->CR &= (uint32_t)~(((uint32_t)0x00040000));

   
  ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->CR |= (uint32_t)(RTC_DayLightSaving | RTC_StoreOperation);

   
  ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->WPR = 0xFF;
}







 
uint32_t RTC_GetStoreOperation(void)
{
  return (((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->CR & ((uint32_t)0x00040000));
}



 















 
void RTC_OutputConfig(uint32_t RTC_Output, uint32_t RTC_OutputPolarity)
{
   
  ((void)0);
  ((void)0);

   
  ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->WPR = 0xCA;
  ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->WPR = 0x53;

   
  ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->CR &= (uint32_t)~(((uint32_t)0x00200000) | ((uint32_t)0x00100000));

   
  ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->CR |= (uint32_t)(RTC_Output | RTC_OutputPolarity);

   
  ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->WPR = 0xFF;
}



 






 
void RTC_CalibOutputCmd(FunctionalState NewState)
{
   
  ((void)0);
  
   
  ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->WPR = 0xCA;
  ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->WPR = 0x53;
  
  if (NewState != DISABLE)
  {
     
    ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->CR |= (uint32_t)((uint32_t)0x00800000);
  }
  else
  { 
     
    ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->CR &= (uint32_t)~((uint32_t)0x00800000);
  }
  
   
  ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->WPR = 0xFF; 
}








 
void RTC_CalibOutputConfig(uint32_t RTC_CalibOutput)
{
   
  ((void)0);

   
  ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->WPR = 0xCA;
  ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->WPR = 0x53;
  
   
  ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->CR &= (uint32_t)~(((uint32_t)0x00080000));

   
  ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->CR |= (uint32_t)RTC_CalibOutput;

   
  ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->WPR = 0xFF;
}

















 
ErrorStatus RTC_SmoothCalibConfig(uint32_t RTC_SmoothCalibPeriod,
                                  uint32_t RTC_SmoothCalibPlusPulses,
                                  uint32_t RTC_SmouthCalibMinusPulsesValue)
{
  ErrorStatus status = ERROR;
  uint32_t recalpfcount = 0;

   
  ((void)0);
  ((void)0);
  ((void)0);

   
  ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->WPR = 0xCA;
  ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->WPR = 0x53;
  
   
  if ((((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->ISR & ((uint32_t)0x00010000)) != RESET)
  {
     
    while (((((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->ISR & ((uint32_t)0x00010000)) != RESET) && (recalpfcount != ((uint32_t) 0x00001000)))
    {
      recalpfcount++;
    }
  }

   
  if ((((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->ISR & ((uint32_t)0x00010000)) == RESET)
  {
     
    ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->CALR = (uint32_t)((uint32_t)RTC_SmoothCalibPeriod | (uint32_t)RTC_SmoothCalibPlusPulses | (uint32_t)RTC_SmouthCalibMinusPulsesValue);

    status = SUCCESS;
  }
  else
  {
    status = ERROR;
  }

   
  ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->WPR = 0xFF;
  
  return (ErrorStatus)(status);
}



 














 
void RTC_TimeStampCmd(uint32_t RTC_TimeStampEdge, FunctionalState NewState)
{
  uint32_t tmpreg = 0;

	 
   
  ((void)0);
  ((void)0);

   
  tmpreg = (uint32_t)(((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->CR & (uint32_t)~(((uint32_t)0x00000008) | ((uint32_t)0x00000800)));

   
  if (NewState != DISABLE)
  {
    tmpreg |= (uint32_t)(RTC_TimeStampEdge | ((uint32_t)0x00000800));
  }
  else
  {
    tmpreg |= (uint32_t)(RTC_TimeStampEdge);
  }

   
  ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->WPR = 0xCA;
  ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->WPR = 0x53;

   
  ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->CR = (uint32_t)tmpreg;

   
  ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->WPR = 0xFF;
}












 
void RTC_GetTimeStamp(uint32_t RTC_Format, RTC_TimeTypeDef* RTC_StampTimeStruct, 
                                      RTC_DateTypeDef* RTC_StampDateStruct)
{
  uint32_t tmptime = 0, tmpdate = 0;

   
  ((void)0);

   
  tmptime = (uint32_t)(((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->TSTR & ((uint32_t)0x007F7F7F));
  tmpdate = (uint32_t)(((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->TSDR & ((uint32_t)0x00FFFF3F));

   
  RTC_StampTimeStruct->RTC_Hours = (uint8_t)((tmptime & (((uint32_t)0x00300000) | ((uint32_t)0x000F0000))) >> 16);
  RTC_StampTimeStruct->RTC_Minutes = (uint8_t)((tmptime & (((uint32_t)0x00007000) | ((uint32_t)0x00000F00))) >> 8);
  RTC_StampTimeStruct->RTC_Seconds = (uint8_t)(tmptime & (((uint32_t)0x00000070) | ((uint32_t)0x0000000F)));
  RTC_StampTimeStruct->RTC_H12 = (uint8_t)((tmptime & (((uint32_t)0x00400000))) >> 16);  

   
  RTC_StampDateStruct->RTC_Year = 0;
  RTC_StampDateStruct->RTC_Month = (uint8_t)((tmpdate & (((uint32_t)0x00001000) | ((uint32_t)0x00000F00))) >> 8);
  RTC_StampDateStruct->RTC_Date = (uint8_t)(tmpdate & (((uint32_t)0x00000030) | ((uint32_t)0x0000000F)));
  RTC_StampDateStruct->RTC_WeekDay = (uint8_t)((tmpdate & (((uint32_t)0x0000E000))) >> 13);

   
  if (RTC_Format == ((uint32_t)0x000000000))
  {
     
    RTC_StampTimeStruct->RTC_Hours = (uint8_t)RTC_Bcd2ToByte(RTC_StampTimeStruct->RTC_Hours);
    RTC_StampTimeStruct->RTC_Minutes = (uint8_t)RTC_Bcd2ToByte(RTC_StampTimeStruct->RTC_Minutes);
    RTC_StampTimeStruct->RTC_Seconds = (uint8_t)RTC_Bcd2ToByte(RTC_StampTimeStruct->RTC_Seconds);

     
    RTC_StampDateStruct->RTC_Month = (uint8_t)RTC_Bcd2ToByte(RTC_StampDateStruct->RTC_Month);
    RTC_StampDateStruct->RTC_Date = (uint8_t)RTC_Bcd2ToByte(RTC_StampDateStruct->RTC_Date);
    RTC_StampDateStruct->RTC_WeekDay = (uint8_t)RTC_Bcd2ToByte(RTC_StampDateStruct->RTC_WeekDay);
  }
}





 
uint32_t RTC_GetTimeStampSubSecond(void)
{
   
  return (uint32_t)(((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->TSSSR);
}



 














 
void RTC_TamperTriggerConfig(uint32_t RTC_Tamper, uint32_t RTC_TamperTrigger)
{
   
  ((void)0); 
  ((void)0);
 
  if (RTC_TamperTrigger == ((uint32_t)0x00000000))
  {  
     
    ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->TAFCR &= (uint32_t)((uint32_t)~(RTC_Tamper << 1));	
  }
  else
  { 
     
    ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->TAFCR |= (uint32_t)(RTC_Tamper << 1);  
  }  
}










 
void RTC_TamperCmd(uint32_t RTC_Tamper, FunctionalState NewState)
{
   
  ((void)0);  
  ((void)0);
  
  if (NewState != DISABLE)
  {
     
    ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->TAFCR |= (uint32_t)RTC_Tamper;
  }
  else
  {
     
    ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->TAFCR &= (uint32_t)~RTC_Tamper;    
  }  
}













 
void RTC_TamperFilterConfig(uint32_t RTC_TamperFilter)
{
   
  ((void)0);
   
   
  ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->TAFCR &= (uint32_t)~(((uint32_t)0x00001800));

   
  ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->TAFCR |= (uint32_t)RTC_TamperFilter;
}






















 
void RTC_TamperSamplingFreqConfig(uint32_t RTC_TamperSamplingFreq)
{
   
  ((void)0);
 
   
  ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->TAFCR &= (uint32_t)~(((uint32_t)0x00000700));

   
  ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->TAFCR |= (uint32_t)RTC_TamperSamplingFreq;
}











 
void RTC_TamperPinsPrechargeDuration(uint32_t RTC_TamperPrechargeDuration)
{
   
  ((void)0);
   
   
  ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->TAFCR &= (uint32_t)~(((uint32_t)0x00006000));

   
  ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->TAFCR |= (uint32_t)RTC_TamperPrechargeDuration;
}








 
void RTC_TimeStampOnTamperDetectionCmd(FunctionalState NewState)
{
   
  ((void)0);
   
  if (NewState != DISABLE)
  {
     
    ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->TAFCR |= (uint32_t)((uint32_t)0x00000080);
  }
  else
  {
     
    ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->TAFCR &= (uint32_t)~((uint32_t)0x00000080);    
  }
}






 
void RTC_TamperPullUpCmd(FunctionalState NewState)
{
   
  ((void)0);
  
 if (NewState != DISABLE)
  {
     
    ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->TAFCR &= (uint32_t)~((uint32_t)0x00008000); 
  }
  else
  {
     
    ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->TAFCR |= (uint32_t)((uint32_t)0x00008000);    
  } 
}



 









 
void RTC_OutputTypeConfig(uint32_t RTC_OutputType)
{
   
  ((void)0);
  
  ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->TAFCR &= (uint32_t)~(((uint32_t)0x00040000));
  ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->TAFCR |= (uint32_t)(RTC_OutputType);  
}



 












 
ErrorStatus RTC_SynchroShiftConfig(uint32_t RTC_ShiftAdd1S, uint32_t RTC_ShiftSubFS)
{
  ErrorStatus status = ERROR;
  uint32_t shpfcount = 0;

   
  ((void)0);
  ((void)0);

   
  ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->WPR = 0xCA;
  ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->WPR = 0x53;
  
   
  if ((((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->ISR & ((uint32_t)0x00000008)) != RESET)
  {
     
    while (((((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->ISR & ((uint32_t)0x00000008)) != RESET) && (shpfcount != ((uint32_t) 0x00001000)))
    {
      shpfcount++;
    }
  }

   
  if ((((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->ISR & ((uint32_t)0x00000008)) == RESET)
  {
     
    if((((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->CR & ((uint32_t)0x00000010)) == RESET)
    {
       
      ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->SHIFTR = (uint32_t)(uint32_t)(RTC_ShiftSubFS) | (uint32_t)(RTC_ShiftAdd1S);
    
      if(RTC_WaitForSynchro() == ERROR)
      {
        status = ERROR;
      }
      else
      {
        status = SUCCESS;
      }
    }
    else
    {
      status = ERROR;
    }
  }
  else
  {
    status = ERROR;
  }

   
  ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->WPR = 0xFF;
  
  return (ErrorStatus)(status);
}



 












 
void RTC_ITConfig(uint32_t RTC_IT, FunctionalState NewState)
{
   
  ((void)0);
  ((void)0);

   
  ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->WPR = 0xCA;
  ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->WPR = 0x53;

  if (NewState != DISABLE)
  {
     
    ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->CR |= (uint32_t)(RTC_IT & ~((uint32_t)0x00000004));
     
    ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->TAFCR |= (uint32_t)(RTC_IT & ((uint32_t)0x00000004));
  }
  else
  {
     
    ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->CR &= (uint32_t)~(RTC_IT & (uint32_t)~((uint32_t)0x00000004));
     
    ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->TAFCR &= (uint32_t)~(RTC_IT & ((uint32_t)0x00000004));
  }
   
  ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->WPR = 0xFF; 
}
















 
FlagStatus RTC_GetFlagStatus(uint32_t RTC_FLAG)
{
  FlagStatus bitstatus = RESET;
  uint32_t tmpreg = 0;
  
   
  ((void)0);
  
   
  tmpreg = (uint32_t)(((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->ISR & ((uint32_t)(((uint32_t)0x00001000) | ((uint32_t)0x00000800) | ((uint32_t)0x00000100) | ((uint32_t)0x00000020) | ((uint32_t)0x00000010) |((uint32_t)0x00000040) | ((uint32_t)0x00002000) | ((uint32_t)0x00004000) | ((uint32_t)0x00010000) | ((uint32_t)0x00000008))));
  
   
  if ((tmpreg & RTC_FLAG) != (uint32_t)RESET)
  {
    bitstatus = SET;
  }
  else
  {
    bitstatus = RESET;
  }
  return bitstatus;
}













 
void RTC_ClearFlag(uint32_t RTC_FLAG)
{
   
  ((void)0);

   
  ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->ISR = (uint32_t)((uint32_t)(~((RTC_FLAG | ((uint32_t)0x00000080))& 0x0001FFFF) | (uint32_t)(((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->ISR & ((uint32_t)0x00000080))));    
}











 
ITStatus RTC_GetITStatus(uint32_t RTC_IT)
{
  ITStatus bitstatus = RESET;
  uint32_t tmpreg = 0, enablestatus = 0;
 
   
  ((void)0);
  
   
  tmpreg = (uint32_t)(((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->TAFCR & (((uint32_t)0x00000004)));
 
   
  enablestatus = (uint32_t)((((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->CR & RTC_IT) | (tmpreg & ((RTC_IT >> (RTC_IT >> 18)) >> 15)));
  
   
  tmpreg = (uint32_t)((((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->ISR & (uint32_t)(RTC_IT >> 4)));
  
   
  if ((enablestatus != (uint32_t)RESET) && ((tmpreg & 0x0000FFFF) != (uint32_t)RESET))
  {
    bitstatus = SET;
  }
  else
  {
    bitstatus = RESET;
  }
  return bitstatus;
}











 
void RTC_ClearITPendingBit(uint32_t RTC_IT)
{
  uint32_t tmpreg = 0;

   
  ((void)0);

   
  tmpreg = (uint32_t)(RTC_IT >> 4);

   
  ((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->ISR = (uint32_t)((uint32_t)(~((tmpreg | ((uint32_t)0x00000080))& 0x0000FFFF) | (uint32_t)(((RTC_TypeDef *) (((uint32_t)0x40000000) + 0x00002800))->ISR & ((uint32_t)0x00000080)))); 
}



 





 
static uint8_t RTC_ByteToBcd2(uint8_t Value)
{
  uint8_t bcdhigh = 0;
  
  while (Value >= 10)
  {
    bcdhigh++;
    Value -= 10;
  }
  
  return  ((uint8_t)(bcdhigh << 4) | Value);
}





 
static uint8_t RTC_Bcd2ToByte(uint8_t Value)
{
  uint8_t tmp = 0;
  tmp = ((uint8_t)(Value & (uint8_t)0xF0) >> (uint8_t)0x4) * 10;
  return (tmp + (Value & (uint8_t)0x0F));
}



  



  



  

 
