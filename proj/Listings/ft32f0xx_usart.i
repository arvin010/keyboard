# 1 "..\\FTLib\\Src\\ft32f0xx_usart.c"






















 

 
# 1 "..\\FTLib\\Inc\\ft32f0xx_usart.h"









 


 







 
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






 





 




 






















 



 
  



 
# 23 "..\\FTLib\\Inc\\ft32f0xx_usart.h"




  

 

   
   


  

typedef struct
{
  uint32_t USART_BaudRate;            


 

  uint32_t USART_WordLength;          
 

  uint32_t USART_StopBits;            
 

  uint32_t USART_Parity;              




 
 
  uint32_t USART_Mode;                
 

  uint32_t USART_HardwareFlowControl; 

 
} USART_InitTypeDef;



  

typedef struct
{
  uint32_t USART_Clock;             
 

  uint32_t USART_CPOL;              
 

  uint32_t USART_CPHA;              
 

  uint32_t USART_LastBit;           

 
} USART_ClockInitTypeDef;

 



  










  

# 108 "..\\FTLib\\Inc\\ft32f0xx_usart.h"


  



  

# 122 "..\\FTLib\\Inc\\ft32f0xx_usart.h"


  



  

# 136 "..\\FTLib\\Inc\\ft32f0xx_usart.h"


  



  







  



  

# 165 "..\\FTLib\\Inc\\ft32f0xx_usart.h"


  



  
  






  



 
  






  



 







 



 







 
  


 








  



 







  



 







 



  







  



  



 



 







  



 







  



 








  



 







  



 







  


 














  



 
# 389 "..\\FTLib\\Inc\\ft32f0xx_usart.h"

# 396 "..\\FTLib\\Inc\\ft32f0xx_usart.h"


  









 

# 425 "..\\FTLib\\Inc\\ft32f0xx_usart.h"

# 432 "..\\FTLib\\Inc\\ft32f0xx_usart.h"

# 440 "..\\FTLib\\Inc\\ft32f0xx_usart.h"

