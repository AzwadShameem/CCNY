#include <iostream>
using namespace std;

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

int overflow_check(char operators, int a, int b) {
    if (operators == '+') {
        try {
            int c = a + b;
            if ((a > 0) && (b > 0)  && (c < 0)) {
                throw("Overflow Error");
            } else if ((a < 0) == 1 && (b < 0) && (c > 0)) {
                throw("Overflow Error");
            }
            cout << c << '\n' << binary(c) << '\n';
        } catch(const char* e) {
            cout << e << '\n';
        }
    } else if (operators == '-') {
        try {
            int c = a - b;
            if ((a > 0) && (b < 0) && (c < 0)) {
                throw ("Overflow Error");
            } else if ((a < 0) && (b > 0) && (c > 0)) {
                throw ("Overflow Error");
            }
            cout << c << '\n' << binary(c) << '\n';
        } catch(const char* e) {
            cout << e << '\n';
        }
    }
}


int main() {
    int a = +2147483647;
    int b = +1;
    cout << "Adding " << a << " and " << b << '\n';
    int overflow = overflow_check('+', a, b);

    a = -2147483648;
    b = -2;
    cout << "\nAdding" << a << " and " << b << '\n';
    overflow = overflow_check('+', a, b);

    a = +2147483647;
    b = -2147483648;
    cout << "\nSubtracting " << a << " and " << b << '\n';
    overflow = overflow_check('-', a, b);

     a = -2147483648;
     b = +2147483647;
    cout << "\nSubtracting " << a << " and " << b << '\n';
    overflow = overflow_check('-', a, b);

    a = -1;
    b = +2;
    cout << "\nAdding " << a << " and " << b << '\n';
    overflow = overflow_check('+', a, b);
}



