#include <stdlib.h>
#include <stdio.h>
#include <string.h>

unsigned int BPHash(char* str, unsigned int len)
{
   unsigned int hash = 0;
   unsigned int i    = 0;
   for(i = 0; i < len; str++, i++)
   {
      hash = hash << 7 ^ (*str);
   }

   return hash;
}
/* End Of BP Hash Function */

int main(int argc, char* argv[]) {
  unsigned char *str = argv[1];
  
  unsigned int hash = BPHash(str, strlen(str));
  
  //printf("%x\n", hash);
  
  if (hash == 0x5bfaf2f9)
		printf("You win!\n");
  return 0;
}

