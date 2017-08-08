<?php
//关键字 global static 

$x = 5;

function myTest(){

	static $y = 10;
	$y++;
//        global $x;	
//	echo "测试函数内变量\n";
//	echo "变量x为：$GLOBALS[x] \n";
	echo "变量y为：$y \n";
}

myTest();
myTest();
myTest();
//echo "测试函数外变量\n";
//echo "变量x为：$x \n";
//echo "变量y为：$y \n";

?>
