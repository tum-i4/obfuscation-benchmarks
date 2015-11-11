#include<stdio.h>

int main(int argc, char* argv[]){
  if (argc < 2) return 1;
  int n,i=1,sum=0;

//  printf("Enter a number: ");
//  scanf("%d",&n);
  n = argv[1][0];

  while(i<n){
      if(n%i==0)
           sum=sum+i;
          i++;
  }
  if(sum==n)
      printf("%d is a perfect number\n",i);
  else
      printf("%d is not a perfect number\n",i);

  return 0;
}
