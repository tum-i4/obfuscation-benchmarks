#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[]) {
	unsigned char c = argv[1][0];
	
	if (c > 85)
		printf("if-1-win ");
	else
		printf("if-1-lose ");
	
	if (c < 170)
		printf("if-2-win\n");
	else
		printf("if-2-lose\n");
	
	return 0;
}
