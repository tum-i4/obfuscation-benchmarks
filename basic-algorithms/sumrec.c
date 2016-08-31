#include<stdio.h>
int main(int argc, char* argv[]){
  if (argc < 2) return 1;
  int num,x;
//  printf("\nEnter a number: ");
//  scanf("%d",&num);
  num = argv[1][0];
  x=findsum(num);
  printf("Sum of the digits of %d is: %02x\n",num,x);
  return 0;
}

int r,s;
int findsum(int n){
if(n){
         r=n%10;
         s=s+r;
         findsum(n/10);
     }
     else
       return s;
}
