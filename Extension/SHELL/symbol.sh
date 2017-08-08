#!/bin/bash

echo "-- 原生bash不支持简单的数学运算 --"

val=`expr 2 + 2`
echo "两数之和:$val"

#关系运算符

a=10
b=20

if [ $a -eq $b ]
then
	echo "$a -eq $b : a等于b"
else
	echo "$a -eq $b : a不等于b"
fi


if [ $a -ne $b ]
then
	echo "$a -ne $b : a不等于b"
else
	echo "$a -ne $b : a等于b"
fi


if [ $a -gt $b ]
then
	echo "$a -gt $b : a大于b"
else
	echo "$a -gt $b : a不大于b"
fi


if [ $a -lt $b ]
then
	echo "$a -lt $b : a小于b"
else
	echo "$a -lt $b : a不小于b"
fi


if [ $a -ge $b ]
then
	echo "$a -ge $b : a大于或等于b"
else
	echo "$a -eq $b : a小于b"
fi


if [ $a -le $b ]
then
	echo "$a -le $b : a小于或等于b"
else
	echo "$a -le $b : a大于b"
fi


#布尔运算符
#! 非 、 -o或运算 、 -a与运算


#逻辑运算符
#&& ||

#字符串运算符号
# =  !=  -z  -n  $

stringA="abc"
stringB="efg"
if [ $a = $b ]
then
	echo "$a = $b: a等于b"
else
	echo "$a = $b: a不等于b"
fi

if [ $a ]
then
	echo "$a: 字符串不为空"
else
	echo "$a: 字符串为空"
fi

#文件测试运算符
# -b<块设备文件>  -c<字符设备文件>  -d<目录>  -f<非目录非设备文件>  -g<SGID>  -k<Sticky Bit>  -p<pipe>  -u<SUID>  -r  -w  -x  -s<大于0>  -e<exist>

file="~/"

if [ -r $rile ]
then
	echo"文件可读"
else
	echo"文件不可读"
fi
