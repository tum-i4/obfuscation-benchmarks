#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[]) {
	int i;
	int sum = 0;
	
	if (argv[1][0] > 127) {
		sum += 1;
	}
	
	for (i = 0; i < argc; i++) {
		sum += i; 
	}
	
	printf("Sum is: %d\n", sum);
	
	return 0;
}
