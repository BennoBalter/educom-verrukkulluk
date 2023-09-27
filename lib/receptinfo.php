<?php

class Receptinfo {

    private $connection; 
    private $recinfo;
    private $gebr;

    public function __construct($connection) { 
        $this->connection = $connection;
        $this->gebr = new Gebruiker($connection);
    }

    private function selecteerGebruiker($gebruiker_id) { 
       $gebruiker = $this->gebr->selecteerGebruiker($gebruiker_id);
       return($gebruiker);
    }
  
    public function selecteerReceptinfo($recept_id, $record_type) {
        $return = array();

        $sql = "SELECT * FROM receptinfo WHERE recept_id = $recept_id AND record_type = '$record_type'"; 

        $result = mysqli_query($this->connection, $sql);
        
        while($receptinfo = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            
            if ($record_type == 'O' || $record_type == 'F') {
                $recinfo = $this->selecteerGebruiker($receptinfo["gebruiker_id"]);
                $return[] = [
                    "id" => $receptinfo['id'],
                    "datum" => $receptinfo['datum'],
                    "num" => $receptinfo['num'],
                    "text" => $receptinfo['text'],
                    "gebruiker_naam" => $recinfo['gebruiker_naam'],
                    "gebruiker_wachtwoord" => $recinfo['gebruiker_wachtwoord'],
                    "gebruiker_email" => $recinfo['gebruiker_email'],
                    "gebruiker_afbeelding" => $recinfo['gebruiker_afbeelding'],
                    ];
            } else {            
                $return[] = [
                    "id" => $receptinfo['id'],
                    "datum" => $receptinfo['datum'],
                    "num" => $receptinfo['num'],
                    "text" => $receptinfo['text'],
                ];
            
            }
        };
        return($return); 
    
    }
    
    public function addFavorite($recept_id, $gebruiker_id) { 
        $conn = $this->connection;

        $sql = "INSERT INTO `receptinfo` (`record_type`, `recept_id`, `gebruiker_id`) VALUES ('F', '$recept_id', '$gebruiker_id')";

        if ($conn->query($sql) === TRUE) {
        echo "New record created successfully";
        } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
        }

        $conn->close();
    }

    public function deleteFavorite($recept_id, $gebruiker_id) { 
        $conn = $this->connection;
        $sql = "DELETE FROM `receptinfo` WHERE recept_id=$recept_id AND gebruiker_id=$gebruiker_id";

        if ($conn->query($sql) === TRUE) {
        echo "Record deleted successfully";
        } else {
        echo "Error deleting record: " . $conn->error;
        }

        $conn->close();
    }
}
?>
