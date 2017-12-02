#include <stdio.h>

int main(){


    int a[10] = {0}, i;

    printf("Enter 10 numbers: ");

    for(i = 0; i < 10; i++){

	  scanf("%d", &a[i]);

    }

    for(i = 0; i < 10; i++){

      printf(" %d\n", a[i]);

    }

    return 0;
}
