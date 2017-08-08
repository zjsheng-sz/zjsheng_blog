<?php
//算术运算符  赋值运算符 递增/减运算符 比较运算符 逻辑运算符 三元运算符

$a = 5;
$b = "5";

var_dump ($a == $b); //true
var_dump ($a === $b); //false


echo "逻辑运算符\n";

$x = 6;
$y = 3;

var_dump($x == 6 and $y == 3);
var_dump($x == 6 or $y == 4);
var_dump($x == 6 xor $y == 4); //异或 2个中有且仅有1个为true则为true
var_dump($x == 6 && $y == 4);
var_dump($x == 6 || $y == 4);

echo "数组运算符\n";

$x = array("a" => "red", "b" => "green");
$y = array("c" => "blue", "d" => "yellow");

$z = $x + $y;

var_dump($x == $y);
var_dump($x === $y);
var_dump($x != $y);
var_dump($x <> $y);
var_dump($x !== $y);

echo "三元运算符";

$test = "zjsTest";

//$username = isset($test) ? $test : "nobody";
//$username = $test ? $test : "nobody";
$username = $test?: "nobody";


echo $username, PHP_EOL;  //PHP_EOL 换行符

echo "\n";
?>
