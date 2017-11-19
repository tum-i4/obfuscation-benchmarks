#include <stdlib.h>
#include <stdio.h>
#include <string.h>

unsigned int FNVHash(char* str, unsigned int len)
{
   const unsigned int fnv_prime = 0x811C9DC5;
   unsigned int hash      = 0;
   unsigned int i         = 0;

   for(i = 0; i < len; str++, i++)
   {
      hash *= fnv_prime;
      hash ^= (*str);
   }

   return hash;
}
/* End Of FNV Hash Function */

int main(int argc, char* argv[]) {
  unsigned char *str = argv[1];
  
  unsigned int hash = FNVHash(str, strlen(str));
  
  //printf("%x\n", hash);
  
  if (hash == 0xee3c81d4)
		printf("You win!\n");
  return 0;
}

