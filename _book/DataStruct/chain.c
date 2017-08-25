#include<stdio.h>
#include<stdlib.h>

//申明节点类型
struct node{

	int value;
	struct node *next;
};

//插入节点
struct node *add_to_list(struct node *list, int n){

	struct node *new_node;
	new_node = malloc(sizeof(struct node));

	if(new_node == NULL){

		Printf("Error: malloc failed in add_to_list");
		exit(EXIT_FAILURE);
	}
	new_node->value = n;
	new_node->next = list;

	return new_node;
}

//插入N个节点
struct node *read_numbers(void){

	struct node *first = NULL;
	int n;

	printf("Enter a series of integers (0 to terminate):");
	for(;;){
		scanf("%d",&n);
		if (n == 0)
			return first;
		first = add_to_list(first,n);
	}

}

//搜索
struct node *search_list(struct node *list, int n){

	struct node *p;

	for(p = list; p!= NULL; p = p->next)
		if(p->value == n)
			return p

	return NULL;
}

//从链表中删除节点

struct node *delete_from_list(struct node *list, int n){

	//定位
	//改变前一个节点，使它"绕过"删除节点
	//free

	struct node *cur, *prev;

	for(cur = list, prev = NULL;
			cur != NULL && cur->value != n;
			prev = cur, cur = cur->next)
		;

	if(cur == NULL)
		return list;

	if(prev == NULL)
		list = list->next;
	else
		prev->next = cur->next;
	free(cur);

	cur = NULL;

	return list;

}



int main(){



	return 0;
}
