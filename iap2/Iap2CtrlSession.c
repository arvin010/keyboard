
//#include "ArchDef.h"
#include "Iap2CtrlSession.h"
#include <string.h>
#include "iap2.h"
#include  <stdio.h>
#include  <stdlib.h>
#include "ft32f072x8.h"                  // Device header
#include "ft32f0xx_i2c.h"
//#include "GenericTypeDefs.h"
#include "main.h"
extern Iap2Link* g_pIap2Link;
extern Bool g_start_key ;


void Iap2CtrlSessionMsg_swap(Iap2CtrlSessionMsg* pMsg)
{
	
	uint16 i = 0;
	uint8* pByte = (uint8*)&pMsg->m_Param;
	Iap2CtrlSessionMsgParam* pParam = Null;
	
	pMsg->m_Len   = SWAP16(pMsg->m_Len);
	pMsg->m_MsgId = SWAP16(pMsg->m_MsgId);

	while(i < pMsg->m_Len)
	{
		pParam = (Iap2CtrlSessionMsgParam*)&pByte[i];

		pParam->m_Len 	= SWAP16(pParam->m_Len);
		pParam->m_MsgId = SWAP16(pParam->m_MsgId);

		i += pParam->m_Len;
	}
}

int Iap2CtrlSessionMsg_Init(Iap2CtrlSessionMsg* pMsg, uint16 MsgId)
{
	memset(pMsg, 0, sizeof(Iap2CtrlSessionMsg));

	pMsg->m_Sof = IAP2_CTRL_SESSION_MSG_SOM;
	
	pMsg->m_Len   = SWAP16(IAP2_CTRL_SESSION_MSG_HEAD_SIZE);
	
	pMsg->m_MsgId   = SWAP16(MsgId);

	return IAP2_CTRL_SESSION_MSG_HEAD_SIZE;
}

int Iap2CtrlSessionMsg_AddParam(Iap2CtrlSessionMsg* pMsg
	, uint16 paramId
	, const uint8* pData
	, uint16 len)
{
	uint8* pByte = (uint8*)pMsg;
	uint16 i = 2;//SWAP16(pMsg->m_Len);
	
	pByte[i++] = U16_MSB(len);		//Parameter Length MSB
	pByte[i++] = U16_LSB(len);		//Parameter Length LSB
	
	pByte[i++] = U16_MSB(paramId);	//Parameter ID MSB
	pByte[i++] = U16_LSB(paramId);	//Parameter ID LSB
	
	memcpy(&pByte[i], pData, len);	//Parameter Data
	
	//i += len;
	
	//pMsg->m_Len = SWAP16(i);
	pMsg->m_Len = SWAP16(len);
	

	return i;
}

