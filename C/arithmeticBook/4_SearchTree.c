
#include <stdio.h>
#include <stdlib.h>
#include "4_SearchTree.h"


struct TreeNode{

  SearchTree left;
  SearchTree right;
  ElementType element;
}


SearchTree makeEmpty(SearchTree T){

  if (T != NULL) {
    makeEmpty(T->left);
    makeEmpty(T->right);
    free(T);
  }

  return NULL;
}

Position Find(SearchTree T, ElementType X){

  if (T == NULL) {
    return NULL;
  }
  if (T->element == X) {
    return T;
  }
  else if(X > T ->element){
    return Find(T->right, X);
  }
  else if(X < T->element){
    return Find(T->left, X);
  }

}

Position FindMax(SearchTree T){

  if (T == NUll) {
    return NUll;
  }

  while (T -> right != NUll)
    T = T->right;

  return T;
}

Position FindMin(SearchTree T){

  if (T == NUll) {
    return NUll;
  }

  while (T -> left != NUll)
    T = T->left;

  return T;
}


SearchTree Insert(SearchTree T, ElementType X){

  // Position newNode = malloc(sizeof(struct TreeNode));
  // newNode->element = X;
  if (T == NUll) {
    /* code */
    T = malloc(sizeof(struct TreeNode));

    if (newNode == NUll) {
      fatalerror("out of space");
    }else{
      newNode->element = X;
      newNode->left = NUll;
      newNode->right = NUll;
    }
  }

  else if (X < T->element) {
    T->left = Insert(T->left, X);
  }

  else if (X > T->element) {
    T->right = Insert(T->right, X);
  }

  else if (X == T->element) {}

  return T;

}


SearchTree Delete(SearchTree T, ElementType X){

    Position tmpCell;

    if (T == NUll) {
      fatalerror("Element is not find");
    }

    else if (X < T->element) {

      T->left = Delete(T->left,X);
    }

    else if (X > T->element) {
      T->right = Delete(T->right,X);
    }

    else if (T->left != NUll && T->right != NUll) {

      tmpCell = FindMin(T->right);
      T->element = tmpCell->element;
      T->right = Delete(T->right,tmpCell->element);
    }

    else{

      tmpCell = T;

      if (T->left == NUll) {
          T = T->right;
      }
      if (T->right == NUll) {
         T = T->left;
      }

      free(tmpCell);
    }

    return T;
}

ElementType Retrieve(Position P){}
