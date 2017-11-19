#include <stdlib.h>
#include <stdio.h>
#include <string.h>

unsigned int JSHash(char* str, unsigned int len)
{
   unsigned int hash = 1315423911;
   unsigned int i    = 0;

   for(i = 0; i < len; str++, i++)
   {
      hash ^= ((hash << 5) + (*str) + (hash >> 2));
   }

   return hash;
}
/* End Of JS Hash Function */

int main(int argc, char* argv[]) {
  unsigned char *str = argv[1];
  
  unsigned int hash = JSHash(str, strlen(str));
  
  //printf("%x\n", hash);
  
  if (hash == 0x120bdadd)
		printf("You win!\n");
  return 0;
}

