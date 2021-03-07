// gcc hw4.c -o hw4
// ./hw4

#include <stdio.h>

#define N 22 // 21 seg fault /* plug something in here */
#define XSIZE (0x01 << N)

#define M 18 // 18 seg fault /* plug something in here */
#define MAXREC (0x01 << M)

double big_array(void) {
    int i, x[XSIZE];
    double result = 0.0;
    for (i = 0; i < XSIZE; i++)
        x[i] = i;
    for (i = 0; i < XSIZE; i++)
        result += x[i];
    return result;
}

double max_recursion(int val) {
    if (val <= 1)
        return 1;
    return val + max_recursion(val - 1);
}

int main() {
    printf("N: %d  XSIZE: %d\r\n", N, XSIZE);
    printf("M: %d  MAXREC: %d\r\n", M, MAXREC);
    printf("Result returned by big_array() is %e\n", big_array());
    printf("Result returned by max_recursion() is %e\n", max_recursion(MAXREC));
}
