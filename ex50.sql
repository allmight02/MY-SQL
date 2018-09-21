/*

 * To change this license header, choose License Headers in Project Properties.

 * To change this template file, choose Tools | Templates

 * and open the template in the editor.

 */



/**

* Objectif : Créer dans PHPMyAdmin une base de données haribo dont la modélisation est ci-dessous, les étapes sont détaillées ensuite.

*/



/**

+---------------+----------------+------+------+---------+----------------+

| Field         | Type           | Null | Key  | Default | Extra          |

+---------------+----------------+------+------+---------+----------------+

| id_stagiaire  | int(11)        | NO   | PRI  | NULL    | auto_increment |

| prenom        | varchar(100)   | NO   |      | NULL    |                |

| yeux          | varchar(30)    | NO   |      | NULL    |                |

| genre         | enum('h','f')  | NO   |      | NULL    |                |

+---------------+----------------+------+------+---------+----------------+



+---------------+----------------+------+------+---------+----------------+

| Field         | Type           | Null | Key  | Default | Extra          |

+---------------+----------------+------+------+---------+----------------+

| id_bonbon     | int(11)        | NO   | PRI  | NULL    | auto_increment |

| nom           | varchar(100)   | NO   |      | NULL    |                |

| saveur        | varchar(100)   | NO   |      | NULL    |                |

+---------------+----------------+------+------+---------+----------------+



+---------------+----------------+------+------+---------+----------------+

| Field         | Type           | Null | Key  | Default | Extra          |

+---------------+----------------+------+------+---------+----------------+

| id_manger     | int(11)        | NO   | PRI  | NULL    | auto_increment |

| id_bonbon     | int(11)        | YES  |      | NULL    |                |

| id_stagiaire  | int(11)        | YES  |      | NULL    |                |

| date_manger   | date           | NO   |      | NULL    |                |

| quantite      | int(11)        | NO   |      | NULL    |                |

+---------------+----------------+------+------+---------+----------------+

*/



/**

* REQUETES A EFFECTUER dans PHPMyAdmin

*/



--1-- lister toutes les BDD de PHPMyAdmin

SHOW DATABESES;

--2-- Créer une base de données SQL nommée HARIBO
CREATE DATABESES haribo;


--3--






-- id_stagiaire => nombre qui s'auto-incrémente, requis et clé primaire

-- prenom => 100 caractères, requis

-- couleur des yeux => 30 caractères, requis

 -- genre => homme ou femme, requis

CREATE TABLE stagiaire(id_stagiaire INT(11) PRIMARY KEY AUTO_INCREMENT NOT NULL, prenom VARCHAR(100)
NOT NULL, yeux VARCHAR(30) NOT NULL, genre ENUM('h','f') NOT NULL);




--4--

/**

* insérer dans cette table les informations de votre groupe (faites un copier-coller des lignes ci-dessous) :

*/





--5--

/**

* créer une table bonbon

* qui comporte 3 champs :

* - id_bonbon => nombre qui s'auto-incrémente, requis et clé primaire

* - nom => 100 caractères, requis
* - saveur => 100 caractères, requis

*/

CREATE TABLE bonbons(id_bonbon INT(11) PRIMARY KEY AUTO_INCREMENT NOT NULL, nom VARCHAR(100) 
	NOT NULL, saveur VARCHAR(100) NOT NULL);






INSERT INTO bonbons(nom, saveur) VALUES (

	'dragibus',

	'pomme',
);


--6--

/**

* insérer dans cette table des bonbons haribo (faites un copier-coller des lignes ci-dessous) :

*/



--7--

/**

* créer une table manger

* qui comporte 5 champs :

* - id_manger => nombre qui s'auto-incrémente, requis et clé primaire

* - id_stagiaire => champs de la table stagiaire

* - id_bonbon => champs de la table bonbon

* - date_manger => type date, requis

* - quantite => nombre, requis

*/
CREATE TABLE manger(id_manger INT(11) 
	PRIMARY KEY NOT NULL AUTO_INCREMENT, id_bonbon INT(11), 
	id_stagiaire INT(11), 
	date_manger DATE NOT NULL, quantite INT(11) NOT NULL);


--8--

/**

* insérer dans la table manger des informations sur qui a consommé quel bonbon, quand et dans quelles quantités (faites un copier-coller des lignes ci-dessous) :

*/

INSERT INTO manger (id_bonbon, id_stagiaire,date_manger, quantite) VALUES (5,5,'2018-09-01', 2);



--9-- Lister les tables de la BDD *haribo*

SHOW TABLES ;

--10-- voir les paramètres de la table *bonbon*

 SELECT * FROM bonbons;

--11-- Sélectionner tous les champs de tous les enregistrements de la table *stagiaire*

 SELECT * FROM stagiaire;

--12-- Rajouter un nouveau stagiaire *Patriiiick* en forçant la numérotation de l'id
 INSERT INTO stagiaire(id_stagiaire, prenom, yeux, genre) VALUES (100, 'Patriiiick', 'noisette', 'h');


--13-- Rajouter un nouveau stagiaire *Mila* SANS forcer la numérotation de l'id

  INSERT INTO stagiaire(id_stagiaire, prenom, yeux, genre) VALUES (id_stagiaire, 'Mila', 'marron', 'f');


--14-- Changer le prénom du stagiaire qui a l'id 100 de *Patriiiick* à *Patrick*

UPDATE stagiaire SET prenom='Patrick' WHERE id_stagiaire=100; 

