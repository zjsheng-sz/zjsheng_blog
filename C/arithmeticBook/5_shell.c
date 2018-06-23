
#include <stdio.h>
#include <stdlib.h>
#include "5_shell.h"

struct ListNode{

  Position *nextNode;
  ElementType *element;
}

typedef Position List;

struct HashTbl{

  int TableSize;
  List *TheLists; //指向指针的指针
}


//初始化
HashTable InitializeTable(int TableSize){

  //alloc HashTable
  HashTable table = malloc(sizeof(struct HashTbl));

  if (table == NULL)
    fatalerror("out of space");

  //alloc  HashTable -> TheLists
  table -> TableSize = TableSize;
  table -> TheLists = malloc(sizeof(List) * table->TableSize);

  if (table -> TheLists == NULL)
    fatalerror("out of space");

  //alloc List firstNode
  for (int i = 0; i < table -> TableSize; i++) {

    H->TheLists[i] = malloc(sizeof(struct ListNode));

    if (H->TheLists[i] == NULL)
      fatalerror("out of space");

    H->TheLists[i] -> nextNode = NUll;

  }

}


//查找
Position Find(ElementType key, HashTable H){

    List L;
    Position P;

    L = H->elements[hash(key, TableSize)];

    for ( P = L->nextNode; P != NUll; P = P->nextNode) {

      if (P ->element == key) {
        return P;
      }
    }

    return NUll;

}

//插入
void  Insert(ElementType Key, HashTable H){



  List L;
  Position P;

  if (Find(key,H) != NUll) {
    return;
  }

  L = H->elements[hash(key, TableSize)];

  Position newP = malloc(sizeof(struct ListNode));
  newP->element = key;
  newP->nextNode = L->nextNode;

  L->nextNode = newP;

}
