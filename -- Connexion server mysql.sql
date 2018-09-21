-- Connexion server mysql 

mysql -u root -p

-- Affichages de toutes les bdd

SHOW DATABASES;

-- Création d'une bdd

CREATE DATABASE NOM_DE_LA_BDD;

-- Séléction d'une bdd

USE NOM_DE_LA_BDD;

-- Création d'une table dans une bdd

-- Type de donnée(INT, VARCHAR, TEXT, DECIMAL, etc)

CREATE TABLE nom_de_la_bdd (

	nom_colonne1 type_de_donnée,

	nom_colonne2 type_de_donnée,

	nom_colonne3 type_de_donnée,

	nom_colonne4 type_de_donnée

);

-- Insertion dans la table(Méthode 1)

INSERT INTO nom_de_la_table VALUES (

	'valeur',

	'valeur',

	'...'

);

-- Insertion dans la table(Méthode 2) 

INSERT INTO nom_de_la_table (

	colonne

	colonne) VALUES (

	'valeur',

	'valeur2'

);



-- Afficher toutes les tables

SHOW TABLES;

-- Séléctionné toutes les données d'une table

SELECT * FROM nom_de_la_table;

-- Séléctionné les données d'une ou pllusieurs colonnes spécifique d'une table

SELECT nom_colonne, nom_colonne2 FROM nom_de_la_table;

-- Supprimer une ligne de la table avec unne condition WHERE

DELETE FROM nom_de_la_table WHERE condition;

TRUNCATE nom_de_la_table WHERE condition;

-- Mettre à jour une colonne d'une table

UPDATE nom_de_la_table SET nom_colonne = 'valeur'WHERE condition;

UPDATE salarie SET date_naissance= '1988-04-09' WHERE id=125;

-- Mettre à jour plusieurs colonnes d'une table

UPDATE salarie SET nom= 'diarra', prenom= 'samba' WHERE id=126;

ALTER TABLE nom_de_la_table ADD nom_colonne type_de_donnée;

ALTER TABLE salarie ADD telephone VARCHAR(10);

-- Modification d'une table existante

ALTER TABLE nom_de_la_table MODIFY nom_colonne type_de_donnée attributs;

ALTER TABLE salarie MODIFY telephone INT(10);

-- Afficher les avertissements

SHOW WARNINGS;

-- Opérateur de comparaison



= Égale

<> Pas égale

!= Pas égale

> Supérieur à

< Inférieur à

>= Supérieur ou égale à

<= Inférieur ou égale à

IN Liste de plusieurs valeurs possibles

BETWEEN Valeur comprise dans un intervalle donnée (utile pour les nombres ou dates)

LIKE Recherche en spécifiant le début, milieu ou fin d'un mot.

IS NULL Valeur est nulle

IS NOT NULL Valeur n'est pas nulle

-- Séléctionne les données entre(BETWEEN) un intervalle(fonctionne dans une requête utilisant WHERE)

SELECT * FROM salarie WHERE date_naissance BETWEEN '1901-01-01' AND '1980-12-31';

SELECT * FROM salarie WHERE date_naissance NOT BETWEEN '1901-01-01' AND '1980-12-31';

SELECT * FROM salarie WHERE date_naissance= '0000-00-00' OR '1234-12-25';

-- Pour éviter des redondances dans les résultats

SELECT DISTINCT nom_colonne FROM nom_de_la_table;

SELECT DISTINCT adresse FROM salarie;

-- Pour grouper plusieurs résultats | La fonction SUM() permet d’additionner la valeur de chaque salaire pour une même adresse

SELECT adresse, SUM(salaire) FROM salarie GROUP BY adresse;

-- Trier les lignes dans un résultat d’une requête SQL

SELECT nom, prenom FROM salarie ORDER BY date_naissance DESC;





-- Vérifier si une colonne est égale à une des valeurs comprise dans le set de valeurs déterminés.

SELECT nom_colonne FROM table WHERE nom_colonne IN ( valeur1, valeur2);

SELECT * FROM salarie WHERE prenom IN ('s', 'maude');



SELECT * FROM table LIMIT la_limite;

SELECT* FROM salarie LIMIT 2;



SELECT * FROM table LIMIT offset, la_limite;

SELECT * FROM salarie LIMIT 1, 2;

-- Toutes les entrées qui finnisent par un "a"

SELECT * FROM salarie WHERE nom LIKE '%a';

-- Toutes les entrées qui commence par un "a"

SELECT * FROM salarie WHERE nom LIKE 'a%';

--=  Toutes les entrées qui continnent "a"

SELECT * FROM salarie WHERE nom LIKE '%a%';

-- toutes les entreés qui commence par "po", contiennent "a" et finissent par "nt"

