<!-- -	Créez une page contenant un formulaire où on peut saisir des informations sur un nouveau livre pour l'insérer dans la BD -->

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
    try{$db = new PDO(DBDRIVER . ': host=' . DBHOST . ';port=' . DBPORT . ';dbname=' . DBNAME .
        ';charset=' . DBCHARSET, DBUSER, DBPASS);
    }
    catch(Exception $e) {

        print"Erreur";
        print $e->getmessage();
        die();
    }
    // prise des valeurs du formulaire
    $titre = $_POST['titre']; // manque filter_vars
    $prix = $_POST['prix'];
    $description = $_POST['description'];
    $date_publication = $_POST['date_publication'];
    $isbn = $_POST['isbn'];
    $auteur_id = $_POST['auteur_id'];
    var_dump ($_POST);
  
    // création de la requête et spécification des paramètres
    $sql = "INSERT INTO livre (id, titre,prix,description,date_publication, isbn, auteur_id) " .
        "VALUES (null, :titre, :prix,:description,:date, :isbn, :auteur_id)";

    // préparation de la requête
    $stmt = $db->prepare($sql);

    // donner des valeurs aux paramètres
    $stmt->bindParam (":titre",$titre);
    $stmt->bindParam (":prix",$prix);
    $stmt->bindParam (":description",$description);
    $stmt->bindParam (":date",$date_publication);
    $stmt->bindParam (":isbn",$isbn);
    $stmt->bindParam (":auteur_id",$auteur_id);

    // lancer la requête
    $stmt->execute();
    var_dump ($stmt->errorInfo());
    var_dump ($db->errorInfo());

    ?>
</body>

</html>