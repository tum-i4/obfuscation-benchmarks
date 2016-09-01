#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[]) {
  int i;
  int sum = 0;

  for (i = 0; i < argc; i++) {
    if (sum < 127) {
      sum += 64;
    }

    sum += i;
  }

  printf("Sum is: %d\n", sum);

  return 0;
}
