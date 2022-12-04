#include <iostream>
#include <windows.h>
#include "dotProduct.h"
using namespace std;

int main() {
    __int64 ctr1 = 0, ctr2 = 0, freq = 0;
    int n = 0;

    for (int i = 4; i <= 16; i++) {
        n = (int)pow(2, i);
        freq = 0;

        float* a = new float[n];
        float* b = new float[n];

        for (int j = 0; j < n; j++) {
            a[j] = 10.12;
            b[j] = 10.14;
        }

        cout << "Array Size: " << n << endl;
        if (QueryPerformanceCounter((LARGE_INTEGER*)&ctr1) != 0) {
            cout << "Dot Product Answer: " << DPPSDotProduct(a, b, n) << endl;

            QueryPerformanceCounter((LARGE_INTEGER*)&ctr2);
            cout << "Start Value: " << ctr1 << endl;
            cout << "End Value: " << ctr2 << endl;

            QueryPerformanceFrequency((LARGE_INTEGER*)&freq);
            cout << "QueryPerformanceFrequency: " << freq << " counts per Seconds." << endl;

            cout << "QueryPerformanceCounter minimum resolution: 1/" << freq << " seconds." << endl;
            cout << "ctr2 - ctr1: " << ((ctr2 - ctr1) * 1.0 / 1.0) << " counts." << endl;
            cout << "Total time: " << (((ctr2 - ctr1) * 1.0) / freq) << " seconds.\n" << endl;
        }
        else {
            DWORD error = GetLastError();
            cout << "Error value = " << error << endl;
        }
    }
}