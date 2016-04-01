#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[]) {
	int i;
	int sum = 0;
	
	for (i = 0; i < 127; i++)
		sum += i;
		
	printf("Sum is: %d\n", sum);
	
	return 0;
}
