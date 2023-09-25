<?php

ini_set('display_startup_errors',1);
ini_set('display_errors',1);
error_reporting(-1);

require_once("lib/database.php");
require_once("lib/artikel.php");

/// INIT
$db = new database();
$art = new artikel($db->getConnection());


/// VERWERK 
$data = $art->selecteerArtikel(8);

/// RETURN
echo "<pre>";
var_dump($data);




?>