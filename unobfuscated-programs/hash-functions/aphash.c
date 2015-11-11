#include <stdlib.h>
#include <stdio.h>
#include <string.h>

unsigned int APHash(char* str, unsigned int len)
{
   unsigned int hash = 0xAAAAAAAA;
   unsigned int i    = 0;

   for(i = 0; i < len; str++, i++)
   {
      hash ^= ((i & 1) == 0) ? (  (hash <<  7) ^ (*str) * (hash >> 3)) :
                               (~((hash << 11) + ((*str) ^ (hash >> 5))));
   }

   return hash;
}
/* End Of AP Hash Function */

int main(int argc, char* argv[]) {
  unsigned char *str = argv[1];
  
  unsigned int hash = APHash(str, strlen(str));
  
  if (hash == 0x23c9344)
		printf("The license key is correct!\n");
	else
		printf("The license key is incorrect!\n");
	return 0;
}

