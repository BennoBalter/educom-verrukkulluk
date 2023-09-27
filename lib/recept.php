<?php

class Recept {

    private $connection; 
    private $gebr;
    private $ingr;

    public function __construct($connection) { 
        $this->connection = $connection; 
        $this->gebr = new Gebruiker($connection); 
        $this->ingr = new Ingredient($connection);
    }

    private function selecteerGebruiker($gebruiker_id) { 
        $gebruiker = $this->gebr->selecteerGebruiker($gebruiker_id);
        return($gebruiker);
    }
  
    public function selecteerRecept($recept_id) {
        $return = array();

        $sql = "SELECT * FROM recept WHERE id = $recept_id"; 
        
        $result = mysqli_query($this->connection, $sql); 
        
        while($recept = mysqli_fetch_array($result, MYSQLI_ASSOC)) { 
           
            $gebr = $this->selecteerGebruiker($recept["gebruiker_id"]); 
            
            $ingredienten = $this->ingr->selecteerIngredient($recept_id);
            
            $return[] = [
              "recept_datum_toegevoegd" => $recept['recept_datum_toegevoegd'],
              "gebruiker_naam" => $gebr['gebruiker_naam'],
              "gebruiker_afbeelding" => $gebr['gebruiker_afbeelding'],
              "ingredienten" => $ingredienten,              // hoe kan ik elementen selecteren die ik als output van selecteerIngredient wil?
            ];
        };
        

       return($return); 

    }

    private function calcCalorieen($recept_id) {             // ik wil toch dat calorieen worden getoond als output van de selecteerRecept(recept_id) methode? Waarom moet ik dan een losse calcCalorieen functie maken?
        $receptinfo = $this->selecteerRecept($recept_id);
        $hoeveelheid = $recipeInfo[artikel_hoeveelheid]['artikel_hoeveelheid'];
        echo ($gebruikerNaam);
    // if (artikel_meeteenheid == 'g' || artikel_meeteenheid == 'mL'){
    //     $this->artikel_voedingswaarden_100;
    //     artikel_hoeveelheid;
    // } elseif (artikel_meeteenheid == 'stuk') {
    //     calc cal stuk;
    // } else {echo "kan calorieen niet berekenen, artikel_meeteenheid onbekend";
    // }


    }
}
?>
