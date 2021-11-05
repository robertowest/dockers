<?php
/*
MySQLi es una opci&oacute;n mas para la conexi&oacute;n he interacci&oacute;n con MySQL. 
Su nombre viene de "MySQL Improved" y es una interfaz mejorada de PHP, 
por lo que se utiliza únicamente para PHP Scripting
*/

$host='mariadb';
$usuariodb='root';
$passwdb='roberto';
$nombredb='idiomagic';

echo "<h1>Probando conexi&oacuten pdo</h1>";
try {
    $link = new PDO("mysql:host=$host;dbname=$nombredb", $usuariodb, $passwdb);
    $link->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "Conexi&oacute;n exitosa !!!.";
}
catch(PDOException $e) {
    echo "Error de conexi&oacute: " . $e->getMessage();
}

echo "<h1>Probando conexi&oacuten mysqli</h1>";
$link = mysqli_connect($host, $usuariodb, $passwdb, $nombredb);
if ($link) {
    echo "Conexi&oacute;n exitosa !!!." . PHP_EOL. "</br>";
    echo "Informaci&oacute;n del host: " . mysqli_get_host_info($link) . PHP_EOL;
    mysqli_close($link);
} else {
    echo "Error: Incapaz de conectarse a MySQL." . PHP_EOL . "</br>";
    echo "Depuraci&oacute;n errno: " . mysqli_connect_errno() . PHP_EOL. "</br>";
    echo "Depuraci&oacute;n error: " . mysqli_connect_error() . PHP_EOL. "</br>";
}
?>
