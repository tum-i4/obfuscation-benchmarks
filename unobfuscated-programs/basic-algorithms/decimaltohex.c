#include<stdio.h>
int main(int argc, char* argv[]){
    if (argc < 2 ) return 1;
    long int decimalNumber,remainder,quotient;
    int i=1,j,temp;
    char hexadecimalNumber[100];

//    printf("Enter any decimal number: ");
//    scanf("%ld",&decimalNumber);
    decimalNumber = (int) argv[1][0];

    quotient = decimalNumber;

    while(quotient!=0){
         temp = quotient % 16;

      //To convert integer into character
      if( temp < 10)
           temp =temp + 48;
      else
         temp = temp + 55;

      hexadecimalNumber[i++]= temp;
      quotient = quotient / 16;
  }

    printf("Equivalent hexadecimal value of decimal number %d: \n",decimalNumber);
    for(j = i -1 ;j> 0;j--)
      printf("%c",hexadecimalNumber[j]);

    return 0;
}
