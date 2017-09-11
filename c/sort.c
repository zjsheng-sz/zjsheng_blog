#include<stdio.h>

void sort_insert();
void sort_insert1();

int main(){

	printf("hello World\n");

	sort_insert1();
a
	return 0;
}

int arr[7] = {49,38,65,97,76,13,27};

void printArr(){

    for(int i = 0; i < 7; i++){

	  printf("%d,",arr[i]);

    }

    printf("\n");
}

void sort_bubble(int a[], int N) {

	for (int i = 0; i < N - 1; i++) {
		/* code */
		for (int j = 0; j < N - 1 - i; j++) {
			/* code */
			if (a[j] > a[j + 1]) {
				/* code */
				int tmp = a[j];
				a[j] = a[j+1];
				a[j+1] = tmp;
			}
		}
	}
}


void sort_select(int a[], int N) {

	for (int i = 0; i < N - 1; i++) {

		for (int j = i; j < N; j++) {

				if (a[i] > a[j]) {
					int tmp = a[i];
					a[i] = a[j];
					a[j] = tmp;
				}// if

		} // for j

	}// for i

}


void name(/* arguments */) {
	/* code */
}

void sort_inserts(int a[], N) {

	for (int i = 0; i < N; i++) {

		for (int j = 0; j < count; j++) {

			if (a[i] > a[i+1]) {



			}

		}

	}

}

void sort_insert1(){

    printf("排序前：");
    printArr();

    for (int i = 1; i < 7; i ++){

    	for(int j = i; j > 0; j--){

		if(arr[j] < arr[j-1]){

			int tmp = arr[j];
			arr[j] = arr[j-1];
			arr[j-1] = tmp;

		}
	}

    }

    printf("排序后：");
    printArr();

}

//插入排序 , 严重不可取
void sort_insert(){

	printf("排序前:");
    	printArr();

	for(int i = 1; i < 7; i++){

		for(int j = 0; j < i; j++){

			if(arr[j] > arr[i]){

			    	int tmp = arr[i];

			    	for(int k = i; k > j; k--){

					arr[k] = arr[k-1];
				}

	    			arr[j] = tmp;

				printArr();

				break;
			}

		}

	}

	printf("排序后:");
	printArr();
}
