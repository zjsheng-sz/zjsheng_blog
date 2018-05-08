#include<stdio.h>

void sort_bubble(int a[], int N);
void sort_select(int a[], int N);
void printArr(int a[], int N);

int main(){

	int arr[7] = {49,38,65,97,76,13,27};

	sort_bubble(arr,7);

	printArr(arr,7);

	return 0;
}

void sort_bubble(int a[], int N) {

	for (int i = 0; i < N - 1; i++)
		for (int j = 0; j < N - i - 1; j++)
			if (a[j] > a[j + 1]) {
				int tmp = a[j];
				a[j]    = a[j + 1];
				a[j + 1]= tmp;
			}
}


void sort_select(int a[], int N) {
	/* code */
	for (int i = 0; i < N; i++)
		for (int j = i + 1; j < N; j++)
			if (a[i] > a[j]) {
				/* code */
				int tmp  = a[i];
				a[i] = a[j];
				a[j] = tmp;
			}
}


// void sort_inserts(int a[], N) {
//
// 	for (int i = 0; i < N; i++) {
//
// 		for (int j = 0; j < count; j++) {
//
// 			if (a[i] > a[i+1]) {
//
//
//
// 			}
//
// 		}
//
// 	}
//
// }

// void sort_insert1(){
//
//     printf("排序前：");
//     printArr();
//
//     for (int i = 1; i < 7; i ++){
//
//     	for(int j = i; j > 0; j--){
//
// 		if(arr[j] < arr[j-1]){
//
// 			int tmp = arr[j];
// 			arr[j] = arr[j-1];
// 			arr[j-1] = tmp;
//
// 		}
// 	}
//
//     }
//
//     printf("排序后：");
//     printArr();
//
// }

// //插入排序 , 严重不可取
// void sort_insert(){
//
// 	printf("排序前:");
//     	printArr();
//
// 	for(int i = 1; i < 7; i++){
//
// 		for(int j = 0; j < i; j++){
//
// 			if(arr[j] > arr[i]){
//
// 			    	int tmp = arr[i];
//
// 			    	for(int k = i; k > j; k--){
//
// 					arr[k] = arr[k-1];
// 				}
//
// 	    			arr[j] = tmp;
//
// 				printArr();
//
// 				break;
// 			}
//
// 		}
//
// 	}
//
// 	printf("排序后:");
// 	printArr();
// }



void printArr(int a[], int N){

    for(int i = 0; i < N; i++)
	  printf("%d,",a[i]);

    printf("\n");
}
