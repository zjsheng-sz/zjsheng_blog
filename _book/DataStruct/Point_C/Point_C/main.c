////
////  main.c
////  Point_C
////
////  Created by robert on 16/7/6.
////  Copyright © 2016年 robert. All rights reserved.
////
//
//#include <stdio.h>
//
//#define ZJSDEBUG 0
//
//
//int main(int argc, const char * argv[]) {
//
//    /*
//      预处理指令
//     宏定义：    #define #undef
//     文件包含：  #include
//     条件编译：  #if #ifdef #ifndef #elif #else #endif
//     */
//
//    printf("%d\n",__LINE__);
//    //    20
//    printf("%s\n",__FILE__);
//    //    Users/robert/Desktop/C/Point_C/Point_C/main.c
//    printf("%s\n",__DATE__);
//    //    Jul  6 2016
//    printf("%s\n",__TIME__);
//    //    21:23:58
//    printf("%d\n",__STDC__);
//    //    1
//
//#if ZJSDEBUG
//
//    printf("if debug\n");
//
//#endif
//
//
//#ifdef ZJSDEBUG
//
//    printf("ifdef debug\n");
//
//#endif
//
//    return 0;
//}



#include<stdio.h>
//#include<stdlib.h>

struct aa{
    char a;
    double b;
    short c;
};

struct bb
{
    double a;
    short b;
    char c;
};

struct cc
{
    struct bb s1;
    char s2;
};

struct dd
{
    struct aa s1;
    char s2;
};

#pragma pack(1)
struct ee
{
    double a;
    short b;
    char c;
};

struct ff
{
    char a;
    double b;
    short c;
};
#pragma pack()

struct gg
{
    char a;
};

struct jj
{
    char a;
    short b;
};

int main()
{

  

    printf("double short char size is %d %d %d\n",sizeof(double),sizeof(short),sizeof(char));
    printf("size of s1 = %d\nsize of s2 = %d\n",sizeof(struct aa),sizeof(struct bb));

    printf("size of t1 = %d\nsize of dd = %d\n",sizeof(struct cc),sizeof(struct dd));

    printf("size of struct ee = %d\nsize of struct ff = %d\nsize of struct gg = %d\nsize of struct jj = %d\n",
           sizeof(struct ee),sizeof(struct ff),sizeof(struct gg),sizeof(struct jj));
    exit(0);

/*
    size of s1 = 24
	size of s2 = 16
	size of t1 = 24
	size of dd = 32
	size of struct ee = 11
	size of struct ff = 11
	size of struct gg = 1
	size of struct jj = 4
*/
}
