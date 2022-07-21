/*******************************************************************

                  Generic Type Definitions

********************************************************************
 FileName:        GenericTypeDefs.h
 Dependencies:    None
 Processor:       PIC10, PIC12, PIC16, PIC18, PIC24, dsPIC, PIC32
 Compiler:        MPLAB C Compilers for PIC18, PIC24, dsPIC, & PIC32
                  Hi-Tech PICC PRO, Hi-Tech PICC18 PRO
 Company:         Microchip Technology Inc.

 Software License Agreement

 The software supplied herewith by Microchip Technology Incorporated
 (the "Company") is intended and supplied to you, the Company's
 customer, for use solely and exclusively with products manufactured
 by the Company.

 The software is owned by the Company and/or its supplier, and is
 protected under applicable copyright laws. All rights are reserved.
 Any use in violation of the foregoing restrictions may subject the
 user to criminal sanctions under applicable laws, as well as to
 civil liability for the breach of the terms and conditions of this
 license.

 THIS SOFTWARE IS PROVIDED IN AN "AS IS" CONDITION. NO WARRANTIES,
 WHETHER EXPRESS, IMPLIED OR STATUTORY, INCLUDING, BUT NOT LIMITED
 TO, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
 PARTICULAR PURPOSE APPLY TO THIS SOFTWARE. THE COMPANY SHALL NOT,
 IN ANY CIRCUMSTANCES, BE LIABLE FOR SPECIAL, INCIDENTAL OR
 CONSEQUENTIAL DAMAGES, FOR ANY REASON WHATSOEVER.

********************************************************************
 File Description:

 Change History:
  Rev   Date         Description
  1.1   09/11/06     Add base signed types
  1.2   02/28/07     Add QWORD, LONGLONG, QWORD_VAL
  1.3   02/06/08     Add def's for PIC32
  1.4   08/08/08     Remove LSB/MSB Macros, adopted by Peripheral lib
  1.5   08/14/08     Simplify file header
  2.0   07/13/09     Updated for new release of coding standards
*******************************************************************/

#ifndef __GENERIC_TYPE_DEFS_H_
#define __GENERIC_TYPE_DEFS_H_

/* Specify an extension for GCC based compilers */
#if defined(__GNUC__)
#define __EXTENSION __extension__
#else
#define __EXTENSION
#endif

#if !defined(__PACKED)
    #define __PACKED
#endif

/* get compiler defined type definitions (NULL, size_t, etc) */
#include <stddef.h> 
#ifndef TRUE
#define TRUE	1
#endif

#ifndef FALSE
#define FALSE	0
#endif
//typedef enum _BOOL { FALSE = 0, TRUE } BOOL;    /* Undefined size */
//typedef enum _BIT { CLEAR = 0, SET } BIT;

#define PUBLIC                                  /* Function attributes */
#define PROTECTED
#define PRIVATE   static

/* INT is processor specific in length may vary in size */
typedef unsigned char uint8;
typedef char int8;
typedef unsigned short uint16;
typedef short int16;
typedef unsigned int uint32;
typedef volatile unsigned int vuint32;
typedef int int32;
typedef uint16 wchar;
#define Bool uint8

typedef signed int          INT;
typedef signed char         INT8;
typedef signed short int    INT16;
typedef signed long int     INT32;
#define True 	1
#define False 	0
#define Null	0


/* BITS */
#define BIT_0		0x00000001UL
#define BIT_1		0x00000002UL
#define BIT_2		0x00000004UL
#define BIT_3		0x00000008UL
#define BIT_4		0x00000010UL
#define BIT_5		0x00000020UL
#define BIT_6		0x00000040UL
#define BIT_7		0x00000080UL
#define BIT_8		0x00000100UL
#define BIT_9		0x00000200UL
#define BIT_10		0x00000400UL
#define BIT_11		0x00000800UL
#define BIT_12		0x00001000UL
#define BIT_13		0x00002000UL
#define BIT_14		0x00004000UL
#define BIT_15		0x00008000UL
#define BIT_16		0x00010000UL
#define BIT_17		0x00020000UL
#define BIT_18		0x00040000UL
#define BIT_19		0x00080000UL
#define BIT_20		0x00100000UL
#define BIT_21		0x00200000UL
#define BIT_22		0x00400000UL
#define BIT_23		0x00800000UL
#define BIT_24		0x01000000UL
#define BIT_25		0x02000000UL
#define BIT_26		0x04000000UL
#define BIT_27		0x08000000UL
#define BIT_28		0x10000000UL
#define BIT_29		0x20000000UL
#define BIT_30		0x40000000UL
#define BIT_31		0x80000000UL

#define SECTOR_FACTOR			9

#define BIT(_x, _i) ((((uint32)(_x)) >> (_i)) & 0x00000001)
#define AS_UINT8(x) (*((uint8*)&(x)))
#define AS_UINT16(_msByte, _lsByte) (uint16)((((_msByte) << 8)) | (_lsByte))
#define AS_UINT32(_Byte3, _Byte2,_Byte1, _Byte0) (uint32)(((_Byte3) << 24) | ((_Byte2) << 16) | ((_Byte1) << 8) | (_Byte0))


#define SWAP16(value) (uint16)(value)
#define SWAP32(value) (uint32)(value)

//?????
//#define SWAP16(value) (uint16)(((value) << 8) | (((value) >> 8) & 0xFF))
//#define SWAP32(value) (uint32)((((uint8*)&(value))[0] << 24) | (((uint8*)&(value))[1] << 16) | (((uint8*)&(value))[2] << 8) | ((uint8*)&(value))[3])

#define MEM_BYTE(asUint32, byteIndex) (((uint8*)&(asUint32))[byteIndex])

#define U16_MSB(asUint16) (uint8)((asUint16)>>8)
#define U16_LSB(asUint16) (uint8)(asUint16)
typedef struct _tagList
{
	struct _tagList* 	m_pNext;
	struct _tagList* 	m_pPre;
    uint8 				m_isUsed;
}List;



/* UINT is processor specific in length may vary in size */
typedef unsigned int        UINT;
typedef unsigned char       UINT8;
typedef unsigned short int  UINT16;
/* 24-bit type only available on C18 */

typedef unsigned long int   UINT32;     /* other name for 32-bit integer */
/* MPLAB C Compiler for PIC18 does not support 64-bit integers */




/***********************************************************************************/

/* Alternate definitions */
typedef void                    VOID;

typedef char                    CHAR8;
typedef unsigned char           UCHAR8;

typedef unsigned char           BYTE;                           /* 8-bit unsigned  */
typedef unsigned short int      WORD;                           /* 16-bit unsigned */
typedef unsigned long           DWORD;                          /* 32-bit unsigned */
/* MPLAB C Compiler for PIC18 does not support 64-bit integers */


typedef signed char             CHAR;                           /* 8-bit signed    */
typedef signed short int        SHORT;                          /* 16-bit signed   */
typedef signed long             LONG;                           /* 32-bit signed   */
/* MPLAB C Compiler for PIC18 does not support 64-bit integers */



#define READ_NO_WAIT_FOR_USB 1


#endif /* __GENERIC_TYPE_DEFS_H_ */
