
#include "stack_arr.h"

int IsEmpty(Stack S){

  return S -> TopOfStack == EmptyTOS;

}

int Isfull(Stack S){

  return S -> Capacity == S -> TopOfStack;
}

Stack CreateStack(int MaxElements){

  Stack S;

  if (MaxElements < MinStackSize) {
    Error ("Stack size is too small");
  }

  S = malloc(sizeOf(struct StackRecord));
  if (S == Null) {
    FatalError("Out of space!!!");
  }

  S ->array = malloc(sizeOf(int) * MaxElements);
  if (S -> array == Null) {
    FatalError("Out of space!!!");
  }

  S -> Capacity = MaxElements;
  MakeEmpty(S);

  return S;
}

void  DisposeStack(Stack S){

  if (S != Null) {
    free(S -> array);
    free(S);
  }
  
}

void MakeEmpty(Stack S){

  S -> TopOfStack = EmptyTOS;

}

void Push(int x, Stack S){

  if (Isfull(S)) {
    Error("Full stack");

  }else{
    S -> TopOfStack += 1;
    S -> array[ S -> TopOfStack] = X;
  }

}

int  Top(Stack S){

  if (!IsEmpty(S)) {
    return S -> array[S -> TopOfStack];
  }

  Error("Empty stack");
  return 0;
}

void Pop(Stack S){

  if (!IsEmpty(S)) {
    S -> TopOfStack -= 1;

  }else{

    Error("Empty stack");
  }
}


int  TopAndPop(Stack S){

  if (IsEmpty(S)) {
    Error("Empty stack");
    return 0;
  }

  S -> TopOfStack -= 1;
  return array[S -> TopOfStack];

}
