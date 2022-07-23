
#ifndef __DRIVER__H_
#define __DRIVER__H_



#include "GenericTypeDefs.h"
#include "Iap2Link.h"

Bool Driver_TransferStart(Irb* pIrb);
void Driver_RxDone(const void* pData, int len);
void Driver_Check(void);
void Driver_TxDone(void);



#endif

