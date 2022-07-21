#include "ScanMatrix.h"
#include "main.h"





typedef struct{
    uint8_t rQty;
    uint8_t cQty;
    uint8_t rList[32];
    uint8_t cList[32];
}scanData_t;








typedef struct{
    uint8_t keyCode;
    uint8_t rowIndex;
    uint8_t colIndex;
}keyData_t;





/*
功能：初始化矩阵GPIO
参数：@matrix 对象结构体
返回值：无
备注：无
*/
static void init_matrix_gpio(matrix_t* matrix)
{
    /*初始Row口设置为输入上拉*/
    for(uint8_t i = 0; i < matrix->row; ++i)
    {
        matrix->pin_cfg(matrix->rowPinList, i, ModeIN_PU_noINT);
    }

    /*初始Col口设置为输入上位*/
    for(uint8_t i = 0; i < matrix->col; ++i)
    {
        matrix->pin_cfg(matrix->colPinList, i, ModeIN_PU_noINT);
    }
}








/*
功能：初始化ROW扫描IO口
参数：@matrix 对象结构体
返回值：无
备注：无
*/
static void initScanRow(matrix_t* matrix)
{
    /*Row口设置为输入上拉*/
    for(uint8_t i = 0; i < matrix->row; ++i)
    {
        matrix->pin_cfg(matrix->rowPinList, i, ModeIN_PU_noINT);
    }

    /*Col口设置为输出下拉*/
    for(uint8_t i = 0; i < matrix->col; ++i)
    {
        matrix->pin_cfg(matrix->colPinList, i, ModeOut_PD_noINT);
    }
}








/*
功能：初始化COL扫描IO口
参数：@matrix 对象结构体
返回值：无
备注：无
*/
static void initScanCol(matrix_t* matrix)
{
    /*COL口设置为输入上拉*/
    for(uint8_t i = 0; i < matrix->col; ++i)
    {
        matrix->pin_cfg(matrix->colPinList, i, ModeIN_PU_noINT);
    }

    /*ROW口设置为输出下拉*/
    for(uint8_t i = 0; i < matrix->row; ++i)
    {
        matrix->pin_cfg(matrix->rowPinList, i, ModeOut_PD_noINT);
    }
}








/*
功能：扫描ROW
参数：
    @matrix 对象结构体
    @indexList ROW按下INDEX列表
返回值：返回按下的ROW线数量
备注：无
*/
static int8_t scanRow(matrix_t* matrix, uint8_t* indexList)
{
    int8_t qty = 0;

    /*读取所有ROW线*/
    for(uint8_t i = 0; i < matrix->row; ++i)
    {
        if(!matrix->pin_read(matrix->rowPinList, i))
        {
            indexList[qty++] = i;
        }
    }

    return qty;
}








/*
功能：扫描COL
参数：
    @matrix 对象结构体
    @indexList COL按下INDEX列表
返回值：返回按下的COL线数量
备注：无
*/
static int8_t scanCol(matrix_t* matrix, uint8_t* indexList)
{
    int8_t qty = 0;

    /*读取所有COL*/
    for(uint8_t i = 0; i < matrix->col; ++i)
    {
        if(!matrix->pin_read(matrix->colPinList, i))
        {
            indexList[qty++] = i;
        }
    }

    return qty;
}








/*
功能：粗扫描
参数：
    @matrix 对象结构体
    @outData 扫描到的按下的ROW,COL线数据
返回值：无返回值
备注：无
*/
static void rough_scan(matrix_t* matrix, scanData_t* outData)
{

    /*初始IO设置*/
    init_matrix_gpio(matrix);

    /*ROW扫描*/
    initScanRow(matrix);
    outData->rQty = scanRow(matrix, outData->rList);
	
    /*COL扫描*/
    initScanCol(matrix);
    outData->cQty = scanCol(matrix, outData->cList);
	
}








/*
功能：过滤鬼键
参数：
    @in 输入缓冲区
    @inQty 输入缓冲区长度
    @out 输出缓冲区
返回值：失败返回负数，成功返回鬼键过滤后输出按下按键数量
备注：无
*/
static uint8_t ghost(uint8_t* last, uint8_t lastQty, 
    keyData_t* in, uint8_t inQty, uint8_t* out)
{
    uint8_t ckQty = 0, outQty = 0;
    uint8_t r_cont = 0, c_cont = 0;
    keyData_t ckBuffer[64] = {0x00};
	
    /*1、判断是否是HOLD键*/
	for(uint8_t i = 0; i < lastQty; ++i)
	{
		for(uint8_t j = 0; j < inQty; ++j)
		{
			if(in[j].keyCode == last[i])
			{
				/*处理HOLD键，放入OUT缓冲区中*/
				out[outQty++] = in[j].keyCode;
				in[j].keyCode = 0x00;
			}
		}
	}
	
	/*2、拷贝新按下的键*/
	for(uint8_t i = 0; i < inQty; ++i)
	{
		if(in[i].keyCode != 0x00)
		{
			ckBuffer[ckQty].colIndex = in[i].colIndex;
			ckBuffer[ckQty].rowIndex = in[i].rowIndex;
			ckBuffer[ckQty++].keyCode = in[i].keyCode;
		}
	}
	
    /*3、判断新按下的键是否是鬼键*/
    for(uint8_t i = 0; i < ckQty; ++i)
    {
        for(uint8_t j = 0; j < inQty; ++j)
        {
	        /*统计嫌疑键所在的R线上其他被按下的按键数量*/
			if(ckBuffer[i].rowIndex == in[j].rowIndex)
			{
				r_cont++;
			}					 
			/*统计嫌疑键所在的C线上其他被按下的按键数量*/
			if(ckBuffer[i].colIndex == in[j].colIndex)
			{
				c_cont++;
			}
        }
        if(!(r_cont >=2 && c_cont >= 2))
        {
            /*不是鬼键，放入out缓冲区中*/
            out[outQty++] = ckBuffer[i].keyCode;
        }
    }
	
    return outQty;
}






