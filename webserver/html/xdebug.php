<?php
$jugos = array("manzana", "naranja", "koolaid1" => "púrpura");

echo "Él tomó algo de jugo de $jugos[0]."."<br>";
echo "Él tomó algo de jugo de $jugos[1]."."<br>";
echo "Él tomó algo de jugo $jugos[koolaid1]."."<br>";

class persona {
    public $john = "John Smith";
    public $jane = "Jane Smith";
    public $robert = "Robert Paulsen";
    
    public $smith = "Smith";
}

$persona = new persona();

echo "$persona->john tomó algo de jugo de $jugos[0]."."<br>";
echo "$persona->john entonces dijo hola a $persona->jane."."<br>";
echo "La esposa de $persona->john saludó a $persona->robert."."<br>";
echo "$persona->robert saludó a los dos $persona->smiths."; // No funcionará
?>
