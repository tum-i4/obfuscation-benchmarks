#include <stdlib.h>
#include <stdio.h>
#include <string.h>

int main(int argc, char* argv[]) {
  unsigned long hash = 5381;
  unsigned char *str = argv[1];
  unsigned long c;

  while (c = *str++)
    hash = ((hash << 5) + hash) + c; /* hash * 33 + c */
  
  if (((hash & 0xffffffff) == 0x49a54935)  && ((hash >>32) == 0xbc150c6e))
		printf("The license key is correct!\n");
	else
		printf("The license key is incorrect!\n");
	return 0;
}
