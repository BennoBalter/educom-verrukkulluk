<?php

class gebruiker {

    private $connection;

    public function __construct($connection) {
        $this->connection = $connection;
    }
  
    public function selecteerGebruiker($gebruiker_id) {

        $sql = "SELECT * FROM gebruiker WHERE id = $gebruiker_id";
        $result = mysqli_query($this->connection, $sql);
        
        while($data = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            $return[] = $data['gebruiker_email'];
        };
        
        return($return);

    }


}
?>