
//#include "ArchDef.h"
#include "Iap2Link.h"
#include "iAp2Session.h"
#include <string.h>
#include "main.h"
#include "Iap2CtrlSession.h"
#include "SEGGER_RTT.h"
#include "SEGGER_RTT_Conf.h"


static Iap2Link g_Iap2Link;
Iap2Link* g_pIap2Link = &g_Iap2Link;

//#define SOP (uint16)0x5AFF
#define SOP (uint16)0xff5a

#define IAP_LINKPKT_HEAD_LEN	10

static uint8 auth_init_data[] = {0xff,0x55,0x02,0x00,0xee,0x10};

static uint8 Iap2LinkPkt_GetCheckSum(const void* pData, uint16 len)
{
    uint16 i;
    uint8 sum = 0;
	uint8* pByte = (uint8*)pData;
    
    for(i = 0; i < len; i++)
    {
        sum += *pByte++;
    }
    
    return (uint8)(((~sum) & 0xff) + 1);
}


int Iap2LinkPkt_Init(Iap2LinkPkt* pPkt
	, CtrlByte ctrl
	, uint8 seq
	, uint8 ackSeq
	, uint8 sessionId
	, const void* pSessionMgr
	, uint16 pSessionMgrLen)
{
	uint8* pByte = (uint8*)pPkt;
	uint16 totalLen = pSessionMgrLen + IAP2_PKT_HEAD_SIZE;
	Iap2CtrlSessionMsg *pIap2CtrlSessionMsg;

	if(pSessionMgrLen)
	{
		totalLen += 1;	//Check sum
	}
	
	memset(pPkt, 0, sizeof(Iap2LinkPkt));
	pPkt->m_Sof = SOP;

	pPkt->m_Len = SWAP16(totalLen);

	AS_UINT8(pPkt->m_CtrlByte)	= AS_UINT8(ctrl);
	pPkt->m_SeqNum 		= seq;
	pPkt->m_AckSeqNum 	= ackSeq;
	pPkt->m_SessionId 	= sessionId;
	pPkt->m_HeaderSum	= Iap2LinkPkt_GetCheckSum(pByte, IAP2_PKT_HEAD_SIZE-1);

	memcpy(pPkt->m_Payload, pSessionMgr, pSessionMgrLen);
	 pIap2CtrlSessionMsg = (Iap2CtrlSessionMsg *)pSessionMgr;
	 if(pIap2CtrlSessionMsg->m_Param!=NULL)
	 	if(pIap2CtrlSessionMsg->m_Param->m_Data!=NULL)
	 		{
			free(pIap2CtrlSessionMsg->m_Param->m_Data);
			pIap2CtrlSessionMsg->m_Param->m_Data = NULL;
	 		}

	pByte = pPkt->m_Payload; 
	pByte[pSessionMgrLen] = Iap2LinkPkt_GetCheckSum(pPkt->m_Payload, pSessionMgrLen);

	return totalLen;
	
}

//////////////////////////////////////////////////////////////////////
void LinkPayload_AddSession(LinkPayload* pLinkPayload, SessionIden* pSession)
{
	memcpy(pLinkPayload->m_Session, pSession, sizeof(SessionIden));
}

void LinkPayload_Init(LinkPayload* pLinkPayload)
{
	memset(pLinkPayload, 0, sizeof(LinkPayload));

	pLinkPayload->m_LinkVer 			= IAP2_LINK_VERSION;
	pLinkPayload->m_MaxOfOutstandingPkt = IAP2_MAX_OUTSTANDING_PKT;
	
	pLinkPayload->m_MaxPktLenMsb 	= U16_MSB(IAP2_MAX_PACKET_SIZE);
	pLinkPayload->m_MaxPktLenLsb 	= U16_LSB(IAP2_MAX_PACKET_SIZE);
	
	pLinkPayload->m_ReTxTimeOutMsb 	= U16_MSB(IAP2_RETX_TIMEOUT);
	pLinkPayload->m_ReTxTimeOutLsb 	= U16_LSB(IAP2_RETX_TIMEOUT);
	
	pLinkPayload->m_AckTimeOutMsb 	= U16_MSB(IAP2_MAX_ACK_TIMEOUT);
	pLinkPayload->m_AckTimeOutLsb 	= U16_LSB(IAP2_MAX_ACK_TIMEOUT);
	
	pLinkPayload->m_MaxReTxCount 	= IAP2_MAX_RETX_COUNT;
	pLinkPayload->m_MaxAckCount 	= 0;
}

