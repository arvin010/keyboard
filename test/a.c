#include <stdio.h>

extern int global;

extern void  a_main(void)
{
    global = 20;


    printf("%s global : %d\n", __func__, global);

    return ;
}