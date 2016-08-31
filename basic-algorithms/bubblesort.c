#include<stdio.h>
int main(int argc, char* argv[]){

  int temp,i,j,a[10];//={36,15,79,48,46,36,37,18,28,27};

//  printf("Enter total numbers of elements: ");
//  scanf("%d",&s);

//  printf("Enter %d elements: ",s);
  for(i=1;i<argc;i++){
      a[i-1] = argv[i][0];
}
//      scanf("%d",&a[i]);
  //Bubble sorting algorithm
  for(i=argc-3;i>=0;i--){
      for(j=0;j<=i;j++){
           if(a[j]>a[j+1]){
               temp=a[j];
              a[j]=a[j+1];
              a[j+1]=temp;
           }
      }
  }

  printf("After sorting: ");
  for(i=0;i<argc-1;i++)
      printf(" %d",a[i]);

  return 0;
}