//////////////////////////////////////////////////////////////////////
void Iap2Link_TimerReset(Iap2Link* pIap2Link)
{
	//huanghanjing timer
	SwTimer_Stop(&pIap2Link->m_ReTxTimer);
}
void Iap2Link_TimeOut(Iap2Link* pIap2Link, uint8 timeId)
{
	if(IAP2_LINK_INIT_TIMERID == timeId)
	{
		if((pIap2Link->m_MaxReTxCount != IAP2_LINK_RETX_COUNT_UNLIMITIED)
			&& (pIap2Link->m_ReTxCount >= pIap2Link->m_MaxReTxCount))
		{
			//Send failed, end
		}
		//Iap2Link_TxData(pIap2Link, pIap2Link->m_pBuff, pIap2Link->m_Len, pIap2Link->m_ReSendTimeMs, );
	}
}

Bool Iap2Link_Verify(Iap2Link* pIap2Link, Iap2LinkPkt* pPkt, int len)
{
	uint8 checkSum = 0;
//	CtrlByte* pCtrlByte = (CtrlByte*)&pPkt->m_CtrlByte;
	Iap2LinkPkt* pTxPkt = (Iap2LinkPkt*)pIap2Link->m_Irb.m_pBuff;
	uint16 pktLen = SWAP16(pPkt->m_Len);

	if(len < IAP2_PKT_HEAD_SIZE || pktLen != len || len > IAP2_MAX_PACKET_SIZE)
	{
		return False;
	}

	if(pPkt->m_Sof != SOP)
	{
		return False;
	}

	checkSum = Iap2LinkPkt_GetCheckSum(pPkt, IAP2_PKT_HEAD_SIZE - 1);

	if(checkSum != pPkt->m_HeaderSum)
	{
		return False;
	}

	return True;
}

Bool Iap2Link_TxData(Iap2Link* pIap2Link, const void* pData, int len, uint32 reSendTimeMs, uint8 maxTxCount)
{
	Irb* pIrb = &pIap2Link->m_Irb;
	
	SEGGER_RTT_printf(0,"Iap2Link_TxData sizeof(Iap2LinkReqPkt)=%d len=%d\n",sizeof(Iap2LinkReqPkt),len);
//	ASRT(len <= sizeof(Iap2LinkReqPkt));
//	if(!(len <= sizeof(Iap2LinkReqPkt)))
	//	return False;
	pIap2Link->m_ReTxCount++;
	
	SEGGER_RTT_printf(0,"Iap2Link_TxData pIrb->m_isTx 	= True \n");
	pIrb->m_isTx 	= True;
	pIrb->m_pBuff 	= (uint8*)pData;
	pIrb->m_Len 	= len;
	pIrb->m_ActLen 	= 0;
	
	pIap2Link->m_MaxReTxCount = maxTxCount;
	pIap2Link->m_ReSendTimeMs = reSendTimeMs;
	
	if(!pIap2Link->TransferStart(pIrb))
	{
	
	SEGGER_RTT_printf(0,"Iap2Link_TxData	return Falsee \n");
		return False;
	}

	if(maxTxCount && reSendTimeMs)
	{
		SwTimer_Start(&pIap2Link->m_ReTxTimer, IAP2_LINK_INIT_TIMERID, reSendTimeMs);
	}
	
	return True;
}

Bool Iap2Link_ReTx(Iap2Link* pIap2Link)
{
	SEGGER_RTT_printf(0,"### function=%s line=%d\n",__FUNCTION__,__LINE__);

	if(!pIap2Link->TransferStart(&pIap2Link->m_Irb))
	{
		return False;
	}
	SEGGER_RTT_printf(0,"### function=%s line=%d\n",__FUNCTION__,__LINE__);

	SwTimer_Start(&pIap2Link->m_ReTxTimer, IAP2_LINK_INIT_TIMERID, pIap2Link->m_ReSendTimeMs);

	return True;
}

