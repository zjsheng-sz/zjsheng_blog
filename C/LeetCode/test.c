
#include<stdio.h>

int main(int argc, char const *argv[]) {

  return 0;
}


//树的节点申明
typedef struct treeNode *PtrToNode;

struct treeNode{

  ElementType Element;
  PtrToNode   FirstChild;
  PtrToNode   NextSibing;
}


//打印所有问价名
static void ListDir(DirectoryOfFile D, int Depth) {

  if (D is a legitimate entry) {

    printName(D, Depth);

    if (D is a directory) {
      for each child C of D
        ListDir(C, Depth + 1);
    }
  }

}

void  ListDirectory(DirectoryOfFile D) {
  ListDir(D, 0);
}

//获取文件大小
static void SizeDirectory(DirectoryOfFile D) {

  int totalSize = 0;

  if (D is a legitimate entry) {

    totalSize = fileSize(D);
    if (D is a directory) {
        for each child C of D{
          totalSize += fileSize(C);
      }
    }
  }
  return totalSize;
}

//二叉树的ADT
typedef struct treeNode *PtrToNode;
typedef PtrToNode Tree;

struct treeNode{
  ElementType Element;
  Tree        left;
  Tree        right;
}

//表达式树
中缀表达式
后缀表达式
前缀表达式
由后缀表达式构造一棵表达式树

//二叉查找树


typedef struct streeNode *Position;
typedef Position  SearchTree;

struct streeNode{

  ElementType Element;
  SearchTree  left;
  SearchTree  right;
}


Position Find(ElementType X, SearchTree T){

  if (T == NUll) {
    return NUll;
  }

  if (T -> Element == X) {
    return T;
  }

  if (T -> Element > X) {
    return Find(X, T -> left);

  }else{

    return Find(X, T -> right);
  }

}


Position findMin(SearchTree T){

  if (T == NUll) {
    return NUll;
  }

  if (T -> left == NUll) {
    return T;
  }

  return findMin(SearchTree T);
}


SearchTree insert(ElementType X, SearchTree T){

  if (T == NUll) {

    T = malloc(sizeof(struct streeNode));

    if (T == NUll) {
      error;
    }else{

      T -> Element = X;
      T -> left = T -> right = NUll;
    }

  }

  else if (X > T -> Element)
      T -> right = insert(X, T -> right);

  else if (X < T -> Element)
      T -> left = insert(X, T -> left);

  }

  return T;
}

//最复杂的删除操作

SearchTree delete(SearchTree T, ElementType X){

  if (T == NUll) {
    return NUll;
  }
  else if(T -> Element < X){
    delete(T -> right, X);
  }
  else if(T -> Element > X){
    delete(T -> left, X);
  }
  else if(T -> right && T ->left){

    Position tmpCell = findMin(T - right, X);

    T -> Element = tmpCell -> Element;
    T -> right   = delete(T -> right, tmpCell -> Element);

  }
  else{

    Position tmpCell;
    tmpCell = T;
    if (T -> right) {
      T = T -> right;
    }
    else if (T -> left) {
      T = T -> left;
    }
    free(tmpCell);
  }

  return T;
}


//AVl ADT

typedef struct AvlNode *Position;
typedef struct AvlNode *AvlTree;

struct AvlNode{

  ElementType Element;
  AvlTree left;
  AvlTree right;
  int height;
}


AvlTree Insert(ElementType X, AvlTree T){

  if (T == NUll) {

    T = malloc(sizeof(struct AvlNode));
    if (T == NUll) {
      error();
    }else{
      T -> Element = X;
      T -> left = T -> right = NUll;
      T -> height = 0;
    }

  }

  else if (X < T -> Element) {
    T -> left = Insert(X , T -> left);
    if (height(T -> left) - height(T -> right) == 2) {
        if (X < T->left->Element)
          T = SingleRotateWithLeft(T);
        else
          T = DoubleRotateWithLeft(T);
    }

  }

  else if (X > T -> Element){

    T -> right = Insert(X, T -> right);
    if (height(T -> right) - height(T -> left) == 2) {

      if (X > T ->right ->Element)
        T = SingleRotateWithRight(T);
      else
        T = DoubleRotatewithWith(T);

    }

  }

  T -> height = Max(height(T -> left), height(T -> right)) + 1;

  return 1;
}


static Position SingleRotateWithLeft(Position K2){

  Position K1 = K2 -> left;

  K1 -> right = K2;
  k2 -> left  = K1 -> right;

  K2 -> height = Max()

}


//Fab

int fab(int n){

  int a[n];

  a[0] = 1;
  a[1] = 1;

  int current = a[1];
  int pre     = a[0];


  for (size_t i = 2; i < n; i++) {
    /* code */
    a[i] = pre + current;
    pre = current;
    current = a[i];
  }

  return a[n];
}