static int Iap2CtrlSession_AuthenticationCerticate(const Iap2CtrlSessionMsg* pReq, uint8* pData, uint16* pLen)
{

#if 1





///	 int			 fd = -1;
	 int			 err = -1;
	 uint8_t		 buf[ 2 ];
	 uint8_t		 *certificateBuf;
	 int certificateLen;
	 

	 err = i2c_readdata(I2C1,0x20,kMFiAuthReg_DeviceCertificateSize,buf,2);
	 if(err < 0)
	 {
		 return err;
	 }
	certificateLen = ( buf[ 0 ] << 8 ) | buf[ 1 ];


	certificateBuf = (uint8_t *) malloc( certificateLen );
	memset(certificateBuf,0,certificateLen);

	err = i2c_readdata(I2C1,0x20,kMFiAuthReg_DeviceCertificateData1,certificateBuf,certificateLen);
	 if(err < 0)
	 	{
	 	
	 	free(certificateBuf);
		 return err;
	 	}
	
	//  iAP2Packet_t* packet = iAP2PacketCreateEmptySendPacket();
	   unsigned short parameterLen = ( unsigned short)certificateLen+4;
		unsigned short messageLen = ( unsigned short)certificateLen+10;

//		 uint32_t payloadLen = messageLen;
		 uint8_t payload[messageLen];
		payload[0]= 0x40;//start of message MSB
		 payload[1]= 0x40;// start of message LSB
		 payload[2]= (uint8_t)(((messageLen & 0xff00)>> 8)& 0x00ff);// Message Length MSB
		 payload[3]= (uint8_t)(messageLen & 0x00ff);// Message Length LSB
		  
		 payload[4]= 0xAA;// message id MSB
		 payload[5]= 0x01;// message id LSB
		 payload[6]= (uint8_t)(((parameterLen & 0xff00) >> 8)& 0xff);// parameter length MSB
		 payload[7]= (uint8_t)(parameterLen & 0x00ff);// parameter lenth LSB 35 =  31+4
		 payload[8]= 0x0;// parameter id id MSB
		 payload[9]= 0x0;// parameter id LSB
		 memcpy(&(payload[10]),certificateBuf,messageLen-10);


		 	 * pLen = sizeof(payload);  //0xaa01 huanghagnjing

	 Iap2CtrlSessionMsgParam *pParam = (Iap2CtrlSessionMsgParam *)pData;
	 pParam->m_MsgId=0xaa01;
	 pParam->m_Len = sizeof(payload);
	 if(pParam->m_Data==NULL)
	 pParam->m_Data = (uint8*)malloc(pParam->m_Len);
	 memcpy(pParam->m_Data,payload,pParam->m_Len);

	 
		/* iAP2LinkQueueSendData (g_iap2handle->runloop->link,
								payload,
								payloadLen,
								session,
								NULL,
								NULL);
*/
		 	free(certificateBuf);
	 return err;



#else
    uint16 page_num = 0;
	uint16 i, len = 0;
	uint8 j = 0;
        	
	*pLen = 0;
    //read data from MFI IC via IIC
    if(!IicDrv_Read(0x30, pData, 2))
    {
//		SEGGER_RTT_SEGGER_RTT_printf(0,0,"IIC Read data(2) error.\n");
		goto End;
    }
    
    len = (pData[0] << 8) + pData[1];
    if(len > 1024)
    {
        len = 1024;
    }
	
    page_num = len / MFI_IC_PAGE_SIZE;
    if(len % 128)
    {
        page_num ++;
    }
    
    j = 0x31;
    for(i = 0; i < page_num; i++)
    {
        if(!IicDrv_Read(j, pData + (128 * i), 128))
    	{
			SEGGER_RTT_SEGGER_RTT_printf(0,0,"IIC Read Page[%d] len[128] error.\n", i);
			goto End;
        }
        j++;
    }

	*pLen = len;

	return RC_SUCCESS;
End:
	return RC_FAILED;
#endif
	
}

