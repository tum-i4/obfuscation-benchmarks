#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[]) {
	int i,j;
	int sum = 0;
	
	for (i = 0; i < argc; i++) {
		for (j = 1; j <= argc; j++) {
			sum += j; 
		} 
	}
	
	
	
	printf("Sum is: %d\n", sum);
	
	return 0;
}
