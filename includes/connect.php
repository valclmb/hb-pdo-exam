<?php

include 'db.inc.php';

$dsn = $dbDsn;
$user = "$dbUser"; // Utilisateur par défaut
$password = "$dbPass"; // Par défaut, pas de mot de passe sur Wamp

try {
    $connection = new PDO($dsn, $user, $password);
} catch (PDOException $e) {
    echo 'Connexion échouée : ' . $e->getMessage();
}
