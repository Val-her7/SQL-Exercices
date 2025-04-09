-- 1
SELECT *
FROM client
WHERE prenom = "Muriel" AND password = "100c4e57374fc998e57164d4c0453bd3a4876a58";

-- 2
SELECT nom
FROM commande_ligne
GROUP BY nom
HAVING count(*) > 1;

-- 3
SELECT nom AS Produit, GROUP_CONCAT(commande_id) AS Commandes
FROM commande_ligne
GROUP BY nom
HAVING count(*) > 1;

-- 4
UPDATE commande_ligne
SET prix_total = prix_unitaire * quantite;

-- 5
SELECT commande.id AS commande_id, client.prenom, client.nom, commande.date_achat, sum(commande_ligne.prix_total) AS total_commande
FROM commande
INNER JOIN client ON commande.client_id = client.id
INNER JOIN commande_ligne ON commande.id = commande_ligne.commande_id
GROUP BY commande_ligne.commande_id;

-- 6
UPDATE commande
INNER JOIN
(SELECT commande.id AS commande_id, sum(commande_ligne.prix_total) AS total_commande
FROM commande
INNER JOIN commande_ligne ON commande.id = commande_ligne.commande_id
GROUP BY commande_ligne.commande_id) AS table_intermédiaire
ON commande.id = table_intermédiaire.commande_id
SET commande.cache_prix_total = table_intermédiaire.total_commande;

-- 7
SELECT
    CONCAT(
    CASE 
    WHEN EXTRACT(MONTH FROM date_achat) = 1 THEN "Janvier" 
    WHEN EXTRACT(MONTH FROM date_achat) = 2 THEN "Février"
    WHEN EXTRACT(MONTH FROM date_achat) = 3 THEN "Mars"
    WHEN EXTRACT(MONTH FROM date_achat) = 4 THEN "Avril"
    WHEN EXTRACT(MONTH FROM date_achat) = 5 THEN "Mai"
    WHEN EXTRACT(MONTH FROM date_achat) = 6 THEN "Juin"
    WHEN EXTRACT(MONTH FROM date_achat) = 7 THEN "Juillet"
    WHEN EXTRACT(MONTH FROM date_achat) = 8 THEN "Août"
    WHEN EXTRACT(MONTH FROM date_achat) = 9 THEN "Septembre"
    WHEN EXTRACT(MONTH FROM date_achat) = 10 THEN "Octobre"
    WHEN EXTRACT(MONTH FROM date_achat) = 11 THEN "Novembre"
    WHEN EXTRACT(MONTH FROM date_achat) = 12 THEN "Décembre" 
    END, " ", EXTRACT(YEAR FROM date_achat)) AS "année_mois",
    sum(cache_prix_total) AS "total_mois"
FROM commande
GROUP BY EXTRACT(YEAR FROM date_achat), EXTRACT(MONTH FROM date_achat);

-- 8
SELECT client.prenom, client.nom, sum(commande.cache_prix_total) AS "montant_de_commande"
FROM commande
INNER JOIN client ON commande.client_id = client.id
GROUP BY commande.client_id
ORDER BY sum(commande.cache_prix_total) DESC
LIMIT 10;


