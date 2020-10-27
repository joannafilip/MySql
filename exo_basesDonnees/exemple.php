<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
    <?php
    include "./config/db.php";
    // créer une connexion à la BD
    // soit écrire ici soit faire un fichier externe pour mettre des données de connexion

    $db = new PDO(DBDRIVER . ': host=' . DBHOST . ';port=' . DBPORT . ';dbname=' . DBNAME .
        ';charset=' . DBCHARSET, DBUSER, DBPASS);

    $sql = "SELECT code, villeDepart, villeDestination From trains " . "WHERE villeDepart = 'Bruxelles'"; // le texte qu'on va envoyer au server
    $objRequete = $db->prepare($sql);
    $objRequete->execute(); //on lance la requete sur le serveur
    //transformer dans un array
    $arrayResultat = $objRequete->fetchAll(PDO::FETCH_ASSOC); //fetch_assoc - est une constante, de quel typ


    var_dump($arrayResultat);

    //crée une requete

    ?>
</body>

</html>