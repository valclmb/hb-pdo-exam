<?php

include 'includes/connect.php';

$sql = "SELECT  product.name'name', description, price, stock  
        FROM product
        LEFT JOIN category ON product.id = category.id
        WHERE category.id IS NULL
        ";

    $statement = $connection->prepare($sql);
    $isDone = $statement->execute();

    if (!$isDone) {
        throw new Exception('Erreur');
    }
    $statement->setFetchMode(PDO::FETCH_ASSOC);
    $results = $statement->fetchAll();

var_dump($results);
