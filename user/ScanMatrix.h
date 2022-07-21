#ifndef __SCANMATRIX_H__
#define __SCANMATRIX_H__




#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include "key_buffer.h"




/*
矩阵扫描方式
一、粗扫
    1、按顺序依次读取所有ROW口
    2、按顺序依次读取所有COL口
    得到按下的ROW列表和COL列表
二、精扫
    传入粗扫得到的ROW列表和COL列表
    对传入的列表每一个ROW口和COL进行单独扫描
三、通过两次扫描得到比较可信的按键键码列表
四、鬼键去除
    依据：
        1、对每个一按下的按键做判断，判断是否是上一次按下HOLD的按键
        2、如果按键是HOLD键，则该键身份可确定。
        3、如果按键不是HOLD键，则对该键进行鬼键核查
        4、扫描该键所在ROW口是否有2个或以上键按下
        5、扫描该键所在的COL口是否有2个或以上键按下
        6、如果该键所有的ROW和COL线同进有2个或更多键按下，则该键身份无法确认，丢弃！
*/







/*电平定义*/
typedef enum{
    low = 0X00,
    high = 0X01
}level_t;










typedef void(*pin_cfg_t)(void* gpioList, uint8_t index, gpioMode_t mode);
typedef void(*pin_write_t)(void* gpioList, uint8_t index, level_t level);
typedef uint8_t(*pin_read_t)(void* gpioList, uint8_t index);



typedef struct{
	uint8_t key;
	uint8_t remap;
}remap_t;

typedef struct{
    uint8_t row;
    uint8_t col;
    uint8_t* keyMap;
    pin_read_t pin_read;
    pin_write_t pin_write;
    pin_cfg_t pin_cfg;
    uint8_t* rowPinList;
    uint8_t* colPinList;
	uint8_t fn_led_status;
	uint8_t caps_led_status;
	key_buf_t buff;
	remap_t* remap;
	uint8_t remap_num;
	remap_t* remap2;
	uint8_t remap2_num;
	uint8_t send[8];
	uint8_t acpi_send[2];
	uint8_t acpi_send_flag;
	uint8_t send_last[8];
	uint32_t sleepCont;
}matrix_t;







/*
功能：矩阵扫描
参数：
    @matrix 矩阵结构体
    @keyList 扫描得到的按键列表缓冲区
返回值：失败返回负数，成功返回按键列表当次扫描按键数量
备注：无
*/
void matrix_scan(matrix_t* matrix);
void hotKey(matrix_t* matrix);
void build_keycode(matrix_t* matrix);
void send_keycode(matrix_t* matrix);
void send_acpi_media_keycode(matrix_t* matrix);







#endif



