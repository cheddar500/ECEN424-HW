// gcc 3_58.c -o 3_58
// ./3_58

#include <stdio.h>

long decode2(long x, long y, long z) {
    long r;
    y = y - z;   // subq %rdx, %rsi
    x = x * y;   // imulq %rsi, %rdi
    r = y;       // movq %rsi, %rax
    r = r << 63; // salq $63, %rax
    r = r >> 63; // sarq $63, %rax
    r = r ^ x;   // xorq %rdi, %rax
    return r;    // ret
}

int main() {
    long x, y, z, n;
    printf("\nEnter x:");
    scanf("%ld", &x);
    printf("\nEnter y:");
    scanf("%ld", &y);
    printf("\nEnter z:");
    scanf("%ld", &z);
    n = decode2(x, y, z);
    printf("\nResult from decode2(%ld,%ld,%ld) is %ld\n", x, y, z, n);
    return 0;
}
