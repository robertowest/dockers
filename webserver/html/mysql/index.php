<?php
/*
MySQLi es una opción mas para la conexión he interacción con MySQL. 
Su nombre viene de "MySQL Improved" y es una interfaz mejorada de PHP, 
por lo que se utiliza únicamente para PHP Scripting
*/

function Conectarse()
{
    # $host='172.29.0.2:3306';
    $host='mysql';
    $usuariodb='root';
    $passwdb='roberto';
    $nombredb='sys';

    $link = mysqli_connect($host, $usuariodb, $passwdb, $nombredb);
    if (!$link) {
        echo "Error: Incapaz de conectarse a MySQL." . PHP_EOL . "</br>";
        echo "Depuración errno: " . mysqli_connect_errno() . PHP_EOL. "</br>";
        echo "Depuración error: " . mysqli_connect_error() . PHP_EOL. "</br>";
        exit;
    }
    return $link;
}

$link = Conectarse();
echo "Conexión exitosa !!!." . PHP_EOL. "</br>";
echo "Información del host: " . mysqli_get_host_info($link) . PHP_EOL;
mysqli_close($link);
?>