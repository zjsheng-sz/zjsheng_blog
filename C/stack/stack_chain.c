#include "stack_chain.h"


int IsEmpty(Stack S){

  return S->Next == Null;

}

Stack CreateStack(void){

  Stack S = malloc(sizeOf(struct Node));
  S -> Next    = Null;
  MakeEmpty(S);

  return S;
}

void MakeEmpty(Stack S){

  if (S == Null) {
    Error("Must use CreateStack first");

  }else
      while (!IsEmpty(S)) {
        Pop(S);
      }
}

void Push(int x, Stack S){

  if (S == Null) {
    Error("Must use CreateStack first");
    return;
  }

  PtrToNode aNode = malloc(sizeOf(struct Node));
  if (aNode == Null) {
    FatalError("Out of space!!!");
  }

  aNode -> Element = x;
  aNode -> Next =  S -> Next;
  S -> Next = aNode;
}


int  Top(Stack S){

  if (!IsEmpty(S))
    return S -> Next -> Element;

  Error ("Empty stack");
  return 0;
}


void Pop(Stack S){

  PtrToNode topNode;

  while (!IsEmpty(S)) {

    topNode = S -> Next;
    S -> topNode -> Next;
    topNode -> Next = Null;
    free(topNode);

  }

}
