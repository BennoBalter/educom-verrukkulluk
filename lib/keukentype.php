<?php

class Keukentype {

    private $connection;

    public function __construct($connection) {
        $this->connection = $connection;
    }
  
    public function selecteerKeukentype($keukentype_id) {
        
        $sql = "SELECT * FROM keukentype WHERE id = $keukentype_id";
        $result = mysqli_query($this->connection, $sql);
        
        $data_keukentype = mysqli_fetch_array($result, MYSQLI_ASSOC);             
        return($data_keukentype);

    }

}
?>