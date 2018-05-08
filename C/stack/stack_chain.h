
#include<stdio.h>

struct Node;
typedef struct Node *PtrToNode;
typedef PtrToNode Stack;

int IsEmpty(Stack S);
Stack CreateStack(void);
void DisposeStack(Stack S);
void MakeEmpty(Stack S);
void Push(int x, Stack S);
int  Top(Stack S);
void Pop(Stack S);


struct Node{
  int     Element;
  PtrToNode  Next;
};