SELECT * FROM salarie WHERE nom LIKE 'po%a%nt';



SELECT * FROM salarie WHERE nom LIKE 'a_c';





--

-- Exprimer les requêtes suivantes en SQL :

-- Les numéros de chambres avec TV.

SELECT num_chambre FROM chambre WHERE equipement LIKE '%TV%';



-- Les numéros de chambres et leurs capacités.

SELECT num_chambre, nb_pers FROM chambre;



-- La capacité théorique d'accueil de l'hôtel.

SELECT SUM(nb_pers) FROM chambre;



-- Le prix par personne des chambres avec TV.

SELECT AVG(prix/nb_pers) FROM chambre WHERE equipement LIKE '%tv%';

SELECT prix/nb_pers FROM chambre WHERE equipement LIKE '%tv%';



-- Les numéros des chambres et le numéro des clients ayant réservé des chambres pour le 09/02/2004.

SELECT num_chambre, num_client FROM reservation WHERE date_arrive = 'yyyy-mm-dd hh:mm:ss';



-- Les numéros des chambres coûtant au minimum 80 Euro ayant un bain et volant au maximum 120 Euro.

SELECT num_chambre FROM chambre WHERE confort LIKE '%bain%' AND prix >= 80 AND prix <= 120;

SELECT num_chambre FROM chambre WHERE confort LIKE '%bain%' AND prix BETWEEN 80 AND 120;



-- Les numéros des chambres coûtant au maximum 80 Euro ou ayant un bain et volant au maximum 120 Euro(facultatif).

SELECT num_chambre FROM chambre WHERE prix <= 80 OR confort LIKE '%bain%' AND prix <= 120;

-- Les Nom, Prénoms et adresses des clients dans le noms commencent par "D".

SELECT nom, prenom, adresse FROM client WHERE nom LIKE 'd%';

-- Le nombre de chambres dont le prix est entre 85 et 120 Euro.

SELECT COUNT(num_chambre) FROM chambre WHERE prix BETWEEN 85 AND 120; 

-- Les noms des clients n'ayant pas fixé la date de départ.

SELECT nom FROM client AS c, reservation AS r WHERE date_depart IS NULL AND c.num_client = r.num_client;

-- Jointure entre les tables client et réservation avec AS(alias) et INNER JOIN

SELECT nom FROM client AS c INNER JOIN reservation AS r WHERE date_depart = '0000-00-00' AND c.num_client = r.num_client;

-- Jointure entre les tables client et réservation avec INNER JOIN

SELECT * FROM client INNER JOIN reservation ON client.num_client = reservation.num_client;


------------------------------------------------------------------------------
--Afficher tous les salariés né avant 2000
SELECT last_name, first_name FROM employees WHERE birth_date < '2000-01-01'

--Afficher tous les départements
 SELECT * FROM departments;

--Afficher tous les salariés avec salaire entre 40000-55000
SELECT last_name, first_name FROM employees INNER JOIN salaries ON employees.emp_no = salaries.emp_no WHERE salary 40000 AND 55000;

--Afficher tous les employees avecun last_name commençant par lettre "a"
 SELECT * FROM employees WHERE last_name LIKE 'a%';

Afficher toutes les salariées
SELECT * FROM employees;
SELECT first_name, last_name, gender FROM employees WHERE gender LIKE 'F';


-- Afficher tous les salariés embaucher dans l'entreprise avant le 01 janvier 1980;
SELECT last_name, first_name FROM employees WHERE hire_date < '1980-01-01';

-- Afficher toute les salariés embaucher dans l'entreprise avant le 01 janvier 1980;
SELECT first_name, last_name, gender FROM employees WHERE gender = 'F' 
AND hire_date <= '1980-01-01';

--Supprimer tous les salariés en CDI
DELETE FROM employees AS e INNER JOIN dept_emp AS d ON e.emp_no = d.emp_no INNER JOIN salaries
 AS s ON d.emp_no = s.emp_no INNER JOIN titles AS t ON s.emp = t.emp_no INNER JOIN 
 dept_manager AS dm ON t.emp_no = dm.emp_no WHERE t.to_date ='9999-01-01';

--Afficher salariés pour chaque département(pas de doublon)
SELECT DISTINCT first_name, last_name, dept_name 
FROM employees AS e, departments AS d, dept_emp AS p 
WHERE e.emp_no = p.emp_no AND d.dept_no = p.dept_no;

--Afficher manager pour chaque département(pas de doublon)
SELECT DISTINCT first_name, last_name, dept_name 
FROM employees AS e, departments AS d, dept_manager AS m 
WHERE e.emp_no = m.emp_no AND d.dept_no = m.dept_no;

--Afficher les titres(pas de doublon)
SELECT DISTINCT title FROM titles;