# 447 "..\\FTLib\\Inc\\ft32f0xx_usart.h"


 



 









  



  

 
 

 
void USART_DeInit(USART_TypeDef* USARTx);
void USART_Init(USART_TypeDef* USARTx, USART_InitTypeDef* USART_InitStruct);
void USART_StructInit(USART_InitTypeDef* USART_InitStruct);
void USART_ClockInit(USART_TypeDef* USARTx, USART_ClockInitTypeDef* USART_ClockInitStruct);
void USART_ClockStructInit(USART_ClockInitTypeDef* USART_ClockInitStruct);
void USART_Cmd(USART_TypeDef* USARTx, FunctionalState NewState);
void USART_DirectionModeCmd(USART_TypeDef* USARTx, uint32_t USART_DirectionMode, FunctionalState NewState);
void USART_OverSampling8Cmd(USART_TypeDef* USARTx, FunctionalState NewState);
void USART_OneBitMethodCmd(USART_TypeDef* USARTx, FunctionalState NewState);
void USART_MSBFirstCmd(USART_TypeDef* USARTx, FunctionalState NewState);
void USART_DataInvCmd(USART_TypeDef* USARTx, FunctionalState NewState);
void USART_InvPinCmd(USART_TypeDef* USARTx, uint32_t USART_InvPin, FunctionalState NewState);
void USART_SWAPPinCmd(USART_TypeDef* USARTx, FunctionalState NewState);
void USART_ReceiverTimeOutCmd(USART_TypeDef* USARTx, FunctionalState NewState);
void USART_SetReceiverTimeOut(USART_TypeDef* USARTx, uint32_t USART_ReceiverTimeOut);

 
void USART_AutoBaudRateCmd(USART_TypeDef* USARTx, FunctionalState NewState);
void USART_AutoBaudRateConfig(USART_TypeDef* USARTx, uint32_t USART_AutoBaudRate);

 
void USART_SendData(USART_TypeDef* USARTx, uint16_t Data);
uint16_t USART_ReceiveData(USART_TypeDef* USARTx);

 
void USART_SetAddress(USART_TypeDef* USARTx, uint8_t USART_Address);
void USART_MuteModeWakeUpConfig(USART_TypeDef* USARTx, uint32_t USART_WakeUp);
void USART_MuteModeCmd(USART_TypeDef* USARTx, FunctionalState NewState);
void USART_AddressDetectionConfig(USART_TypeDef* USARTx, uint32_t USART_AddressLength);

 
void USART_HalfDuplexCmd(USART_TypeDef* USARTx, FunctionalState NewState);

 
void USART_DECmd(USART_TypeDef* USARTx, FunctionalState NewState);
void USART_DEPolarityConfig(USART_TypeDef* USARTx, uint32_t USART_DEPolarity);
void USART_SetDEAssertionTime(USART_TypeDef* USARTx, uint32_t USART_DEAssertionTime);
void USART_SetDEDeassertionTime(USART_TypeDef* USARTx, uint32_t USART_DEDeassertionTime);

 
void USART_DMACmd(USART_TypeDef* USARTx, uint32_t USART_DMAReq, FunctionalState NewState);
void USART_DMAReceptionErrorConfig(USART_TypeDef* USARTx, uint32_t USART_DMAOnError);

 
void USART_ITConfig(USART_TypeDef* USARTx, uint32_t USART_IT, FunctionalState NewState);
void USART_RequestCmd(USART_TypeDef* USARTx, uint32_t USART_Request, FunctionalState NewState);
void USART_OverrunDetectionConfig(USART_TypeDef* USARTx, uint32_t USART_OVRDetection);
FlagStatus USART_GetFlagStatus(USART_TypeDef* USARTx, uint32_t USART_FLAG);
void USART_ClearFlag(USART_TypeDef* USARTx, uint32_t USART_FLAG);
ITStatus USART_GetITStatus(USART_TypeDef* USARTx, uint32_t USART_IT);
void USART_ClearITPendingBit(USART_TypeDef* USARTx, uint32_t USART_IT);









  



  

 
# 27 "..\\FTLib\\Src\\ft32f0xx_usart.c"
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









 



  

 
# 28 "..\\FTLib\\Src\\ft32f0xx_usart.c"

 




 



 


 


  




 
void USART_DeInit(USART_TypeDef* USARTx)
{
   
  ((void)0);

  if (USARTx == ((USART_TypeDef *) (((uint32_t)0x40000000) + 0x00013800)))
  {
    RCC_APB2PeriphResetCmd(((uint32_t)0x00004000), ENABLE);
    RCC_APB2PeriphResetCmd(((uint32_t)0x00004000), DISABLE);
  }
  else if (USARTx == ((USART_TypeDef *) (((uint32_t)0x40000000) + 0x00004400)))
  {
    RCC_APB1PeriphResetCmd(((uint32_t)0x00020000), ENABLE);
    RCC_APB1PeriphResetCmd(((uint32_t)0x00020000), DISABLE);
  }
}








 
void USART_Init(USART_TypeDef* USARTx, USART_InitTypeDef* USART_InitStruct)
{
  uint32_t divider = 0, apbclock = 0, tmpreg = 0;
  RCC_ClocksTypeDef RCC_ClocksStatus;
  
   
  ((void)0);
  ((void)0);  
  ((void)0);
  ((void)0);
  ((void)0);
  ((void)0);
  ((void)0);
  
   
  USARTx->CR1 &= (uint32_t)~((uint32_t)((uint32_t)0x00000001));
  
   
  tmpreg = USARTx->CR2;
   
  tmpreg &= (uint32_t)~((uint32_t)((uint32_t)0x00003000));
  
   
   
  tmpreg |= (uint32_t)USART_InitStruct->USART_StopBits;
  
   
  USARTx->CR2 = tmpreg;
  
   
  tmpreg = USARTx->CR1;
   
  tmpreg &= (uint32_t)~((uint32_t)((uint32_t)(((uint32_t)0x00001000) | ((uint32_t)0x00000400) | ((uint32_t)0x00000200) | ((uint32_t)0x00000008) | ((uint32_t)0x00000004))));
  
   
   
   
   
  tmpreg |= (uint32_t)USART_InitStruct->USART_WordLength | USART_InitStruct->USART_Parity |
    USART_InitStruct->USART_Mode;
  
   
  USARTx->CR1 = tmpreg;
  
     
  tmpreg = USARTx->CR3;
   
  tmpreg &= (uint32_t)~((uint32_t)((uint32_t)(((uint32_t)0x00000100) | ((uint32_t)0x00000200))));
  
   
   
  tmpreg |= USART_InitStruct->USART_HardwareFlowControl;
  
   
  USARTx->CR3 = tmpreg;
  
   
   
  RCC_GetClocksFreq(&RCC_ClocksStatus);
  
  if (USARTx == ((USART_TypeDef *) (((uint32_t)0x40000000) + 0x00013800)))
  {
    apbclock = RCC_ClocksStatus.USART1CLK_Frequency;
  }
  else if (USARTx == ((USART_TypeDef *) (((uint32_t)0x40000000) + 0x00004400)))
  {
    apbclock = RCC_ClocksStatus.USART2CLK_Frequency;
  }
  
   
  if ((USARTx->CR1 & ((uint32_t)0x00008000)) != 0)
  {
     
    divider = (uint32_t)((2 * apbclock) / (USART_InitStruct->USART_BaudRate));
    tmpreg  = (uint32_t)((2 * apbclock) % (USART_InitStruct->USART_BaudRate));
  }
  else  
  {
     
    divider = (uint32_t)((apbclock) / (USART_InitStruct->USART_BaudRate));
    tmpreg  = (uint32_t)((apbclock) % (USART_InitStruct->USART_BaudRate));
  }
  
   
  if (tmpreg >=  (USART_InitStruct->USART_BaudRate) / 2)
  {
    divider++;
  } 
  
   
  if ((USARTx->CR1 & ((uint32_t)0x00008000)) != 0)
  {
     
    tmpreg = (divider & (uint16_t)0x000F) >> 1;
    
     
    divider = (divider & (uint16_t)0xFFF0) | tmpreg;
  }
  
   
  USARTx->BRR = (uint16_t)divider;
}






 
void USART_StructInit(USART_InitTypeDef* USART_InitStruct)
{
   
  USART_InitStruct->USART_BaudRate = 9600;
  USART_InitStruct->USART_WordLength = ((uint32_t)0x00000000);
  USART_InitStruct->USART_StopBits = ((uint32_t)0x00000000);
  USART_InitStruct->USART_Parity = ((uint32_t)0x00000000) ;
  USART_InitStruct->USART_Mode = ((uint32_t)0x00000004) | ((uint32_t)0x00000008);
  USART_InitStruct->USART_HardwareFlowControl = ((uint32_t)0x00000000);  
}









 
void USART_ClockInit(USART_TypeDef* USARTx, USART_ClockInitTypeDef* USART_ClockInitStruct)
{
  uint32_t tmpreg = 0;
   
  ((void)0);
  ((void)0);
  ((void)0);
  ((void)0);
  ((void)0);
 
  tmpreg = USARTx->CR2;
   
  tmpreg &= (uint32_t)~((uint32_t)((uint32_t)(((uint32_t)0x00000800) | ((uint32_t)0x00000400) | ((uint32_t)0x00000200) | ((uint32_t)0x00000100))));
   
   
   
   
   
  tmpreg |= (uint32_t)(USART_ClockInitStruct->USART_Clock | USART_ClockInitStruct->USART_CPOL | 
                       USART_ClockInitStruct->USART_CPHA | USART_ClockInitStruct->USART_LastBit);
   
  USARTx->CR2 = tmpreg;
}






 
void USART_ClockStructInit(USART_ClockInitTypeDef* USART_ClockInitStruct)
{
   
  USART_ClockInitStruct->USART_Clock = ((uint32_t)0x00000000);
  USART_ClockInitStruct->USART_CPOL = ((uint32_t)0x00000000);
  USART_ClockInitStruct->USART_CPHA = ((uint32_t)0x00000000);
  USART_ClockInitStruct->USART_LastBit = ((uint32_t)0x00000000);
}







 
void USART_Cmd(USART_TypeDef* USARTx, FunctionalState NewState)
{
   
  ((void)0);
  ((void)0);
  
  if (NewState != DISABLE)
  {
     
    USARTx->CR1 |= ((uint32_t)0x00000001);
  }
  else
  {
     
    USARTx->CR1 &= (uint32_t)~((uint32_t)((uint32_t)0x00000001));
  }
}











 
void USART_DirectionModeCmd(USART_TypeDef* USARTx, uint32_t USART_DirectionMode, FunctionalState NewState)
{
   
  ((void)0);
  ((void)0);
  ((void)0); 

  if (NewState != DISABLE)
  {
    
 
    USARTx->CR1 |= USART_DirectionMode;
  }
  else
  {
    
 
    USARTx->CR1 &= (uint32_t)~USART_DirectionMode;
  }
}









 
void USART_OverSampling8Cmd(USART_TypeDef* USARTx, FunctionalState NewState)
{
   
  ((void)0);
  ((void)0);
  
  if (NewState != DISABLE)
  {
     
    USARTx->CR1 |= ((uint32_t)0x00008000);
  }
  else
  {
     
    USARTx->CR1 &= (uint32_t)~((uint32_t)((uint32_t)0x00008000));
  }
}  








 
void USART_OneBitMethodCmd(USART_TypeDef* USARTx, FunctionalState NewState)
{
   
  ((void)0);
  ((void)0);
  
  if (NewState != DISABLE)
  {
     
    USARTx->CR3 |= ((uint32_t)0x00000800);
  }
  else
  {
     
    USARTx->CR3 &= (uint32_t)~((uint32_t)((uint32_t)0x00000800));
  }
}










 
void USART_MSBFirstCmd(USART_TypeDef* USARTx, FunctionalState NewState)
{
   
  ((void)0);
  ((void)0);
  
  if (NewState != DISABLE)
  {
    
 
    USARTx->CR2 |= ((uint32_t)0x00080000);
  }
  else
  {
    
 
    USARTx->CR2 &= (uint32_t)~((uint32_t)((uint32_t)0x00080000));
  }
}












 
void USART_DataInvCmd(USART_TypeDef* USARTx, FunctionalState NewState)
{
   
  ((void)0);
  ((void)0);

  if (NewState != DISABLE)
  {
    
 
    USARTx->CR2 |= ((uint32_t)0x00040000);
  }
  else
  {
    
 
    USARTx->CR2 &= (uint32_t)~((uint32_t)((uint32_t)0x00040000));
  }
}














 
void USART_InvPinCmd(USART_TypeDef* USARTx, uint32_t USART_InvPin, FunctionalState NewState)
{
   
  ((void)0);
  ((void)0);  
  ((void)0); 

  if (NewState != DISABLE)
  {
    
 
    USARTx->CR2 |= USART_InvPin;
  }
  else
  {
    
 
    USARTx->CR2 &= (uint32_t)~USART_InvPin;
  }
}










 
void USART_SWAPPinCmd(USART_TypeDef* USARTx, FunctionalState NewState)
{
   
  ((void)0);
  ((void)0);

  if (NewState != DISABLE)
  {
     
    USARTx->CR2 |= ((uint32_t)0x00008000);
  }
  else
  {
     
    USARTx->CR2 &= (uint32_t)~((uint32_t)((uint32_t)0x00008000));
  }
}







 
void USART_ReceiverTimeOutCmd(USART_TypeDef* USARTx, FunctionalState NewState)
{
   
  ((void)0);
  ((void)0);

  if (NewState != DISABLE)
  {
    
 
    USARTx->CR2 |= ((uint32_t)0x00800000);
  }
  else
  {
    
 
    USARTx->CR2 &= (uint32_t)~((uint32_t)((uint32_t)0x00800000));
  }
}






 
void USART_SetReceiverTimeOut(USART_TypeDef* USARTx, uint32_t USART_ReceiverTimeOut)
{    
   
  ((void)0);
  ((void)0);

  
 
  USARTx->RTOR &= (uint32_t)~((uint32_t)((uint32_t)0x00FFFFFF));
  
 
  USARTx->RTOR |= USART_ReceiverTimeOut;
}


 






 
void USART_AutoBaudRateCmd(USART_TypeDef* USARTx, FunctionalState NewState)
{
   
  ((void)0);
  ((void)0);

  if (NewState != DISABLE)
  {
    
 
    USARTx->CR2 |= ((uint32_t)0x00100000);
  }
  else
  {
    
 
    USARTx->CR2 &= (uint32_t)~((uint32_t)((uint32_t)0x00100000));
  }
}










 
void USART_AutoBaudRateConfig(USART_TypeDef* USARTx, uint32_t USART_AutoBaudRate)
{
   
  ((void)0);
  ((void)0);

  USARTx->CR2 &= (uint32_t)~((uint32_t)((uint32_t)0x00600000));
  USARTx->CR2 |= USART_AutoBaudRate;
}



 





 
void USART_SendData(USART_TypeDef* USARTx, uint16_t Data)
{
   
  ((void)0);
  ((void)0); 
    
   
  USARTx->TDR = (Data & (uint16_t)0x01FF);
}





 
uint16_t USART_ReceiveData(USART_TypeDef* USARTx)
{
   
  ((void)0);
  
   
  return (uint16_t)(USARTx->RDR & (uint16_t)0x01FF);
}



 





 
void USART_SetAddress(USART_TypeDef* USARTx, uint8_t USART_Address)
{
   
  ((void)0);
  
   
  USARTx->CR2 &= (uint32_t)~((uint32_t)((uint32_t)0xFF000000));
   
  USARTx->CR2 |=((uint32_t)USART_Address << (uint32_t)0x18);
}







 
void USART_MuteModeCmd(USART_TypeDef* USARTx, FunctionalState NewState)
{
   
  ((void)0);
  ((void)0); 
  
  if (NewState != DISABLE)
  {
     
    USARTx->CR1 |= ((uint32_t)0x00002000);
  }
  else
  {
     
    USARTx->CR1 &= (uint32_t)~((uint32_t)((uint32_t)0x00002000));
  }
}









 
void USART_MuteModeWakeUpConfig(USART_TypeDef* USARTx, uint32_t USART_WakeUp)
{
   
  ((void)0);
  ((void)0);

  USARTx->CR1 &= (uint32_t)~((uint32_t)((uint32_t)0x00000800));
  USARTx->CR1 |= USART_WakeUp;
}









 
void USART_AddressDetectionConfig(USART_TypeDef* USARTx, uint32_t USART_AddressLength)
{
   
  ((void)0);
  ((void)0);

  USARTx->CR2 &= (uint32_t)~((uint32_t)((uint32_t)0x00000010));
  USARTx->CR2 |= USART_AddressLength;
}



 






 
void USART_HalfDuplexCmd(USART_TypeDef* USARTx, FunctionalState NewState)
{
   
  ((void)0);
  ((void)0);
  
  if (NewState != DISABLE)
  {
     
    USARTx->CR3 |= ((uint32_t)0x00000008);
  }
  else
  {
     
    USARTx->CR3 &= (uint32_t)~((uint32_t)((uint32_t)0x00000008));
  }
}



 






 
void USART_DECmd(USART_TypeDef* USARTx, FunctionalState NewState)
{
   
  ((void)0);
  ((void)0);
  if (NewState != DISABLE)
  {
     
    USARTx->CR3 |= ((uint32_t)0x00004000);
  }
  else
  {
     
    USARTx->CR3 &= (uint32_t)~((uint32_t)((uint32_t)0x00004000));
  }
}









 
void USART_DEPolarityConfig(USART_TypeDef* USARTx, uint32_t USART_DEPolarity)
{
   
  ((void)0);
  ((void)0);

  USARTx->CR3 &= (uint32_t)~((uint32_t)((uint32_t)0x00008000));
  USARTx->CR3 |= USART_DEPolarity;
}







 
void USART_SetDEAssertionTime(USART_TypeDef* USARTx, uint32_t USART_DEAssertionTime)
{
   
  ((void)0);
  ((void)0); 

   
  USARTx->CR1 &= (uint32_t)~((uint32_t)((uint32_t)0x03E00000));
   
  USARTx->CR1 |=((uint32_t)USART_DEAssertionTime << (uint32_t)0x15);
}







 
void USART_SetDEDeassertionTime(USART_TypeDef* USARTx, uint32_t USART_DEDeassertionTime)
{
   
  ((void)0);
  ((void)0); 

   
  USARTx->CR1 &= (uint32_t)~((uint32_t)((uint32_t)0x001F0000));
   
  USARTx->CR1 |=((uint32_t)USART_DEDeassertionTime << (uint32_t)0x10);
}



 











 
void USART_DMACmd(USART_TypeDef* USARTx, uint32_t USART_DMAReq, FunctionalState NewState)
{
   
  ((void)0);
  ((void)0);  
  ((void)0); 

  if (NewState != DISABLE)
  {
    
 
    USARTx->CR3 |= USART_DMAReq;
  }
  else
  {
    
 
    USARTx->CR3 &= (uint32_t)~USART_DMAReq;
  }
}











 
void USART_DMAReceptionErrorConfig(USART_TypeDef* USARTx, uint32_t USART_DMAOnError)
{
   
  ((void)0);
  ((void)0); 
  
   
  USARTx->CR3 &= (uint32_t)~((uint32_t)((uint32_t)0x00002000));
   
  USARTx->CR3 |= USART_DMAOnError;
}



 




















 
void USART_ITConfig(USART_TypeDef* USARTx, uint32_t USART_IT, FunctionalState NewState)
{
  uint32_t usartreg = 0, itpos = 0, itmask = 0;
  uint32_t usartxbase = 0;
   
  ((void)0);
  ((void)0);
  ((void)0);
  
  usartxbase = (uint32_t)USARTx;
  
   
  usartreg = (((uint16_t)USART_IT) >> 0x08);
  
   
  itpos = USART_IT & ((uint32_t)0x000000FF);
  itmask = (((uint32_t)0x01) << itpos);
  
  if (usartreg == 0x02)  
  {
    usartxbase += 0x04;
  }
  else if (usartreg == 0x03)  
  {
    usartxbase += 0x08;
  }
  else  
  {
  }
  if (NewState != DISABLE)
  {
    *(volatile uint32_t*)usartxbase  |= itmask;
  }
  else
  {
    *(volatile uint32_t*)usartxbase &= ~itmask;
  }
}














 
void USART_RequestCmd(USART_TypeDef* USARTx, uint32_t USART_Request, FunctionalState NewState)
{
   
  ((void)0);
  ((void)0);
  ((void)0); 

  if (NewState != DISABLE)
  {
    
 
      USARTx->RQR |= USART_Request;
  }
  else
  {
    
 
    USARTx->RQR &= (uint32_t)~USART_Request;
  }
}











 
void USART_OverrunDetectionConfig(USART_TypeDef* USARTx, uint32_t USART_OVRDetection)
{
   
  ((void)0);
  ((void)0);
  
   
  USARTx->CR3 &= (uint32_t)~((uint32_t)((uint32_t)0x00001000));
   
  USARTx->CR3 |= USART_OVRDetection;
}





























 
FlagStatus USART_GetFlagStatus(USART_TypeDef* USARTx, uint32_t USART_FLAG)
{
  FlagStatus bitstatus = RESET;
   
  ((void)0);
  ((void)0);
  
  if ((USARTx->ISR & USART_FLAG) != (uint16_t)RESET)
  {
    bitstatus = SET;
  }
  else
  {
    bitstatus = RESET;
  }
  return bitstatus;
}






























 
void USART_ClearFlag(USART_TypeDef* USARTx, uint32_t USART_FLAG)
{
   
  ((void)0);
  ((void)0);
     
  USARTx->ICR = USART_FLAG;
}





















 
ITStatus USART_GetITStatus(USART_TypeDef* USARTx, uint32_t USART_IT)
{
  uint32_t bitpos = 0, itmask = 0, usartreg = 0;
  ITStatus bitstatus = RESET;
   
  ((void)0);
  ((void)0); 
  
   
  usartreg = (((uint16_t)USART_IT) >> 0x08);
   
  itmask = USART_IT & ((uint32_t)0x000000FF);
  itmask = (uint32_t)0x01 << itmask;
  
  if (usartreg == 0x01)  
  {
    itmask &= USARTx->CR1;
  }
  else if (usartreg == 0x02)  
  {
    itmask &= USARTx->CR2;
  }
  else  
  {
    itmask &= USARTx->CR3;
  }
  
  bitpos = USART_IT >> 0x10;
  bitpos = (uint32_t)0x01 << bitpos;
  bitpos &= USARTx->ISR;
  if ((itmask != (uint16_t)RESET)&&(bitpos != (uint16_t)RESET))
  {
    bitstatus = SET;
  }
  else
  {
    bitstatus = RESET;
  }
  
  return bitstatus;  
}





























 
void USART_ClearITPendingBit(USART_TypeDef* USARTx, uint32_t USART_IT)
{
  uint32_t bitpos = 0, itmask = 0;
   
  ((void)0);
  ((void)0); 
  
  bitpos = USART_IT >> 0x10;
  itmask = ((uint32_t)0x01 << (uint32_t)bitpos);
  USARTx->ICR = (uint32_t)itmask;
}



 



 



 



 

 
