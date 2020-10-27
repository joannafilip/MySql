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

    $sql = "SELECT titre,prix,description, date_publication, isbn, auteur_id FROM livre";
    $objetRequete = $db->prepare ($sql);
    $objetRequete->execute();
    $arrayResultat = $objetRequete->fetchAll(PDO::FETCH_ASSOC);

    // var_dump ($arrayResultat);
for ($i=0; $i <count($arrayResultat) ; $i++) { 
    print "<br/>";
foreach ($arrayResultat[$i] as $key => $value) {
        print $key . " : " .$value;
        print "<br/>";
    }};
    
    ?>
</body>
</html>