/*
功能：精确扫描
参数：
    @matrix 对象结构体
    @inData 粗扫得来的ROW,COL数据
    @buffer 精确扫描后得到的按键值缓冲区
返回值：失败返回负数，成功返回按下按键数量
备注：无
*/
static uint8_t exactScan(matrix_t* matrix, 
    scanData_t* inData, uint8_t* out)
{
    uint8_t qty = 0;
    uint8_t keyQty = 0;
    uint8_t (*keyMap)[matrix->row] = (uint8_t(*)[matrix->row])matrix->keyMap;
    keyData_t keyBuffer[128] = {0};
    static uint8_t lastBuffer[128] = {0};
	static uint8_t lastQty = 0;
	
    /*初始IO设置*/
    init_matrix_gpio(matrix);

    /*精确扫描*/
    for(uint8_t r = 0; r < inData->rQty; ++r)
    {
        for(uint8_t c = 0; c < inData->cQty; ++c)
        {
            /*将要读取的COL线设置为推挽输出下拉*/
            matrix->pin_cfg(matrix->colPinList, 
                inData->cList[c], ModeOut_PD_noINT);
            /*读取当前ROW线，如果得到低电平，则证明该COL线按下*/
            if(!matrix->pin_read(matrix->rowPinList, inData->rList[r]))
            {
                /*保存精确扫描得到的按下按键码和COL,ROW线的INDEX，用于鬼键过滤*/
                keyBuffer[keyQty].colIndex = inData->cList[c];
                keyBuffer[keyQty].rowIndex = inData->rList[r];
                keyBuffer[keyQty++].keyCode = keyMap[inData->cList[c]][inData->rList[r]];
            }
            /*确认完一条COL线后，将IO口状态配置为输入上拉防止影响其他键判断*/
            matrix->pin_cfg(matrix->colPinList, 
                inData->cList[c], ModeIN_PU_noINT);
        }
    }
		
    /*鬼键筛查*/
	qty = ghost(lastBuffer, lastQty, keyBuffer, keyQty, out);

    memset(lastBuffer, 0, sizeof(lastBuffer));
    memcpy(lastBuffer, out, qty);
    lastQty = qty;
	
    return qty;
}








/*
功能：矩阵扫描
参数：
    @matrix 矩阵结构体
    @keyList 扫描得到的按键列表缓冲区
返回值：失败返回负数，成功返回按键列表当次扫描按键数量
备注：无
*/
void matrix_scan(matrix_t* matrix)
{
	uint8_t i, qty;
	uint8_t keyList[128] = {0x00};
    scanData_t scanData;

    /*粗略扫描*/
	rough_scan(matrix, &scanData);

    /*精确扫描*/
    qty = exactScan(matrix, &scanData, keyList);
	
	for(i = 0; i < qty; ++i)
	{
		key_down(&(matrix->buff), keyList[i]);
	}
}





static void remap(matrix_t* matrix, remap_t* remap, uint8_t num)
{
	int i;
	for(i = 0; i < num; ++i)
	{
		if(get_key(&(matrix->buff), remap[i].key))
		{
			key_up(&(matrix->buff), remap[i].key);
			key_down(&(matrix->buff), remap[i].remap);
		}
	}
}







void hotKey(matrix_t* matrix)
{
	static uint8_t lock_flag = 0x00;
		
	if(get_key(&(matrix->buff), KEY_FN))
	{
		/*抬起FN键*/
		key_up(&(matrix->buff), KEY_FN);
		
		/*FN+ESC Fn锁切换判断*/
		if(get_key(&(matrix->buff), KEY_ESC) && !lock_flag)
		{
			lock_flag = 0x01;
			matrix->fn_led_status ^= 1;
			/*操作FN指示灯*/
			GPIO_WriteBit(LED_PORT, LED_PIN_FN, (BitAction)(matrix->fn_led_status));
		}else if(get_key(&(matrix->buff), KEY_ESC) == 0x00 && lock_flag)
		{
			lock_flag = 0x00;
		}
		
		key_up(&(matrix->buff), KEY_ESC);
		
		
		/*FN组合亮灯, 输出图标功能*/
		if(matrix->fn_led_status)
		{		
			remap(matrix, matrix->remap, matrix->remap_num);
		}
		
		/*映射上下左右*/
		remap(matrix, matrix->remap2, matrix->remap2_num);
	}
	else
	{
		/*没按下FN键*/
		if(!(matrix->fn_led_status))
		{
			/*单按灭灯,输入图标功能*/
			remap(matrix, matrix->remap, matrix->remap_num);
		}
	}
}






