#ifndef __key_buffer_h__
#define __key_buffer_h__


#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>



typedef struct
{
    uint16_t data[16];
}key_buf_t;






void key_down(key_buf_t* key_buf, uint8_t key);
void key_up(key_buf_t* key_buf, uint8_t key);
uint8_t get_key(key_buf_t* key_buf, uint8_t key);
uint8_t get_key_down_list(key_buf_t* key_buf, uint8_t* recv, uint8_t len);
void key_clear(key_buf_t* key_buf);




#endif



