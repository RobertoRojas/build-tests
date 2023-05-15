#include <stdio.h>

#include "operation.h"

#ifndef VERSION
#define VERSION X.Y.Z
#endif

#ifndef TYPE
#define TYPE DEFAULT
#endif

#define STRINGIFY(x) #x
#define TOSTRING(x) STRINGIFY(x)

int main(void)
{
    printf("This is the test program, info: \n\n");
    printf("Version : %s\n", TOSTRING(VERSION));
    printf("Type    : %s\n\n", TOSTRING(TYPE));
    operation();
    return 0;
}