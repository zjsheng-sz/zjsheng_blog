#include <stdio.h>
#include <stdlib.h>
#include "4_AvlTree.h"


struct TreeNode{

  ElementType element;
  AvlTree left;
  AvlTree right;
  int height;
}

static int Height(Position P){

  if (P == NULL) {
    return -1;
  }else{
    return P->height;
  }
}



AvlTree Insert(ElementType X, AvlTree T){

  if (T == NULL) {
    T = malloc(sizeof(struct AvlTree));
    if (T == NULL) {
      fatalerror("out of space");
    }
    else{
      T->element = X; T->height = 0;
      T->left = T->right = NUll;

    }
  }

  else if (X < T->element) {
    T->left = Insert(X, T->left);

    if (Height(T->left) - Height(T->right) == 2) {
      if (X < T->left->element)
        T = singleRotateWithLeft(T);
      else
        T = doubleRotateWithLeft(T);
    }
  }

  else if (X > T->element) {
    T->right = Insert(X, T->right);

    if (Height(T->right) - Height(T->left) == 2) {
      if (X > T->right->element)
        T = singleRotateWithRight(T);
      else
        T = doubleRotateWithRight(T);
    }
  }


  T->height = Max(Height(T->left), Height(T->right)) + 1;

}


static Position singleRotateWithLeft(Position K2){

  Position k1 = k2->left;
  k2->left = k1->right;
  k1->right = k2;

  k2->height = Max(Height(k2->left), height(k2->right)) + 1;

  k1->height = Max(Height(k1->left),k2->height) + 1;

}

static Position doubleRotateWithLeft(Position K3){

  k3->left = singleRotateWithRight(k3->left);

  return singleRotateWithLeft(k3);

}

static Position singleRotateWithRight(Position K2){}
static Position doubleRotateWithRight(Position K2){}
