#ifndef __matrix_h__
#define __matrix_h__




#include "key_buffer.h"
#include "io.h"

#define MAX_ROW_NUM	8
#define MAX_COL_NUM	18


typedef struct{
	uint8_t key;
	uint8_t remap;
}remap_t;


#pragma pack(1)
typedef struct 
{
    uint8_t row_qty;
    uint8_t col_qty;
    KeyIOMap* row_table;
    KeyIOMap* col_table;
    uint8_t* map;
    uint16_t pos[32];
    key_buf_t buf;
    key_buf_t last_buf;
	uint8_t fn_led_status;
	uint8_t caps_led_status;
	remap_t* remap;
	uint8_t remap_num;
	remap_t* remap2;
	uint8_t remap2_num;
	uint8_t send[8];
	uint8_t acpi_send[2];
	uint8_t acpi_send_flag;
	uint8_t send_last[8];
}matrix_t;
#pragma pack()





void matrix_scan_key(matrix_t* matrix);
void matrix_scan_again(matrix_t* matrix);
void matrix_key_handle(matrix_t* matrix);






#endif