//Secudule a receive proc
Bool Iap2Link_RcvData(Iap2Link* pIap2Link, void* pBuff, int len)
{
	Irb* pIrb = &pIap2Link->m_Irb;
	//ASRT(len <= sizeof(Iap2LinkRspPkt));
	if(!(len <= sizeof(Iap2LinkRspPkt)))
		 return FALSE ;
	SEGGER_RTT_printf(0,"Iap2Link_RcvData pIrb->m_isTx 	= false \n");
		
	pIrb->m_isTx = False;
	pIrb->m_pBuff = (uint8*)pBuff;
	pIrb->m_Len 	= len;
	pIrb->m_ActLen 	= 0;

	//PF(DL_MAIN, ("Receive data[%d] start.\n", len));
	if(!pIap2Link->TransferStart(pIrb))
	{
		return False;
	}
	return True;
}

void Iap2Link_Notify(Iap2Link* pIap2Link, Iap2Event eventId)
{
	pIap2Link->m_pSessionMgr->EventProc(pIap2Link->m_pSessionMgr, eventId);
}


void Iap2Link_Sleep(Iap2Link* pIap2Link)
{
}

int Iap2Link_AckInit(Iap2LinkPkt* pAckPkt, const Iap2LinkPkt* pPkt)
{
	CtrlByte ctrlByte;
	int nLen = 0;

	AS_UINT8(ctrlByte) = 0;
	ctrlByte.m_AckBit = 1;
	nLen = Iap2LinkPkt_Init(pAckPkt
		, ctrlByte
		, pPkt->m_AckSeqNum
		, pPkt->m_SeqNum
		, 0
		, Null
		, 0
		);
	
	//Send ACK
	return nLen;
}

Iap2Rc Iap2Link_Payload_Eak(Iap2Link* pIap2Link, Iap2Event event, const Iap2LinkPkt* pPkt)
{
	return IAP2RC_SUCCESS;
}

Iap2Rc Iap2Link_Payload_SyncLink(Iap2Link* pIap2Link, Iap2Event event, const Iap2LinkPkt* pPkt)
{
	//int i = 0;
	int nLen = 0;
	
	if(IAP2_EVENT_TRANSFER_SUCCESS == event)
	{
		if(IAP2_STATE_TX_LINK_SYNC == pIap2Link->m_State)
		{
			Iap2Link_RcvData(pIap2Link, pIap2Link->m_pRspPkt, LINK_SYNC_PKT_SIZE);
			pIap2Link->m_State = IAP2_STATE_RX_LINK_SYNC;
		}
		else if(IAP2_STATE_RX_LINK_SYNC == pIap2Link->m_State)
		{
			nLen = Iap2Link_AckInit(pIap2Link->m_pAckPkt, pPkt);
			Iap2Link_TxData(pIap2Link, pIap2Link->m_pAckPkt, nLen, 0, 0);
			pIap2Link->m_State = IAP2_STATE_TX_ACK;
		}
		else if(IAP2_STATE_TX_ACK == pIap2Link->m_State)
		{
			Iap2Link_Notify(pIap2Link, IAP2_EVENT_LINK_SYNC_DONE);
			pIap2Link->m_State = IAP2_STATE_LINK_DONE;
		}
	}

	return IAP2RC_SUCCESS;
}

Iap2Rc Iap2Link_SendSyncPkt(Iap2Link* pIap2Link)
{
	int i = 0;
	CtrlByte ctrlByte;
	LinkPayload linkPayload;
	Iap2LinkPkt* pPkt = pIap2Link->m_pReqPkt;
	
	//Valid initialization packet
	Iap2Link_Notify(pIap2Link, IAP2_EVENT_HAND_SHAKE);

	//Sends a SYN packet containing desired connection parameters in the Link Synchronization Payload
	LinkPayload_Init(&linkPayload);
	memcpy(linkPayload.m_Session, pIap2Link->m_Session, sizeof(SessionIden) * pIap2Link->m_SessionCount);

	AS_UINT8(ctrlByte) = 0;
	ctrlByte.m_SynBit = 1;
	i = Iap2LinkPkt_Init(pPkt
		, ctrlByte
		, pIap2Link->m_NextSentPSN++
		, 0
		, 0
		, &linkPayload
		, LINK_PAYLOAD_HEAD_SIZE + sizeof(SessionIden) * pIap2Link->m_SessionCount
		);

	Iap2Link_TxData(pIap2Link, pPkt, i, IAP2_RETX_INTERVAL, IAP2_MAX_RETX_COUNT);
	pIap2Link->m_State = IAP2_STATE_TX_LINK_SYNC;
	
	return IAP2RC_SUCCESS;
}

