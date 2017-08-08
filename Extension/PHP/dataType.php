<?php

//string integer float boolean array object NULL

//integer
$x = 5985;
$y = -345;
$z = 0x3c;
$w = 047;
var_dump($x);
var_dump($y);
var_dump($z);
var_dump($w);

//float
$x = 10.32;
$y = 2.4e3;
$z = 8e-5;

var_dump($x);
var_dump($y);
var_dump($z);

//boolean

$x = true;
var_dump($x);

//array
$cars = array("Volvo","BMW","Toyota");
var_dump($cars);

//object

class Car{

	var $color;
	function Car($color = "green"){
	
		$this->color = $color;
	}

	function what_color(){
		return $this->color;
	}
}

$herbie = new Car("white");
echo "herbie: Properties:\n";
print($herbie->color);
//print_vars($herbie);

?>
