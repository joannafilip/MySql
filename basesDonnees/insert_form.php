<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h3>Rajouter un livre</h3>
    <form action="insererLivre.php" method="POST">
      
        <!-- Auteur<input type="number" name="auteur"><br> -->
        Auteur <select name="auteur_id">
        <?php
        include "./config/db.php";
        try {
            $db = new PDO(DBDRIVER . ': host=' . DBHOST . ';port=' . DBPORT . ';dbname=' . DBNAME .
                ';charset=' . DBCHARSET, DBUSER, DBPASS);
        }
        catch (Exception $e){
            echo "Erreur!!";
            echo $e->getMessage();
            die();
        }
        $sqlAuteurs = "SELECT id, nom, prenom FROM Auteur ORDER BY prenom";
        $stmt = $db->prepare($sqlAuteurs);
        $stmt-> execute();
        $arrayAuteurs = $stmt->fetchAll(PDO::FETCH_ASSOC);
       

        foreach ($arrayAuteurs as $unAuteur){
            echo "<option value='".$unAuteur['id']."'>".$unAuteur['prenom']." ".$unAuteur['nom']."</option>";
        }

        ?>
        </select><br>
        Titre<input type="text" name="titre"><br>
        Prix<input type="number" name="prix"><br>
        Description<input type="text" name="description"><br>
        Date publication<input type="date" name="date_publication"><br>
        ISBN<input type="text" name="isbn"><br>

        <input type="submit" value="Envoyer">
    </form>
</body>
</html>