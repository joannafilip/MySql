<!-- Créez une page qui permet de chercher un livre -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=<, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <?php
     // créer une connexion à la BD
    include "./config/db.php";
    $db= new PDO (DBDRIVER.': host='.DBHOST.';port='.DBPORT.';dbname='.DBNAME.
    ';charset='.DBCHARSET, DBUSER, DBPASS); 
 // prise de données d'un formulaire
    $titre = $_POST['titre']; // filter_vars
    $sql = "SELECT * FROM livre WHERE titre = :titre";
    $stmt = $db->prepare ($sql);
    $stmt->bindParam(":titre",$titre);
    $stmt->execute();
    $arrayResultat = $stmt->fetchAll(PDO::FETCH_ASSOC);

     var_dump ($arrayResultat);

    
    ?>
</body>
</html>