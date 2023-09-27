<?php

ini_set('display_startup_errors',1);
ini_set('display_errors',1);
error_reporting(-1);

require_once("lib/database.php");
require_once("lib/artikel.php");
require_once("lib/gebruiker.php");
require_once("lib/keukentype.php");
require_once("lib/ingredient.php");
require_once("lib/receptinfo.php");
require_once("lib/recept.php");

/// INIT
$db = new database();
// $art = new Artikel($db->getConnection());
// $gebr = new Gebruiker($db->getConnection());
// $keukentype = new Keukentype($db->getConnection());
// $ingredient = new Ingredient($db->getConnection());
// $receptinfo = new Receptinfo($db->getConnection());
$recept = new Recept($db->getConnection());

/// VERWERK 
// $artikel = $art->selecteerArtikel(8);
// $gebruiker = $gebr->selecteerGebruiker(1);
// $keukentype = $keukentype->selecteerKeukentype(10);
// $ingredient = $ingredient->selecteerIngredient(2);
// $receptinfo = $receptinfo->selecteerReceptinfo(1, 'B');
// $receptinfo = $receptinfo->addFavorite(2, '2');
// $receptinfo = $receptinfo->deleteFavorite(2, '2');
$recept = $recept->selecteerRecept(1);

/// RETURN
echo "<pre>";
// var_dump($artikel);
// var_dump($gebruiker);
// var_dump($keukentype);
// var_dump($ingredient);
// var_dump($receptinfo);
var_dump($recept);
?>