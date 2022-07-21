#include "key_buffer.h"




void key_down(key_buf_t* key_buf, uint8_t key)
{
    key_buf->data[key & 0x0F] |= 1 << ((key & 0xF0) >> 4);
}





void key_up(key_buf_t* key_buf, uint8_t key)
{
    key_buf->data[key & 0x0F] &= ~(1 << ((key & 0xF0) >> 4));
}





uint8_t get_key(key_buf_t* key_buf, uint8_t key)
{
    return (key_buf->data[key & 0x0F] & (1 << ((key & 0xF0) >> 4))) >> ((key & 0xF0) >> 4);
}





uint8_t get_key_down_list(key_buf_t* key_buf, uint8_t* recv, uint8_t len)
{
    uint8_t i, j, key = 0, index = 0;

    for(i = 0; i < 16; ++i)
    {
        /*查询字节*/
        if(key_buf->data[i] != 0x00)
        {
            for(j = 0; j < 16; ++j)
            {
                /*查询位*/
                if((1 << j) & key_buf->data[i])
                {
                    if(index >= len)
                    {
                        return index;
                    }
                    key |= j;
                    key <<= 4;
                    key |= i;
                    recv[index++] = key;
                    key = 0x00;
                }
            }
        }
    }
    return index;
}





void key_clear(key_buf_t* key_buf)
{
    memset(key_buf->data, 0x00, sizeof(key_buf->data));
}



