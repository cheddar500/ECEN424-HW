// gcc 2_61.c -o 2_61
// ./2_61
#include <limits.h> // defines INT_MIN and INT_MAX
#include <stdio.h>

int any_bit_one(int x) {
    // Fill in code for part A here.
    // return 1 if any bit is 1, else 0
    return !(!x);
}

int any_bit_zero(int x) {
    // Fill in code for part B here.
    // return 1 if any bit is 0, else 0
    // return !(x & 0);
    return !(!(~x));
}

int lsb_one(int x) {
    // Fill in code for part C here.
    // return 1 if any bit in LS byte is 1, else 0
    // shift by w-8
    int shift_val = (sizeof(int) - 1) << 3;
    int lsbyte = x << shift_val;
    return !(!lsbyte);
}

int msb_zero(int x) {
    // Fill in code for part D here.
    // return 1 if any bit in MS byte is 0, else 0
    // shift by w-8
    int shift_val = (sizeof(int) - 1) << 3;
    int msbyte = x >> shift_val;
    return !(!(~msbyte));
}

int main() {
    int x;
    // Test all integer values
    for (x = INT_MIN; x <= INT_MAX; x++) {
        if (any_bit_one(x) != (x != 0)) {
            printf("Any bit in x equal to 1	FAILED!\n");
            break;
        }
        if (any_bit_zero(x) != (x != -1)) {
            printf("Any bit in x equal to 0 FAILED!\n");
            break;
        }
        if (lsb_one(x) != ((char)x != 0)) {
            printf("Any bit in least significant byte in x equal to 1 FAILED!\n");
            break;
        }
        if (msb_zero(x) != (*((char *)&x + 3) != -1)) {
            printf("Any bit in most significant byte in x equal to 0 FAILED!\n");
            break;
        }

        // Print out something so you know that stuff is happening
        if (x % 100000000 == 0) {
            printf("%d\n", x);
        }

        // Have to have a way to break out before we loop around to INT_MIN
        if (x == INT_MAX) {
            printf("All tests passed!\n");
            break;
        }
    }
    // /*
    // Enter the numbers you want to test
    int any_bit_one_test_cases[5] = {5, 150, 32, 111111, 0};
    int i;
    for (i = 0; i < 5; i++) {
        printf("any_bit_one(0x%08x) = %d\n", any_bit_one_test_cases[i],
               any_bit_one(any_bit_one_test_cases[i]));
    }

    printf("\n");
    // Enter new set of test cases
    int any_bit_zero_test_cases[5] = {0xFFFFFFFF, 5, 23, 54, 0};
    for (i = 0; i < 5; i++) {
        printf("any_bit_zero(0x%08x) = %d\n", any_bit_zero_test_cases[i],
               any_bit_zero(any_bit_zero_test_cases[i]));
    }

    printf("\n");
    // Enter new set of test cases
    int lsb_one_test_cases[5] = {0xffffff00, 783873, 453453, 7207867, 758578};
    for (i = 0; i < 5; i++) {
        printf("lsb_one(0x%08x) = %d\n", lsb_one_test_cases[i], lsb_one(lsb_one_test_cases[i]));
    }

    printf("\n");
    // Enter new set of test cases
    int msb_zero_test_cases[5] = {0xffffffff, 783783, 783783, 245348, 7837378};
    for (i = 0; i < 5; i++) {
        printf("msb_zero(0x%08x) = %d\n", msb_zero_test_cases[i], msb_zero(msb_zero_test_cases[i]));
    }

    return 0;
}