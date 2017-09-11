#!/bin/bash

your_name="zjs"
echo $your_name

#只读变量 不能被改变 不能被删除

myUrl="http://www.w3cschool.cc"
#readonly myUrl
#myUrl="http://www.runoob.com"
unset myUrl
echo $myUrl


##########字符串#########"
#Shell 字符串
#单引号 原样输出，变量无效
str='this is a string'

#双引号 可以有变量，可以出现转义字符

your_name='zhongjs'
str="Hello, I know you are \"$your_name\"! \n"

#拼接字符串
your_name="zhongjs"
greeting="hello,\"$your_name\"!"
greeting_1="hello,${your_name}!"
echo $greeting $greeting_1

#获取字符串长度
string="abcd"
echo ${#string}

#提取子字符串
string="runoob is a great site"
echo ${string:1:4}

#查找子字符串
strings="runoob is a great company"
#echo `expr index "$strings" r`


#########数组###########"

#定义数组
array_name=(value0 value1 value2 value3)
array_name=(value00
	    value11
	    value22
	    value33
)

#数组赋值
array_name[0]=value000;
array_name[1]=value111;
#读取数组
valuen=${array_name[1]}
echo ${array_name[@]}
#获取数组长度
length=${#array_name[@]}
length=${#array_name[*]}
#取得数组单个元素的长度
length=${#array_name[n]}


