<?php

ini_set('display_startup_errors',1);
ini_set('display_errors',1);
error_reporting(-1);

require_once("lib/database.php");
require_once("lib/artikel.php");
require_once("lib/gebruiker.php");
require_once("lib/keukentype.php");
require_once("lib/ingredient.php");

/// INIT
$db = new database();
// $art = new artikel($db->getConnection());
// $gebr = new gebruiker($db->getConnection());
// $keukentype = new keukentype($db->getConnection());
$ingredient = new ingredient($db->getConnection());

/// VERWERK 
// $data_art = $art->selecteerArtikel(8);
// $data_gebr = $gebr->selecteerGebruiker(1);
// $data_keukentype = $keukentype->selecteerKeukentype(10);
$data_ingr = $ingredient->selecteerIngredient(2);

/// RETURN
echo "<pre>";
var_dump($data_ingr);

?>