<?php

include 'includes/connect.php';

$data = [
    'Chapeaux',
    'Bérets',
    'Chapka',
    'Cache-oreilles',
    'Bandeaux'
];


  $sql = "INSERT INTO category(name) VALUES (:name)";
    
    $statement = $connection->prepare($sql);
    
    foreach ($data as $value) {
        $statement->bindParam(':name', $value, PDO::PARAM_STR);

        $isDone = $statement->execute();
        
        if (!$isDone) {
            throw new Exception('Erreur lors de l\'insertion de la donnée : bonnet'.$value);
        }
    }
