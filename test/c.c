#include <stdio.h>

extern int global;

extern int c_main(void)
{
    //global = 40;

    printf("%s global : %d\n", __func__, global);

    return ;
}