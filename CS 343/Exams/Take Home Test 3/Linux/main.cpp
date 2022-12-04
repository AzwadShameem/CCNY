#include <iostream>
#include <math.h>
#include <chrono>
#include "dotProduct.h"
using namespace std;

int main() {
    int n = 0;
    
    for (int i = 4; i <= 16; i++) {
        n = (int)pow(2, i);

        float* a = new float[n];
        float* b = new float[n];
        float* result =  new float[n];

        for (int j = 0; j < n; j++) {
            a[j] = 10.12;
            b[j] = 10.14;
        }

        cout << "Array Size : " << n << endl;
        auto start = chrono::high_resolution_clock::now();
        // Function can be dotProduct, ManualDotProduct or DPPSdotProduct
        // dotProduct(a, b, n, result); 
        // manualDotProduct(a, b, n, result);
        DPPSdotProduct(a, b, n, result);
        cout << "Dot Product Answer : " << result[0] << endl;
        auto end = chrono::high_resolution_clock::now();
        chrono::duration<double> diff = end - start;
        cout << "Total time: " << diff.count() << " seconds." << endl;
        cout << endl;
    }
}
