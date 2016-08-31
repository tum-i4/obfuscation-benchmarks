#include<stdio.h>

int main(int argc, char* argv[]){
    if (argc < 2) return 1;
    char* str = argv[1];//[50]="lheiombyymmdtjhzhydvhzcofopdwnhgizqzyvrvxjdnkbqoax";
    int i=0;

//    printf("Enter any string: ");
//    scanf("%s",str);

    printf("ASCII values of each characters of given string: ");
    while(str[i])
         printf("%d ",str[i++]);
        
    printf("\n");   
    return 0;
}
