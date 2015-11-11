#include<stdio.h>

void stringConcat(char[],char[]);
int main(int argc, char* argv[]){
    if (argc < 2) return 1;
    int compare;

//    printf("Enter first string: ");
//    scanf("%s",str1);

//    printf("Enter second string: ");
//    scanf("%s",str2);

    char* str1 = argv[1];
    char* str2 = argv[2];
    stringConcat(str1,str2);

    printf("String after concatenation: %s\n",str1);

    return 0;
}

void stringConcat(char str1[],char str2[]){
    int i=0,j=0;
   
   
    while(str1[i]!='\0'){
         i++;
    }

    while(str2[j]!='\0'){
         str1[i] = str2[j];   
         i++;
         j++;
    }

    str1[i] = '\0';
}
