<?php

ini_set('display_startup_errors',1);
ini_set('display_errors',1);
error_reporting(-1);

require_once("lib/database.php");
require_once("lib/artikel.php");
require_once("lib/gebruiker.php");

/// INIT
$db = new database();
$art = new artikel($db->getConnection());
$gebr = new gebruiker($db->getConnection());

/// VERWERK 
$data_art = $art->selecteerArtikel(8);
$data_gebr = $gebr->selecteerGebruiker(1);

/// RETURN
echo "<pre>";
var_dump($data_art);
var_dump($data_gebr);

?>