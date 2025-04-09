-- 1
SELECT * FROM villes_france_free
ORDER BY ville_population_2012 DESC
LIMIT 10;

-- 2
SELECT * FROM villes_france_free
ORDER BY ville_surface ASC
LIMIT 50;

-- 3
SELECT ville_departement FROM villes_france_free
WHERE ville_departement LIKE "97%";

-- 4
SELECT villes_france_free.ville_nom AS "Ville", departement.departement_nom AS "Departement"
FROM villes_france_free 
INNER JOIN departement ON villes_france_free.ville_departement = departement.departement_code
ORDER BY villes_france_free.ville_population_2012 DESC
LIMIT 10;

-- 5
SELECT departement.departement_nom, villes_france_free.ville_departement, count(*) AS "Nombre_de_communes"
FROM villes_france_free
INNER JOIN departement ON departement.departement_code = villes_france_free.ville_departement
GROUP BY villes_france_free.ville_departement
ORDER BY count(*) DESC;

-- 6
SELECT departement.departement_nom, departement.departement_code 
FROM villes_france_free
INNER JOIN departement ON departement.departement_code = villes_france_free.ville_departement
GROUP BY villes_france_free.ville_departement
ORDER BY sum(villes_france_free.ville_surface) DESC
LIMIT 10;

-- 7
SELECT count(*) AS "Nombre de villes commencant par 'Saint'"
FROM villes_france_free
WHERE ville_nom LIKE "Saint%";

-- 8
SELECT ville_nom, count(*)
FROM villes_france_free
GROUP BY ville_nom
HAVING count(*) > 1
ORDER BY count(*) DESC

-- 9
SELECT ville_nom
FROM villes_france_free
WHERE ville_surface > (SELECT avg(ville_surface)
                       FROM villes_france_free);

-- 10
SELECT departement.departement_nom, departement.departement_code, sum(villes_france_free.ville_population_2012) AS "Population"
FROM villes_france_free
INNER JOIN departement ON departement.departement_code = villes_france_free.ville_departement
GROUP BY villes_france_free.ville_departement
HAVING sum(villes_france_free.ville_population_2012) > 2000000;

-- 11
UPDATE villes_france_free
SET ville_nom = REPLACE(ville_nom, "SAINT-", "SAINT ")
WHERE ville_nom LIKE "SAINT-%";
