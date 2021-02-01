<?php

include 'includes/connect.php';

$sql = "SELECT * FROM product";
    $statement = $connection->query($sql); // Récupération d'un objet PDOStatement
    $results = $statement->fetchAll(PDO::FETCH_ASSOC);

$data = $results;
?>

<table>
    <tr>
        <th>Nom</th>
        <th>Description</th>
        <th>Prix</th>
        <th>En stock</th>
    </tr>
       <?php
    foreach ($data as $beanie) {
        echo '
                <tr>
                    <td>
                        ' . $beanie['name'] . '
                    </td>
                    
                    <td>
                        ' . $beanie['description'] . '
                    </td>
                    
                    <td>
                        ' . $beanie['price'] . '
                    </td> 
                                   
                    <td>
                        ' . $beanie['stock'] . '
                    </td>
       
                </tr>';
    }
    ?>
</table>
 