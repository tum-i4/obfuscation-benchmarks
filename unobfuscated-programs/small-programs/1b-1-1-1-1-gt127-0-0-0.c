#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[]) {
	unsigned char c = argv[1][0];
	if (c > 127)
		printf("win\n");
	else
		printf("lose\n");
	
	return 0;
}
