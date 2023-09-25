<?php

class keukentype {

    private $connection;

    public function __construct($connection) {
        $this->connection = $connection;
    }
  
    public function selecteerKeukentype($keukentype_id) {
        $return = array();

        $sql = "SELECT * FROM keukentype WHERE id = $keukentype_id";
        $result = mysqli_query($this->connection, $sql);
        
        while($data = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            $return[] = $data['recept_keukentype_omschrijving'];
        };
        
        return($return);

    }


}
?>