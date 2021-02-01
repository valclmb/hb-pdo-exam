<?php

include 'includes/connect.php';

$sql = "SELECT  product.name'name', description, price, category.name'categorie', stock  
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

    $data = $results;
    
?>
    <table>
    <tr>
        <th>Nom</th>
        <th>Description</th>
        <th>Prix</th>
        <th>Catégories</th>
        <th>En stock</th>
    </tr>
    <?php foreach ($data as $value) {
    echo '
                <tr>
                    <td>
                        '.$value['name'].'
                    </td>
                    
                    <td>
                        '.$value['description'].'
                    </td>
                    
                    <td>
                        '.$value['price'].'
                    </td> 
                                   
                    <td>
                        '.$value['categorie'].'
                    </td>
                    <td>
                        '.$value['stock'].'
                    </td>
                </tr>';
} ?>
</table>

<?php