Iap2Rc Iap2Link_handShake(Iap2Link* pIap2Link, Iap2Event eventId)
{
	//Detect iAP2 Support
	SEGGER_RTT_printf(0,"Iap2Link_handShake. 000\n");
	if(eventId != IAP2_EVENT_TRANSFER_SUCCESS)
	{
		SEGGER_RTT_printf(0,"iAp2 Link hand shake fialed.\n");
		return IAP2RC_FAILED;
	}
	SEGGER_RTT_printf(0,"Iap2Link_handShake. 11\n");

	if(pIap2Link->m_Irb.m_isTx)
	{
	
	SEGGER_RTT_printf(0,"Iap2Link_handShake. 222\n");
		SwTimer_Stop(&pIap2Link->m_ReTxTimer);
		Iap2Link_RcvData(pIap2Link, pIap2Link->m_pAckPkt, sizeof(auth_init_data));
		return IAP2RC_PENDING;
	}
	
	SEGGER_RTT_printf(0,"Iap2Link_handShake. 333\n");
	if(0 == memcmp(auth_init_data, pIap2Link->m_Irb.m_pBuff, pIap2Link->m_Irb.m_ActLen))
	{
	
	SEGGER_RTT_printf(0,"Iap2Link_handShake. 444\n");
		Iap2Link_SendSyncPkt(pIap2Link);
	}
	else
	{
	
	SEGGER_RTT_printf(0,"Iap2Link_handShake. 555\n");
		//indicate lack of backward compatibility
		static uint8 lack_of_backward_compatibility[] = {0xFF,0x55,0x0E,0x00,0x13,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xEB};
		Iap2Link_TxData(pIap2Link, lack_of_backward_compatibility, sizeof(lack_of_backward_compatibility), 0, 0);
	}
	SEGGER_RTT_printf(0,"Iap2Link_handShake. 666\n");

	return IAP2RC_SUCCESS;
}

void Iap2Link_TransferDone(Iap2Link* pIap2Link, Bool isSuccess)
{
	Irb* pIrb = &pIap2Link->m_Irb;
	Iap2LinkPkt* pPkt = Null;
	Iap2Event eventId = isSuccess? IAP2_EVENT_TRANSFER_SUCCESS : IAP2_EVENT_TRANSFER_FAILED;

	SEGGER_RTT_printf(0,"### function=%s line=%d \n",__FUNCTION__,__LINE__);

	if(!isSuccess && pIap2Link->m_ReTxTimer.m_isStart)
	{
		//Do nothing.
		//Waiting for time out and re-send.
		return;
	}
	
	SEGGER_RTT_printf(0,"### function=%s line=%d \n",__FUNCTION__,__LINE__);
	//Check if it is a handshake packet
	#if 0
	if(IAP2_STATE_INIT == pIap2Link->m_State)
	{
	
	SEGGER_RTT_printf(0,"### function=%s line=%d \n",__FUNCTION__,__LINE__);
		Iap2Link_handShake(pIap2Link, eventId);
		return ;
	}
#endif
	SEGGER_RTT_printf(0,"### function=%s line=%d \n",__FUNCTION__,__LINE__);

	pPkt = (Iap2LinkPkt*)pIap2Link->m_Irb.m_pBuff;
	if(pIrb->m_ActLen && !pIrb->m_isTx)	//Receive a packet
	{
		if(!Iap2Link_Verify(pIap2Link, pPkt, pIap2Link->m_Irb.m_ActLen))
		{
			SEGGER_RTT_printf(0,"Packet verify failed!\n");
			return;
		}
		
	SEGGER_RTT_printf(0,"### function=%s line=%d \n",__FUNCTION__,__LINE__);
		//Check if it is a link packet
		if(pPkt->m_CtrlByte.m_SlpBit)
		{
			SEGGER_RTT_printf(0,"Link Sleep.\n");
			Iap2Link_Sleep(pIap2Link);
			return ;
		}
		else if(pPkt->m_CtrlByte.m_RstBit)
		{
			SEGGER_RTT_printf(0,"Link Reset.\n");
			Iap2Link_SendSyncPkt(pIap2Link);
			return ;
		}
		else if(pPkt->m_CtrlByte.m_AckBit && pPkt->m_CtrlByte.m_EakBit)
		{
		
	SEGGER_RTT_printf(0,"### function=%s line=%d \n",__FUNCTION__,__LINE__);
			//Extended Acknowledgement Payload
			Iap2Link_Payload_Eak(pIap2Link, eventId, pPkt);
			return ;
		}
		
	SEGGER_RTT_printf(0,"### function=%s line=%d \n",__FUNCTION__,__LINE__);
	}

	SEGGER_RTT_printf(0,"### function=%s line=%d pIap2Link->m_State=%d\n",__FUNCTION__,__LINE__,pIap2Link->m_State);

	switch(pIap2Link->m_State)
	{
		case IAP2_STATE_TX_LINK_SYNC:
		case IAP2_STATE_RX_LINK_SYNC:
		case IAP2_STATE_TX_ACK:
			Iap2Link_Payload_SyncLink(pIap2Link, eventId, pPkt);
			break;
		case IAP2_STATE_LINK_DONE:
			SessionMgr_Fsm(pIap2Link->m_pSessionMgr, eventId, pPkt);
			break;
	}
	
}


