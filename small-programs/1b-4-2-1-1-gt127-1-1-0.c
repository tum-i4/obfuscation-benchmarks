#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[]) {
	int i;
	int sum = 0;
	
	for (i = 0; i < argc; i++) {
		if (argv[i][0] > 127) {
			sum += 1;
		}
	
		sum += i; 
	}
	
	printf("Sum is: %d\n", sum);
	
	return 0;
}
