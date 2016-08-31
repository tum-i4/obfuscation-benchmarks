#include<stdio.h>
int fact(int);
int main(int argc, char* argv[]){
  if(argc < 2) return 1;
  int num,f;
//  printf("\nEnter a number: ");
//  scanf("%d",&num);
  num = (int) argv[1][0];//4;
  f=fact(num);
  printf("\nFactorial of %d is: %d\n",num,f);
  return 0;
}

int fact(int n){
   if(n==1)
       return 1;
   else
       return(n*fact(n-1));
 }
