--2.2.4 - Pour la sécurité, vous devez prévoir plusieurs profils de connexion et décliner les autorisations nécessaires.
--Profil visiteur : lecture sur le catalogue
--Profil client : lecture sur toute la base (insertion et mise à jour dans commande et client)
--Profil gestion : lecture/écriture dans la base
--Profil administrateur (ou développeur) : comme gestion + création et suppression d'objet

USE filrouge14;

--Créer les rôles
CREATE ROLE IF NOT EXISTS
    'r_filrouge_visiteur'@'%',
    'r_filrouge_client'@'%',
    'r_filrouge_gestion'@'%',
    'r_filrouge_admin'@'%';

--Accorder (GRANT) des privilèges au rôle
GRANT SELECT
ON filrouge14.produits
TO 'r_filrouge_visiteur'@'%';

GRANT SELECT
ON filrouge14.*
TO 'r_filrouge_client'@'%';

GRANT INSERT, UPDATE
ON filrouge14.commandes
TO 'r_filrouge_client'@'%';

GRANT INSERT, UPDATE
ON filrouge14.clients
TO 'r_filrouge_client'@'%';

GRANT SELECT, INSERT
ON filrouge14.*
TO 'r_filrouge_gestion'@'%';

GRANT ALL PRIVILEGES
ON filrouge14.*
TO 'r_filrouge_admin'@'%';

--Créer les utilisateurs avec des mots de passe
CREATE USER 'visiteur'@'%' IDENTIFIED BY 'visiteur';
CREATE USER 'client'@'%' IDENTIFIED BY 'client';
CREATE USER 'gestion'@'%' IDENTIFIED BY 'gestion';
CREATE USER 'admin'@'%' IDENTIFIED BY 'admin';

--Attribuer (GRANT) les rôle à les utilisateurs
GRANT 'r_filrouge_visiteur'@'%'
TO 'visiteur'@'%';

GRANT 'r_filrouge_client'@'%'
TO 'client'@'%';

GRANT 'r_filrouge_gestion'@'%'
TO 'gestion'@'%';

GRANT 'r_filrouge_admin'@'%'
TO 'admin'@'%';


--Définir des rôles par défaut pour les rendre actifs lorsque l'utilisateur se connecte au serveur
SET DEFAULT ROLE 'r_filrouge_visiteur'@'%'
TO 'visiteur'@'%';

SET DEFAULT ROLE 'r_filrouge_client'@'%'
TO 'client'@'%';

SET DEFAULT ROLE 'r_filrouge_gestion'@'%'
TO 'gestion'@'%';

SET DEFAULT ROLE 'r_filrouge_admin'@'%'
TO 'admin'@'%';

