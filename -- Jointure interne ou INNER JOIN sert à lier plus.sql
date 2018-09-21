-- Jointure interne ou INNER JOIN sert à lier plusieurs tables entres-elles.

-- Cette commande retourne les enregistrements lorsqu'il y a au moins une

-- ligne dans chaque colonne qui corespond à la condition

SELECT * FROM nom_table_1 INNER JOIN nom_table_2 ON condition;

-- Ou

SELECT * FROM nom_table_1 INNER JOIN nom_table_2 WHERE condition;

-- Ou avec trois tables

SELECT * FROM chambre AS a INNER JOIN client AS b ON a.id = b.id INNER JOIN reservation AS c ON b.id = c.id;

/*

 CROSS JOIN sert à croisé chaque ligne d'un tableau A avec les ligne d'un

 tableau B. Retourne le produit(*) de ces 2 tableaux. En généraal

 la commande CROSS JOIN est combinée avec la commande WHERE pour filtrer

 les résultats qui respectent certaine conditions.

*/

SELECT * FROM nom_table_1 CROSS JOIN nom_table_2;

-- Alternative à la commande CROSS JOIN

SELECT * FROM nom_table_1, nom_table_2;



/*

LEFT JOIN permet de lister tous les enregistrements de la table gauche

même si il y pas de correspondance dans la table 2ème table.

*/

SELECT * FROM nom_table_1 LEFT JOIN nom_table_2 ON condition;

-- Ou

SELECT * FROM nom_table_2 LEFT OUTER JOIN nom_table_1 ON condition;



/*

RIGHT JOIN permet de lister tous les enregistrements de la table gauche

même si il y pas de correspondance dans la table 2ème table.

*/

SELECT * FROM nom_table_1 RIGHT JOIN nom_table_2 ON condition;

-- Ou

SELECT * FROM nom_table_2 RIGHT OUTER JOIN nom_table_1 ON condition;



-- Correction

SELECT * FROM employees WHERE birth_date <= '2000-01-01';

SELECT dept_name FROM department;

SELECT first_name, last_name FROM employees INNER JOIN salaries ON employees.emp_no = salaries.emp_no AND (salaries.salary BETWEEN 40000 AND 50000);

SELECT last_name FROM employees LIKE 'a%';

SELECT * FROM employees;

SELECT last_name, first_name, hire_date FROM employees WHERE hire_date <= '1980-01-01';

SELECT last_name, first_name FROM employees WHERE hire_date = '1980-01-01' AND gender = 'F';

DELETE FROM salaries WHERE to_date = '9999-01-01';



-- Créé une base de donnée nommée entreprise

-- Importer les 2 tables du dossier zip employees



-- Afficher tous les salariés né avant 2000

-- Afficher tous les départements

-- Afficher tous les salariés avec salaire entre 40000-55000

-- Afficher tous les salariés avec commençant par lettre "a"

-- Afficher toutes les salariées

-- Afficher tous les salariés embaucher dans l'entreprise avant le 01 janvier 1980

-- Afficher toutes les salariées entrer dans l'entreprise avant le 01 janvier 1980

-- Supprimer tous les salariés en CDI

-- Afficher salariés pour chaque département(pas de doublon)

-- Afficher manager pour chaque département(pas de doublon)

-- Afficher les titres(pas de doublon)

