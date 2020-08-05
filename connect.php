
<?php

$dbname = "fkae_shop";
$host = 'mysql1.php.xdomain.ne.jp';
$user = 'fkae_grgb';
$psw = 'Aroma324';
$mydb = 'mysql:dbname='.$dbname.';host='.$host.';charset=utf8';

$pdo=new PDO($mydb, $user, $psw, $driver_options);
 
$pdo->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);

$pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE,PDO::FETCH_ASSOC);

?>