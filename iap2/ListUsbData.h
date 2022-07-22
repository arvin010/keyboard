#ifndef __LIST_USB_DATA__H
#define __LIST_USB_DATA__H

//#include "Typedef.h"
#include "GenericTypeDefs.h"
typedef struct _tagListUsbData
{
	struct _tagListUsbData* 	m_pNext;
	struct _tagListUsbData* 	m_pPre;
    INT16 				data_size;
	  uint8         *pdata;
	  uint8         m_isUsed;
}ListUsbData;
extern ListUsbData * g_usbdata_list;
void ListUsbData_Init(ListUsbData* pList);
ListUsbData* ListUsbData_AddTail(ListUsbData* pHead, ListUsbData* pNode);
ListUsbData* ListUsbData_Remove(ListUsbData* pNode);
Bool ListUsbData_isIn(ListUsbData* pHead, ListUsbData* pNode);
int ListUsbData_Count(/*ListUsbData* pNode*/);
void ListUsbData_RemoveAll(ListUsbData* pNode);

#endif