static int Iap2CtrlSession_ChallengeRsp(const Iap2CtrlSessionMsg* pReq, uint8* pData, uint16* pLen)
{

// int			 fd = -1;
 int			 err = -1;
 uint8_t		 buf[ 2 ];
 uint8_t *   data = pReq->m_Param->m_Data;

 uint8_t * challengReciveBuf ;
 int challengLen = ((data[11]&0x00ff) <<8)|((data[12]&0x00ff));
	if(challengLen > 6)
		{
		challengReciveBuf = (uint8_t *)malloc(challengLen-6);
		memcpy(challengReciveBuf,&data[15],challengLen-6);
		}
		else
			return -1;

   
			
		
			   buf[ 0 ] = (uint8_t)( ( (challengLen-6) >> 8 ) & 0xFF );
			   buf[ 1 ] = (uint8_t)(   (challengLen -6)   & 0xFF );
 err =    i2c_senddata(I2C1,0x20,kMFiAuthReg_ChallengeSize,buf,2);
	 if(err < 0)
		{
	
		free(challengReciveBuf);
			   return err;
		}
	  err = i2c_senddata(I2C1,0x20,kMFiAuthReg_ChallengeData,challengReciveBuf,challengLen-6);
	 if(err < 0)
		{
	
		free(challengReciveBuf);
			   return err;
		}

  buf[ 0 ] = kMFiAuthControl_GenerateSignature;
			 
 err = i2c_senddata(I2C1,0x20,kMFiAuthReg_AuthControlStatus,&buf[0],1);
  if(err < 0)
	{

	free(challengReciveBuf);
			   return err;
	}

		
  buf[ 0 ] = 0;
			 
 err =i2c_readdata(I2C1,0x20,kMFiAuthReg_AuthControlStatus,&buf[0],1);
  if(err < 0)
	{

	free(challengReciveBuf);
			   return err;
	}
	 uint8_t staus = (uint8_t)(buf[0]>>4)& 0x0f;
	 if(kMFiAuthControl_GenerateSignature!=staus)
		{
	
		free(challengReciveBuf);
		return -1;
		}

				buf[ 0 ] = 0;
				buf[ 1 ] = 0;
				  err = i2c_readdata(I2C1,0x20,kMFiAuthReg_SignatureSize,buf,2);
					  if(err < 0)
						{
						
						free(challengReciveBuf);
								return err;
						}

					 int  signatureLen = ( buf[ 0 ] << 8 ) | buf[ 1 ];

					buf[ 0 ] = 0;
					buf[ 1 ] = 0;
	  err = i2c_readdata(I2C1,0x20,kMFiAuthReg_ChallengeSize,buf,2);
		  if(err < 0)
			{
		
			free(challengReciveBuf);
					return err;
			}
		  if(buf[1]==0 && buf[0]==0)
			{
		
			free(challengReciveBuf);
			return -1;
			}
				 challengLen = ( buf[ 0 ] << 8 ) | buf[ 1 ];
		  // challengLen = ((buf[1]&0x00ff) <<8)|((buf[0]&0x00ff));
			free(challengReciveBuf);
		  challengReciveBuf = (uint8_t *)malloc(signatureLen);
			err = i2c_readdata(I2C1,0x20,kMFiAuthReg_SignatureData,challengReciveBuf,signatureLen);
							if(err < 0)
								{
							
									free(challengReciveBuf);
									  return err;
								}


	  
//	iAP2Packet_t* packet = iAP2PacketCreateEmptySendPacket();
   int parameterLen = signatureLen+4;
	int messageLen = signatureLen+10;

//	 uint32_t payloadLen = messageLen;
	 uint8_t payload[messageLen];
	
	payload[0]= 0x40;//start of message MSB
	payload[1]= 0x40;// start of message LSB
	payload[2]= (uint8_t)(((messageLen & 0xff00)>> 8)& 0x00ff);// Message Length MSB
	payload[3]= (uint8_t)(messageLen & 0x00ff);// Message Length LSB
	payload[4]= 0xAA;// message id MSB
	payload[5]= 0x03;// message id LSB
	payload[6]= (uint8_t)(((parameterLen & 0xff00) >> 8)& 0xff);// parameter length MSB
	payload[7]= (uint8_t)(parameterLen & 0x00ff);// parameter lenth LSB 35 =  31+4
	payload[8]= 0x0;// parameter id id MSB
	payload[9]= 0x0;// parameter id LSB
/*
	 memcpy(&(payload[10]),challengReciveBuf,messageLen-10);
	 iAP2LinkQueueSendData (g_iap2handle->runloop->link,
							payload,
							payloadLen,
							session,
							NULL,
							NULL);
	
	 */

 * pLen = sizeof(payload);	//0xaa01 huanghagnjing
 
 Iap2CtrlSessionMsgParam *pParam = (Iap2CtrlSessionMsgParam *)pData;
 pParam->m_MsgId=0xaa01;
 pParam->m_Len = sizeof(payload);
	 if(pParam->m_Data==NULL)
	 pParam->m_Data = (uint8*)malloc(pParam->m_Len);
 memcpy(pParam->m_Data,payload,pParam->m_Len);



 free(challengReciveBuf);
 return err;

 
 
}



uint8 iAP2_identificationInformation [] =

