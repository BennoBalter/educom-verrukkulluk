<?php

class Gebruiker {

    private $connection;
    private $gebr;

    public function __construct($connection) {
        $this->connection = $connection;
    }
  
    public function selecteerGebruiker($gebruiker_id) {

        $sql = "SELECT * FROM gebruiker WHERE id = $gebruiker_id";
        $result = mysqli_query($this->connection, $sql);
                
        $gebr = mysqli_fetch_array($result, MYSQLI_ASSOC);
        return $gebr;
    }

}
?>

<!-- $return[] = $data_gebr['gebruiker_email']; -->
<!-- "gebruiker_naam" => $gebr['gebruiker_naam'],
"gebruiker_afbeelding" => $gebr['gebruiker_afbeelding'], -->