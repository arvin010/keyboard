#include <stdio.h>

int global = 10;

int main(void)
{

    printf("%s global : %d\n", __func__, global);

    c_main();
    b_main();
    a_main();

    return 0;
}
