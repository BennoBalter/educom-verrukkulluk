<?php

class Artikel {

    private $connection;
    private $art;

    public function __construct($connection) {
        $this->connection = $connection;
    }
  
    public function selecteerArtikel($artikel_id) {

        $sql = "SELECT * FROM artikel WHERE id = $artikel_id";
        $result = mysqli_query($this->connection, $sql);
        
        $art = mysqli_fetch_array($result, MYSQLI_ASSOC);
                
        return $art;
    }

}
?>