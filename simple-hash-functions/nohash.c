#include <stdlib.h>
#include <stdio.h>
#include <string.h>

int main(int argc, char* argv[]) {
  if (strcmp(argv[1], "my_license_key") == 0)
    printf("You win!\n");
  return 0;
}