{

    0x40,0x40,0x00,0x00,0x1d,0x01,
    // Name
    0x00,0x11,0x00,0x00,'M','F','I',' ','K','E','Y','B','O','A','R','D',0x00,
    // ModelIdentifier
    0x00,0x0B,0x00,0x01,'S','1','0','0','8','6',0x00,
    // Manufacturer
    0x00,0x09,0x00,0x02,'D','E','M','O',0x00,
    // SerialNumber
    0x00,0x0B,0x00,0x03,'S','1','0','0','1','0',0x00,
    // FirmwareVersion
    0x00,0x0A,0x00,0x04,'1','0','0','0','0',0x00,
    // HardwareVersion
    0x00,0x0A,0x00,0x05,'R','e','v',' ','1',0x00,
    // MessagesSentByAccessory
     0x00,0x2a,0x00,0x06,
         0x68,0x00,0x68,0x02,0x68,0x03,
         0x4c,0x00,0x4c,0x02,0x4c,0x03,
         0x4c,0x05,0x4c,0x06,0x4c,0x07,
         0x4c,0x08,0x4c,0x09,0x50,0x00,
         0x50,0x02,0x50,0x03,0xDA,0x00,
         0xDA,0x02,0xae,0x00,0xae,0x02,
         0xae,0x03,
    // MessagesReceivedFromDevice
    0x00,0x18,0x00,0x07,
    		0x68,0x01,
    		0x4c,0x01,0x4c,0x004,
    		0x50,0x01,
    		0xDA,0x01,
    		0xae,0x01,
    		0x4e,0x09,
    		0x4e,0x0a,
    		0x4e,0x0b,
    		0x4e,0x0c,
    // PowerSourceType
    0x00,0x05,0x00,0x08,2,
    // MaximumCurrentDrawnFromDevice
    0x00,0x06,0x00,0x09,0, 0,
    // CurrentLanguage
    0x00,0x07,0x00,0x0C,'e','n',0x00,
   // SupportedLanguage
    0x00,0x07,0x00,0x0D,'e','n',0x00,
    // USBDeviceTransportComponent
    0x00,0x26,0x00,0x0F,
        // TransportComponentIdentifier
        0x00,0x06,0x00,0x00,0, 1,
        // TransportComponentName
        0x00,0x09,0x00,0x01,'i','A','P','2',0x00,
        // TransportSupportsiAP2Connection
        0x00,0x04,0x00,0x02,
        // USBDeviceSupportedAudioSampleRate
        0x00,0x05,0x00,0x03,0x06,
        // USBDeviceSupportedAudioSampleRate
        0x00,0x05,0x00,0x03,0x07,
        // USBDeviceSupportedAudioSampleRate
        0x00,0x05,0x00,0x03,0x08,
    // iAP2HIDComponent
    0x00,0x1f,0x00,0x12,
        // HIDComponentIdentifier
        0x00,0x06,0x00,0x00,0, 1,
        // HIDComponentName
        0x00,0x0B,0x00,0x01,'R','e','m','o','t','e',0x00,
        0x00,0x05,0x00,0x02,0,
        // HIDComponentFunction
        0x00,0x05,0x00,0x02,1,
};

static int Iap2CtrlSession_GetIDInfo(const Iap2CtrlSessionMsg* pReq, uint8* pData, uint16* pLen)
{
	* pLen = sizeof(iAP2_identificationInformation);  //0xaa01 huanghagnjing
	// uint8* pDataInfo = iAP2_identificationInformation;
	Iap2CtrlSessionMsgParam *pParam = (Iap2CtrlSessionMsgParam *)pData;
	pParam->m_MsgId=0x1d01;
	pParam->m_Len = sizeof(iAP2_identificationInformation);
	if(pParam->m_Data == NULL)
		pParam->m_Data = (uint8*)malloc(pParam->m_Len);
	memcpy(pParam->m_Data,iAP2_identificationInformation,pParam->m_Len);
	//pParam->m_Data = pDataInfo; 
	//pParam->m_Data = iAP2_identificationInformation;
	//iAP2_identificationInformation;
	
	return IAP2RC_SUCCESS;
}

int Iap2CtrlSession_EventProc(Iap2CtrlSession* pSession, Iap2Event eventId)
{
	//PF_VAR(DL_MAIN, eventId);
	
	if(IAP2_EVENT_SESSION_DONE == eventId)
	{
		if(IAP2_REQ_AUTH == pSession->m_MsgId
			|| IAP2_REQ_AUTH_CHA_RSP == pSession->m_MsgId
			|| IAP2_RSP_AUTH_RESULT_SUCCESS == pSession->m_MsgId)
		{
			SessionMgr_RxReq((SessionMgr*)pSession);
		}
		else if(IAP2_REQ_ID_ACCEPTED == pSession->m_MsgId)
		{
			SessionMgr_TxReq((SessionMgr*)pSession, Null, 0);
		}
	}
	else if(IAP2_EVENT_LINK_SYNC_DONE == eventId)
	{
		SessionMgr_RxReq((SessionMgr*)pSession);
	}
	else if(IAP2_EVENT_TRANSFER_FAILED == eventId)
	{
		//Break the session
	}
	return IAP2RC_SUCCESS;
}
 uint8_t	 keyboard_reportDescriptor[] = {
										  0x05,0x01,
										  0x09,0x06,
										  0xa1,0x01,
										  0x05,0x08,
										  0x15,0x00,
										  0x25,0x01,
										  0x09,0x02,
										  0x75,0x01,
										  0x95,0x01,
										  0x91,0x02,
										  0x75,0x07,
										  0x95,0x01,
										  0x91,0x03,
										  0x05,0x07,
										  0x19,0xe0,
										  0x29,0xe7,
										  0x75,0x01,
										  0x95,0x08,
										  0x81,0x02,
										  0x15,0x00,
										  0x26,0xff,0x00,
										  0x19,0x00,
										  0x2a,0xff,0x00,
										  0x75,0x08,
										  0x95,0x05,
										  0x81,0x00,
										  0x05,0x0c,
										  0x15,0x00,
										  0x25,0x01,
										  0x09,0x40,
										  0x0a,0x21,0x02,
										  0x0a,0xae,0x01,
										  0x09,0xb6,
										  0x09,0xcd,
										  0x09,0xb5,
										  0x09,0xe2,
										  0x09,0xea,
										  0x09,0xe9,
										  0x09,0x30,
										  0x71,0x01,
										  0x95,0x0a,
										  0x81,0x02,
										  0x75,0x06,
										  0x95,0x01,
										  0x81,0x03,
										  0xc0
										
										 
									  };
 void startKeyboardHid(const Iap2CtrlSessionMsg* pReq, uint8* pData, uint16* pLen)

