#include <stdlib.h>
#include <stdio.h>
#include <string.h>

unsigned int SDBMHash(char* str, unsigned int len)
{
   unsigned int hash = 0;
   unsigned int i    = 0;

   for(i = 0; i < len; str++, i++)
   {
      hash = (*str) + (hash << 6) + (hash << 16) - hash;
   }

   return hash;
}
/* End Of SDBM Hash Function */

int main(int argc, char* argv[]) {
  unsigned char *str = argv[1];
  
  unsigned int hash = SDBMHash(str, strlen(str));
  
  //printf("%x\n", hash);
  
  if (hash == 0x89dcd66e)
		printf("You win!\n");
  return 0;
}

