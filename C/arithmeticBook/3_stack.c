
#include <stdio.h>
#include <stdlib.h>
#include "3_stack.h"

struct Node{
  ElementType element;
  PtrToNode next;
}

int IsEmpty(Stack S){

  return S->next == NULL;
}


Stack CreateStack(void){

  Stack S;

  S = malloc(sizeof(struct Node));
  if (S == NULL) {
    FatalError("Out of sapce!!!");
  }
  S->next == NULL;
  MakeEmpty(S);

  return S;

}


void DisposeStack(Stack S){}
void MakeEmpty(Stack S){}


void Push(ElementType X, Stack S){

  PtrToNode tmpCell = malloc(sizeof(struct Node));
  if (tmpCell == NUll) {
    FatalError("out of space");
  }
  else{

    tmpCell->element = X;
    tmpCell->next = S->next;
    S->next = tmpCell;
  }
}


ElementType Top(Stack S){

  if (!IsEmpty(S))
    return S->next->element;

  FatalError("Empty stack");

  return 0;
}


void Pop(Stack S){

  if (!IsEmpty(S)) {

    PtrToNode tmpCell = S->next;
    S->next = tmpCell->next;
    free(tmpCell);
  }else{

    FatalError(Empty stack);
  }
}
