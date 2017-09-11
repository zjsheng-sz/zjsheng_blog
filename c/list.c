#include<stdio.h>

//结构定义
typedef struct{         //顺序表

	int data[maxSize];
	int length;
}Sqlist;

typedef struct LNode{   //单链表

    int data;
    struct DLNode *next;
}LNode;

typedef struct DLNode{	//双链表
	
    int data;
    struct DLNode *prior;
    struct DLNode *next;
}

//算法操作
//顺序表
int LocationElem (Sqlist L, int e);

int Insert(Sqlist &L, int p, int e);

int ListDelete(Sqlist &L, int p, int &e); 

void InitList(Sqlist &L);

int GetElem(Sqlist L, int p, int &e);

//单链表

void CreatListR(LNode *&C, int a[], int n);//尾插法建表
void CreatListF(LNode *&C, int a[], int n);//头插法建表


