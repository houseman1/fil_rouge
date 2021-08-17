--2.2.4 - Pour la sécurité, vous devez prévoir plusieurs profils de connexion et décliner les autorisations nécessaires.
--Profil visiteur : lecture sur le catalogue
--Profil client : lecture sur toute la base (insertion et mise à jour dans commande et client)
--Profil gestion : lecture/écriture dans la base
--Profil administrateur (ou développeur) : comme gestion + création et suppression d'objet

USE village_green;

--Créer les rôles
CREATE ROLE IF NOT EXISTS
    'r_village_green_visiteur'@'%',
    'r_village_green_client'@'%',
    'r_village_green_gestion'@'%',
    'r_village_green_admin'@'%';

--Accorder (GRANT) des privilèges au rôle
GRANT SELECT
ON village_green.catalogue
TO 'r_village_green_visiteur'@'%';

GRANT SELECT
ON village_green.*
TO 'r_village_green_client'@'%';

GRANT INSERT, UPDATE
ON village_green.commandes, village_green.clients
TO 'r_village_green_client'@'%';

GRANT SELECT, INSERT
ON village_green.*
TO 'r_village_green_gestion'@'%';

GRANT ALL PRIVILEGES
ON village_green.*
TO 'r_village_green_admin'@'%';

--Créer les utilisateurs avec des mots de passe
CREATE USER 'visiteur'@'%' IDENTIFIED BY 'visiteur';
CREATE USER 'client'@'%' IDENTIFIED BY 'client';
CREATE USER 'gestion'@'%' IDENTIFIED BY 'gestion';
CREATE USER 'admin'@'%' IDENTIFIED BY 'admin';

--Attribuer (GRANT) les rôle à les utilisateurs
GRANT 'r_village_green_visiteur'@'%'
TO 'visiteur'@'%';

GRANT 'r_village_green_client'@'%'
TO 'client'@'%';

GRANT 'r_village_green_gestion'@'%'
TO 'gestion'@'%';

GRANT 'r_village_green_admin'@'%'
TO 'admin'@'%';