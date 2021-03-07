// gcc 424_1.c -o 424_1
// ./424_1
#include <stdio.h>
main() {
    float f, g;
    f = 0.0;
    g = f + 1.0;
    int count = 0;
    while (f != g) {
        f = g;
        g = f + 1.0;
        count++;
    }
    printf("Does it ever get here?\n");
    printf("loop count: %d\r\n", count);
}
