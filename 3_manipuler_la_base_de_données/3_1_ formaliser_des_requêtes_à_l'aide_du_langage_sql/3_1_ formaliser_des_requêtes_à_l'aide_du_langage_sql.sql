--3.1.1 Pour chacune des interrogations demandées (voir cahier des charges), créez un script contenant la ou les requêtes necessaires.

-- Les commandes et les documents associés sont conservé pendant trois ans
-- Pour voir les commandes de plus de trois ans :
SELECT * FROM commandes
WHERE DATEDIFF(NOW(),com_com_date)/365 > 3;
-- Pour supprimer les commandes de plus de trois ans :
DELETE FROM commandes
WHERE DATEDIFF(NOW(),com_com_date)/365 > 3;


-- Le prix de vente est calculé à partir du prix d'achat auquel on applique un coefficient en fonction de la catégorie
-- du client (particulier ou professionnel).
SELECT pro_pri_achat,(pro_pri_achat*(SELECT cli.cli_coefficient
                                     WHERE cli.cli_coefficient = 1.2)) AS 'prix_de vent professionnels',
                     (pro_pri_achat*(SELECT cli.cli_coefficient
                                     WHERE cli.cli_coefficient = 1.6)) AS 'prix_de vent particuliers'
FROM produits p
JOIN ligne_de_commande ldc ON p.Id_produits = ldc.Id_produits
JOIN commandes com ON ldc.Id_commandes_li = com.Id_commandes
JOIN clients cli ON com.Id_clients = cli.Id_clients


--3.1.3 - chiffre d'affaires hors taxes généré pour l'ensemble :
SELECT SUM(com_prix_total-(com_prix_total*com_discount/100)) as chiffre_aff FROM commandes
-- et par fournisseur :
-- RIGHT JOIN pour afficher les enregistrements nuls
SELECT f.Id_fournisseurs, SUM(com_prix_total-(com_prix_total*com_discount/100)) as chiffre_aff FROM commandes c
JOIN ligne_de_commande ldc ON c.Id_commandes = ldc.Id_commandes_li
JOIN produits p ON ldc.Id_produits = p.Id_produits
RIGHT JOIN fournisseurs f ON p.Id_fournisseurs_pro = f.Id_fournisseurs
GROUP BY f.Id_fournisseurs;

--3.1.4 - liste des produits commandés pour une année sélectionnée (référence et nom du produit, quantité commandée, fournisseur)
SELECT pro_fou_ref as 'Référence du fournisseur',
       id_fournisseurs_pro as 'ID du fournisseur',
       pro_lib_court as 'Description court',
       lico_qty as 'Quantité commandée'
FROM produits p
JOIN ligne_de_commande ldc ON ldc.Id_produits = p.Id_produits
JOIN commandes c ON ldc.Id_commandes_li= c.Id_commandes
WHERE YEAR(com_com_date) = 2018

--3.1.5 - liste des commandes pour un client (date de commande, référence client, montant, état de la commande)
-- RIGHT JOIN pour afficher les enregistrements nuls si le client n'a pas commandé
SELECT com_com_date as 'Date de commande',
       cli_ref as 'Référence client',
       com_prix_total as 'Montant',
       com_status as 'Etat de la commande'
FROM commandes com
RIGHT JOIN clients cli ON cli.Id_clients = com.Id_clients
WHERE cli.Id_clients = 4;

--3.1.6 - répartition du chiffre d'affaires hors taxes par type de client
-- Clients particuliers
SELECT SUM(com_prix_total-(com_prix_total*com_discount/100)) as 'CA clients particuliers'
FROM commandes com
RIGHT JOIN clients cli ON cli.Id_clients = com.Id_clients
WHERE cli_type = 0;

--Clients professionels
SELECT SUM(com_prix_total-(com_prix_total*cli_coefficient)-(com_prix_total*com_discount/100)) as 'CA clients professionels'
FROM commandes com
RIGHT JOIN clients cli ON cli.Id_clients = com.Id_clients
WHERE cli_type = 1;


--3.1.7 - lister les commandes en cours de livraison
SELECT * FROM commandes
WHERE com_status LIKE "LP";

















--3.1.5 - liste des commandes pour un client (date de commande, référence client, montant, état de la commande)