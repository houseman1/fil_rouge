-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 17 sep. 2021 à 07:59
-- Version du serveur :  5.7.31-log
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `filrouge14`
--

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `Id_categories` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Clé de la table categories',
  `cat_nom` varchar(50) DEFAULT NULL COMMENT 'Nom de catégorie',
  `cat_desc` varchar(255) DEFAULT NULL COMMENT 'Description de la catégorie',
  `Id_categories_1` int(11) DEFAULT NULL COMMENT 'Nom de la catégorie parente',
  PRIMARY KEY (`Id_categories`),
  KEY `fk_categories_cat_parent` (`Id_categories_1`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`Id_categories`, `cat_nom`, `cat_desc`, `Id_categories_1`) VALUES
(1, 'batterie', 'ça tape et ça cogne', NULL),
(2, 'cables', 'de la connection', NULL),
(3, 'cases', 'des rangements et des rangements', NULL),
(4, 'guitares', 'ça gratte', NULL),
(5, 'micro', 'pour ceux qui chantes ou pas...', NULL),
(6, 'piano', 'pia pia piano', NULL),
(7, 'saxo', 'ça va souffler', NULL),
(8, 'sono', 'cest qui le DJ', NULL),
(9, 'jack', 'longueurs > à un mètre', 2),
(10, 'cable micro', 'connectic multi pin pour micros', 2),
(11, 'midi', 'micros et sonos', 8),
(12, 'mixte', 'adaptateur et double connectics', 2),
(13, 'housse', 'housses souples', 3),
(14, 'rigide', 'plastic ou bois delux', 3),
(15, 'basse electrique', 'du lourd', 4),
(16, 'basse acoustique', 'pour les unpluged', 4),
(17, 'étuis rigides', 'étuis en bois ou plastiqu pour sonos', 3),
(18, 'guitare électrique', 'les guitares électrique de toutes marques', 4),
(19, 'guitare acoustique', 'les guitares acoustiques de toutes marques', 4),
(20, 'guitare classique', 'les guitares classiques de toutes marques', 4),
(21, 'ampli guitare', 'sonorisation quitare', 8),
(22, 'ampli basse', 'sonorisation basse', 8),
(23, 'micro', 'prise de son', 5),
(24, 'mixage', 'table de mixage', 5),
(25, 'standard', 'le grand classique', 1),
(26, 'rock', 'indémodable', 1),
(27, 'fusion', 'ça déchire', 1),
(28, 'jazz', 'le virtuose', 1),
(29, 'junior', 'le pitchoune', 1),
(30, 'débutant', 'il faut bien commencer', 1),
(31, 'compacte', 'y à plus de place', 1),
(32, 'jack court', 'longueurs < à un mètre', 2),
(33, 'Accordéons', 'accorder et jouer', 6),
(34, 'grosses caisse', 'batteries classique', 1);

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

