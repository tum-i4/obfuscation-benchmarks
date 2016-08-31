#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[]) {
	int i;
	int sum = 0;
	
	if (argc < 2) {
		printf("Usage: program-name char\n");
		return 1;
	}
	
	for (i = 0; i < argv[1][0]; i++)
		sum += i;
		
	printf("Sum is: %d\n", sum);
	
	return 0;
}
