#include <stdio.h>
#include <stdlib.h>
#include <time.h>
using namespace std;

int common(int A[], int B[], int m, int n);
void mergesort(int* a, int* aux, int length);

int main()
{
    int P[500000];
    int Q[200000];
    int i, t1, t2, result;
    time_t t;
    srand((unsigned)time(&t)); /*initialize random numbers */
    for (i = 0; i < 500000; i++) /* fill P with even numbers */
        P[i] = 2 * ((579 * i + 234987) % 500000);
    for (i = 0; i < 200000; i++)/* fill Q with odd numbers */
        Q[i] = 2 * ((997 * i + 98771) % 200000) + 1;
    t1 = (rand() % 10) + 1;
    t2 = (rand() % 10) + 1;
    for (i = 0; i < t1; i++) /* put some odd numbers in P */
    {
        P[rand() % 500000] = 2 * (51 * i + 237) + 1;
        P[rand() % 500000] = 2 * (51 * i + 237) + 1;
        P[rand() % 500000] = 2 * (51 * i + 237) + 1;
        Q[2 * i] = 2 * (51 * i + 237) + 1;
    }
    for (i = 0; i < t2; i++) /* put some even numbers in Q */
    {
        Q[rand() % 200000] = 2 * (53 * i + 732);
        Q[rand() % 200000] = 2 * (53 * i + 732);
        Q[rand() % 200000] = 2 * (53 * i + 732);
        P[5 * i] = 2 * (53 * i + 732);
    }
    printf(" finished preparing two arrays. they have %d elements in common\n",
        t1 + t2);
    result = common(P, Q, 500000, 200000);
    printf(" found %d elements in common.\n", result);
    if (result == t1 + t2)
        printf(" Passed test.\n");
    else
        printf(" Failed test.\n");

}

int common(int A[], int B[], const int m, const int n)
{
    // Uses malloc to create the auxiliary array //
    int* array1 = (int*)malloc(m*sizeof(int));
    int* array2 = (int*)malloc(n*sizeof(int));
    mergesort(A, array1, m);
    mergesort(B, array2, n);
    // A and B are now sorted //
    // x - position of A // y - position of B // c is the count of common values //
    int x, y, c = 0, cvalue;  

    // Makes sure everything stays in the bounds //
    for (x = 0, y = 0; x < m && y < n;)
    {       
        if (A[x] == B[y]) 
        {
            // If the arrays have an duplicate increase the count // 
            ++c;
            // Loops through the positions in A and B 
            // until the value of the position is changed //
            cvalue = A[x];
            for (x; x < m && A[x] == cvalue; x++){}
            for (y; y < n && B[y] == cvalue; y++){}         
        }
        else
        {
            // If the array position right now is not a duplicate //
            // If position value at A is greater than B move B forward //
            // If position value at B is greater than A move B forward //
            if (A[x] > B[y]){ y++; } 
            else if (B[y] > A[x]){ x++; }
        }
    }
    return c;
}

void mergesort(int* a, int* aux, int length)
{
    int i, j1, j2;
    if (length > 1)
    {
        mergesort(a, aux, (length / 2)); /* recursive calls */
        mergesort(a + (length / 2), aux, (length - (length / 2)));
        for (i = 0, j1 = 0, j2 = (length / 2); i < length; ) /* merging */
        {
            if ((j1 < (length / 2) && a[j1] < a[j2]) || j2 == length)
                aux[i++] = a[j1++];
            else
                aux[i++] = a[j2++];

        }
        for (i = 0; i < length; i++) /* copying back */
            a[i] = aux[i];
    }
}