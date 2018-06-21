#include<stdio.h>

void selectSort(int A[], int N); //选择排序
void bubbleSort(int A[], int N); //冒泡排序
void insertSort(int A[], int N); //插入排序
void shellSort(int A[], int N);  //希尔排序
void heapSort(int A[], int N);   //堆排序
void mergeSort(int A[], int N);  //归并排序
void quickSort(int A[], int N);  //快速排序

int main(){
	int a[10] = {45,48,24,24,57,87,118,21,54,54};
//        selectSort(a, 10);
//        bubbleSort(a, 10);
//        insertSort(a, 10);
//        shellSort(a, 10);
//        heapSort(a, 10);
//        mergeSort(a, 10);
	quickSort(a, 10);

	for (int i = 0; i < 10; i++) {
			printf("%d,",a[i]);
	}
	printf("\n");

	return 0;
}


//快速排序
void swap(int *a, int *b){
    int tmp = *a;
    *a = *b;
    *b = tmp;
}

int median3(int A[], int left, int right){

    int center = (left + right)/2;
    if (A[left] > A[center]) {
        swap(&A[left], &A[center]);
    }

    if (A[left] > A[right]) {
        swap(&A[left], &A[right]);
    }

    if (A[center] > A[right]) {
        swap(&A[center], &A[right]);
    }

    swap(&A[center], &A[right - 1]);

    return A[right - 1];
}


void insertQSort(int A[], int left, int right){

    for (int p = left + 1; p <= right; p ++) {

        int tmp = A[p];
        int j;
        for (j = p; j > left && A[j - 1] > tmp; j--) {
            A[j] = A[j - 1];
        }

        A[j] = tmp;
    }
}

#define CutOff 3

void QSort(int A[], int left, int right){

    int i,j,pivot;

    if (right - left >= CutOff) {

        pivot = median3(A, left, right);
        i = left; j = right - 1;

        while (i < j) {

            while (A[++i] < pivot) {}

            while (A[--j] > pivot) {}

            if (i < j) {
                swap(&A[i], &A[j]);
            }
        }

        swap(&A[i], &A[right - 1]);

        QSort(A, left, i - 1);
        QSort(A, i + 1, right);

    }else{

        insertQSort(A, left, right);
    }
}

void quickSort(int A[], int N){

    QSort(A, 0, N - 1);
}


//归并排序
void merge(int A[], int tmpArr[], int leftP,int leftEnd, int rightP, int rightEnd){

    int elementNum = rightEnd - leftP + 1;
    int tmpP = leftP;

    while (leftP <= leftEnd && rightP <= rightEnd) {

        if (A[leftP] < A[rightP]) {
            tmpArr[tmpP++] = A[leftP++];
        }else{
            tmpArr[tmpP++] = A[rightP++];
        }
    }

    while (leftP <= leftEnd) {
        tmpArr[tmpP++] = A[leftP++];
    }

    while (rightP <= rightEnd) {
        tmpArr[tmpP++] = A[rightP++];
    }


    for (int i = 0; i < elementNum; i ++,rightEnd--) {
        A[rightEnd] = tmpArr[rightEnd];
    }

}


void MSort(int A[],int tmpArr[], int left, int right){

    int center;

    if (left < right) {

        center = (left + right)/2;

        MSort(A,tmpArr, left, center);
        MSort(A,tmpArr, center + 1, right);
        merge(A,tmpArr, left, center, center+1, right);
    }
}

void mergeSort(int A[], int N){

    int *tmpArr;

    tmpArr = malloc(sizeof(int) * N);

    if (tmpArr != nil) {

        MSort(A,tmpArr, 0, N - 1);
        free(tmpArr);

    }else{

        printf("malloc error");
    }

}

//堆排序

#define LeftChild(i) (2 * (i) + 1)

void percDown(int A[], int r, int N){

    int child;
    int tmp;

    for (tmp = A[r]; LeftChild(r) < N; r = child) {

        child = LeftChild(r);
        if (child != N - 1 && A[child + 1] > A[child]) {
            child++;
        }

        if (A[child] > tmp) {
            A[r] = A[child];
        }else{
            break;
        }
    }

    A[r] = tmp;
}

void heapSort(int A[], int N){

    //1、BuildHeap
    for (int i = N/2; i >=0 ; i --) {
        percDown(A, i, N);
    }

    //2、DeleteMax
    for (int i = N -1; i > 0; i --) {
        int tmp = A[0];
        A[0] = A[i];
        A[i] = tmp;
        percDown(A, 0, i);
    }

}


//希尔排序
void shellSort(int A[], int N){

    int increase;
    for (increase = N/2; increase > 0; increase /= 2) {

        for (int p = increase; p < N; p++) {

            int tmp = A[p];
            int i;
            for ( i = p; i >= increase; i -= increase) {

                if (A[i - increase] > tmp) {
                    A[i] = A[i - increase];
                }else{
                    break;
                }
            }
            A[i] = tmp;
        }
    }
}


//插入排序
void insertSort(int A[], int N){
    for (int p = 1; p < N; p ++) {

        int tmp = A[p];
        int j;
        for (j = p; j > 0 && A[j-1] > tmp; j--) {

            A[j] = A[j-1];
        }
        A[j] = tmp;
    }

}


//冒泡排序
void bubbleSort(int A[], int N){

    for (int i = 0; i < N - 1; i++) {

        for (int j = 0; j < N - i - 1; j++) {

            if (A[j] > A[j+1]) {

                int tmp = A[j];
                A[j] = A[j+1];
                A[j+1] = tmp;
            }
        }
    }
}

//选择排序
void selectSort(int A[], int N){

    for (int i = 0; i < N - 1; i++) {

        for (int j = i; j < N; j++) {

            if (A[i] > A[j]) {
                int tmp = A[i];
                A[i] = A[j];
                A[j] = tmp;
            }

        }
    }
}