{


	int messageLen = 0;
	int len;
   // uint32_t payloadLen = messageLen;

	uint8_t payload[1024];
   payload[0]= 0x40;//start of message MSB
   payload[1]= 0x40;// start of message LSB
   //payload[2]= (uint8_t)(((messageLen & 0xff00)>> 8)& 0x00ff);// Message Length MSB
   //payload[3]= (uint8_t)(messageLen & 0x00ff);// Message Length LSB
 
   payload[4]= 0x68;// message id MSB
   payload[5]= 0x00;// message id LSB
   messageLen +=6;

   //HIDComponentIdentifier
   len = 6;
   payload[messageLen]= (uint8_t)(((len & 0xff00) >> 8)& 0xff);// parameter length MSB
   payload[messageLen+1]= (uint8_t)(len & 0x00ff);// parameter lenth LSB 35 =  31+4
   payload[messageLen+2]= 0x0;// parameter id id MSB
   payload[messageLen+3]= 0x00;// parameter id LSB
   payload[messageLen+4]= 0x00;// 
   payload[messageLen+5]= 0x01;// 
   messageLen+=len;

   //vendorIdentifier
   len = 6;
   payload[messageLen]= (uint8_t)(((len & 0xff00) >> 8)& 0xff);// parameter length MSB
   payload[messageLen+1]= (uint8_t)(len & 0x00ff);// parameter lenth LSB 35 =  31+4
   payload[messageLen+2]= 0x0;// parameter id id MSB
   payload[messageLen+3]= 0x01;// parameter id LSB
   payload[messageLen+4]= 0x05;// 
   payload[messageLen+5]= 0xac;// 
   //payload[messageLen+4]= 0x18;// 
  // payload[messageLen+5]= 0xd1;// 
   messageLen+=len;

   //productIdentifier
   len = 6;
   payload[messageLen]= (uint8_t)(((len & 0xff00) >> 8)& 0xff);// parameter length MSB
   payload[messageLen+1]= (uint8_t)(len & 0x00ff);// parameter lenth LSB 35 =  31+4
   payload[messageLen+2]= 0x0;// parameter id id MSB
   payload[messageLen+3]= 0x02;// parameter id LSB
   payload[messageLen+4]= 0x12;//0x00;// 
   payload[messageLen+5]= 0xa8;//0x00;// 
// payload[messageLen+4]= 0x00;//0x00;// 
  // payload[messageLen+5]= 0x00;//0x00;//
   messageLen+=len;

   //playback hid report
   len = 4+sizeof(keyboard_reportDescriptor);
   payload[messageLen]= (uint8_t)(((len & 0xff00) >> 8)& 0xff);// parameter length MSB
   payload[messageLen+1]= (uint8_t)(len & 0x00ff);// parameter lenth LSB 35 =  31+4
   payload[messageLen+2]= 0x0;// parameter id id MSB
   payload[messageLen+3]= 0x04;// parameter id LSB
   memcpy(&payload[messageLen+4],keyboard_reportDescriptor,sizeof(keyboard_reportDescriptor));
   messageLen+=len;

   //////////////////////////////////////////////////////
   payload[2]= (uint8_t)(((messageLen & 0xff00)>> 8)& 0x00ff);// Message Length MSB
   payload[3]= (uint8_t)(messageLen & 0x00ff);// Message Length LSB


			 
			 Iap2CtrlSessionMsgParam *pParam = (Iap2CtrlSessionMsgParam *)pData;
			 pParam->m_MsgId=0xaa01;
			 pParam->m_Len = sizeof(payload);
			 
			 if(pParam->m_Data == NULL)
				 pParam->m_Data = (uint8*)malloc(pParam->m_Len);
			 memcpy(pParam->m_Data,payload,pParam->m_Len);

	//uint8_t * challengReciveBuf = (uint8_t*)malloc(messageLen);
   
	//memcpy(challengReciveBuf,payload,messageLen);
 //  BOOL ret =  iAP2LinkQueueSendData (g_iap2handle->runloop->link,
						 //  challengReciveBuf,
						  //// messageLen,
						  // session,
						  // NULL,
						  // NULL);
  
	//free(challengReciveBuf);


}

