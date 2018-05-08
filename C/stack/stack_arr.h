
#include <stdio.h>

struct StackRecord;
typedef struct StackRecord *Stack;

int IsEmpty(Stack S);
int Isfull(Stack S);
Stack CreateStack(int MaxElements);
void  DisposeStack(Stack S);
void MakeEmpty(Stack S);
void Push(int x, Stack S);
int  Top(Stack S);
void Pop(Stack S);
int  TopAndPop(Stack S);

#define MinStackSize (5)
#define EmptyTOS (-1)

struct StackRecord{
  int Capacity;
  int TopOfStack;
  int * array;
}
