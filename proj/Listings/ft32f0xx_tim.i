# 1 "..\\FTLib\\Src\\ft32f0xx_tim.c"

















 

 
# 1 "..\\FTLib\\Inc\\ft32f0xx_tim.h"









 


 







 
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






 





 




 






















 



 
  



 
# 23 "..\\FTLib\\Inc\\ft32f0xx_tim.h"




  

 




 

typedef struct
{
  uint16_t TIM_Prescaler;         
 

  uint16_t TIM_CounterMode;       
 

  uint32_t TIM_Period;            

  

  uint16_t TIM_ClockDivision;     
 

  uint8_t TIM_RepetitionCounter;  






 
} TIM_TimeBaseInitTypeDef;       



 

typedef struct
{
  uint16_t TIM_OCMode;        
 

  uint16_t TIM_OutputState;   
 

  uint16_t TIM_OutputNState;  

 

  uint32_t TIM_Pulse;         

 

  uint16_t TIM_OCPolarity;    
 

  uint16_t TIM_OCNPolarity;   

 

  uint16_t TIM_OCIdleState;   

 

  uint16_t TIM_OCNIdleState;  

 
} TIM_OCInitTypeDef;



 

typedef struct
{

  uint16_t TIM_Channel;      
 

  uint16_t TIM_ICPolarity;   
 

  uint16_t TIM_ICSelection;  
 

  uint16_t TIM_ICPrescaler;  
 

  uint16_t TIM_ICFilter;     
 
} TIM_ICInitTypeDef;




 

typedef struct
{

  uint16_t TIM_OSSRState;        
 

  uint16_t TIM_OSSIState;        
 

  uint16_t TIM_LOCKLevel;        
  

  uint16_t TIM_DeadTime;         

 

  uint16_t TIM_Break;            
 

  uint16_t TIM_BreakPolarity;    
 

  uint16_t TIM_AutomaticOutput;  
 
} TIM_BDTRInitTypeDef;



 

 

  


 

# 171 "..\\FTLib\\Inc\\ft32f0xx_tim.h"

 


 





 




 
# 194 "..\\FTLib\\Inc\\ft32f0xx_tim.h"

 
# 202 "..\\FTLib\\Inc\\ft32f0xx_tim.h"

 





 
# 216 "..\\FTLib\\Inc\\ft32f0xx_tim.h"
                                      
 





 
# 230 "..\\FTLib\\Inc\\ft32f0xx_tim.h"

 
# 240 "..\\FTLib\\Inc\\ft32f0xx_tim.h"

 

                                     



  



 

# 273 "..\\FTLib\\Inc\\ft32f0xx_tim.h"


 



 







  



 






# 307 "..\\FTLib\\Inc\\ft32f0xx_tim.h"



  



 

# 322 "..\\FTLib\\Inc\\ft32f0xx_tim.h"


 



 

# 340 "..\\FTLib\\Inc\\ft32f0xx_tim.h"


  



 







 



 
  






 



 







  



 







  



 







  



 







  



 







  



 







  



 







  



 

# 464 "..\\FTLib\\Inc\\ft32f0xx_tim.h"


  



 







 



 







  



 







  



 







  



 

# 526 "..\\FTLib\\Inc\\ft32f0xx_tim.h"


  



 

# 542 "..\\FTLib\\Inc\\ft32f0xx_tim.h"


  



 

# 558 "..\\FTLib\\Inc\\ft32f0xx_tim.h"


  



 

# 575 "..\\FTLib\\Inc\\ft32f0xx_tim.h"

# 584 "..\\FTLib\\Inc\\ft32f0xx_tim.h"


  



 

# 632 "..\\FTLib\\Inc\\ft32f0xx_tim.h"


  




 

# 677 "..\\FTLib\\Inc\\ft32f0xx_tim.h"


  



 

# 693 "..\\FTLib\\Inc\\ft32f0xx_tim.h"



  



 

# 710 "..\\FTLib\\Inc\\ft32f0xx_tim.h"


  



 

# 738 "..\\FTLib\\Inc\\ft32f0xx_tim.h"


  



 







  



  






 



 







  



 







  



 

# 799 "..\\FTLib\\Inc\\ft32f0xx_tim.h"


  




 

# 817 "..\\FTLib\\Inc\\ft32f0xx_tim.h"



  



 

# 832 "..\\FTLib\\Inc\\ft32f0xx_tim.h"


  



 







  



 





                                     


  



 







  



 

# 893 "..\\FTLib\\Inc\\ft32f0xx_tim.h"


  



 

# 909 "..\\FTLib\\Inc\\ft32f0xx_tim.h"


  



 







  
  


 

# 953 "..\\FTLib\\Inc\\ft32f0xx_tim.h"
                               
                               



  




 




  



 




 



 







 


 











 



 

# 1028 "..\\FTLib\\Inc\\ft32f0xx_tim.h"


 



 
  
 
  

 
void TIM_DeInit(TIM_TypeDef* TIMx);
void TIM_TimeBaseInit(TIM_TypeDef* TIMx, TIM_TimeBaseInitTypeDef* TIM_TimeBaseInitStruct);
void TIM_TimeBaseStructInit(TIM_TimeBaseInitTypeDef* TIM_TimeBaseInitStruct);
void TIM_PrescalerConfig(TIM_TypeDef* TIMx, uint16_t Prescaler, uint16_t TIM_PSCReloadMode);
void TIM_CounterModeConfig(TIM_TypeDef* TIMx, uint16_t TIM_CounterMode);
void TIM_SetCounter(TIM_TypeDef* TIMx, uint32_t Counter);
void TIM_SetAutoreload(TIM_TypeDef* TIMx, uint32_t Autoreload);
uint32_t TIM_GetCounter(TIM_TypeDef* TIMx);
uint16_t TIM_GetPrescaler(TIM_TypeDef* TIMx);
void TIM_UpdateDisableConfig(TIM_TypeDef* TIMx, FunctionalState NewState);
void TIM_UpdateRequestConfig(TIM_TypeDef* TIMx, uint16_t TIM_UpdateSource);
void TIM_ARRPreloadConfig(TIM_TypeDef* TIMx, FunctionalState NewState);
void TIM_SelectOnePulseMode(TIM_TypeDef* TIMx, uint16_t TIM_OPMode);
void TIM_SetClockDivision(TIM_TypeDef* TIMx, uint16_t TIM_CKD);
void TIM_Cmd(TIM_TypeDef* TIMx, FunctionalState NewState);

 
void TIM_BDTRConfig(TIM_TypeDef* TIMx, TIM_BDTRInitTypeDef *TIM_BDTRInitStruct);
void TIM_BDTRStructInit(TIM_BDTRInitTypeDef* TIM_BDTRInitStruct);
void TIM_CtrlPWMOutputs(TIM_TypeDef* TIMx, FunctionalState NewState);

 
void TIM_OC1Init(TIM_TypeDef* TIMx, TIM_OCInitTypeDef* TIM_OCInitStruct);
void TIM_OC2Init(TIM_TypeDef* TIMx, TIM_OCInitTypeDef* TIM_OCInitStruct);
void TIM_OC3Init(TIM_TypeDef* TIMx, TIM_OCInitTypeDef* TIM_OCInitStruct);
void TIM_OC4Init(TIM_TypeDef* TIMx, TIM_OCInitTypeDef* TIM_OCInitStruct);
void TIM_OCStructInit(TIM_OCInitTypeDef* TIM_OCInitStruct);
void TIM_SelectOCxM(TIM_TypeDef* TIMx, uint16_t TIM_Channel, uint16_t TIM_OCMode);
void TIM_SetCompare1(TIM_TypeDef* TIMx, uint32_t Compare1);
void TIM_SetCompare2(TIM_TypeDef* TIMx, uint32_t Compare2);
void TIM_SetCompare3(TIM_TypeDef* TIMx, uint32_t Compare3);
void TIM_SetCompare4(TIM_TypeDef* TIMx, uint32_t Compare4);
void TIM_ForcedOC1Config(TIM_TypeDef* TIMx, uint16_t TIM_ForcedAction);
void TIM_ForcedOC2Config(TIM_TypeDef* TIMx, uint16_t TIM_ForcedAction);
void TIM_ForcedOC3Config(TIM_TypeDef* TIMx, uint16_t TIM_ForcedAction);
void TIM_ForcedOC4Config(TIM_TypeDef* TIMx, uint16_t TIM_ForcedAction);
void TIM_CCPreloadControl(TIM_TypeDef* TIMx, FunctionalState NewState);
void TIM_OC1PreloadConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPreload);
void TIM_OC2PreloadConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPreload);
void TIM_OC3PreloadConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPreload);
void TIM_OC4PreloadConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPreload);
void TIM_OC1FastConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCFast);
void TIM_OC2FastConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCFast);
void TIM_OC3FastConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCFast);
void TIM_OC4FastConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCFast);
void TIM_ClearOC1Ref(TIM_TypeDef* TIMx, uint16_t TIM_OCClear);
void TIM_ClearOC2Ref(TIM_TypeDef* TIMx, uint16_t TIM_OCClear);
void TIM_ClearOC3Ref(TIM_TypeDef* TIMx, uint16_t TIM_OCClear);
void TIM_ClearOC4Ref(TIM_TypeDef* TIMx, uint16_t TIM_OCClear);
void TIM_OC1PolarityConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPolarity);
void TIM_OC1NPolarityConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCNPolarity);
void TIM_OC2PolarityConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPolarity);
void TIM_OC2NPolarityConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCNPolarity);
void TIM_OC3PolarityConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPolarity);
void TIM_OC3NPolarityConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCNPolarity);
void TIM_OC4PolarityConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPolarity);
void TIM_SelectOCREFClear(TIM_TypeDef* TIMx, uint16_t TIM_OCReferenceClear);
void TIM_CCxCmd(TIM_TypeDef* TIMx, uint16_t TIM_Channel, uint16_t TIM_CCx);
void TIM_CCxNCmd(TIM_TypeDef* TIMx, uint16_t TIM_Channel, uint16_t TIM_CCxN);
void TIM_SelectCOM(TIM_TypeDef* TIMx, FunctionalState NewState);

 
void TIM_ICInit(TIM_TypeDef* TIMx, TIM_ICInitTypeDef* TIM_ICInitStruct);
void TIM_ICStructInit(TIM_ICInitTypeDef* TIM_ICInitStruct);
void TIM_PWMIConfig(TIM_TypeDef* TIMx, TIM_ICInitTypeDef* TIM_ICInitStruct);
uint32_t TIM_GetCapture1(TIM_TypeDef* TIMx);
uint32_t TIM_GetCapture2(TIM_TypeDef* TIMx);
uint32_t TIM_GetCapture3(TIM_TypeDef* TIMx);
uint32_t TIM_GetCapture4(TIM_TypeDef* TIMx);
void TIM_SetIC1Prescaler(TIM_TypeDef* TIMx, uint16_t TIM_ICPSC);
void TIM_SetIC2Prescaler(TIM_TypeDef* TIMx, uint16_t TIM_ICPSC);
void TIM_SetIC3Prescaler(TIM_TypeDef* TIMx, uint16_t TIM_ICPSC);
void TIM_SetIC4Prescaler(TIM_TypeDef* TIMx, uint16_t TIM_ICPSC);

 
void TIM_ITConfig(TIM_TypeDef* TIMx, uint16_t TIM_IT, FunctionalState NewState);
void TIM_GenerateEvent(TIM_TypeDef* TIMx, uint16_t TIM_EventSource);
FlagStatus TIM_GetFlagStatus(TIM_TypeDef* TIMx, uint16_t TIM_FLAG);
void TIM_ClearFlag(TIM_TypeDef* TIMx, uint16_t TIM_FLAG);
ITStatus TIM_GetITStatus(TIM_TypeDef* TIMx, uint16_t TIM_IT);
void TIM_ClearITPendingBit(TIM_TypeDef* TIMx, uint16_t TIM_IT);
void TIM_DMAConfig(TIM_TypeDef* TIMx, uint16_t TIM_DMABase, uint16_t TIM_DMABurstLength);
void TIM_DMACmd(TIM_TypeDef* TIMx, uint16_t TIM_DMASource, FunctionalState NewState);
void TIM_SelectCCDMA(TIM_TypeDef* TIMx, FunctionalState NewState);

 
void TIM_InternalClockConfig(TIM_TypeDef* TIMx);
void TIM_ITRxExternalClockConfig(TIM_TypeDef* TIMx, uint16_t TIM_InputTriggerSource);
void TIM_TIxExternalClockConfig(TIM_TypeDef* TIMx, uint16_t TIM_TIxExternalCLKSource,
                                uint16_t TIM_ICPolarity, uint16_t ICFilter);
