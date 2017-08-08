<?php
//超级全局变量
//
//在一个脚本的全部作用域中都可以使用，可以不做特殊说明就可以在函数和类中使用
//
//$GLOBALS  $_SERVER  $_REQUEST  $_POST  $_GET  $_FILES $_ENV  $_COOKIE  $_SESSION
//
$x = 75;
$y = 25;

echo "\$GLOBALS:\n";

function addition(){

	$GLOBALS['z'] = $GLOBALS['x'] + $GLOBALS['y'];
}

addition();
echo $z;
echo "\n";

echo $_SERVER['PHP_SELF'];
echo "\n";
echo $_SERVER['SERVER_NAME'];
echo "\n";
echo $_SERVER['HTTP_HOST'];
echo "\n";
echo $_SERVER['HTTP_REFERER'];
echo "\n";
echo $_SERVER['HTTP_USER_AGENT'];
echo "\n";
echo $_SERVER['SCRIPT_NAME'];
echo "\n";
?>