DROP TABLE IF EXISTS `clients`;
CREATE TABLE IF NOT EXISTS `clients` (
  `Id_clients` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Clé de la table clients',
  `cli_nom` varchar(50) DEFAULT NULL COMMENT 'Nom du client',
  `cli_prenom` varchar(50) DEFAULT NULL COMMENT 'Préom du client',
  `cli_adresse` varchar(50) DEFAULT NULL COMMENT 'Adresse du client',
  `cli_cp` varchar(10) DEFAULT NULL COMMENT 'Code postal du client',
  `cli_ville` varchar(50) DEFAULT NULL COMMENT 'Ville du client',
  `cli_mail` varchar(50) DEFAULT NULL COMMENT 'Adresse e-mail du client',
  `cli_phone` int(15) DEFAULT NULL COMMENT 'Le numéro de téléphone du client',
  `cli_mot_pass` varchar(255) DEFAULT NULL COMMENT 'Le mot de passe du client',
  `cli_ins_date` datetime DEFAULT NULL,
  `cli_type` tinyint(1) NOT NULL COMMENT 'le type du client (particulier(1) ou professionel(0))',
  `cli_ref` varchar(50) NOT NULL COMMENT 'Le référence du client',
  `cli_coefficient` decimal(5,3) DEFAULT NULL COMMENT 'Le coefficient du client',
  `Id_employees` int(10) UNSIGNED NOT NULL COMMENT 'Numéro d''identification employé',
  `role` tinyint(1) NOT NULL,
  PRIMARY KEY (`Id_clients`),
  KEY `Id_employees` (`Id_employees`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `clients`
--

INSERT INTO `clients` (`Id_clients`, `cli_nom`, `cli_prenom`, `cli_adresse`, `cli_cp`, `cli_ville`, `cli_mail`, `cli_phone`, `cli_mot_pass`, `cli_ins_date`, `cli_type`, `cli_ref`, `cli_coefficient`, `Id_employees`, `role`) VALUES
(1, 'George', 'Nolan', 'CP 214, 1460 Dui Avenue', '81313', 'Moerkerke', 'et.ultrices.posuere@pharetranibh.ca', 129812927, '$2y$10$BBFFx.lzX3Ch6IUnVt5he.xwKhZ2k0c5FJVpbn00ylZ...', '2021-02-14 00:00:00', 0, 'AB1402', NULL, 11, 0),
(2, 'Sandoval', 'Linda', 'Appartement 443-4185 Lacinia. Route', '12512', 'Torgnon', 'Proin.dolor@sodales.net', 345298967, '$2y$10$BBFFx.lzX3Ch6IUnVt5he.xwKhZ2k0c5FJVpbn00ylZ...', '2000-03-18 00:00:00', 0, 'AC1803', NULL, 1, 0),
(3, 'Johns', 'Judah', '478-741 Urna. Av.', '68356', 'Baarle-Hertog', 'nibh.Phasellus.nulla@veliteu.co.uk', 147649162, '$2y$10$BBFFx.lzX3Ch6IUnVt5he.xwKhZ2k0c5FJVpbn00ylZ...', '2020-10-30 00:00:00', 1, 'PRO3010', '0.200', 4, 0);

-- --------------------------------------------------------

--
-- Structure de la table `commandes`
--

DROP TABLE IF EXISTS `commandes`;
CREATE TABLE IF NOT EXISTS `commandes` (
  `Id_commandes` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Clé de la table commandes',
  `com_com_date` datetime DEFAULT NULL COMMENT 'La date de commande',
  `com_pay_date` datetime DEFAULT NULL COMMENT 'La date de paiement',
  `com_exp_date` datetime DEFAULT NULL COMMENT 'La date d''expédition',
  `com_status` char(2) DEFAULT NULL COMMENT 'Le statut de la commande : livrée totalement(LT), livrée partiellement(LP, annulée(AN), en cours(EC))',
  `com_type_paiement` tinyint(1) NOT NULL COMMENT 'Le type de paiement (à la commande(1) ou en différé(0))',
  `com_prix_total` decimal(15,2) DEFAULT NULL COMMENT 'Le prix total de la commande',
  `com_discount` int(11) DEFAULT NULL COMMENT 'La remise de la commande',
  `com_facture_date` date DEFAULT NULL COMMENT 'La date de la facture',
  `com_facture_adresse` varchar(255) NOT NULL COMMENT 'L''adresse de facturation',
  `Id_clients` int(10) UNSIGNED NOT NULL COMMENT 'Numéro d''identification client',
  PRIMARY KEY (`Id_commandes`),
  KEY `Id_clients` (`Id_clients`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `commandes`
--

INSERT INTO `commandes` (`Id_commandes`, `com_com_date`, `com_pay_date`, `com_exp_date`, `com_status`, `com_type_paiement`, `com_prix_total`, `com_discount`, `com_facture_date`, `com_facture_adresse`, `Id_clients`) VALUES
(1, '2018-01-15 00:00:00', '2019-01-15 00:00:00', '2019-01-15 00:00:00', 'LT', 0, '4270.00', 10, '2019-01-15', '10 rue des corbak AMIENS 80000', 3),
(2, '2018-03-18 00:00:00', '2019-01-15 00:00:00', '2019-01-15 00:00:00', 'LP', 1, '6400.00', 15, '2019-01-15', '7882 Luctus Rue Lonquimay 45354', 3),
(3, '2018-05-21 00:00:00', NULL, '2018-10-15 00:00:00', 'LT', 1, '2200.00', 0, '2018-10-20', 'CP 394, 7305 Risus. Route Lunel 68624', 1),
(4, '2018-07-24 00:00:00', '2018-11-15 00:00:00', '2018-10-15 00:00:00', 'LP', 1, '800.00', 5, '2018-10-17', '226-6532 Convallis Avenue Bhilai 62534', 2),
(5, '2021-06-03 00:00:00', '2021-07-10 00:00:00', '2021-06-23 00:00:00', 'LP', 1, '1450.00', 7, NULL, '3831 Eu Route Portland 29059', 2),
(6, '2018-11-30 00:00:00', '2018-12-15 00:00:00', '2018-12-15 00:00:00', 'LT', 1, '330.00', 10, '2018-12-20', '9969 Aliquet Route Coevorden 40616', 1),
(7, '2018-12-22 00:00:00', '2019-01-15 00:00:00', '2019-01-15 00:00:00', 'LT', 0, '420.00', 20, '2019-01-17', 'Appartement 691-6161 Non Rue Jacksonville 94276', 3);

-- --------------------------------------------------------

--
-- Structure de la table `employees`
--

DROP TABLE IF EXISTS `employees`;
CREATE TABLE IF NOT EXISTS `employees` (
  `Id_employees` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Clé de la table employees',
  `emp_nom` varchar(50) DEFAULT NULL COMMENT 'Nom de l''employé',
  `emp_prenom` varchar(50) DEFAULT NULL COMMENT 'Prénom de l''employe',
  `emp_adresse` varchar(255) DEFAULT NULL COMMENT 'Adresse de l''employé',
  `emp_cp` varchar(10) DEFAULT NULL COMMENT 'Code postal de l''employé',
  `emp_ville` varchar(50) DEFAULT NULL COMMENT 'la ville où l''employé habite',
  `emp_mail` varchar(50) DEFAULT NULL COMMENT 'Adresse e-mail de l''employé',
  `emp_phone` int(11) DEFAULT NULL COMMENT 'Le numéro de téléphone de l''employé',
  `emp_mot_pass` varchar(255) DEFAULT NULL COMMENT 'Le mot de passe de l''employé',
  `emp_dat_embauche` date NOT NULL,
  `Id_poste` int(10) UNSIGNED NOT NULL COMMENT 'ID de poste',
  PRIMARY KEY (`Id_employees`),
  KEY `Id_poste` (`Id_poste`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `employees`
--

INSERT INTO `employees` (`Id_employees`, `emp_nom`, `emp_prenom`, `emp_adresse`, `emp_cp`, `emp_ville`, `emp_mail`, `emp_phone`, `emp_mot_pass`, `emp_dat_embauche`, `Id_poste`) VALUES
(1, 'MOLETTE', 'Denis', '27 avenue Paul Lepoulpe', '80000', 'Amiens', 'dmolette@blabla.fr', 102030405, '$2y$10$BBFFx.lzX3Ch6IUnVt5he.xwKhZ2k0c5FJVpbn00ylZ...', '2010-05-05', 4),
(2, 'NAGER', 'Emma', '14 rue Tabaga', '80300', 'Albert', 'emmanager@laposte.net', 102030405, '$2y$10$BBFFx.lzX3Ch6IUnVt5he.xwKhZ2k0c5FJVpbn00ylZ...', '2000-05-15', 7),
(3, 'LEBOSSE', 'Hugo', '28 mail Ludovic Cruchot', '75001', 'Paris', 'leboss@jarditou.com', 102030405, '$2y$10$BBFFx.lzX3Ch6IUnVt5he.xwKhZ2k0c5FJVpbn00ylZ...', '2020-04-18', 8),
(4, 'LAPAGE', 'Edith', '22 rue Stevy Boulay', '60300', 'Senlis', 'lapage60300@yahoo.fr', 102030405, '$2y$10$BBFFx.lzX3Ch6IUnVt5he.xwKhZ2k0c5FJVpbn00ylZ...', '2011-12-11', 3),
(5, 'DRESSAMERE', 'Yvan', '224 avenue Caumartin', '75009', 'Paris', 'yvan75009@outlook.com', 102030405, '$2y$10$BBFFx.lzX3Ch6IUnVt5he.xwKhZ2k0c5FJVpbn00ylZ...', '2017-01-23', 25),
(6, 'MERCE', 'Coco', '56 cours Loana', '02000', 'Laon', 'merce@wazaa.net', 102030405, '$2y$10$BBFFx.lzX3Ch6IUnVt5he.xwKhZ2k0c5FJVpbn00ylZ...', '2020-05-05', 36),
(7, 'AMAR', 'Yann', '4 rue du papillon de lumière', '62000', 'Arras', 'amar@azerty.com', 102030405, '$2y$10$BBFFx.lzX3Ch6IUnVt5he.xwKhZ2k0c5FJVpbn00ylZ...', '2005-07-28', 7),
(8, 'ASAP', 'Liliane', 'Appartement 202-3846 Suspendisse Chemin', 'FA46 ', 'Pekanbaru', 'convallis@Integer.com', 102030405, '$2y$10$BBFFx.lzX3Ch6IUnVt5he.xwKhZ2k0c5FJVpbn00ylZ...', '2020-02-29', 11),
(9, 'LAVISSE', 'Edouard', '131-3667 Arcu. Rd.', '80136', 'Rivery', 'nulla.magna@Proinvel.co.uk', 102030405, '$2y$10$BBFFx.lzX3Ch6IUnVt5he.xwKhZ2k0c5FJVpbn00ylZ...', '2007-12-17', 3),
(10, 'HILLARY', 'Dorian', '6824 Placerat. Route', '12787', 'Parramatta', 'mus@Morbi.co.uk', 102030405, '$2y$10$BBFFx.lzX3Ch6IUnVt5he.xwKhZ2k0c5FJVpbn00ylZ...', '2021-01-30', 4),
(11, 'POUTIN', 'Vladimir', '251-633 Convallis Impasse', '8373 ', 'Colchester', 'facilisis.vitae.orci@indolor.net', 102030405, '$2y$10$BBFFx.lzX3Ch6IUnVt5he.xwKhZ2k0c5FJVpbn00ylZ...', '2020-05-05', 3),
(12, 'DECLAN', 'Richard', 'Appartement 870-7677 Magna Av.', '42980', 'Dornbirn', 'Mauris@amet.ca', 102030405, '$2y$10$BBFFx.lzX3Ch6IUnVt5he.xwKhZ2k0c5FJVpbn00ylZ...', '2020-05-05', 12),
(13, 'ABRAHAM', 'François', '612-4178 Urna Chemin', '87784', 'Llanidloes', 'sodales@malesuadaInteger.com', 102030405, '$2y$10$BBFFx.lzX3Ch6IUnVt5he.xwKhZ2k0c5FJVpbn00ylZ...', '2020-05-05', 20),
(14, 'COOPER', 'Dale', '6954 Mauris Av.', '17543', 'Kalyan', 'Nunc.ullamcorper.velit@penatibuset.org', 102030405, '$2y$10$BBFFx.lzX3Ch6IUnVt5he.xwKhZ2k0c5FJVpbn00ylZ...', '2020-05-05', 7);

-- --------------------------------------------------------

--
-- Structure de la table `fournisseurs`
--

DROP TABLE IF EXISTS `fournisseurs`;
CREATE TABLE IF NOT EXISTS `fournisseurs` (
  `Id_fournisseurs` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clé de la table fournisseurs',
  `fou_nom` varchar(50) DEFAULT NULL COMMENT 'Nom du fournisseur',
  `fou_ville` varchar(50) DEFAULT NULL COMMENT 'Ville du fournisseur',
  `fou_pays` varchar(50) DEFAULT NULL COMMENT 'Pays du fournisseur',
  `fou_adresse` varchar(255) DEFAULT NULL COMMENT 'Adresse du fournisseur',
  `fou_cp` varchar(10) DEFAULT NULL COMMENT 'Code postal du fournisseur',
  `fou_mail` varchar(50) DEFAULT NULL COMMENT 'Adresse e-mail du fournisseur',
  `fou_nom_contact` varchar(50) DEFAULT NULL COMMENT 'Le nom de contact chez le fournisseur',
  `fou_contact_phone` varchar(20) DEFAULT NULL COMMENT 'Le numéro de téléphone du contact chez le fournisseur',
  `fou_type` tinyint(1) DEFAULT NULL COMMENT 'Le type de fournisseur (constructeurs(1) ou importateurs(0))',
  PRIMARY KEY (`Id_fournisseurs`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `fournisseurs`
--

INSERT INTO `fournisseurs` (`Id_fournisseurs`, `fou_nom`, `fou_ville`, `fou_pays`, `fou_adresse`, `fou_cp`, `fou_mail`, `fou_nom_contact`, `fou_contact_phone`, `fou_type`) VALUES
(1, 'Amet Orci PC', 'Cinisi', 'FRANCE', 'Appartement 402-3526 Massa Rue', '88835', 'amet.fou@gmail.com', 'ALOU Amira', '09 65 12 45 03', 0),
(2, 'Integer Vulputate Risus Consulting', 'Mazenzele', 'France', '4509 Libero Chemin', '91003', 'Vuluputate@gmail.com', 'Harper Edan', '07 12 88 74 07', 0),
(3, 'Maecenas Malesuada Inc.', 'Washington', 'FRANCE', 'Appartement 975-1252 Odio. Impasse', '55361', 'Maecenas@hotmail.com', 'Dale Lucius', '07 09 79 41 97', 1),
(4, 'Dictum Mi Ac Inc.', 'Vandoeuvre-lès-Nancy', 'FRANCE', 'Appartement 245-2355 Auctor, Route', '21846', 'Dictum@gmail.com', 'Holden Dorian', '09 04 52 00 84', 0),
(5, 'Eleifend Vitae Industries', 'San Nicolás', 'FRANCE', 'Appartement 536-5751 Neque Rue', '12959', 'Eleifend@gmail.fr', 'Herman Aurora', '08 04 60 78 18', 1),
(6, 'Nunc Quis Arcu Corporation', 'Werder', 'FRANCE', '491-9263 Aenean Avenue', '56602', 'NUNC@gmail.com', 'Cruz Alvin', '08 30 54 07 77', 0),
(7, 'A Sollicitudin Consulting', 'White Rock', 'FRANCE', 'Appartement 142-1903 Libero Rue', '23030', 'sollicitudin@gmail.fr', 'Santana Carissa', '02 08 93 32 17', 1);

-- --------------------------------------------------------

--
-- Structure de la table `gérer`
--

DROP TABLE IF EXISTS `gérer`;
CREATE TABLE IF NOT EXISTS `gérer` (
  `Id_employees` int(10) UNSIGNED DEFAULT NULL COMMENT 'Numéro d''identification employé',
  `Id_fournisseurs` int(11) DEFAULT NULL COMMENT 'Numéro d''identification fournisseur',
  KEY `Id_employees` (`Id_employees`),
  KEY `Id_fournisseurs` (`Id_fournisseurs`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `gérer`
--

INSERT INTO `gérer` (`Id_employees`, `Id_fournisseurs`) VALUES
(14, 1),
(14, 5),
(2, 2),
(2, 6),
(7, 3),
(7, 4),
(7, 7);

-- --------------------------------------------------------

--
-- Structure de la table `ligne_de_commande`
--

DROP TABLE IF EXISTS `ligne_de_commande`;
CREATE TABLE IF NOT EXISTS `ligne_de_commande` (
  `Id_ligne_de_commande` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Clé de la table ligne de commande',
  `lico_qty` int(10) UNSIGNED DEFAULT NULL COMMENT 'La quantité de produits sur la commande',
  `lico_uni_prix` decimal(15,2) DEFAULT NULL COMMENT 'Prix unitaire du produit',
  `Id_commandes_li` int(10) UNSIGNED NOT NULL COMMENT 'Numéro d''identification commande',
  `Id_produits` int(10) NOT NULL COMMENT 'numéro d''identification produit',
  PRIMARY KEY (`Id_ligne_de_commande`),
  KEY `Id_commandes` (`Id_commandes_li`),
  KEY `Id_produits` (`Id_produits`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `ligne_de_commande`
--

INSERT INTO `ligne_de_commande` (`Id_ligne_de_commande`, `lico_qty`, `lico_uni_prix`, `Id_commandes_li`, `Id_produits`) VALUES
(1, 1, '130.00', 6, 1),
(2, 1, '200.00', 6, 5),
(3, 1, '780.00', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `livraison`
--

DROP TABLE IF EXISTS `livraison`;
CREATE TABLE IF NOT EXISTS `livraison` (
  `Id_livraison` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Clé de la table livraison',
  `liv_num_bon` int(11) DEFAULT NULL COMMENT 'Numéro de bon de livraison',
  `liv_date` date DEFAULT NULL COMMENT 'Date de livraison',
  `liv_etat` varchar(50) DEFAULT NULL COMMENT 'Etat de livraison',
  `liv_adresse` varchar(255) DEFAULT NULL COMMENT 'Adresse de livraison',
  PRIMARY KEY (`Id_livraison`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `livraison`
--

INSERT INTO `livraison` (`Id_livraison`, `liv_num_bon`, `liv_date`, `liv_etat`, `liv_adresse`) VALUES
(1, 36059, '2018-05-12', 'total', '7882 Luctus Rue Lonquimay 45354'),
(2, 12579, '2019-04-14', 'partielle', '226-6532 Convallis Avenue Bhilai 62534'),
(3, 69881, '2019-07-30', 'total', '9969 Aliquet Route Coevorden 40616'),
(4, 39674, '2020-03-03', 'total', '10 rue des corbak AMIENS 80000');

-- --------------------------------------------------------

--
-- Structure de la table `livrer`
--

DROP TABLE IF EXISTS `livrer`;
CREATE TABLE IF NOT EXISTS `livrer` (
  `Id_ligne_de_commande_l` int(10) UNSIGNED DEFAULT NULL COMMENT 'Numéro d''identification ligne de commande',
  `Id_livraison_l` int(10) UNSIGNED DEFAULT NULL COMMENT 'Numéro d''identification livraison',
  KEY `Id_ligne_de_commande_l` (`Id_ligne_de_commande_l`),
  KEY `Id_livraison_l` (`Id_livraison_l`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `livrer`
--

INSERT INTO `livrer` (`Id_ligne_de_commande_l`, `Id_livraison_l`) VALUES
(1, 3),
(3, 2),
(2, 4);

-- --------------------------------------------------------

--
-- Structure de la table `poste`
--

DROP TABLE IF EXISTS `poste`;
CREATE TABLE IF NOT EXISTS `poste` (
  `Id_poste` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Clé de la table poste',
  `pos_libelle` varchar(50) DEFAULT NULL COMMENT 'Nom du poste',
  PRIMARY KEY (`Id_poste`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `poste`
--

INSERT INTO `poste` (`Id_poste`, `pos_libelle`) VALUES
(1, 'Président-Directeur Général'),
(2, 'Manager(/geuse)'),
(3, 'Commercial(e)(particulier)'),
(4, 'Commercial(e)(profissionel)'),
(5, 'Mécanicien(ne)'),
(6, 'Assistant(e) commercial(e)'),
(7, 'Acheteur(/teuse)'),
(8, 'Assistant(e) RH'),
(9, 'Directeur(/trice) financier'),
(10, 'Directeur(/trice) des Ressources Humaines'),
(11, 'Chef(fe) de rayon'),
(12, 'Vendeur/(euse)'),
(13, 'Hôte(/esse) de caisse'),
(17, 'Directeur(/trice) de magasin'),
(18, 'Directeur(/trice) du marketing'),
(19, 'Assistant(e) marketing'),
(20, 'Comptable'),
(21, 'Assistant(e) comptable'),
(22, 'Vigile'),
(23, 'Cariste'),
(24, 'Préparateur(/trice) de commandes'),
(25, 'Formateur(/trice)'),
(26, 'Directeur(/trice) des systèmes d\'information'),
(27, 'Développeur(/peuse)'),
(28, 'Chef(/fe) de projet informatique'),
(29, 'Community manager'),
(30, 'Graphiste'),
(31, 'Technicien(/ne) réseau'),
(32, 'Technicien(/ne) support informatique'),
(33, 'Electricien(/ne)'),
(34, 'Technicien(/ne) de maintenance'),
(35, 'Directeur(/trice) commercial'),
(36, 'Responsable des ventes');

-- --------------------------------------------------------

--
-- Structure de la table `produits`
--

DROP TABLE IF EXISTS `produits`;
CREATE TABLE IF NOT EXISTS `produits` (
  `Id_produits` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clé de la table produits',
  `pro_lib_court` varchar(50) NOT NULL COMMENT 'Brève description du produit',
  `pro_lib_long` varchar(255) DEFAULT NULL COMMENT 'Description longue du produit',
  `pro_fou_ref` varchar(50) DEFAULT NULL COMMENT 'Référence du fournisseur',
  `pro_photo` varchar(50) DEFAULT NULL COMMENT 'Photo du produit',
  `pro_pri_achat` decimal(15,2) DEFAULT NULL COMMENT 'Prix du produit',
  `pro_stock` int(10) UNSIGNED DEFAULT NULL COMMENT 'quantité de produit dans le stock',
  `pro_bloque` tinyint(1) DEFAULT NULL COMMENT 'Produit bloqué au moment d achat',
  `Id_fournisseurs_pro` int(11) NOT NULL COMMENT 'ID du fournisseur',
  `Id_categories_pro` int(10) UNSIGNED NOT NULL COMMENT 'ID de la catégorie',
  PRIMARY KEY (`Id_produits`),
  KEY `Id_fournisseurs_pro` (`Id_fournisseurs_pro`),
  KEY `Id_categories_pro` (`Id_categories_pro`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `produits`
--

INSERT INTO `produits` (`Id_produits`, `pro_lib_court`, `pro_lib_long`, `pro_fou_ref`, `pro_photo`, `pro_pri_achat`, `pro_stock`, `pro_bloque`, `Id_fournisseurs_pro`, `Id_categories_pro`) VALUES
(1, 'Guitare', 'Yamaha - Guitare Classique C40BL Noir', 'C40BL', 'jpg', '130.00', 12, 0, 2, 20),
(2, 'GIBSON', 'GIBSON SG Standard Tribute 2019 - vintage cherry satin', 'SG2019', 'jpg', '856.00', 17, 0, 2, 18),
(3, 'APPLAUSE', 'APPLAUSE AE44II Mid Cutaway - natural', 'AE44II', 'jpg', '270.00', 30, 0, 2, 19),
(4, 'AQUILINA', 'AQUILINA Shelby 4 Custom (#01854) - natural', 'AQUI1854', 'jpg', '3200.00', 90, 0, 3, 15),
(5, 'CORT', 'CORT SJB6FX Fretless NAT +bag - natural', 'CORTSJB6FX', 'jpg', '740.00', 15, 0, 2, 16),
(6, 'Flyht Pro', 'Flyht Pro Case Uni­versal 2 / 120cm', 'FLPROU2', 'jpg', '200.00', 10, 0, 2, 14),
(7, 'MARSHALL', 'MARSHALL AS50DC Acoustic - Racing Green', 'AS50DC', 'jpg', '290.00', 3, 0, 2, 21),
(8, 'FENDER', 'FENDER Rumble Stage 800', 'FENDRS800', 'jpg', '800.00', 14, 1, 5, 22),
(9, 'Accordéon', 'Startone Piano Accordion 72 Black', 'AC690', 'JPG', '489.00', 10, 0, 7, 33),
(10, 'Grosses Caisses 20', 'Pearl Export 20\"x16\" Bass Drum #31', 'GK666', 'jpg', '244.00', 7, 0, 5, 34),
(11, 'câbles ', 'cable avec fiche CCE', 'CCE652', 'jpg', '14.90', 30, 0, 3, 2);

-- --------------------------------------------------------

--
-- Structure de la table `saisir`
--

DROP TABLE IF EXISTS `saisir`;
CREATE TABLE IF NOT EXISTS `saisir` (
  `Id_produits` int(11) DEFAULT NULL COMMENT 'Numéro d''identification produit',
  `Id_employees` int(10) UNSIGNED DEFAULT NULL COMMENT 'Numéro d''identification employé',
  `sai_date` datetime DEFAULT NULL COMMENT 'Date de saisie des données produit',
  `sai_description` text COMMENT 'Déscription du produit',
  KEY `Id_produits` (`Id_produits`),
  KEY `Id_employees` (`Id_employees`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `saisir`
--

INSERT INTO `saisir` (`Id_produits`, `Id_employees`, `sai_date`, `sai_description`) VALUES
(8, 5, '2019-02-14 10:24:36', 'changer le prix de produit de 750 euro à 800 euro '),
(3, 9, '2021-04-20 16:10:52', 'modifier la quantité de produit en stock de 0 à 30');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `clients_ibfk_1` FOREIGN KEY (`Id_employees`) REFERENCES `employees` (`Id_employees`);

--
-- Contraintes pour la table `commandes`
--
ALTER TABLE `commandes`
  ADD CONSTRAINT `commandes_ibfk_1` FOREIGN KEY (`Id_clients`) REFERENCES `clients` (`Id_clients`);

--
-- Contraintes pour la table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`Id_poste`) REFERENCES `poste` (`Id_poste`);

--
-- Contraintes pour la table `gérer`
--
ALTER TABLE `gérer`
  ADD CONSTRAINT `gérer_ibfk_1` FOREIGN KEY (`Id_employees`) REFERENCES `employees` (`Id_employees`),
  ADD CONSTRAINT `gérer_ibfk_2` FOREIGN KEY (`Id_fournisseurs`) REFERENCES `fournisseurs` (`Id_fournisseurs`);

--
-- Contraintes pour la table `ligne_de_commande`
--
ALTER TABLE `ligne_de_commande`
  ADD CONSTRAINT `ligne_de_commande_ibfk_1` FOREIGN KEY (`Id_commandes_li`) REFERENCES `commandes` (`Id_commandes`),
  ADD CONSTRAINT `ligne_de_commande_ibfk_2` FOREIGN KEY (`Id_produits`) REFERENCES `produits` (`Id_produits`);

--
-- Contraintes pour la table `livrer`
--
ALTER TABLE `livrer`
  ADD CONSTRAINT `livrer_ibfk_1` FOREIGN KEY (`Id_ligne_de_commande_l`) REFERENCES `ligne_de_commande` (`Id_ligne_de_commande`),
  ADD CONSTRAINT `livrer_ibfk_2` FOREIGN KEY (`Id_livraison_l`) REFERENCES `livraison` (`Id_livraison`);

--
-- Contraintes pour la table `produits`
--
ALTER TABLE `produits`
  ADD CONSTRAINT `produits_ibfk_1` FOREIGN KEY (`Id_fournisseurs_pro`) REFERENCES `fournisseurs` (`Id_fournisseurs`),
  ADD CONSTRAINT `produits_ibfk_2` FOREIGN KEY (`Id_categories_pro`) REFERENCES `categories` (`Id_categories`);

--
-- Contraintes pour la table `saisir`
--
ALTER TABLE `saisir`
  ADD CONSTRAINT `saisir_ibfk_1` FOREIGN KEY (`Id_produits`) REFERENCES `produits` (`Id_produits`),
  ADD CONSTRAINT `saisir_ibfk_2` FOREIGN KEY (`Id_employees`) REFERENCES `employees` (`Id_employees`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