void TIM_ETRClockMode1Config(TIM_TypeDef* TIMx, uint16_t TIM_ExtTRGPrescaler, uint16_t TIM_ExtTRGPolarity,
                             uint16_t ExtTRGFilter);
void TIM_ETRClockMode2Config(TIM_TypeDef* TIMx, uint16_t TIM_ExtTRGPrescaler, 
                             uint16_t TIM_ExtTRGPolarity, uint16_t ExtTRGFilter);


 
void TIM_SelectInputTrigger(TIM_TypeDef* TIMx, uint16_t TIM_InputTriggerSource);
void TIM_SelectOutputTrigger(TIM_TypeDef* TIMx, uint16_t TIM_TRGOSource);
void TIM_SelectSlaveMode(TIM_TypeDef* TIMx, uint16_t TIM_SlaveMode);
void TIM_SelectMasterSlaveMode(TIM_TypeDef* TIMx, uint16_t TIM_MasterSlaveMode);
void TIM_ETRConfig(TIM_TypeDef* TIMx, uint16_t TIM_ExtTRGPrescaler, uint16_t TIM_ExtTRGPolarity,
                   uint16_t ExtTRGFilter);

                    
void TIM_EncoderInterfaceConfig(TIM_TypeDef* TIMx, uint16_t TIM_EncoderMode,
                                uint16_t TIM_IC1Polarity, uint16_t TIM_IC2Polarity);
void TIM_SelectHallSensor(TIM_TypeDef* TIMx, FunctionalState NewState);

 
void TIM_RemapConfig(TIM_TypeDef* TIMx, uint16_t TIM_Remap);










  



 

 
# 22 "..\\FTLib\\Src\\ft32f0xx_tim.c"
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









 



  

 
# 23 "..\\FTLib\\Src\\ft32f0xx_tim.c"


 




  

static void TI1_Config(TIM_TypeDef* TIMx, uint16_t TIM_ICPolarity, uint16_t TIM_ICSelection,
                       uint16_t TIM_ICFilter);
static void TI2_Config(TIM_TypeDef* TIMx, uint16_t TIM_ICPolarity, uint16_t TIM_ICSelection,
                       uint16_t TIM_ICFilter);
static void TI3_Config(TIM_TypeDef* TIMx, uint16_t TIM_ICPolarity, uint16_t TIM_ICSelection,
                       uint16_t TIM_ICFilter);
static void TI4_Config(TIM_TypeDef* TIMx, uint16_t TIM_ICPolarity, uint16_t TIM_ICSelection,
                       uint16_t TIM_ICFilter);






 
