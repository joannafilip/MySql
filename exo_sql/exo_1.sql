-- Requêtes sans filtre

-- 1.	Obtenez la liste de clients, toutes les informations
SELECT * FROM client

-- 2.	Obtenez le nom et le prénom de tous les clients
SELECT nom, prenom FROM client

-- 3.	Obtenez le titre et le prix de tous les livres
SELECT titre, prix FROM livre

-- 4.	Obtenez tous les noms de clients en majuscule (UPPER)
SELECT UPPER(nom) FROM client

-- Requêtes avec filtre simple (WHERE)

-- 5.	Obtenez l'adresse de tous les clients qui s'appellent 'Jones'
SELECT adresse FROM client WHERE nom="Jones"

-- 6.	Obtenez tous les livres de la collection "Asterix"
SELECT * FROM 'livre' WHERE titre LIKE 'Ast%'
SELECT * FROM 'livre' WHERE titre LIKE 'Asterix%'
SELECT titre FROM livre WHERE titre LIKE 'Ast%'

-- 7.	Obtenez tous les livres qui coutent plus de 20 euros 
sELECT prix FROM livre WHERE prix>20

-- 8.	Obtenez la liste de livres en ordre alphabétique (ascendant) en utilisant "ORDER BY"
SELECT * FROM livre ORDER BY titre

-- 9.	Obtenez tous les clients dont le nom commence par ‘J’ (utilisez LIKE)
SELECT nom FROM client WHERE nom LIKE 'J%'
SELECT * FROM client WHERE nom LIKE 'J%'

-- 10.	Obtenez tous les clients dont le nom contient la lettre ‘e’
SELECT * FROM client WHERE nom LIKE '%e%'

-- Requêtes avec filtre AND et OR (WHERE)

-- 11.	Obtenez tous les livres qui coutent entre 10 et 20 euros
SELECT * FROM livre WHERE prix<20 AND prix >10

-- 12.	Obtenez tous les livres qui coutent moins de 13 euros et les livres qui coutent plus de 25 dans la même requête 
SELECT * FROM livre WHERE prix<13 OR prix>25

-- 13.	Obtenez tous les livres de la collection "Asterix" qui coutent moins de 20 euros
SELECT * FROM livre where titre LIKE 'Asterix%' AND prix <20

-- 14.	Obtenez tous les livres publiés à partir de 2008 (y inclus 2008)
-- Suivez cet schéma (les dates doivent être mises entre guillemets et le format doit être respecté) :
-- SELECT * FROM `emprunt` WHERE date_emprunt > "2008/01/01" 

SELECT - FROM livre WHERE date_publication >"2008/01/01" 
-- 15. Obtenez les emprunts pendant le mois de Février de 2015
--     (MONTH : <https://www.w3schools.com/sql/func_mysql_month.asp>)

SELECT * FROM Livre WHERE MONTH(date_publication) = 2 AND YEAR(date_publication) = 2015;
-- 16. Obtenez les emprunts depuis le 1er janvier 2015 (le plus
--     récent le premier)

SELECT * FROM Emprunt WHERE date_emprunt > "2015-1-1" ORDER BY date_emprunt ;

-- Requêtes avec plusieurs tableaux (jointures – JOIN)

-- Les jointures : 

-- 17.	Obtenez une liste où on affiche de couples titre du livre – nom de l'auteur
SELECT livre.titre, auteur.nom AS couple FROM livre INNER JOIN auteur ON livre.auteur_id = auteur.id

-- 18.	Obtenez une liste de tous les exemplaires de chaque livre
SELECT livre.titre, exemplaire.id AS exemplaire FROM livre INNER JOIN exemplaire ON exemplaire.livre_id = livre.id

-- 19.	Obtenez les titres des livres empruntés par chaque client
SELECT livre.titre, client.nom AS info, exemplaire.id, emprunt.id FROM livre INNER JOIN exemplaire ON livre.id=exemplaire.livre_id INNER JOIN emprunt ON exemplaire.id=emprunt.exemplaire_id INNER JOIN client ON client.id=emprunt.client_id

-- 20.	Obtenez les titres des livres empruntés entre 2008 et 2010
SELECT livre.titre, emprunt.date_emprunt, exemplaire.id FROM livre INNER JOIN exemplaire ON livre.id=exemplaire.livre_id INNER JOIN emprunt ON exemplaire.id=emprunt.exemplaire_id WHERE date_emprunt > "2008/01/01" AND date_emprunt < "2010/12/31"

-- 21.	Obtenez les noms des clients qui on emprunté les livres d'Astérix
SELECT livre.titre, exemplaire.id, emprunt.id, client.nom FROM livre INNER JOIN exemplaire ON livre.id=exemplaire.livre_id INNER JOIN emprunt ON exemplaire.id=emprunt.exemplaire_id INNER JOIN client ON client.id=emprunt.client_id WHERE titre LIKE "Asterix%"

-- 22.	Considérez qu’un emprunt peut durer deux semaines au maximum. Obtenez une liste des exemplaires empruntés et des dates limite des emprunts (utilisez ADDDATE)
-- Requêtes diverses

SELECT livre.titre, emprunt.date_emprunt, DATE_ADD(emprunt.date_emprunt, INTERVAL 14 DAY) as date_limite FROM livre INNER JOIN exemplaire ON livre.id = exemplaire.livre_id INNER JOIN emprunt ON exemplaire.id = emprunt.exemplaire_id

-- 23.	Obtenez le nombre de clients avec COUNT()  https://www.w3schools.com/sql/func_mysql_count.asp
SELECT COUNT(client.id) AS NumberOfClient FROM client;

-- 24.	Obtenez le nombre de livres qui se trouvent à la bibliothèque
SELECT COUNT(livre.id) AS NumberOfBooks FROM livre;

-- 25.	Obtenez le nombre de clients dont le nom contient la lettre ‘b’
SELECT COUNT(client.nom) AS Nom FROM client WHERE nom LIKE "%b%"

-- 26.	Obtenez le nombre d’exemplaires disponibles
SELECT * FROM exemplaire INNER JOIN emprunt ON exemplaire.id = emprunt.exemplaire_id WHERE date_retour <CURRENT_DATE

-- 27. Obtenez le nombre d'exemplaires disponibles d'un titre de votre choix
SELECT * FROM livre INNER JOIN exemplaire ON livre.id = exemplaire.livre_id INNER JOIN emprunt ON exemplaire.id = emprunt.exemplaire_id WHERE date_retour <CURRENT_DATE AND titre LIKE "Asterix%"

-- 28.	Obtenez tous les livres dont le titre commence par ‘V’
SELECT COUNT(livre.id) AS NumberOfBooks FROM livre WHERE titre LIKE "V%"

-- 29.	Obtenez le nombre d’exemplaires de chaque livre (afficher le code du livre, pas besoin du titre)

SELECT livre.isbn, COUNT(exemplaire.id) AS numberEx FROM livre INNER JOIN exemplaire ON livre.id = exemplaire.livre_id GROUP BY livre.id

-- 30.	Obtenez le nombre d’exemplaires de chaque livre (afficher le titre du livre aussi)
SELECT livre.isbn, livre.titre, COUNT(exemplaire.id) AS numberEx FROM livre INNER JOIN exemplaire ON livre.id = exemplaire.livre_id GROUP BY livre.id

-- 31.	Obtenez la liste d’exemplaires qui ont été empruntés cette année

SELECT * FROM exemplaire INNER JOIN emprunt ON exemplaire.id=emprunt.exemplaire_id WHERE YEAR (date_emprunt)=2020