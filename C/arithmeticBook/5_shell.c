
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


}


//查找
Position Find(ElementType key, HashTable H){


}

//插入
void  Insert(ElementType Key, HashTable H){


}
