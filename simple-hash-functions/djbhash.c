#include <stdlib.h>
#include <stdio.h>
#include <string.h>

unsigned int DJBHash(char* str, unsigned int len)
{
   unsigned int hash = 5381;
   unsigned int i    = 0;

   for(i = 0; i < len; str++, i++)
   {
      hash = ((hash << 5) + hash) + (*str);
   }

   return hash;
}
/* End Of DJB Hash Function */

int main(int argc, char* argv[]) {
  unsigned char *str = argv[1];
  
  unsigned int hash = DJBHash(str, strlen(str));
  
  //printf("%x\n", hash);
  
  if (hash == 0x49a54935)
		printf("You win!\n");
  return 0;
}

