#include<stdio.h>
#define NAME_LEN 20
//结构体变量的申明
/*
struct{
	int number;
	char name[NAME_LEN + 1];
	int on_hand;

} part1,part2;
*/
//结构体变量的初始化

/*
struct{
	int number;
	char name[NAME_LEN + 1];
	int on_hand;

} part1 = {528,"Disk drive",10},
  part2 = {914,"Printer cable",5};
*/

//结构标记的申明
/*
struct Part {
	int number;
	char name[NAME_LEN + 1];
	int on_hand;
};
*/
//结构体类型的定义
typedef struct{
	int number;
	char name[NAME_LEN + 1];
	int on_hand;
} Part;

//结构体的数据对齐
//...
int main(){

	Part part3 = {123,"robert",1};
	printf("part1 number:%d\n",part3.number);		
	
	return 0;
}
