#include "matrix.h"
#include "main.h"



static void init_matrix_gpio(matrix_t* matrix)
{
	uint8_t i;

    for(i = 0; i < matrix->row_qty; ++i)
    {
		set_IO_PinMode(matrix->row_table[i].port, matrix->row_table[i].pin, ModeIN_PD_noINT);
    }
    for(i = 0; i < matrix->col_qty; ++i)
    {
		set_IO_PinMode(matrix->col_table[i].port, matrix->col_table[i].pin, ModeIN_PD_noINT);
    }
}


//row扫 
//1、配置 row 输入下拉
//2、配置 col 推挽 高电平
//3、读row ,高电平，按下
static void init_scan_row(matrix_t* matrix)
{
	uint8_t i;
	
    for(i = 0; i < matrix->row_qty; ++i)
    {
		set_IO_PinMode(matrix->row_table[i].port, matrix->row_table[i].pin, ModeIN_PD_noINT);
    }
    for(i = 0; i < matrix->col_qty; ++i)
    {
		set_IO_PinMode(matrix->col_table[i].port, matrix->col_table[i].pin, ModeOut_noINT);
		GPIO_WriteBit(matrix->col_table[i].port, matrix->col_table[i].pin, HIGH);
    }
}

//col扫
//1、配置 col 输入下拉
//2、配置 row 推挽 高电平
//3、读col ,高电平，按下
static void init_scan_col(matrix_t* matrix)
{
	uint8_t i;
	
    for(i = 0; i < matrix->col_qty; ++i)
    {
		set_IO_PinMode(matrix->col_table[i].port, matrix->col_table[i].pin, ModeIN_PD_noINT);
    }
    for(i = 0; i < matrix->row_qty; ++i)
    {
		set_IO_PinMode(matrix->row_table[i].port, matrix->row_table[i].pin, ModeOut_noINT);
		GPIO_WriteBit(matrix->row_table[i].port, matrix->row_table[i].pin, HIGH);
    }
}



static void scan_row(matrix_t* matrix)
{
	uint8_t i;
	
	for(i = 0; i < matrix->row_qty; ++i)
	{
		if(GPIO_ReadInputDataBit(matrix->row_table[i].port, matrix->row_table[i].pin))
		{
			matrix->pos[matrix->col_qty] |= 1 << i;
		}
	}
}



static void scan_col(matrix_t* matrix)
{
	uint8_t i; 
	
	for(i = 0; i < matrix->col_qty; ++i)
	{
		if(GPIO_ReadInputDataBit(matrix->col_table[i].port, matrix->col_table[i].pin))
		{
			matrix->pos[i] |= 1 << matrix->row_qty;
		}
	}
}




void matrix_scan_key(matrix_t* matrix)
{
	uint8_t i, j;
	uint8_t(*p)[matrix->row_qty] = NULL;
	
	p = (uint8_t(*)[matrix->row_qty])matrix->map;
	
	/*初始化所有GPIO*/
	init_matrix_gpio(matrix);
	
	/*扫描ROW*/
	init_scan_row(matrix);
	scan_row(matrix);

	/*扫描COL*/
	init_scan_col(matrix);
	scan_col(matrix);

	/*键位置位*/
	for(i = 0; i < matrix->col_qty; ++i)
	{
		for(j = 0; j < matrix->row_qty; ++j)
		{
			if( matrix->pos[matrix->col_qty] & (1 << j) && 
				matrix->pos[i] & 1 << matrix->row_qty && 
				p[i][j] != 0x00)
			{
				matrix->pos[i] |= 1 << j;
			}
		}
	}
	
}




void matrix_scan_again(matrix_t* matrix)
{
	uint8_t i, j;
	
	init_matrix_gpio(matrix);
	for(i = 0; i < matrix->col_qty; ++i)
	{
		for(j = 0; j < matrix->row_qty && matrix->pos[i] != 0x00; ++j)
		{
			if(matrix->pos[i] & 1 << j)
			{
				set_IO_PinMode(matrix->col_table[i].port, matrix->col_table[i].pin, ModeOut_PU_noINT);
				GPIO_WriteBit(matrix->col_table[i].port, matrix->col_table[i].pin, HIGH);
				__NOP();
				__NOP();
				if(!GPIO_ReadInputDataBit(matrix->row_table[j].port, matrix->row_table[j].pin))
				{
					matrix->pos[i] &= ~(1 << j);
				}
				set_IO_PinMode(matrix->col_table[i].port, matrix->col_table[i].pin, ModeIN_PD_noINT);
				__NOP();
			}
		}
	}
}






static void ghost(matrix_t* matrix, uint32_t* pos)
{
	uint8_t i, j, x, y;
	uint8_t rc = 0x00, cc = 0x00;
	uint8_t(*p)[matrix->row_qty] = NULL;
	
	p = (uint8_t(*)[matrix->row_qty])matrix->map;
	for(i = 0; i < matrix->col_qty; ++i)
	{
		for(j = 0; j < matrix->row_qty && pos[i] != 0x00; ++j)
		{
			if( pos[i] & 1 << j )
			{
				
				/*统计键位所在的C,R线按下键数量*/
				for(x = 0; x < matrix->col_qty; ++x)
				{
					if( matrix->pos[x] & 1 << j )
					{
						rc++;
					}
				}
				for(y = 0; y < matrix->row_qty; ++y)
				{
					if( matrix->pos[i] & 1 << y )
					{
						cc++;
					}
				}

				/*不是鬼键*/
				if(!(rc >= 2 && cc >= 2))
				{
					key_down(&matrix->buf, p[i][j]);
				}
			}
			rc = 0;
			cc = 0;
		}
	}
}




void matrix_key_handle(matrix_t* matrix)
{
    uint8_t r, c;
	uint32_t t_pos[32] = {0x00};
    uint8_t(*p)[matrix->row_qty] = NULL;
	
	p = (uint8_t(*)[matrix->row_qty])matrix->map;
	key_clear(&(matrix->buf));
	
	for(c = 0; c < matrix->col_qty; ++c)
    {
		for(r = 0; r < matrix->row_qty && matrix->pos[c] != 0x00; ++r)
		{	
			if( matrix->pos[c] & 1 << r )
			{
				/*如果是上一次按下键，则可排除嫌疑*/
				if(get_key(&matrix->last_buf, p[c][r]))
				{
					key_down(&matrix->buf, p[c][r]);
				}
				else
				{
					t_pos[c] |= 1 << r;
				}
			}
		}
    }
	
	/*新按下键GHOST判断*/
	ghost(matrix, t_pos);
		
	/*本轮结束，清尾工作*/
    memset(matrix->pos, 0x00, sizeof(matrix->pos));
    memcpy(&matrix->last_buf, &matrix->buf, sizeof(matrix->last_buf));

}





