#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[]) {
	int i,j;
	int sum = 0;
	
	const char *str = argv[1];
	register const char *s, *t;

	for (i = 0; i < argv[1][0]; i++) {
		for (t = str; *t; ++t) {
			sum += *t;
		}
	}
	
	printf("Sum is: %d\n", sum);
	
	return 0;
}
