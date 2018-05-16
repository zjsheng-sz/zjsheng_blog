#include<stdio.h>

void flipAndInvertImage(int** A, int ARowSize, int AColSizes);

int main(int argc, char const *argv[]) {

  int a[][3] = {{1,1,0},{1,0,1},{0,0,0}};

  flipAndInvertImage(a, 3,3);

  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      printf("%d\n",a[i][j]);
    }
  }

  return 0;
}


/**
 * Return an array of arrays of size *returnSize.
 * The sizes of the arrays are returned as *columnSizes array.
 * Note: Both returned array and *columnSizes array must be malloced, assume caller calls free().
 */
void flipAndInvertImage(int** A, int ARowSize, int AColSizes) {

  for (int i = 0; i < ARowSize; i++)
    for (int j = 0; j < AColSizes; j++) {

      int tmp = A[i][j];
      A[i][j] = A[i][AColSizes - j -1];
      A[i][AColSizes - j -1] = tmp;

      A[i][j] = 1 - A[i][j];

    }

}
