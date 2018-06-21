//栈

#include<stdio.h>
#include <stdlib.h>

//顺序栈
typedef int datatype;
const int maxsize = 100;
typedef struct{
	datatype data[maxsize];
	datatype top;
}sqstack;

//初始化
void init_sqstack(sqstack *sq){

    sq->top = -1;
}
//判栈空
int empty_sqstack(sqstack *sq){

	if(sq->top == -1) return 1;
	else return 0;
}
//进栈
int push_sqstack(sqstack *sq, datatype x){

	if(sq->top == maxsize - 1){

		printf("栈满，不能进栈！\n");
		return 0;
	}
	sq->data[++sq->top] = x;
	return 1;
}
//出栈
int pop_sqstack(sqstack *sq, datatype *x){

	if(sq->top == -1){
		printf("空栈，不能出栈!\n");
		return 0;
	}
	*x = sq->data[sq->top--];
	return 1;
}
//取栈顶
int gettop_sqstack(sqstack *sq, datatype *x){

	if(sq->top == -1){
	    printf("空栈，无栈顶可以取\n");
	    return 0;
	}
	*x = sq->data[sq->top];
	return 1;
}

//链栈
typedef struct node * pointer; //节点指针类型
struct node{
	datatype data;
	pointer next;
};
typedef struct{
	pointer top;
}lkstack;

void init_lkstack(lkstack *lk){//初始化
    lk->top = NULL;
}

void empty_lkstack(lkstack *lk){//判栈空
	if(lk->top == NULL) return 1;
	else return 0;
}

void push_lkstack(lkstack *lk, datatype x){//进栈

    pointer p;          //申请新节点*p
    p = new node;
    p->data = x;
    p->next = ls->top;  //更改新节点next指针，原栈顶成为新节点的后继
    lk->top = p;        //改栈顶指针，新节点成为新的栈顶
}

int pop_lkstack(lkstack *lk, datatype *x){//退栈

	if(lk->top == NULL){
		printf("空栈,不能出栈!\n");
		return 0;
	}
	p = lk->top;
	*x = p->data;
	lk->top = lk->top->next;
	delete p;                       //C++，释放原来空间
	return 1;
}



int main(){
	return 0;
}
