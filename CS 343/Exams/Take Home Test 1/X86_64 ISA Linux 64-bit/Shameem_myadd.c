static int a = 1;
static int b = 2;
static int c = 3;

int myAdd(int a, int b) 
{
	int c = a + b;
	return c;
}

void main() 
{
	c = myAdd(a, b);
}
