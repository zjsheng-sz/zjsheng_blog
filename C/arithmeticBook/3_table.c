
#include <stdio.h>
#include <stdlib.h>
#include "3_table.h"

struct Node{

  ElementType element;
  Position next;
}

bool IsEmpty(List L){

  return L->next == NULL;

}

bool IsLast(List L, Position P){

  return P->next == NULL;
}


Position Find(List L, ElementType X){

  Position P;

  for (P = L->next; P != NULL; P = P->next) {

    if (P->element == X) {
      return P
    }
  }

  return NUll;
}

void Delete(List L, ElementType X){

  Position P, tmpCell;

  P = FindPrevious(L, X);

  if ( !IsLast(L,P)) {
    tmpCell = P->next;
    P->next = tmpCell->next;
    free(tmpCell);
  }
}

Position FindPrevious(List L, ElementType X){

  Position P;
  for (P = L; P->next != NULL; P = P->next) {

    if (P->next->element == X) {

      return P;
    }  
  }
}

void Insert(List L, ElementType X, Position P){

  Position tmpCell = malloc(sizeof(struct Node));
  tmpCell->element = X;

  tmpCell->next = P->next;
  P->next = tmpCell->next;

}

void DeleteList(List L){

  Position P;
  for (P = L->next; P!= NULL; P = P->next) {

    L = P->next;
    free(P);
  }

}
