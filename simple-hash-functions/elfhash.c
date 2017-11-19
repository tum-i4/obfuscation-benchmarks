#include <stdlib.h>
#include <stdio.h>
#include <string.h>

unsigned int ELFHash(char* str, unsigned int len)
{
   unsigned int hash = 0;
   unsigned int x    = 0;
   unsigned int i    = 0;

   for(i = 0; i < len; str++, i++)
   {
      hash = (hash << 4) + (*str);
      if((x = hash & 0xF0000000L) != 0)
      {
         hash ^= (x >> 24);
      }
      hash &= ~x;
   }

   return hash;
}
/* End Of ELF Hash Function */

int main(int argc, char* argv[]) {
  unsigned char *str = argv[1];
  
  unsigned int hash = ELFHash(str, strlen(str));
  
  //printf("%x\n", hash);
  
  if (hash == 0xaf9bec9)
		printf("You win!\n");
  return 0;
}

