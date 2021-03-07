// Just generate the assembly
// gcc -S -m64 -o 3_65.s -Og 3_65.c
// compile and run
// gcc 3_65.c -o 3_65
// ./3_65

#include <stdio.h>
#define M 4
// typedef int Marray_t[M][M];

void print_matrix(long A[M][M]) {
    long i, j;
    for (i = 0; i < M; i++) {
        for (j = 0; j < M; j++) {
            printf("%8d   ", A[i][j]);
        }
        printf("\n");
    }
}

void transpose(long A[M][M]) {
    long i, j;
    for (i = 0; i < M; i++) {
        for (j = 0; j < i; j++) {
            long t = A[i][j];
            A[i][j] = A[j][i];
            A[j][i] = t;
        }
    }
}

void transpose_optimized(long A[M][M]) {
    // fill your code in here
}

int main() {
    long i, j;
    long A[M][M] = {{1, 2, 3, 4}, {1, 2, 3, 4}, {1, 2, 3, 4}, {1, 2, 3, 4}};
    print_matrix(A);
    printf("\n");
    transpose(A);
    // transpose_optimized(A);
    print_matrix(A);
}