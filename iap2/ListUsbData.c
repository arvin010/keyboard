
//#include "ArchDef.h"

#include "ListUsbData.h"
#include <stdlib.h>
#include <string.h>

void ListUsbData_Init(ListUsbData* pList)
{

	//memset(pList, 0, sizeof(ListUsbData));
}

ListUsbData* ListUsbData_AddTail(ListUsbData* pHead, ListUsbData* pNode)
{
	ListUsbData* pListNode = pHead;
     if(!(pNode))
	 	return Null;
	//ASRT(pNode);
	SEGGER_RTT_printf(0,"##### function=%s line=%d \n",__FUNCTION__,__LINE__);
	pNode->m_pNext = Null;
	if(pHead == Null)
	{
		pNode->m_pPre = Null;
		pHead = pNode;
		goto END;
	}
	SEGGER_RTT_printf(0,"##### function=%s line=%d \n",__FUNCTION__,__LINE__);

	//Get the tail node
	while(pListNode->m_pNext)
	{
		pListNode = pListNode->m_pNext;
		//ASRT(pListNode != pNode);
		 if(!(pListNode != pNode))
	 	return Null;
	}
	SEGGER_RTT_printf(0,"##### function=%s line=%d \n",__FUNCTION__,__LINE__);

	pListNode->m_pNext = pNode;
	
	SEGGER_RTT_printf(0,"##### function=%s line=%d \n",__FUNCTION__,__LINE__);
	pNode->m_pPre = pListNode;
END:
	
	SEGGER_RTT_printf(0,"##### function=%s line=%d \n",__FUNCTION__,__LINE__);
//	PF(DL_LISTEX, ("List_AddTail(), count=%d\n", List_Count(pHead)));
	return pHead;
}

void ListUsbData_RemoveAll(ListUsbData* pNode)
{
	ListUsbData* pTemp = pNode;

	while(pTemp)
	{
		pTemp = ListUsbData_Remove(pNode);
	}
}

//Remove a node form list
//Return: head node
ListUsbData* ListUsbData_Remove(ListUsbData* pNode)
{
	ListUsbData* pHead = pNode;
	
	SEGGER_RTT_printf(0,"##### function=%s line=%d \n",__FUNCTION__,__LINE__);
	//ASRT(pNode);
	if(!(pNode))
		{
				SEGGER_RTT_printf(0,"### function=%s line=%d\n",__FUNCTION__,__LINE__);
		   return Null;
		}
	SEGGER_RTT_printf(0,"##### function=%s line=%d \n",__FUNCTION__,__LINE__);

	//Head of list
	if(pNode->m_pPre == Null)
	{
	
	SEGGER_RTT_printf(0,"##### function=%s line=%d \n",__FUNCTION__,__LINE__);
		pHead = pNode->m_pNext;
		if(pHead)
		{
			pHead->m_pPre = Null;
		}
		
		SEGGER_RTT_printf(0,"##### function=%s line=%d \n",__FUNCTION__,__LINE__);
		goto END;
	}
	else
	{
	
	SEGGER_RTT_printf(0,"##### function=%s line=%d \n",__FUNCTION__,__LINE__);
		pNode->m_pPre->m_pNext = pNode->m_pNext;
		
		SEGGER_RTT_printf(0,"##### function=%s line=%d \n",__FUNCTION__,__LINE__);
		if(pNode->m_pNext)
		{
		
		SEGGER_RTT_printf(0,"##### function=%s line=%d \n",__FUNCTION__,__LINE__);
			pNode->m_pNext->m_pPre = pNode->m_pPre;
		}
		
		SEGGER_RTT_printf(0,"##### function=%s line=%d \n",__FUNCTION__,__LINE__);
	}
	SEGGER_RTT_printf(0,"##### function=%s line=%d \n",__FUNCTION__,__LINE__);

	while(pHead->m_pPre)
	{
		SEGGER_RTT_printf(0,"##### function=%s line=%d \n",__FUNCTION__,__LINE__);
		pHead = pHead->m_pPre;
		
		SEGGER_RTT_printf(0,"##### function=%s line=%d \n",__FUNCTION__,__LINE__);
	}
	
	SEGGER_RTT_printf(0,"##### function=%s line=%d \n",__FUNCTION__,__LINE__);

END:
	
	SEGGER_RTT_printf(0,"##### function=%s line=%d \n",__FUNCTION__,__LINE__);
	pNode->m_pPre = Null;
	
	SEGGER_RTT_printf(0,"##### function=%s line=%d \n",__FUNCTION__,__LINE__);
	pNode->m_pNext = Null;
	
	SEGGER_RTT_printf(0,"##### function=%s line=%d \n",__FUNCTION__,__LINE__);
	
//	PF(DL_LISTEX, ("List_Remove(), count=%d\n", List_Count(pHead)));
	return pHead;
}

Bool ListUsbData_isIn(ListUsbData* pHead, ListUsbData* pNode)
{
	if(Null == pHead || Null == pNode)
	{
		return False;
	}

	if(pHead == pNode)
	{
		return True;
	}
	
	pHead = pHead->m_pNext;
	while(pHead)
	{
		if(pHead == pNode)
		{
			return True;
		}

		pHead = pHead->m_pNext;
	}

	return False;
}

int ListUsbData_Count(ListUsbData* pNode)
{
	ListUsbData* pHead = pNode;
	int nCount = 0;

	if(pNode == Null)
	{
		return 0;
	}

	while(pHead)
	{
		pHead = pHead->m_pPre;
		nCount++;
	}

	pNode = pNode->m_pNext;
	while(pNode)
	{
		pNode = pNode->m_pNext;
		nCount++;
	}	

	return nCount;
}

