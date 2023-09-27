<?php
// class om in index.php verbinding met database te leggen en methodes uit te voeren
class Ingredient {

    private $connection; // property connection van de class ingredient, houdt de verbinding met de database in die gelegd is in database.php 
    private $art;

    public function __construct($connection) { // constructs database connection
        $this->connection = $connection; // "$this->connection" is a class property. Now this ingredient class has a connection property.
        $this->art = new Artikel($connection); // the art we are dealing with in this instance should refer to the database connection and the artikel methods
    }

    private function selecteerArtikel($artikel_id) { // nu kan de ingredient class artikel-info ophalen met een artikel_id, methodes hergebruiken
        $artikel = $this->art->selecteerArtikel($artikel_id);
        return($artikel);
    }
  
    public function selecteerIngredient($recept_id) {
        $return = array();

        $sql = "SELECT * FROM ingredient WHERE recept_id = $recept_id"; // SQL query string to select all records from the ingredient table where the recept_id matches the provided $recept_id.

        $result = mysqli_query($this->connection, $sql); // executes the query for all ingredient records that match the recept_id, results stored in result variable
        
        while($ingredient = mysqli_fetch_array($result, MYSQLI_ASSOC)) { // iterate through rows of results, stored as array in ingredient variable
           
            $art = $this->selecteerArtikel($ingredient["artikel_id"]); // retrieve artikel-info of the current ingredient using artikel_id
           
            $return[] = [
              "id" => $ingredient['id'],
              "artikel_hoeveelheid" => $ingredient['artikel_hoeveelheid'],
              "artikel_titel" => $art['artikel_titel'],
              "artikel_omschrijving" => $art['artikel_omschrijving'],
              "artikel_afbeelding" => $art['artikel_afbeelding'],
              "artikel_omvang_unit" => $art['artikel_omvang_unit'],
              "artikel_meeteenheid" => $art['artikel_meeteenheid'],
              "artikel_prijs_unit" => $art['artikel_prijs_unit'],
              "artikel_voedingswaarden_100" => $art['artikel_voedingswaarden_100'],
              "artikel_voorraad" => $art['artikel_voorraad'],
            ];
        };
        
        return($return); // array of ingredient-info associated with recept_id

    }

}
?>