int Iap2CtrlSession_ReqProc(Iap2CtrlSession* pSession, const Iap2CtrlSessionMsg* pReq, Iap2CtrlSessionMsg* pRsp, uint16* pLen)
{	
	uint16 nRspLen = 0;
//	int nRet = RC_UNKNOWN;
	uint16 msgId = SWAP16(pReq->m_MsgId);

	*pLen = 0;
	Iap2CtrlSessionMsg_Init(pRsp, msgId + 1);

	pSession->m_MsgId = msgId;
	if(IAP2_REQ_AUTH == msgId) //aa00
	{
		Iap2CtrlSession_AuthenticationCerticate(pReq, (uint8*)pRsp->m_Param, &nRspLen);
	}
	else if(IAP2_REQ_AUTH_CHA_RSP == msgId) //aa02
	{
		Iap2CtrlSession_ChallengeRsp(pReq, (uint8*)pRsp->m_Param, &nRspLen);
	}
	else if(IAP2_RSP_AUTH_RESULT_SUCCESS == msgId)
	{
		//No Response
	}
	else if(IAP2_REQ_ID == msgId)
	{
		Iap2CtrlSession_GetIDInfo(pReq, (uint8*)pRsp->m_Param, &nRspLen);
	}
	else if(IAP2_REQ_ID_ACCEPTED == msgId)
	{
	startKeyboardHid(pReq, (uint8*)pRsp->m_Param, &nRspLen);
	g_start_key = TRUE;
		//No Response
	}
	else if(IAP2_REQ_ID_REJECTED == msgId)
		{
		   Iap2CtrlSession_GetIDInfo(pReq, (uint8*)pRsp->m_Param, &nRspLen);
		}
	
	if(nRspLen)
	{
		*pLen = Iap2CtrlSessionMsg_AddParam(pRsp, 0, (uint8*)pRsp->m_Param, nRspLen);
	}

	return IAP2RC_SUCCESS;
}

int Iap2CtrlSession_RspProc(Iap2CtrlSession* pSession, const Iap2CtrlSessionMsg* pReq, const Iap2CtrlSessionMsg* pRsp)
{
	return IAP2RC_SUCCESS;
}

Bool Iap2CtrlSession_SendMsg(Iap2CtrlSession* pIap2CtrlSession, Iap2CtrlSessionMsg* pMsg)
{
	return Iap2Link_TxData(g_pIap2Link, pMsg, pMsg->m_Len, 0, 0);
}

Bool Iap2CtrlSession_Init(Iap2CtrlSession* pIap2CtrlSession)
{
	SessionIden* pSessionIden = (SessionIden*)pIap2CtrlSession;
	SessionMgr* pSession = (SessionMgr*)pIap2CtrlSession;

	memset(pIap2CtrlSession, 0, sizeof(Iap2CtrlSession));
	SessionMgr_Init(pSession);
	
	pSessionIden->m_ID   = CONTROL_SESSION_ID;
	pSessionIden->m_Type = CONTROL_SESSION_TYPE;
	pSessionIden->m_Ver  = CONTROL_SESSION_VERSION;
	
	pSession->EventProc = (Iap2EventFn)Iap2CtrlSession_EventProc;
	pSession->ReqProc 	= (Iap2ReqFn)Iap2CtrlSession_ReqProc;
	pSession->RspProc 	= (Iap2RspFn)Iap2CtrlSession_RspProc;

	Iap2Link_RegSession(g_pIap2Link, pSession);

	return True;
}

