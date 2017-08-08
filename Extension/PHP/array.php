<?php

//数值数组
//
//获取数组长度
//
//数组遍历
//
//关联数组
//
//遍历关联数组
//
//数组排序<sort()/rsort()/asort()/arsort()/ksort()/krsort()>

$cars = array("Volove","BMW","Toyato");
echo count($cars);
echo "\n";
for($i = 0; $i < count($cars); $i++){
	echo($cars[$i]);
	echo "\n";
}

$ages = array("zjs"=>"26","llx"=>"29","lhq"=>"27");

echo "zjs is " . $ages['zjs']." years old\n";

foreach($ages as $x=>$x_value){
	echo "Key=" . $x . ", Value=" . $x_value . "\n";
}




?>
