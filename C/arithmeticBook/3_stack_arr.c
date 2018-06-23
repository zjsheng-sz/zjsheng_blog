
#include <stdio.h>
#include <stdlib.h>
#include "3_stack_arr.h"

#define EmptyTOS (-1)
#define MinStackSize (5)

struct StackRecord{

    int Capacity;
    int TopOfStack;
    ElementType *Array;
}



int IsFull(Stack S){

  return TopOfStack == Capacity;

}

Stack CreateStack(int MaxElements){

  if (MaxElements < MinStackSize)
    FatalError("Stack is too small");

  Stack S = malloc(sizeof(struct StackRecord));
  if (S == NULL)
    FatalError("out of space");

  S->Array = malloc(sizeof(ElementType) * MaxElements);
  if (S->Array == NULL)
    FatalError("out of space");

  S->Capacity = MaxElements;

  MakeEmpty(S);

  return S;
}


void DisposeStack(Stack S){

  if (S != NULL) {
    free(S->Array);
    free(S);
  }
}

int IsEmpty(Stack S){

  return S->TopOfStack == EmptyTOS;
}

void MakeEmpty(Stack S){

  S->TopOfStack = EmptyTOS;
}


void Push(ElementType X, Stack S){

  if (IsFull(S)) {
    FatalError("Full Stack");
  }

  S->Array[++S->TopOfStack] = X;
}


ElementType Top(Stack S){

  if (!IsEmpty(S))
    return S->Array[S->TopOfStack];

  FatalError("Empty Stack");
  return 0;
}


void Pop(Stack S){

  if (IsEmpty(S)) {
    FatalError("Empty Stack");
  }else{
    S->TopOfStack--;
  }
}


ElementType TopAndPop(Stack S){

  if (IsEmpty(S)) {
    FatalError("Empty Stack");
  }else{

    return S->Array[TopOfStack--];
  }
}
