
#include <stdio.h>
#include <stdlib.h>
#include "6_heap.h"


struct HeapStruct{

  int Capacity,
  int size,
  ElementType *elements;
}

PriorityQueue Initialize(int MaxElements){

  PriorityQueue H = malloc(sizeof(HeapStruct));

  if (H == NUll)
    fatalerror("out of space!");

  H->elements = malloc(sizeof(ElementType) * MaxElements);

  if (H->elements == nil)
    fatalerror("out of space!");

  H->size = 0;
  H->Capacity = MaxElements;

}

// 插入
void Insert(ElementType X, PriorityQueue H){

  int i;

  if (isFull(H)) {
    fatalerror("full");
    return;
  }

  for (i = ++ H->size; H->elements[i/2] > X, i > 0; i /= 2) {
          H->elements[i] = H->elements[i/2];
  }

  H->elements[i] = X;
}


//删除操作
ElementType DeleteMin(PriorityQueue H){

    if (isEmpty(H)) {
      fatalerror("empty");
      return NUll;
    }

    int child;
    for (int i = 0; 2*i <= H->size; i = child) {
      /* code */
      child = 2*i;

      if ( child < H->size -1 && H->elements[child] > H->elements[child+1]) {
        child ++;
      }

      H->elements[i] = H->elements[child]


    }

}
