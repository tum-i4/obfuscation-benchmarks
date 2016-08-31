#include<stdio.h>
int main(int argc, char* argv[]){
  if (argc < 3) return 1;
  int n1,n2,gcd;
//  printf("\nEnter two numbers: ");
//  scanf("%d %d",&n1,&n2);
  n1 = argv[1][0];//75;
  n2 = argv[2][0];//15;
  gcd=findgcd(n1,n2);
  printf("GCD of %d and %d is: %d\n",n1,n2,gcd);
  return 0;
}

int findgcd(int x,int y){
     while(x!=y){
          if(x>y)
              return findgcd(x-y,y);
          else
             return findgcd(x,y-x);
     }
     return x;
}
