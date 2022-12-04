#include <stdio.h>
static int a = 5;
static int b = 10;
static int answer = 0;

int gcd(int a, int b) {
	if (a == 0) {
		return b;
	}
	return gcd(b % a, a);
}

int main() {
	answer = gcd(a, b);
	printf("%d", answer);
}