void Iap2Link_Run(Iap2Link* pIap2Link)
{

//if( )

	SEGGER_RTT_printf(0,"### function=%s pIap2Link->m_ReTxTimer.m_isStart=%d\n",__FUNCTION__,pIap2Link->m_ReTxTimer.m_isStart);

	if(pIap2Link->m_ReTxTimer.m_isStart
		&& SwTimer_isTimerOutEx(&pIap2Link->m_ReTxTimer))
	{
	
	SEGGER_RTT_printf(0,"### function=%s line=%d\n",__FUNCTION__,__LINE__);
		if(pIap2Link->m_ReTxCount <= pIap2Link->m_MaxReTxCount
			|| IAP2_LINK_RETX_COUNT_UNLIMITIED == pIap2Link->m_MaxReTxCount)
		{
		
		SEGGER_RTT_printf(0,"### function=%s line=%d\n",__FUNCTION__,__LINE__);
			Iap2Link_ReTx(pIap2Link);
		}
	}
}

void Iap2Link_RegSession(Iap2Link* pIap2Link, SessionMgr* pSession)
{
//	ASRT(pIap2Link->m_SessionCount < IAP2_MAX_PAYLOAD_COUNT);
	memcpy(&pIap2Link->m_Session[pIap2Link->m_SessionCount++], pSession, sizeof(SessionIden));

	pIap2Link->m_pSessionMgr = pSession;
}

void Iap2Link_Start(Iap2Link* pIap2Link)
{
	//DetectiAP2Support
	
	SEGGER_RTT_printf(0,"Iap2Link_Start.\n");
	if(!Iap2Link_TxData(pIap2Link, auth_init_data, sizeof(auth_init_data), IAP2_RETX_INTERVAL, IAP2_LINK_RETX_COUNT_UNLIMITIED))
	{
		SEGGER_RTT_printf(0,"xxxxxx Send initialization pkt failed.\n");
		return ;
	}
	SEGGER_RTT_printf(0,"xxxxxxxxxxxxSend initialization pkt successful.\n");
	pIap2Link->m_State = IAP2_STATE_INIT;
	//pIap2Link->RxRsp = 
}

void Iap2Link_Init(Iap2Link* pIap2Link, Iap2LinkTransferFn Transfer)
{
	memset(pIap2Link, 0, sizeof(Iap2Link));
	
	pIap2Link->TransferStart = Transfer;

	//Init the data pointer
	pIap2Link->m_pReqPkt = (Iap2LinkPkt*)&pIap2Link->_ReqPkt;
	pIap2Link->m_pRspPkt = (Iap2LinkPkt*)&pIap2Link->_RspPkt;
	pIap2Link->m_pAckPkt = &pIap2Link->_AckPkt;
}

