<?php

class ingredient {

    private $connection;
    private $art;

    public function __construct($connection) {
        $this->connection = $connection;
        $this->art = new artikel($connection);
    }

    private function selectArtikel($artikel_id) {
        $artikel = $this->art->selecteerArtikel($artikel_id);
        return($artikel);
    }
  
    public function selecteerIngredient($recept_id) {
        $return = array();

        $sql = "SELECT * FROM ingredient WHERE recept_id = $recept_id";

        $result = mysqli_query($this->connection, $sql);
        
        while($ingredient = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
           
             $art = $this->selectArtikel($ingredient["artikel_id"]);
           
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
        
        return($return);

    }

}
?>
