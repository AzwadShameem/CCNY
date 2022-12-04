#include <stdio.h>

char* binary (int n) {
    static char binary[33];
    for (int i = 31, c = 0;i >= 0;i--, c++) {
        int check = n >> i & 1;
        if (check) {
            binary[c] = '1';
        } else {
            binary[c] = '0';
        }
    }
    binary[32] = '\0';
    return binary;
}

int main() {
    int maxpoint = +2147483647;
    int posone = +1;
    int result = maxpoint + posone;
    printf("%d", result);
}