void TIM_DeInit(TIM_TypeDef* TIMx)
{
   
  ((void)0); 

  if (TIMx == ((TIM_TypeDef *) (((uint32_t)0x40000000) + 0x00012C00)))
  {
    RCC_APB2PeriphResetCmd(((uint32_t)0x00000800), ENABLE);
    RCC_APB2PeriphResetCmd(((uint32_t)0x00000800), DISABLE);  
  }     





  else if (TIMx == ((TIM_TypeDef *) (((uint32_t)0x40000000) + 0x00000400)))
  {
    RCC_APB1PeriphResetCmd(((uint32_t)0x00000002), ENABLE);
    RCC_APB1PeriphResetCmd(((uint32_t)0x00000002), DISABLE);
  }
  else if (TIMx == ((TIM_TypeDef *) (((uint32_t)0x40000000) + 0x00001000)))
  {
    RCC_APB1PeriphResetCmd(((uint32_t)0x00000010), ENABLE);
    RCC_APB1PeriphResetCmd(((uint32_t)0x00000010), DISABLE);
  } 





  else if (TIMx == ((TIM_TypeDef *) (((uint32_t)0x40000000) + 0x00002000))) 
  {       
    RCC_APB1PeriphResetCmd(((uint32_t)0x00000100), ENABLE);
    RCC_APB1PeriphResetCmd(((uint32_t)0x00000100), DISABLE);  
  }        
  else if (TIMx == ((TIM_TypeDef *) (((uint32_t)0x40000000) + 0x00014000)))
  {
    RCC_APB2PeriphResetCmd(((uint32_t)0x00010000), ENABLE);
    RCC_APB2PeriphResetCmd(((uint32_t)0x00010000), DISABLE);
  } 
  else if (TIMx == ((TIM_TypeDef *) (((uint32_t)0x40000000) + 0x00014400)))
  {
    RCC_APB2PeriphResetCmd(((uint32_t)0x00020000), ENABLE);
    RCC_APB2PeriphResetCmd(((uint32_t)0x00020000), DISABLE);
  } 
  else
  {
    if (TIMx == ((TIM_TypeDef *) (((uint32_t)0x40000000) + 0x00014800)))
    {
      RCC_APB2PeriphResetCmd(((uint32_t)0x00040000), ENABLE);
      RCC_APB2PeriphResetCmd(((uint32_t)0x00040000), DISABLE);
    }  
  }
     
}










 
void TIM_TimeBaseInit(TIM_TypeDef* TIMx, TIM_TimeBaseInitTypeDef* TIM_TimeBaseInitStruct)
{
  uint16_t tmpcr1 = 0;

   
  ((void)0); 
  ((void)0);
  ((void)0);

  tmpcr1 = TIMx->CR1;  

  if((TIMx == ((TIM_TypeDef *) (((uint32_t)0x40000000) + 0x00012C00))) || (TIMx == ((TIM_TypeDef *) (((uint32_t)0x40000000) + 0x00000000))) || (TIMx == ((TIM_TypeDef *) (((uint32_t)0x40000000) + 0x00000400))))
  {
     
    tmpcr1 &= (uint16_t)(~((uint16_t)(((uint16_t)0x0010) | ((uint16_t)0x0060))));
    tmpcr1 |= (uint32_t)TIM_TimeBaseInitStruct->TIM_CounterMode;
  }
 
  if(TIMx != ((TIM_TypeDef *) (((uint32_t)0x40000000) + 0x00001000)))
  {
     
    tmpcr1 &= (uint16_t)(~((uint16_t)((uint16_t)0x0300)));
    tmpcr1 |= (uint32_t)TIM_TimeBaseInitStruct->TIM_ClockDivision;
  }

  TIMx->CR1 = tmpcr1;

   
  TIMx->ARR = TIM_TimeBaseInitStruct->TIM_Period ;
 
   
  TIMx->PSC = TIM_TimeBaseInitStruct->TIM_Prescaler;
    
  if ((TIMx == ((TIM_TypeDef *) (((uint32_t)0x40000000) + 0x00012C00))) || (TIMx == ((TIM_TypeDef *) (((uint32_t)0x40000000) + 0x00014000)))|| (TIMx == ((TIM_TypeDef *) (((uint32_t)0x40000000) + 0x00014400))) || (TIMx == ((TIM_TypeDef *) (((uint32_t)0x40000000) + 0x00014800))))  
  {
     
    TIMx->RCR = TIM_TimeBaseInitStruct->TIM_RepetitionCounter;
  }

  
 
  TIMx->EGR = ((uint16_t)0x0001);           
}






 
void TIM_TimeBaseStructInit(TIM_TimeBaseInitTypeDef* TIM_TimeBaseInitStruct)
{
   
  TIM_TimeBaseInitStruct->TIM_Period = 0xFFFFFFFF;
  TIM_TimeBaseInitStruct->TIM_Prescaler = 0x0000;
  TIM_TimeBaseInitStruct->TIM_ClockDivision = ((uint16_t)0x0000);
  TIM_TimeBaseInitStruct->TIM_CounterMode = ((uint16_t)0x0000);
  TIM_TimeBaseInitStruct->TIM_RepetitionCounter = 0x0000;
}










 
void TIM_PrescalerConfig(TIM_TypeDef* TIMx, uint16_t Prescaler, uint16_t TIM_PSCReloadMode)
{
   
  ((void)0);
  ((void)0);
  
   
  TIMx->PSC = Prescaler;
   
  TIMx->EGR = TIM_PSCReloadMode;
}












 
void TIM_CounterModeConfig(TIM_TypeDef* TIMx, uint16_t TIM_CounterMode)
{
  uint16_t tmpcr1 = 0;
  
   
  ((void)0);
  ((void)0);
  
  tmpcr1 = TIMx->CR1;
   
  tmpcr1 &= (uint16_t)(~((uint16_t)(((uint16_t)0x0010) | ((uint16_t)0x0060))));
   
  tmpcr1 |= TIM_CounterMode;
   
  TIMx->CR1 = tmpcr1;
}







 
void TIM_SetCounter(TIM_TypeDef* TIMx, uint32_t Counter)
{
   
   ((void)0);
   
   
  TIMx->CNT = Counter;
}






 
void TIM_SetAutoreload(TIM_TypeDef* TIMx, uint32_t Autoreload)
{
   
  ((void)0);
  
   
  TIMx->ARR = Autoreload;
}






 
uint32_t TIM_GetCounter(TIM_TypeDef* TIMx)
{
   
  ((void)0);
  
   
  return TIMx->CNT;
}






 
uint16_t TIM_GetPrescaler(TIM_TypeDef* TIMx)
{
   
  ((void)0);
  
   
  return TIMx->PSC;
}








 
void TIM_UpdateDisableConfig(TIM_TypeDef* TIMx, FunctionalState NewState)
{
   
  ((void)0);
  ((void)0);
  
  if (NewState != DISABLE)
  {
     
    TIMx->CR1 |= ((uint16_t)0x0002);
  }
  else
  {
     
    TIMx->CR1 &= (uint16_t)~((uint16_t)((uint16_t)0x0002));
  }
}












 
void TIM_UpdateRequestConfig(TIM_TypeDef* TIMx, uint16_t TIM_UpdateSource)
{
   
  ((void)0);
  ((void)0);
  
  if (TIM_UpdateSource != ((uint16_t)0x0000))
  {
     
    TIMx->CR1 |= ((uint16_t)0x0004);
  }
  else
  {
     
    TIMx->CR1 &= (uint16_t)~((uint16_t)((uint16_t)0x0004));
  }
}








 
void TIM_ARRPreloadConfig(TIM_TypeDef* TIMx, FunctionalState NewState)
{
   
  ((void)0);
  ((void)0);
  
  if (NewState != DISABLE)
  {
     
    TIMx->CR1 |= ((uint16_t)0x0080);
  }
  else
  {
     
    TIMx->CR1 &= (uint16_t)~((uint16_t)((uint16_t)0x0080));
  }
}










 
void TIM_SelectOnePulseMode(TIM_TypeDef* TIMx, uint16_t TIM_OPMode)
{
   
  ((void)0);
  ((void)0);
  
   
  TIMx->CR1 &= (uint16_t)~((uint16_t)((uint16_t)0x0008));
   
  TIMx->CR1 |= TIM_OPMode;
}










 
void TIM_SetClockDivision(TIM_TypeDef* TIMx, uint16_t TIM_CKD)
{
   
  ((void)0);
  ((void)0);
  
   
  TIMx->CR1 &= (uint16_t)~((uint16_t)((uint16_t)0x0300));
   
  TIMx->CR1 |= TIM_CKD;
}








 
void TIM_Cmd(TIM_TypeDef* TIMx, FunctionalState NewState)
{
   
  ((void)0); 
  ((void)0);
  
  if (NewState != DISABLE)
  {
     
    TIMx->CR1 |= ((uint16_t)0x0001);
  }
  else
  {
     
    TIMx->CR1 &= (uint16_t)(~((uint16_t)((uint16_t)0x0001)));
  }
}



 







 
void TIM_BDTRConfig(TIM_TypeDef* TIMx, TIM_BDTRInitTypeDef *TIM_BDTRInitStruct)
{
   
  ((void)0);
  ((void)0);
  ((void)0);
  ((void)0);
  ((void)0);
  ((void)0);
  ((void)0);
  
 
  TIMx->BDTR = (uint32_t)TIM_BDTRInitStruct->TIM_OSSRState | TIM_BDTRInitStruct->TIM_OSSIState |
             TIM_BDTRInitStruct->TIM_LOCKLevel | TIM_BDTRInitStruct->TIM_DeadTime |
             TIM_BDTRInitStruct->TIM_Break | TIM_BDTRInitStruct->TIM_BreakPolarity |
             TIM_BDTRInitStruct->TIM_AutomaticOutput;
}






 
void TIM_BDTRStructInit(TIM_BDTRInitTypeDef* TIM_BDTRInitStruct)
{
   
  TIM_BDTRInitStruct->TIM_OSSRState = ((uint16_t)0x0000);
  TIM_BDTRInitStruct->TIM_OSSIState = ((uint16_t)0x0000);
  TIM_BDTRInitStruct->TIM_LOCKLevel = ((uint16_t)0x0000);
  TIM_BDTRInitStruct->TIM_DeadTime = 0x00;
  TIM_BDTRInitStruct->TIM_Break = ((uint16_t)0x0000);
  TIM_BDTRInitStruct->TIM_BreakPolarity = ((uint16_t)0x0000);
  TIM_BDTRInitStruct->TIM_AutomaticOutput = ((uint16_t)0x0000);
}







 
void TIM_CtrlPWMOutputs(TIM_TypeDef* TIMx, FunctionalState NewState)
{
   
  ((void)0);
  ((void)0);
  if (NewState != DISABLE)
  {
     
    TIMx->BDTR |= ((uint16_t)0x8000);
  }
  else
  {
     
    TIMx->BDTR &= (uint16_t)(~((uint16_t)((uint16_t)0x8000)));
  }  
}



 









 
void TIM_OC1Init(TIM_TypeDef* TIMx, TIM_OCInitTypeDef* TIM_OCInitStruct)
{
  uint16_t tmpccmrx = 0, tmpccer = 0, tmpcr2 = 0;
   
   
  ((void)0);
  ((void)0);
  ((void)0);
  ((void)0);   
  
  TIMx->CCER &= (uint16_t)(~(uint16_t)((uint16_t)0x0001));
   
  tmpccer = TIMx->CCER;
   
  tmpcr2 =  TIMx->CR2;
  
   
  tmpccmrx = TIMx->CCMR1;
    
   
  tmpccmrx &= (uint16_t)(~((uint16_t)((uint16_t)0x0070)));
  tmpccmrx &= (uint16_t)(~((uint16_t)((uint16_t)0x0003)));

   
  tmpccmrx |= TIM_OCInitStruct->TIM_OCMode;
  
   
  tmpccer &= (uint16_t)(~((uint16_t)((uint16_t)0x0002)));
   
  tmpccer |= TIM_OCInitStruct->TIM_OCPolarity;
  
   
  tmpccer |= TIM_OCInitStruct->TIM_OutputState;
    
  if((TIMx == ((TIM_TypeDef *) (((uint32_t)0x40000000) + 0x00012C00))) || (TIMx == ((TIM_TypeDef *) (((uint32_t)0x40000000) + 0x00014000))) || (TIMx == ((TIM_TypeDef *) (((uint32_t)0x40000000) + 0x00014400))) || (TIMx == ((TIM_TypeDef *) (((uint32_t)0x40000000) + 0x00014800))))
  {
    ((void)0);
    ((void)0);
    ((void)0);
    ((void)0);
    
     
    tmpccer &= (uint16_t)(~((uint16_t)((uint16_t)0x0008)));
     
    tmpccer |= TIM_OCInitStruct->TIM_OCNPolarity;
    
     
    tmpccer &= (uint16_t)(~((uint16_t)((uint16_t)0x0004)));    
     
    tmpccer |= TIM_OCInitStruct->TIM_OutputNState;
    
     
    tmpcr2 &= (uint16_t)(~((uint16_t)((uint16_t)0x0100)));
    tmpcr2 &= (uint16_t)(~((uint16_t)((uint16_t)0x0200)));
    
     
    tmpcr2 |= TIM_OCInitStruct->TIM_OCIdleState;
     
    tmpcr2 |= TIM_OCInitStruct->TIM_OCNIdleState;
  }
   
  TIMx->CR2 = tmpcr2;
  
   
  TIMx->CCMR1 = tmpccmrx;

   
  TIMx->CCR1 = TIM_OCInitStruct->TIM_Pulse; 
 
   
  TIMx->CCER = tmpccer;
}









 
void TIM_OC2Init(TIM_TypeDef* TIMx, TIM_OCInitTypeDef* TIM_OCInitStruct)
{
  uint16_t tmpccmrx = 0, tmpccer = 0, tmpcr2 = 0;
   
   
  ((void)0); 
  ((void)0);
  ((void)0);
  ((void)0);   
    
  TIMx->CCER &= (uint16_t)(~((uint16_t)((uint16_t)0x0010)));
  
     
  tmpccer = TIMx->CCER;
   
  tmpcr2 =  TIMx->CR2;
  
   
  tmpccmrx = TIMx->CCMR1;
    
   
  tmpccmrx &= (uint16_t)(~((uint16_t)((uint16_t)0x7000)));
  tmpccmrx &= (uint16_t)(~((uint16_t)((uint16_t)0x0300)));
  
   
  tmpccmrx |= (uint16_t)(TIM_OCInitStruct->TIM_OCMode << 8);
  
   
  tmpccer &= (uint16_t)(~((uint16_t)((uint16_t)0x0020)));
   
  tmpccer |= (uint16_t)(TIM_OCInitStruct->TIM_OCPolarity << 4);
  
   
  tmpccer |= (uint16_t)(TIM_OCInitStruct->TIM_OutputState << 4);
    
  if((TIMx == ((TIM_TypeDef *) (((uint32_t)0x40000000) + 0x00012C00))) || (TIMx == ((TIM_TypeDef *) (((uint32_t)0x40000000) + 0x00014000))))
  {
     
    ((void)0);
    
     
    tmpcr2 &= (uint16_t)(~((uint16_t)((uint16_t)0x0400)));
    
     
    tmpcr2 |= (uint16_t)(TIM_OCInitStruct->TIM_OCIdleState << 2);
    
    if (TIMx == ((TIM_TypeDef *) (((uint32_t)0x40000000) + 0x00012C00)))
    {    
       
      ((void)0);
      ((void)0);
      ((void)0);
      
       
      tmpccer &= (uint16_t)(~((uint16_t)((uint16_t)0x0080)));
       
      tmpccer |= (uint16_t)(TIM_OCInitStruct->TIM_OCNPolarity << 4);
      
       
      tmpccer &= (uint16_t)(~((uint16_t)((uint16_t)0x0040)));    
       
      tmpccer |= (uint16_t)(TIM_OCInitStruct->TIM_OutputNState << 4);
      
       
      tmpcr2 &= (uint16_t)(~((uint16_t)((uint16_t)0x0800)));
      
       
      tmpcr2 |= (uint16_t)(TIM_OCInitStruct->TIM_OCNIdleState << 2);
    }
  }
   
  TIMx->CR2 = tmpcr2;
  
   
  TIMx->CCMR1 = tmpccmrx;

   
  TIMx->CCR2 = TIM_OCInitStruct->TIM_Pulse;
  
   
  TIMx->CCER = tmpccer;
}









 
void TIM_OC3Init(TIM_TypeDef* TIMx, TIM_OCInitTypeDef* TIM_OCInitStruct)
{
  uint16_t tmpccmrx = 0, tmpccer = 0, tmpcr2 = 0;
   
   
  ((void)0); 
  ((void)0);
  ((void)0);
  ((void)0);   
   
  TIMx->CCER &= (uint16_t)(~((uint16_t)((uint16_t)0x0100)));
  
   
  tmpccer = TIMx->CCER;
   
  tmpcr2 =  TIMx->CR2;
  
   
  tmpccmrx = TIMx->CCMR2;
    
   
  tmpccmrx &= (uint16_t)(~((uint16_t)((uint16_t)0x0070)));
  tmpccmrx &= (uint16_t)(~((uint16_t)((uint16_t)0x0003)));  
   
  tmpccmrx |= TIM_OCInitStruct->TIM_OCMode;
  
   
  tmpccer &= (uint16_t)(~((uint16_t)((uint16_t)0x0200)));
   
  tmpccer |= (uint16_t)(TIM_OCInitStruct->TIM_OCPolarity << 8);
  
   
  tmpccer |= (uint16_t)(TIM_OCInitStruct->TIM_OutputState << 8);
    
  if(TIMx == ((TIM_TypeDef *) (((uint32_t)0x40000000) + 0x00012C00)))
  {
    ((void)0);
    ((void)0);
    ((void)0);
    ((void)0);
    
     
    tmpccer &= (uint16_t)(~((uint16_t)((uint16_t)0x0800)));
     
    tmpccer |= (uint16_t)(TIM_OCInitStruct->TIM_OCNPolarity << 8);
     
    tmpccer &= (uint16_t)(~((uint16_t)((uint16_t)0x0400)));
    
     
    tmpccer |= (uint16_t)(TIM_OCInitStruct->TIM_OutputNState << 8);
     
    tmpcr2 &= (uint16_t)(~((uint16_t)((uint16_t)0x1000)));
    tmpcr2 &= (uint16_t)(~((uint16_t)((uint16_t)0x2000)));
     
    tmpcr2 |= (uint16_t)(TIM_OCInitStruct->TIM_OCIdleState << 4);
     
    tmpcr2 |= (uint16_t)(TIM_OCInitStruct->TIM_OCNIdleState << 4);
  }
   
  TIMx->CR2 = tmpcr2;
  
   
  TIMx->CCMR2 = tmpccmrx;

   
  TIMx->CCR3 = TIM_OCInitStruct->TIM_Pulse;
  
   
  TIMx->CCER = tmpccer;
}









 
void TIM_OC4Init(TIM_TypeDef* TIMx, TIM_OCInitTypeDef* TIM_OCInitStruct)
{
  uint16_t tmpccmrx = 0, tmpccer = 0, tmpcr2 = 0;
   
   
  ((void)0); 
  ((void)0);
  ((void)0);
  ((void)0);   
   
  TIMx->CCER &= (uint16_t)(~((uint16_t)((uint16_t)0x1000)));
  
   
  tmpccer = TIMx->CCER;
   
  tmpcr2 =  TIMx->CR2;
  
   
  tmpccmrx = TIMx->CCMR2;
    
   
  tmpccmrx &= (uint16_t)(~((uint16_t)((uint16_t)0x7000)));
  tmpccmrx &= (uint16_t)(~((uint16_t)((uint16_t)0x0300)));
  
   
  tmpccmrx |= (uint16_t)(TIM_OCInitStruct->TIM_OCMode << 8);
  
   
  tmpccer &= (uint16_t)(~((uint16_t)((uint16_t)0x2000)));
   
  tmpccer |= (uint16_t)(TIM_OCInitStruct->TIM_OCPolarity << 12);
  
   
  tmpccer |= (uint16_t)(TIM_OCInitStruct->TIM_OutputState << 12);
    
  if(TIMx == ((TIM_TypeDef *) (((uint32_t)0x40000000) + 0x00012C00)))
  {
    ((void)0);
     
    tmpcr2 &= (uint16_t)(~((uint16_t)((uint16_t)0x4000)));
     
    tmpcr2 |= (uint16_t)(TIM_OCInitStruct->TIM_OCIdleState << 6);
  }
   
  TIMx->CR2 = tmpcr2;
  
     
  TIMx->CCMR2 = tmpccmrx;

   
  TIMx->CCR4 = TIM_OCInitStruct->TIM_Pulse;
  
   
  TIMx->CCER = tmpccer;
}






 
void TIM_OCStructInit(TIM_OCInitTypeDef* TIM_OCInitStruct)
{
   
  TIM_OCInitStruct->TIM_OCMode = ((uint16_t)0x0000);
  TIM_OCInitStruct->TIM_OutputState = ((uint16_t)0x0000);
  TIM_OCInitStruct->TIM_OutputNState = ((uint16_t)0x0000);
  TIM_OCInitStruct->TIM_Pulse = 0x0000000;
  TIM_OCInitStruct->TIM_OCPolarity = ((uint16_t)0x0000);
  TIM_OCInitStruct->TIM_OCNPolarity = ((uint16_t)0x0000);
  TIM_OCInitStruct->TIM_OCIdleState = ((uint16_t)0x0000);
  TIM_OCInitStruct->TIM_OCNIdleState = ((uint16_t)0x0000);
}























 
void TIM_SelectOCxM(TIM_TypeDef* TIMx, uint16_t TIM_Channel, uint16_t TIM_OCMode)
{
  uint32_t tmp = 0;
  uint16_t tmp1 = 0;

   
  ((void)0);  
  ((void)0);
  
  tmp = (uint32_t) TIMx;
  tmp += ((uint16_t)0x0018);

  tmp1 = ((uint16_t)0x0001) << (uint16_t)TIM_Channel;

   
  TIMx->CCER &= (uint16_t) ~tmp1;

  if((TIM_Channel == ((uint16_t)0x0000)) ||(TIM_Channel == ((uint16_t)0x0008)))
  {
    tmp += (TIM_Channel>>1);

     
    *(volatile uint32_t *) tmp &= (uint32_t)~((uint32_t)((uint16_t)0x0070));
   
     
    *(volatile uint32_t *) tmp |= TIM_OCMode;
  }
  else
  {
    tmp += (uint16_t)(TIM_Channel - (uint16_t)4)>> (uint16_t)1;

     
    *(volatile uint32_t *) tmp &= (uint32_t)~((uint32_t)((uint16_t)0x7000));
    
     
    *(volatile uint32_t *) tmp |= (uint16_t)(TIM_OCMode << 8);
  }
}






 
void TIM_SetCompare1(TIM_TypeDef* TIMx, uint32_t Compare1)
{
   
  ((void)0);
  
   
  TIMx->CCR1 = Compare1;
}






 
void TIM_SetCompare2(TIM_TypeDef* TIMx, uint32_t Compare2)
{
   
  ((void)0);
  
   
  TIMx->CCR2 = Compare2;
}






 
void TIM_SetCompare3(TIM_TypeDef* TIMx, uint32_t Compare3)
{
   
  ((void)0);
  
   
  TIMx->CCR3 = Compare3;
}






 
void TIM_SetCompare4(TIM_TypeDef* TIMx, uint32_t Compare4)
{
   
  ((void)0);
  
   
  TIMx->CCR4 = Compare4;
}









 
void TIM_ForcedOC1Config(TIM_TypeDef* TIMx, uint16_t TIM_ForcedAction)
{
  uint16_t tmpccmr1 = 0;
   
  ((void)0);
  ((void)0);
  tmpccmr1 = TIMx->CCMR1;
   
  tmpccmr1 &= (uint16_t)~((uint16_t)((uint16_t)0x0070));
   
  tmpccmr1 |= TIM_ForcedAction;
   
  TIMx->CCMR1 = tmpccmr1;
}
 








 
void TIM_ForcedOC2Config(TIM_TypeDef* TIMx, uint16_t TIM_ForcedAction)
{
  uint16_t tmpccmr1 = 0;
  
   
  ((void)0);
  ((void)0);
  
  tmpccmr1 = TIMx->CCMR1;
   
  tmpccmr1 &= (uint16_t)~((uint16_t)((uint16_t)0x7000));
   
  tmpccmr1 |= (uint16_t)(TIM_ForcedAction << 8);
   
  TIMx->CCMR1 = tmpccmr1;
}









 
void TIM_ForcedOC3Config(TIM_TypeDef* TIMx, uint16_t TIM_ForcedAction)
{
  uint16_t tmpccmr2 = 0;
  
   
  ((void)0);
  ((void)0);
  
  tmpccmr2 = TIMx->CCMR2;
   
  tmpccmr2 &= (uint16_t)~((uint16_t)((uint16_t)0x0070));
   
  tmpccmr2 |= TIM_ForcedAction;
   
  TIMx->CCMR2 = tmpccmr2;
}









 
void TIM_ForcedOC4Config(TIM_TypeDef* TIMx, uint16_t TIM_ForcedAction)
{
  uint16_t tmpccmr2 = 0;
   
  ((void)0);
  ((void)0);
  
  tmpccmr2 = TIMx->CCMR2;
   
  tmpccmr2 &= (uint16_t)~((uint16_t)((uint16_t)0x7000));
   
  tmpccmr2 |= (uint16_t)(TIM_ForcedAction << 8);
   
  TIMx->CCMR2 = tmpccmr2;
}







 
void TIM_CCPreloadControl(TIM_TypeDef* TIMx, FunctionalState NewState)
{ 
   
  ((void)0);
  ((void)0);
  if (NewState != DISABLE)
  {
     
    TIMx->CR2 |= ((uint16_t)0x0001);
  }
  else
  {
     
    TIMx->CR2 &= (uint16_t)~((uint16_t)((uint16_t)0x0001));
  }
}










 
void TIM_OC1PreloadConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPreload)
{
  uint16_t tmpccmr1 = 0;
   
  ((void)0);
  ((void)0);
  
  tmpccmr1 = TIMx->CCMR1;
   
  tmpccmr1 &= (uint16_t)~((uint16_t)((uint16_t)0x0008));
   
  tmpccmr1 |= TIM_OCPreload;
   
  TIMx->CCMR1 = tmpccmr1;
}









 
void TIM_OC2PreloadConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPreload)
{
  uint16_t tmpccmr1 = 0;
   
  ((void)0);
  ((void)0);
  
  tmpccmr1 = TIMx->CCMR1;
   
  tmpccmr1 &= (uint16_t)~((uint16_t)((uint16_t)0x0800));
   
  tmpccmr1 |= (uint16_t)(TIM_OCPreload << 8);
   
  TIMx->CCMR1 = tmpccmr1;
}









 
void TIM_OC3PreloadConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPreload)
{
  uint16_t tmpccmr2 = 0;
  
   
  ((void)0);
  ((void)0);
  
  tmpccmr2 = TIMx->CCMR2;
   
  tmpccmr2 &= (uint16_t)~((uint16_t)((uint16_t)0x0008));
   
  tmpccmr2 |= TIM_OCPreload;
   
  TIMx->CCMR2 = tmpccmr2;
}









 
void TIM_OC4PreloadConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPreload)
{
  uint16_t tmpccmr2 = 0;
  
   
  ((void)0);
  ((void)0);
  
  tmpccmr2 = TIMx->CCMR2;
   
  tmpccmr2 &= (uint16_t)~((uint16_t)((uint16_t)0x0800));
   
  tmpccmr2 |= (uint16_t)(TIM_OCPreload << 8);
   
  TIMx->CCMR2 = tmpccmr2;
}









 
void TIM_OC1FastConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCFast)
{
  uint16_t tmpccmr1 = 0;
  
   
  ((void)0);
  ((void)0);
  
   
  tmpccmr1 = TIMx->CCMR1;
   
  tmpccmr1 &= (uint16_t)~((uint16_t)((uint16_t)0x0004));
   
  tmpccmr1 |= TIM_OCFast;
   
  TIMx->CCMR1 = tmpccmr1;
}









 
void TIM_OC2FastConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCFast)
{
  uint16_t tmpccmr1 = 0;
  
   
  ((void)0);
  ((void)0);
  
   
  tmpccmr1 = TIMx->CCMR1;
   
  tmpccmr1 &= (uint16_t)~((uint16_t)((uint16_t)0x0400));
   
  tmpccmr1 |= (uint16_t)(TIM_OCFast << 8);
   
  TIMx->CCMR1 = tmpccmr1;
}









 
void TIM_OC3FastConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCFast)
{
  uint16_t tmpccmr2 = 0;
  
   
  ((void)0);
  ((void)0);
  
   
  tmpccmr2 = TIMx->CCMR2;
   
  tmpccmr2 &= (uint16_t)~((uint16_t)((uint16_t)0x0004));
   
  tmpccmr2 |= TIM_OCFast;
   
  TIMx->CCMR2 = tmpccmr2;
}









 
void TIM_OC4FastConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCFast)
{
  uint16_t tmpccmr2 = 0;
  
   
  ((void)0);
  ((void)0);
  
   
  tmpccmr2 = TIMx->CCMR2;
   
  tmpccmr2 &= (uint16_t)~((uint16_t)((uint16_t)0x0400));
   
  tmpccmr2 |= (uint16_t)(TIM_OCFast << 8);
   
  TIMx->CCMR2 = tmpccmr2;
}









 
void TIM_ClearOC1Ref(TIM_TypeDef* TIMx, uint16_t TIM_OCClear)
{
  uint16_t tmpccmr1 = 0;
  
   
  ((void)0);
  ((void)0);
  
  tmpccmr1 = TIMx->CCMR1;
   
  tmpccmr1 &= (uint16_t)~((uint16_t)((uint16_t)0x0080));
   
  tmpccmr1 |= TIM_OCClear;
   
  TIMx->CCMR1 = tmpccmr1;
}









 
void TIM_ClearOC2Ref(TIM_TypeDef* TIMx, uint16_t TIM_OCClear)
{
  uint16_t tmpccmr1 = 0;
  
   
  ((void)0);
  ((void)0);
  
  tmpccmr1 = TIMx->CCMR1;
   
  tmpccmr1 &= (uint16_t)~((uint16_t)((uint16_t)0x8000));
   
  tmpccmr1 |= (uint16_t)(TIM_OCClear << 8);
   
  TIMx->CCMR1 = tmpccmr1;
}









 
void TIM_ClearOC3Ref(TIM_TypeDef* TIMx, uint16_t TIM_OCClear)
{
  uint16_t tmpccmr2 = 0;
  
   
  ((void)0);
  ((void)0);
  
  tmpccmr2 = TIMx->CCMR2;
   
  tmpccmr2 &= (uint16_t)~((uint16_t)((uint16_t)0x0080));
   
  tmpccmr2 |= TIM_OCClear;
   
  TIMx->CCMR2 = tmpccmr2;
}









 
void TIM_ClearOC4Ref(TIM_TypeDef* TIMx, uint16_t TIM_OCClear)
{
  uint16_t tmpccmr2 = 0;
  
   
  ((void)0);
  ((void)0);
  
  tmpccmr2 = TIMx->CCMR2;
   
  tmpccmr2 &= (uint16_t)~((uint16_t)((uint16_t)0x8000));
   
  tmpccmr2 |= (uint16_t)(TIM_OCClear << 8);
   
  TIMx->CCMR2 = tmpccmr2;
}









 
void TIM_OC1PolarityConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPolarity)
{
  uint16_t tmpccer = 0;
  
   
  ((void)0);
  ((void)0);
  
  tmpccer = TIMx->CCER;
   
  tmpccer &= (uint16_t)~((uint16_t)((uint16_t)0x0002));
  tmpccer |= TIM_OCPolarity;
   
  TIMx->CCER = tmpccer;
}









 
void TIM_OC1NPolarityConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCNPolarity)
{
  uint16_t tmpccer = 0;
   
  ((void)0);
  ((void)0);
   
  tmpccer = TIMx->CCER;
   
  tmpccer &= (uint16_t)~((uint16_t)((uint16_t)0x0008));
  tmpccer |= TIM_OCNPolarity;
   
  TIMx->CCER = tmpccer;
}









 
void TIM_OC2PolarityConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPolarity)
{
  uint16_t tmpccer = 0;
  
   
  ((void)0);
  ((void)0);
  
  tmpccer = TIMx->CCER;
   
  tmpccer &= (uint16_t)~((uint16_t)((uint16_t)0x0020));
  tmpccer |= (uint16_t)(TIM_OCPolarity << 4);
   
  TIMx->CCER = tmpccer;
}









 
void TIM_OC2NPolarityConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCNPolarity)
{
  uint16_t tmpccer = 0;
   
  ((void)0);
  ((void)0);
  
  tmpccer = TIMx->CCER;
   
  tmpccer &= (uint16_t)~((uint16_t)((uint16_t)0x0080));
  tmpccer |= (uint16_t)(TIM_OCNPolarity << 4);
   
  TIMx->CCER = tmpccer;
}









 
void TIM_OC3PolarityConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPolarity)
{
  uint16_t tmpccer = 0;
  
   
  ((void)0);
  ((void)0);
  
  tmpccer = TIMx->CCER;
   
  tmpccer &= (uint16_t)~((uint16_t)((uint16_t)0x0200));
  tmpccer |= (uint16_t)(TIM_OCPolarity << 8);
   
  TIMx->CCER = tmpccer;
}









 
void TIM_OC3NPolarityConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCNPolarity)
{
  uint16_t tmpccer = 0;
 
   
  ((void)0);
  ((void)0);
    
  tmpccer = TIMx->CCER;
   
  tmpccer &= (uint16_t)~((uint16_t)((uint16_t)0x0800));
  tmpccer |= (uint16_t)(TIM_OCNPolarity << 8);
   
  TIMx->CCER = tmpccer;
}









 
void TIM_OC4PolarityConfig(TIM_TypeDef* TIMx, uint16_t TIM_OCPolarity)
{
  uint16_t tmpccer = 0;
  
   
  ((void)0);
  ((void)0);
  
  tmpccer = TIMx->CCER;
   
  tmpccer &= (uint16_t)~((uint16_t)((uint16_t)0x2000));
  tmpccer |= (uint16_t)(TIM_OCPolarity << 12);
   
  TIMx->CCER = tmpccer;
}









 
void TIM_SelectOCREFClear(TIM_TypeDef* TIMx, uint16_t TIM_OCReferenceClear)
{
   
  ((void)0);
  ((void)0);

   
  TIMx->SMCR &=  (uint16_t)~((uint16_t)((uint16_t)0x0008));
  TIMx->SMCR |=  TIM_OCReferenceClear;
}













 
void TIM_CCxCmd(TIM_TypeDef* TIMx, uint16_t TIM_Channel, uint16_t TIM_CCx)
{
  uint16_t tmp = 0;

   
  ((void)0); 
  ((void)0);

  tmp = ((uint16_t)0x0001) << TIM_Channel;

   
  TIMx->CCER &= (uint16_t)~ tmp;

    
  TIMx->CCER |=  (uint16_t)(TIM_CCx << TIM_Channel);
}












 
void TIM_CCxNCmd(TIM_TypeDef* TIMx, uint16_t TIM_Channel, uint16_t TIM_CCxN)
{
  uint16_t tmp = 0;

   
  ((void)0);
  ((void)0);
  ((void)0);

  tmp = ((uint16_t)0x0004) << TIM_Channel;

   
  TIMx->CCER &= (uint16_t) ~tmp;

    
  TIMx->CCER |=  (uint16_t)(TIM_CCxN << TIM_Channel);
}







 
void TIM_SelectCOM(TIM_TypeDef* TIMx, FunctionalState NewState)
{
   
  ((void)0);
  ((void)0);
  if (NewState != DISABLE)
  {
     
    TIMx->CR2 |= ((uint16_t)0x0004);
  }
  else
  {
     
    TIMx->CR2 &= (uint16_t)~((uint16_t)((uint16_t)0x0004));
  }
}



 








 
void TIM_ICInit(TIM_TypeDef* TIMx, TIM_ICInitTypeDef* TIM_ICInitStruct)
{
   
  ((void)0);
  ((void)0);  
  ((void)0);
  ((void)0);
  ((void)0);
  ((void)0);

  if (TIM_ICInitStruct->TIM_Channel == ((uint16_t)0x0000))
  {
    ((void)0);
     
    TI1_Config(TIMx, TIM_ICInitStruct->TIM_ICPolarity,
               TIM_ICInitStruct->TIM_ICSelection,
               TIM_ICInitStruct->TIM_ICFilter);
     
    TIM_SetIC1Prescaler(TIMx, TIM_ICInitStruct->TIM_ICPrescaler);
  }
  else if (TIM_ICInitStruct->TIM_Channel == ((uint16_t)0x0004))
  {
    ((void)0);
     
    TI2_Config(TIMx, TIM_ICInitStruct->TIM_ICPolarity,
               TIM_ICInitStruct->TIM_ICSelection,
               TIM_ICInitStruct->TIM_ICFilter);
     
    TIM_SetIC2Prescaler(TIMx, TIM_ICInitStruct->TIM_ICPrescaler);
  }
  else if (TIM_ICInitStruct->TIM_Channel == ((uint16_t)0x0008))
  {
    ((void)0);
     
    TI3_Config(TIMx,  TIM_ICInitStruct->TIM_ICPolarity,
               TIM_ICInitStruct->TIM_ICSelection,
               TIM_ICInitStruct->TIM_ICFilter);
     
    TIM_SetIC3Prescaler(TIMx, TIM_ICInitStruct->TIM_ICPrescaler);
  }
  else
  {
    ((void)0);
     
    TI4_Config(TIMx, TIM_ICInitStruct->TIM_ICPolarity,
               TIM_ICInitStruct->TIM_ICSelection,
               TIM_ICInitStruct->TIM_ICFilter);
     
    TIM_SetIC4Prescaler(TIMx, TIM_ICInitStruct->TIM_ICPrescaler);
  }
}






 
void TIM_ICStructInit(TIM_ICInitTypeDef* TIM_ICInitStruct)
{
   
  TIM_ICInitStruct->TIM_Channel = ((uint16_t)0x0000);
  TIM_ICInitStruct->TIM_ICPolarity = ((uint16_t)0x0000);
  TIM_ICInitStruct->TIM_ICSelection = ((uint16_t)0x0001);
  TIM_ICInitStruct->TIM_ICPrescaler = ((uint16_t)0x0000);
  TIM_ICInitStruct->TIM_ICFilter = 0x00;
}









 
void TIM_PWMIConfig(TIM_TypeDef* TIMx, TIM_ICInitTypeDef* TIM_ICInitStruct)
{
  uint16_t icoppositepolarity = ((uint16_t)0x0000);
  uint16_t icoppositeselection = ((uint16_t)0x0001);
   
  ((void)0);
   
  if (TIM_ICInitStruct->TIM_ICPolarity == ((uint16_t)0x0000))
  {
    icoppositepolarity = ((uint16_t)0x0002);
  }
  else
  {
    icoppositepolarity = ((uint16_t)0x0000);
  }
   
  if (TIM_ICInitStruct->TIM_ICSelection == ((uint16_t)0x0001))
  {
    icoppositeselection = ((uint16_t)0x0002);
  }
  else
  {
    icoppositeselection = ((uint16_t)0x0001);
  }
  if (TIM_ICInitStruct->TIM_Channel == ((uint16_t)0x0000))
  {
     
    TI1_Config(TIMx, TIM_ICInitStruct->TIM_ICPolarity, TIM_ICInitStruct->TIM_ICSelection,
               TIM_ICInitStruct->TIM_ICFilter);
     
    TIM_SetIC1Prescaler(TIMx, TIM_ICInitStruct->TIM_ICPrescaler);
     
    TI2_Config(TIMx, icoppositepolarity, icoppositeselection, TIM_ICInitStruct->TIM_ICFilter);
     
    TIM_SetIC2Prescaler(TIMx, TIM_ICInitStruct->TIM_ICPrescaler);
  }
  else
  { 
     
    TI2_Config(TIMx, TIM_ICInitStruct->TIM_ICPolarity, TIM_ICInitStruct->TIM_ICSelection,
               TIM_ICInitStruct->TIM_ICFilter);
     
    TIM_SetIC2Prescaler(TIMx, TIM_ICInitStruct->TIM_ICPrescaler);
     
    TI1_Config(TIMx, icoppositepolarity, icoppositeselection, TIM_ICInitStruct->TIM_ICFilter);
     
    TIM_SetIC1Prescaler(TIMx, TIM_ICInitStruct->TIM_ICPrescaler);
  }
}





 
uint32_t TIM_GetCapture1(TIM_TypeDef* TIMx)
{
   
  ((void)0);
  
   
  return TIMx->CCR1;
}





 
uint32_t TIM_GetCapture2(TIM_TypeDef* TIMx)
{
   
  ((void)0);
  
   
  return TIMx->CCR2;
}





 
uint32_t TIM_GetCapture3(TIM_TypeDef* TIMx)
{
   
  ((void)0); 
  
   
  return TIMx->CCR3;
}





 
uint32_t TIM_GetCapture4(TIM_TypeDef* TIMx)
{
   
  ((void)0);
  
   
  return TIMx->CCR4;
}











 
void TIM_SetIC1Prescaler(TIM_TypeDef* TIMx, uint16_t TIM_ICPSC)
{
   
  ((void)0);
  ((void)0);
  
   
  TIMx->CCMR1 &= (uint16_t)~((uint16_t)((uint16_t)0x000C));
   
  TIMx->CCMR1 |= TIM_ICPSC;
}











 
void TIM_SetIC2Prescaler(TIM_TypeDef* TIMx, uint16_t TIM_ICPSC)
{
   
  ((void)0);
  ((void)0);
  
   
  TIMx->CCMR1 &= (uint16_t)~((uint16_t)((uint16_t)0x0C00));
   
  TIMx->CCMR1 |= (uint16_t)(TIM_ICPSC << 8);
}











 
void TIM_SetIC3Prescaler(TIM_TypeDef* TIMx, uint16_t TIM_ICPSC)
{
   
  ((void)0);
  ((void)0);
  
   
  TIMx->CCMR2 &= (uint16_t)~((uint16_t)((uint16_t)0x000C));
   
  TIMx->CCMR2 |= TIM_ICPSC;
}











 
void TIM_SetIC4Prescaler(TIM_TypeDef* TIMx, uint16_t TIM_ICPSC)
{  
   
  ((void)0);
  ((void)0);
  
   
  TIMx->CCMR2 &= (uint16_t)~((uint16_t)((uint16_t)0x0C00));
   
  TIMx->CCMR2 |= (uint16_t)(TIM_ICPSC << 8);
}



 























 
void TIM_ITConfig(TIM_TypeDef* TIMx, uint16_t TIM_IT, FunctionalState NewState)
{  
   
  ((void)0);
  ((void)0);
  ((void)0);
  
  if (NewState != DISABLE)
  {
     
    TIMx->DIER |= TIM_IT;
  }
  else
  {
     
    TIMx->DIER &= (uint16_t)~TIM_IT;
  }
}




















 
void TIM_GenerateEvent(TIM_TypeDef* TIMx, uint16_t TIM_EventSource)
{ 
   
  ((void)0);
  ((void)0); 
   
  TIMx->EGR = TIM_EventSource;
}


























 
FlagStatus TIM_GetFlagStatus(TIM_TypeDef* TIMx, uint16_t TIM_FLAG)
{ 
  ITStatus bitstatus = RESET; 
   
   
  ((void)0);
  ((void)0);
  
  if ((TIMx->SR & TIM_FLAG) != (uint16_t)RESET)
  {
    bitstatus = SET;
  }
  else
  {
    bitstatus = RESET;
  }
  return bitstatus;
}



























 
void TIM_ClearFlag(TIM_TypeDef* TIMx, uint16_t TIM_FLAG)
{  
   
  ((void)0);
  ((void)0);
   
   
  TIMx->SR = (uint16_t)~TIM_FLAG;
}






















 
ITStatus TIM_GetITStatus(TIM_TypeDef* TIMx, uint16_t TIM_IT)
{
  ITStatus bitstatus = RESET;  
  uint16_t itstatus = 0x0, itenable = 0x0;
  
   
  ((void)0);
  ((void)0);
   
  itstatus = TIMx->SR & TIM_IT;
  
  itenable = TIMx->DIER & TIM_IT;
  if ((itstatus != (uint16_t)RESET) && (itenable != (uint16_t)RESET))
  {
    bitstatus = SET;
  }
  else
  {
    bitstatus = RESET;
  }
  return bitstatus;
}






















 
void TIM_ClearITPendingBit(TIM_TypeDef* TIMx, uint16_t TIM_IT)
{
   
  ((void)0);
  ((void)0);
   
   
  TIMx->SR = (uint16_t)~TIM_IT;
}



























 
void TIM_DMAConfig(TIM_TypeDef* TIMx, uint16_t TIM_DMABase, uint16_t TIM_DMABurstLength)
{
   
  ((void)0);
  ((void)0); 
  ((void)0);
   
  TIMx->DCR = TIM_DMABase | TIM_DMABurstLength;
}
















 
void TIM_DMACmd(TIM_TypeDef* TIMx, uint16_t TIM_DMASource, FunctionalState NewState)
{ 
   
  ((void)0);
  ((void)0);
  ((void)0);
  
  if (NewState != DISABLE)
  {
     
    TIMx->DIER |= TIM_DMASource; 
  }
  else
  {
     
    TIMx->DIER &= (uint16_t)~TIM_DMASource;
  }
}







 
void TIM_SelectCCDMA(TIM_TypeDef* TIMx, FunctionalState NewState)
{
   
  ((void)0);
  ((void)0);
  
  if (NewState != DISABLE)
  {
     
    TIMx->CR2 |= ((uint16_t)0x0008);
  }
  else
  {
     
    TIMx->CR2 &= (uint16_t)~((uint16_t)((uint16_t)0x0008));
  }
}



 




 
void TIM_InternalClockConfig(TIM_TypeDef* TIMx)
{
   
  ((void)0);
   
  TIMx->SMCR &=  (uint16_t)(~((uint16_t)((uint16_t)0x0007)));
}











 
void TIM_ITRxExternalClockConfig(TIM_TypeDef* TIMx, uint16_t TIM_InputTriggerSource)
{
   
  ((void)0);
  ((void)0);
   
  TIM_SelectInputTrigger(TIMx, TIM_InputTriggerSource);
   
  TIMx->SMCR |= ((uint16_t)0x0007);
}
















 
void TIM_TIxExternalClockConfig(TIM_TypeDef* TIMx, uint16_t TIM_TIxExternalCLKSource,
                                uint16_t TIM_ICPolarity, uint16_t ICFilter)
{
   
  ((void)0);
  ((void)0);
  ((void)0);
  
   
  if (TIM_TIxExternalCLKSource == ((uint16_t)0x0060))
  {
    TI2_Config(TIMx, TIM_ICPolarity, ((uint16_t)0x0001), ICFilter);
  }
  else
  {
    TI1_Config(TIMx, TIM_ICPolarity, ((uint16_t)0x0001), ICFilter);
  }
   
  TIM_SelectInputTrigger(TIMx, TIM_TIxExternalCLKSource);
   
  TIMx->SMCR |= ((uint16_t)0x0007);
}

















 
void TIM_ETRClockMode1Config(TIM_TypeDef* TIMx, uint16_t TIM_ExtTRGPrescaler, uint16_t TIM_ExtTRGPolarity,
                             uint16_t ExtTRGFilter)
{
  uint16_t tmpsmcr = 0;
  
   
  ((void)0);
  ((void)0);
  ((void)0);
  ((void)0);
  
   
  TIM_ETRConfig(TIMx, TIM_ExtTRGPrescaler, TIM_ExtTRGPolarity, ExtTRGFilter);
  
   
  tmpsmcr = TIMx->SMCR;
   
  tmpsmcr &= (uint16_t)(~((uint16_t)((uint16_t)0x0007)));
   
  tmpsmcr |= ((uint16_t)0x0007);
   
  tmpsmcr &= (uint16_t)(~((uint16_t)((uint16_t)0x0070)));
  tmpsmcr |= ((uint16_t)0x0070);
   
  TIMx->SMCR = tmpsmcr;
}

















 
void TIM_ETRClockMode2Config(TIM_TypeDef* TIMx, uint16_t TIM_ExtTRGPrescaler, 
                             uint16_t TIM_ExtTRGPolarity, uint16_t ExtTRGFilter)
{
   
  ((void)0);
  ((void)0);
  ((void)0);
  ((void)0);
  
   
  TIM_ETRConfig(TIMx, TIM_ExtTRGPrescaler, TIM_ExtTRGPolarity, ExtTRGFilter);
   
  TIMx->SMCR |= ((uint16_t)0x4000);
}



 














 
void TIM_SelectInputTrigger(TIM_TypeDef* TIMx, uint16_t TIM_InputTriggerSource)
{
  uint16_t tmpsmcr = 0;

   
  ((void)0); 
  ((void)0);

   
  tmpsmcr = TIMx->SMCR;
   
  tmpsmcr &= (uint16_t)(~((uint16_t)((uint16_t)0x0070)));
   
  tmpsmcr |= TIM_InputTriggerSource;
   
  TIMx->SMCR = tmpsmcr;
}





















 
void TIM_SelectOutputTrigger(TIM_TypeDef* TIMx, uint16_t TIM_TRGOSource)
{
   
  ((void)0);
  ((void)0);

   
  TIMx->CR2 &= (uint16_t)~((uint16_t)((uint16_t)0x0070));
   
  TIMx->CR2 |=  TIM_TRGOSource;
}












 
void TIM_SelectSlaveMode(TIM_TypeDef* TIMx, uint16_t TIM_SlaveMode)
{
   
  ((void)0); 
  ((void)0);
  
   
  TIMx->SMCR &= (uint16_t)~((uint16_t)((uint16_t)0x0007));
   
  TIMx->SMCR |= TIM_SlaveMode;
}










 
void TIM_SelectMasterSlaveMode(TIM_TypeDef* TIMx, uint16_t TIM_MasterSlaveMode)
{
   
  ((void)0);
  ((void)0);
  
   
  TIMx->SMCR &= (uint16_t)~((uint16_t)((uint16_t)0x0080));
  
   
  TIMx->SMCR |= TIM_MasterSlaveMode;
}

















 
void TIM_ETRConfig(TIM_TypeDef* TIMx, uint16_t TIM_ExtTRGPrescaler, uint16_t TIM_ExtTRGPolarity,
                   uint16_t ExtTRGFilter)
{
  uint16_t tmpsmcr = 0;
  
   
  ((void)0);
  ((void)0);
  ((void)0);
  ((void)0);
  
  tmpsmcr = TIMx->SMCR;
   
  tmpsmcr &= ((uint16_t)0x00FF);
   
  tmpsmcr |= (uint16_t)(TIM_ExtTRGPrescaler | (uint16_t)(TIM_ExtTRGPolarity | (uint16_t)(ExtTRGFilter << (uint16_t)8)));
   
  TIMx->SMCR = tmpsmcr;
}



 


















 
void TIM_EncoderInterfaceConfig(TIM_TypeDef* TIMx, uint16_t TIM_EncoderMode,
                                uint16_t TIM_IC1Polarity, uint16_t TIM_IC2Polarity)
{
  uint16_t tmpsmcr = 0;
  uint16_t tmpccmr1 = 0;
  uint16_t tmpccer = 0;
    
   
  ((void)0);
  ((void)0);
  ((void)0);
  ((void)0);
  
   
  tmpsmcr = TIMx->SMCR;
   
  tmpccmr1 = TIMx->CCMR1;
   
  tmpccer = TIMx->CCER;
   
  tmpsmcr &= (uint16_t)(~((uint16_t)((uint16_t)0x0007)));
  tmpsmcr |= TIM_EncoderMode;
   
  tmpccmr1 &= (uint16_t)(((uint16_t)~((uint16_t)((uint16_t)0x0003))) & (uint16_t)(~((uint16_t)((uint16_t)0x0300))));
  tmpccmr1 |= ((uint16_t)0x0001) | ((uint16_t)0x0100);
   
  tmpccer &= (uint16_t)~((uint16_t)(((uint16_t)0x0002) | ((uint16_t)0x0008))) & (uint16_t)~((uint16_t)(((uint16_t)0x0020) | ((uint16_t)0x0080)));
  tmpccer |= (uint16_t)(TIM_IC1Polarity | (uint16_t)(TIM_IC2Polarity << (uint16_t)4));
   
  TIMx->SMCR = tmpsmcr;
   
  TIMx->CCMR1 = tmpccmr1;
   
  TIMx->CCER = tmpccer;
}







 
void TIM_SelectHallSensor(TIM_TypeDef* TIMx, FunctionalState NewState)
{
   
  ((void)0);
  ((void)0);
  
  if (NewState != DISABLE)
  {
     
    TIMx->CR2 |= ((uint16_t)0x0080);
  }
  else
  {
     
    TIMx->CR2 &= (uint16_t)~((uint16_t)((uint16_t)0x0080));
  }
}



 












 
void TIM_RemapConfig(TIM_TypeDef* TIMx, uint16_t TIM_Remap)
{
  
  ((void)0);
  ((void)0);

   
  TIMx->OR =  TIM_Remap;
}



 
















 
static void TI1_Config(TIM_TypeDef* TIMx, uint16_t TIM_ICPolarity, uint16_t TIM_ICSelection,
                       uint16_t TIM_ICFilter)
{
  uint16_t tmpccmr1 = 0, tmpccer = 0;
   
  TIMx->CCER &= (uint16_t)~((uint16_t)((uint16_t)0x0001));
  tmpccmr1 = TIMx->CCMR1;
  tmpccer = TIMx->CCER;
   
  tmpccmr1 &= (uint16_t)(((uint16_t)~((uint16_t)((uint16_t)0x0003))) & ((uint16_t)~((uint16_t)((uint16_t)0x00F0))));
  tmpccmr1 |= (uint16_t)(TIM_ICSelection | (uint16_t)(TIM_ICFilter << (uint16_t)4));
 
   
  tmpccer &= (uint16_t)~((uint16_t)(((uint16_t)0x0002) | ((uint16_t)0x0008)));
  tmpccer |= (uint16_t)(TIM_ICPolarity | (uint16_t)((uint16_t)0x0001));
   
  TIMx->CCMR1 = tmpccmr1;
  TIMx->CCER = tmpccer;
}
















 
static void TI2_Config(TIM_TypeDef* TIMx, uint16_t TIM_ICPolarity, uint16_t TIM_ICSelection,
                       uint16_t TIM_ICFilter)
{
  uint16_t tmpccmr1 = 0, tmpccer = 0, tmp = 0;
   
  TIMx->CCER &= (uint16_t)~((uint16_t)((uint16_t)0x0010));
  tmpccmr1 = TIMx->CCMR1;
  tmpccer = TIMx->CCER;
  tmp = (uint16_t)(TIM_ICPolarity << 4);
   
  tmpccmr1 &= (uint16_t)(((uint16_t)~((uint16_t)((uint16_t)0x0300))) & ((uint16_t)~((uint16_t)((uint16_t)0xF000))));
  tmpccmr1 |= (uint16_t)(TIM_ICFilter << 12);
  tmpccmr1 |= (uint16_t)(TIM_ICSelection << 8); 
   
  tmpccer &= (uint16_t)~((uint16_t)(((uint16_t)0x0020) | ((uint16_t)0x0080)));
  tmpccer |= (uint16_t)(tmp | (uint16_t)((uint16_t)0x0010));  
   
  TIMx->CCMR1 = tmpccmr1 ;
  TIMx->CCER = tmpccer;
}
















 
static void TI3_Config(TIM_TypeDef* TIMx, uint16_t TIM_ICPolarity, uint16_t TIM_ICSelection,
                       uint16_t TIM_ICFilter)
{
  uint16_t tmpccmr2 = 0, tmpccer = 0, tmp = 0;
   
  TIMx->CCER &= (uint16_t)~((uint16_t)((uint16_t)0x0100));
  tmpccmr2 = TIMx->CCMR2;
  tmpccer = TIMx->CCER;
  tmp = (uint16_t)(TIM_ICPolarity << 8);
   
  tmpccmr2 &= (uint16_t)(((uint16_t)~((uint16_t)((uint16_t)0x0003))) & ((uint16_t)~((uint16_t)((uint16_t)0x00F0))));
  tmpccmr2 |= (uint16_t)(TIM_ICSelection | (uint16_t)(TIM_ICFilter << (uint16_t)4));
   
  tmpccer &= (uint16_t)~((uint16_t)(((uint16_t)0x0200) | ((uint16_t)0x0800)));
  tmpccer |= (uint16_t)(tmp | (uint16_t)((uint16_t)0x0100));  
   
  TIMx->CCMR2 = tmpccmr2;
  TIMx->CCER = tmpccer;
}
















 
static void TI4_Config(TIM_TypeDef* TIMx, uint16_t TIM_ICPolarity, uint16_t TIM_ICSelection,
                       uint16_t TIM_ICFilter)
{
  uint16_t tmpccmr2 = 0, tmpccer = 0, tmp = 0;

    
  TIMx->CCER &= (uint16_t)~((uint16_t)((uint16_t)0x1000));
  tmpccmr2 = TIMx->CCMR2;
  tmpccer = TIMx->CCER;
  tmp = (uint16_t)(TIM_ICPolarity << 12);
   
  tmpccmr2 &= (uint16_t)((uint16_t)(~(uint16_t)((uint16_t)0x0300)) & ((uint16_t)~((uint16_t)((uint16_t)0xF000))));
  tmpccmr2 |= (uint16_t)(TIM_ICSelection << 8);
  tmpccmr2 |= (uint16_t)(TIM_ICFilter << 12);  
   
  tmpccer &= (uint16_t)~((uint16_t)(((uint16_t)0x2000)));
  tmpccer |= (uint16_t)(tmp | (uint16_t)((uint16_t)0x1000));
   
  TIMx->CCMR2 = tmpccmr2;
  TIMx->CCER = tmpccer;
}



 



 



 

 
