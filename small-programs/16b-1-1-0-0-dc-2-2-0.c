#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[]) {
	int i,j;
	int sum = 0;
	
	const char *str = argv[1];
	register const char *s;

	for (s = str; *s; ++s) {
		sum += *s;
	}
	
	unsigned int len = (s - str);
	
	for (i = 0; i < len; i++) {
			sum += str[i]; 
	}
	
	printf("Sum is: %d\n", sum);
	
	return 0;
}