--15-- Rajouter dans la table manger que Patrick a mangé 5 Tagada purpule le 15 septembre

 INSERT INTO manger (id_bonbon, id_stagiaire,date_manger, quantite) VALUES (5,100,'2018-09-15');

--16 SELECTIONNER tous les nom des bonbon

SELECT nom FROM bonbon;

--17-- Sélectionner tous les noms des bonbons en enlevant les doublons

SELECT DISTINCT nom FROM bonbons;

--18-- Récupérer les couleurs des yeux des stagiaires (Sélectionner plusieurs champs dans une table)
SELECT yeux FROM stagiaire;


--19-- Dédoublonner un résultat sur plusieurs champs
SELECT DISTINCT yeux, genre FROM stagiaire;


--20-- Sélectionner le stagiaire qui a l'id 5

SELECT * FROM stagiaire WHERE id_stagiaire=5;

--21-- Sélectionner tous les stagiaires qui ont les yeux marrons
SELECT * FROM stagiaire WHERE yeux='marron';


--22-- Sélectionner tous les stagiaires dont l'id est plus grand que 9

 SELECT * FROM stagiaire WHERE id_stagiaire >9;

--23-- Sélectionner tous les stagiaires SAUF celui dont l'id est 13 (soyons supersticieux !) :!\ il y a 2 façons de faire
SELECT * FROM stagiaire WHERE id_stagiaire != 13;


--24-- Sélectionner tous les stagiaires qui ont un id inférieur ou égal à 10

SELECT * FROM stagiaire WHERE id_stagiaire <=9

--25-- Sélectionner tous les stagiaires dont l'id est compris entre 7 et 11

SELECT * FROM stagiaire WHERE id_stagiaire BETWEEN 7 AND 11;

--26-- Sélectionner les stagiaires dont le prénom commence par un *S*

SELECT * FROM stagiaire WHERE prenom LIKE 'S%';

--27-- Trier les stagiaires femmes par id décroissant
SELECT * FROM stagiaire WHERE genre='f' ORDER BY id_stagiaire DESC;

--28-- Trier les stagiaires hommes par prénom dans l'ordre alphabétique

SELECT * FROM stagiaire WHERE genre='h' ORDER BY prenom ASC;

--29-- Trier les stagiaires en affichant les femmes en premier et en classant les couleurs des yeux dans l'ordre alphabétique
SELECT * FROM stagiaire WHERE genre='f' ORDER BY yeux ASC;


--30-- Limiter l'affichage d'une requête de sélection de tous les stagiaires aux 3 premires résultats
SELECT * FROM stagiaire LIMIT 3;


--31-- Limiter l'affichage d'une requête de sélection de tous les stagiaires à partir du 3ème résultat et des 5 suivants

SELECT * FROM stagiaire LIMIT 3, 5;

--32-- Afficher les 4 premiers stagiaires qui ont les yeux marron
SELECT * FROM stagiaire WHERE yeux='marron' LIMIT 4;


--33-- Pareil mais en triant les prénoms dans l'ordre alphabétique
SELECT * FROM stagiaire WHERE yeux='marron' LIMIT 4 ASC;
faux

--34-- Compter le nombre de stagiaires

SELECT COUNT(id_stagiaire) FROM stagiaire;

--35-- Compter le nombre de stagiaires hommes mais en changeant le nom de la colonne de résultat par *nb_stagiaires_H*
SELECT COUNT(genre) FROM stagiaire WHERE genre='h';

 SELECT COUNT(id_stagiaire) FROM stagiaire



--36-- Compter le nombre de couleurs d'yeux différentes
SELECT COUNT(id_stagiaire) FROM stagiaire WHERE yeux!='marron';

--37-- Afficher le prénom et les yeux du stagiaire qui a l'id le plus petit
SELECT * FROM stagiaire WHERE id_stagiaire < 2; 


--38-- Afficher le prénom et les yeux du stagiaire qui a l'id le plus grand /!\ c'est une requête imbriquée qu'il faut faire (requête sur le résultat d'une autre requête)
SELECT * FROM stagiaire WHERE id_stagiaire id 
faux


--39-- Afficher les stagiaires qui ont les yeux bleu et vert
SELECT * FROM stagiaire WHERE yeux='bleu';


--40-- A l'inverse maintenant, afficher les stagiaires qui n'ont pas les yeux bleu ni vert
SELECT * FROM stagiaire WHERE NOT yeux='bleu' OR yeux='vert';


--41-- récupérer tous les stagiaires qui ont mangé des bonbons, avec le détail de leurs consommations
SELECT * FROM stagiaire LEFT JOIN manger WHERE date_manger;


--42-- récupérer que les stagiaires qui ont mangé des bonbons, avec le détail de leurs consommations



--43-- prénom du stagiaire, le nom du bonbon, la date de consommation pour tous les stagiaires qui ont mangé au moins une fois



--44-- Afficher les quantités consommées par les stagiaires (uniquement ceux qui ont mangé !)



--45-- Calculer combien de bonbons ont été mangés au total par chaque stagiaire et afficher le nombre de fois où ils ont mangé



--46-- Afficher combien de bonbons ont été consommés au total



--47-- Afficher le total de *Tagada* consommées



--48-- Afficher les prénoms des stagiaires qui n'ont rien mangé



--49-- Afficher les saveurs des bonbons (sans doublons)

SELECT DISTINCT saveur FROM bonbons;

--50-- Afficher le prénom du stagiaire qui a mangé le plus de bonbons

