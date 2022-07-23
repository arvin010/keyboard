#include <stdio.h>

extern int global;


extern int b_main(void)
{
    global = 30;

    printf("%s global : %d\n", __func__, global);

    return ;
}