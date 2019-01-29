int callee(int a, int b, int *c)
{
	int sum;	

	sum = a + b;
	*c = sum;

	return sum;
}

void caller(void)
{
	int p_a = 1;
	int p_b = 2;
	int p_c = 0;
	int p_sum = 0;

	p_sum = callee(p_a, p_b, &p_c);	
}

void call_0(void)
{
	caller();
}