static void handle_super_key(matrix_t* matrix)
{
	uint8_t i;
	
	for(i = 0; i < 8; ++i)
	{
		if(get_key(&(matrix->buff), 0xE0 + i))
		{
			key_up(&(matrix->buff), 0xE0 + i);
			matrix->send[0] |= 1 << i;
		}
	}
}








void build_keycode(matrix_t* matrix)
{
	uint8_t t_buff[128] = {0x00};
	uint8_t i, q = 0x00, index = 2;

	handle_super_key(matrix);
	q = GetKeyDownList(&(matrix->buff), t_buff, sizeof(t_buff));
	
	for(i = 0; i < q && index < 8; ++i)
	{
		switch(t_buff[i])
		{
			case MUTE:					/*静音*/
			case VOL_DOWN:				/*音量减*/
			case VOL_UP:				/*音量加*/
			case PLAY_PAUSE:			/*播放_暂停*/
			case PROJECTION_SCREEN:		/*投屏*/
			case NOTIFICATION_CENTER:	/*通知中心*/
			case LOCK:					/*锁屏*/
			case FLIGHT_MODE:			/*飞行模式*/
			case BRIGHT_UP:				/*亮度加*/
			case BRIGHT_DOWN: 			/*亮度减*/
				if(matrix->acpi_send_flag == 0x00)
				{
					matrix->acpi_send[0] = t_buff[i];
					matrix->acpi_send_flag = 0x01;
				}
			break;	
			default: matrix->send[index++] = t_buff[i];
		}	
	
	}
	
	if(matrix->acpi_send_flag == 0x02 && !GetKey(&matrix->buff, matrix->acpi_send[0]))
	{
		memset(matrix->acpi_send, 0x00, sizeof(matrix->acpi_send));
		matrix->acpi_send_flag = 0x03;
	}
	
	KeyClear(&(matrix->buff));
}

/*
判断是不是ACPI和多媒体，需添加
*/


void send_keycode(matrix_t* matrix)
{
	uint8_t flag = 0;
	
	for(uint8_t i = 0; i < 8; ++i)
	{
		if(matrix->send_last[i] == matrix->send[i])
		{
			flag++;
		}
	}
	
	if(flag < 8)
	{
		//清空休眠计数
		matrix->sleepCont = 0;
		
		uint8_t key_send_buff[18] = {0x00};
		key_send_buff[0] = 0xFE;
		key_send_buff[1] = 0xEF;
		key_send_buff[5] = 0x28;
		key_send_buff[14] = 0x0D;
		key_send_buff[15] = 0x0A;
		key_send_buff[16] = 0xEE;
		key_send_buff[17] = 0xEE;
		memcpy(&key_send_buff[6], matrix->send, sizeof(matrix->send));
		
		for(int i = 0; i < sizeof(key_send_buff); ++i)
		{
			dbg_print("%02x ", key_send_buff[i]);
		}
		dbg_print("\n");
		
		
		//发送
		Uart_Senddata(key_send_buff, sizeof(key_send_buff));
		//Uart_Senddata(matrix->send, sizeof(matrix->send));
		
		//更新
		memcpy(matrix->send_last, matrix->send, sizeof(matrix->send_last));
		

	}
	
	memset(matrix->send, 0x00, sizeof(matrix->send));
}




void send_acpi_media_keycode(matrix_t* matrix)
{
	uint8_t t_send[12] = {0xFE, 0xEF, 0x00, 0x00, 0x00, 0x42, 0x00, 0x00, 0x0D, 0x0A, 0xEE, 0xEE};
	
	//发送多媒体键，ACPI键
	if(matrix->acpi_send_flag == 0x01)
	{
		//发送多媒体键
		memcpy(&t_send[6], matrix->acpi_send, sizeof(matrix->acpi_send));
		Uart_Senddata(t_send, sizeof(t_send));
		matrix->acpi_send_flag = 0x02;
		#ifdef __DBG_PRINTF
		for(int i = 0; i < 12; ++i)
		{
			dbg_print("%02x ", t_send[i]);
		}
		dbg_print("\n");
		#endif
		
	}else if(matrix->acpi_send_flag == 0x03)
	{
		//发送抬起包
		Uart_Senddata(t_send, sizeof(t_send));
		matrix->acpi_send_flag = 0x00;
		#ifdef __DBG_PRINTF
		for(int i = 0; i < 12; ++i)
		{
			dbg_print("%02x ", t_send[i]);
		}
		dbg_print("\n");
		#endif
	}
	
}

















