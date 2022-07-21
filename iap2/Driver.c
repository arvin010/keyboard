
#include "GenericTypeDefs.h"
#include "Driver.h"
#include "stdlib.h"
#include "string.h"
#include "main.h"
#include "SEGGER_RTT.h"
#include "SEGGER_RTT_Conf.h"

extern Iap2Link* g_pIap2Link;

Bool g_isTxDone		= FALSE;
Bool g_isRxDone		= FALSE;

Irb* g_pIrb = Null;


extern void usb_send_data_buffer(uint8_t *pdata, uint16 data_size );

Bool Driver_TransferStart(Irb* pIrb)//huanghanjing  transfer data
{
	g_pIrb = pIrb;
SEGGER_RTT_printf(0,"Driver_TransferStart pIrb->m_isTx=%d\n",pIrb->m_isTx);
	if(pIrb->m_isTx)
	{
	usb_send_data_buffer(pIrb->m_pBuff,pIrb->m_Len);
		//Printf("Tx Data: ");
	//	DUMP_BYTE((uint8*)pIrb->m_pBuff, pIrb->m_Len>32 ? 32 : pIrb->m_Len);
		g_isTxDone = TRUE;
		g_pIrb->m_ActLen = pIrb->m_Len;
	}
	return True;
}

void Driver_Check()
{
	//SEGGER_RTT_printf(0,"Driver_Check g_isTxDone=%d g_isRxDone=%d\n",g_isTxDone,g_isRxDone);

	if(g_isTxDone)
	{
		Iap2Link_TransferDone(g_pIap2Link, True);
		g_isTxDone = FALSE;
		return;
	}

	//SEGGER_RTT_printf(0,"### function=%s line=%d \n",__FUNCTION__,__LINE__);

	if(g_isRxDone)
	{
		//Printf("Rx Data: ");
	//	DUMP_BYTE((uint8*)g_pIrb->m_pBuff, g_pIrb->m_ActLen);

		Iap2Link_TransferDone(g_pIap2Link, True);
		g_isRxDone = FALSE;
	}
	
	//SEGGER_RTT_printf(0,"### function=%s line=%d \n",__FUNCTION__,__LINE__);
}

void Driver_TxDone()
{
	g_isTxDone = True;
}

void Driver_RxDone(const void* pData, int len)
{

	SEGGER_RTT_printf(0,"### function=%s line=%d \n",__FUNCTION__,__LINE__);

	if(g_pIrb == NULL) return;
	SEGGER_RTT_printf(0,"### function=%s line=%d \n",__FUNCTION__,__LINE__);

	g_isRxDone = TRUE;
	g_pIrb->m_ActLen = len;
	memcpy(g_pIrb->m_pBuff, pData, len);
}

