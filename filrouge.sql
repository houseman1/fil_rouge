DROP DATABASE IF EXISTS `filrouge`;
CREATE DATABASE 'filrouge';
use 'filrouge',
  
DROP TABLE IF EXISTS `fournisseurs`;
CREATE TABLE fournisseurs(
   Id_fournisseurs INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Clé de la table fournisseurs',
   fou_nom VARCHAR(50) COMMENT 'Nom du fournisseur',
   fou_ville VARCHAR(50) COMMENT 'Ville du fournisseur',
   fou_pays VARCHAR(50) COMMENT 'Pays du fournisseur',
   fou_adresse VARCHAR(255) COMMENT 'Adresse du fournisseur',
   fou_cp INT(5) UNSIGNED COMMENT 'Code postal du fournisseur',
   fou_mail VARCHAR(255) COMMENT 'Adresse e-mail du fournisseur',
   fou_nom_contact VARCHAR(50) COMMENT 'Le nom de contact chez le fournisseur',
   fou_contact_phone VARCHAR(15) COMMENT 'Le numéro de téléphone du contact chez le fournisseur',
   fou_type VARCHAR(50) COMMENT 'Le type de fournisseur (constructeurs ou importateurs)',
   PRIMARY KEY(Id_fournisseurs)
)  ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `fournisseurs`(`Id_fournisseurs`, `fou_nom`, `fou_ville`, `fou_pays`, `fou_adresse`, `fou_cp`, `fou_mail`, `fou_nom_contact`, `fou_contact_phone`, `fou_type`) VALUES
(1, 'Amet Orci PC', 'Cinisi' ,'FRANCE', 'Appartement 402-3526 Massa Rue', 88835,'amet.fou@gmail.com','ALOU Amira', '09 65 12 45 03', ' importateurs'),
(2, 'Integer Vulputate Risus Consulting','Mazenzele','France', '4509 Libero Chemin', 91003,'Vuluputate@gmail.com' ,'Harper Edan', '07 12 88 74 07','importateurs '),
(3, 'Maecenas Malesuada Inc.','Washington','FRANCE', 'Appartement 975-1252 Odio. Impasse', 55361,'Maecenas@hotmail.com','Dale Lucius' ,'07 09 79 41 97','constructeurs' ),
(4, 'Dictum Mi Ac Inc.', 'Vandoeuvre-lès-Nancy','FRANCE', 'Appartement 245-2355 Auctor, Route', 21846,'Dictum@gmail.com','Holden Dorian' ,'09 04 52 00 84',' importateurs' ),
(5, 'Eleifend Vitae Industries', 'San Nicolás','FRANCE', 'Appartement 536-5751 Neque Rue', 12959,'Eleifend@gmail.fr','Herman Aurora', '08 04 60 78 18','constructeurs'),
(6, 'Nunc Quis Arcu Corporation','Werder','FRANCE', '491-9263 Aenean Avenue', 56602,'NUNC@gmail.com', 'Cruz Alvin' ,'08 30 54 07 77',' importateurs' ),
(7, 'A Sollicitudin Consulting','White Rock','FRANCE', 'Appartement 142-1903 Libero Rue', 23030 ,'sollicitudin@gmail.fr','Santana Carissa' ,'02 08 93 32 17','constructeurs ' );






DROP TABLE IF EXISTS `categories`;
CREATE TABLE categories(
   Id_categories INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Clé de la table categories',
   cat_nom VARCHAR(50) COMMENT 'Nom de catégorie',
   cat_desc VARCHAR(255)COMMENT 'Description de la catégorie',
   Id_categories_1 INT  COMMENT 'Nom de la catégorie parente',
   PRIMARY KEY(Id_categories),
  KEY `fk_categories_cat_parent` (`Id_categories_1`)
)  ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `categories`(`Id_categories`, `cat_nom`, `cat_desc`, `Id_categories_1`) VALUES 
(1, 'batterie', 'ça tape et ça cogne', NULL),
(2, 'cables', 'de la connection',NULL),
(3, 'cases', 'des rangements et des rangements',NULL),
(4, 'guitares', 'ça gratte',NULL),
(5, 'studio', 'pour ceux qui chantes ou pas...',NULL),
(6, 'claviers', 'pia pia piano',NULL),
(7, 'instruments à vent', 'ça va souffler',NULL),
(8, 'sono', 'cest qui le DJ',NULL),
(9, 'jack', 'longueurs > à un mètre', 2),
(10, 'cable micro', 'connectic multi pin pour micros', 2),
(11, 'midi', 'micros et sonos', 2),
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
(32, 'jack court', 'longueurs < à un mètre', 2);






CREATE TABLE poste(
   Id_poste INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Clé de la table poste',
   pos_libelle VARCHAR(50) COMMENT 'Nom du poste',
   PRIMARY KEY(Id_poste)
)  ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `poste`(`Id_poste`, `pos_libelle`) VALUES
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
(26, "Directeur(/trice) des systèmes d\'information"),
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






CREATE TABLE produits(
   Id_produits INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Clé de la table produits',
   pro_lib_court VARCHAR(50)  NOT NULL COMMENT 'Brève description du produit',
   pro_lib_long VARCHAR(255) COMMENT 'Description longue du produit',
   pro_fou_ref VARCHAR(50) COMMENT 'Référence du fournisseur',
   pro_photo VARCHAR(50) COMMENT 'Photo du produit',
   pro_pri_achat DECIMAL(15,2) COMMENT 'Prix du produit',
   pro_stock INT UNSIGNED COMMENT 'quantité de produit dans le stock',
   pro_bloque BOOLEAN COMMENT 'Produit bloqué au moment d achat',
   Id_fournisseurs_pro INT(10) UNSIGNED NOT NULL COMMENT 'ID du fournisseur',
   Id_categories_pro INT(10) UNSIGNED  NOT NULL COMMENT 'ID de la catégorie',
   PRIMARY KEY(Id_produits),
   FOREIGN KEY(Id_fournisseurs_pro) REFERENCES fournisseurs(Id_fournisseurs),
   FOREIGN KEY(Id_categories_pro) REFERENCES categories(Id_categories)
)  ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `produits`(`Id_produits`, `pro_lib_court`, `pro_lib_long`, `pro_fou_ref`, `pro_photo`, `pro_pri_achat`, `pro_stock`, `pro_bloque`, `Id_fournisseurs_pro`, `Id_categories_pro`) VALUES 
(1,'Guitare' , 'Yamaha - Guitare Classique C40BL Noir','C40BL', '../images/default_guit.jpg', '130.00',12,0, 2, 20),
(2,'GIBSON', 'GIBSON SG Standard Tribute 2019 - vintage cherry satin', 'SG2019', '../images/default_guit.jpg', '856.00',17,0, 2, 18),
(3,'APPLAUSE' , 'APPLAUSE AE44II Mid Cutaway - natural','AE44II', '../images/default_guit.jpg', '270.00',30,0 ,2, 19),
(4,'AQUILINA',  'AQUILINA Shelby 4 Custom (#01854) - natural','AQUI1854', '../images/default_guit.jpg','3200.00',90,0, 3, 15),
(5,'CORT' , 'CORT SJB6FX Fretless NAT +bag - natural','CORTSJB6FX', '../images/default_guit.jpg', '740.00',15,0, 2, 16),
(6,'Flyht Pro' , 'Flyht Pro Case Uni­versal 2 / 120cm','FLPROU2', '../images/default_guit.jpg', '200.00',10,0, 2, 14),
(7,'MARSHALL' , 'MARSHALL AS50DC Acoustic - Racing Green','AS50DC', '../images/default_guit.jpg',  '290.00',3,0, 2, 21),
(8,'FENDER' , 'FENDER Rumble Stage 800','FENDRS800', '../images/default_guit.jpg', '800.00',14,1, 5, 22);


CREATE TABLE employees(
   Id_employees INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Clé de la table employees',
   emp_nom VARCHAR(50) COMMENT "Nom de l'employé",
   emp_prenom VARCHAR(50) COMMENT "Prénom de l'employe",
   emp_adresse VARCHAR(255) COMMENT "Adresse de l'employé",
   emp_cp VARCHAR(50) COMMENT "Code postal de l'employé",
   emp_ville VARCHAR(50) COMMENT "la ville où l'employé habite",
   emp_mail VARCHAR(50) COMMENT "Adresse e-mail de l'employé",
   emp_phone INT COMMENT "Le numéro de téléphone de l'employé",
   emp_mot_pass VARCHAR(60) COMMENT "Le mot de passe de l'employé",
   emp_dat_embauche date COMMENT " la date d'ambauche de l'employé",
   Id_poste INT(10) UNSIGNED NOT NULL COMMENT 'ID de poste',
   PRIMARY KEY(Id_employees),
   FOREIGN KEY(Id_poste) REFERENCES poste(Id_poste)
)  ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `employees`(`Id_employees`, `emp_nom`, `emp_prenom`, `emp_adresse`, `emp_cp`, `emp_ville`, `emp_mail`, `emp_phone`, `emp_mot_pass`, `emp_dat_embauche`, `Id_poste`) VALUES 
(1, 'MOLETTE', 'Denis', '27 avenue Paul Lepoulpe', '80000', 'Amiens', 'dmolette@blabla.fr', 0102030405,'$2y$10$BBFFx.lzX3Ch6IUnVt5he.xwKhZ2k0c5FJVpbn00ylZ...','2010-05-05', 4),
(2, 'NAGER', 'Emma', '14 rue Tabaga', '80300', 'Albert', 'emmanager@laposte.net', 0102030405,'$2y$10$BBFFx.lzX3Ch6IUnVt5he.xwKhZ2k0c5FJVpbn00ylZ...','2000-05-15', 7),
(3,  'LEBOSSE', 'Hugo', '28 mail Ludovic Cruchot', '75001', 'Paris', 'leboss@jarditou.com', 0102030405, '$2y$10$BBFFx.lzX3Ch6IUnVt5he.xwKhZ2k0c5FJVpbn00ylZ...','2020-04-18', 8),
(4, 'LAPAGE', 'Edith', '22 rue Stevy Boulay', '60300', 'Senlis', 'lapage60300@yahoo.fr', 0102030405, '$2y$10$BBFFx.lzX3Ch6IUnVt5he.xwKhZ2k0c5FJVpbn00ylZ...', '2011-12-11',3),
(5,'DRESSAMERE', 'Yvan', '224 avenue Caumartin', '75009', 'Paris', 'yvan75009@outlook.com', 0102030405, '$2y$10$BBFFx.lzX3Ch6IUnVt5he.xwKhZ2k0c5FJVpbn00ylZ...', '2017-01-23', 25),
(6,  'MERCE', 'Coco', '56 cours Loana', '02000', 'Laon', 'merce@wazaa.net', 0102030405, '$2y$10$BBFFx.lzX3Ch6IUnVt5he.xwKhZ2k0c5FJVpbn00ylZ...', '2020-05-05', 36),
(7,'AMAR', 'Yann', '4 rue du papillon de lumière', '62000', 'Arras', 'amar@azerty.com', 0102030405, '$2y$10$BBFFx.lzX3Ch6IUnVt5he.xwKhZ2k0c5FJVpbn00ylZ...', '2005-07-28', 7),
(8,'ASAP', 'Liliane', 'Appartement 202-3846 Suspendisse Chemin', 'FA46 ', 'Pekanbaru', 'convallis@Integer.com', 0102030405, '$2y$10$BBFFx.lzX3Ch6IUnVt5he.xwKhZ2k0c5FJVpbn00ylZ...', '2020-02-29',11),
(9,'LAVISSE', 'Edouard', '131-3667 Arcu. Rd.', '80136', 'Rivery', 'nulla.magna@Proinvel.co.uk', 0102030405, '$2y$10$BBFFx.lzX3Ch6IUnVt5he.xwKhZ2k0c5FJVpbn00ylZ...', '2007-12-17', 3),
(10, 'HILLARY', 'Dorian', '6824 Placerat. Route', '12787', 'Parramatta', 'mus@Morbi.co.uk', 0102030405, '$2y$10$BBFFx.lzX3Ch6IUnVt5he.xwKhZ2k0c5FJVpbn00ylZ...', '2021-01-30', 4),
(11, 'POUTIN', 'Vladimir', '251-633 Convallis Impasse', '8373 ', 'Colchester', 'facilisis.vitae.orci@indolor.net', 0102030405, '$2y$10$BBFFx.lzX3Ch6IUnVt5he.xwKhZ2k0c5FJVpbn00ylZ...', '2020-05-05', 3),
(12,  'DECLAN', 'Richard', 'Appartement 870-7677 Magna Av.', '42980', 'Dornbirn', 'Mauris@amet.ca', 0102030405, '$2y$10$BBFFx.lzX3Ch6IUnVt5he.xwKhZ2k0c5FJVpbn00ylZ...', '2020-05-05',12),
(13,'ABRAHAM', 'François', '612-4178 Urna Chemin', '87784', 'Llanidloes', 'sodales@malesuadaInteger.com', 0102030405, '$2y$10$BBFFx.lzX3Ch6IUnVt5he.xwKhZ2k0c5FJVpbn00ylZ...', '2020-05-05',20),
(14, 'COOPER', 'Dale', '6954 Mauris Av.', '17543', 'Kalyan', 'Nunc.ullamcorper.velit@penatibuset.org', 0102030405, '$2y$10$BBFFx.lzX3Ch6IUnVt5he.xwKhZ2k0c5FJVpbn00ylZ...', '2020-05-05',  7);








CREATE TABLE clients(
   Id_clients INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Clé de la table clients',
   cli_nom VARCHAR(50) COMMENT 'Nom du client',
   cli_prenom VARCHAR(50) COMMENT 'Préom du client',
   cli_adresse VARCHAR(50) COMMENT 'Adresse du client',
   cli_cp VARCHAR(50) COMMENT 'Code postal du client',
   cli_ville VARCHAR(50) COMMENT 'Ville du client',
   cli_mail VARCHAR(50) COMMENT 'Adresse e-mail du client',
   cli_phone INT COMMENT 'Le numéro de téléphone du client',
   cli_mot_pass VARCHAR(60) COMMENT 'Le mot de passe du client',
   cli_ins_date DATETIME,
   cli_type VARCHAR(50) NOT NULL COMMENT 'le type du client (particulier ou professionel',
   cli_ref VARCHAR(50) NOT NULL COMMENT 'Le référence du client',
   cli_coefficient DECIMAL COMMENT 'Le coefficient du client',
   Id_employees INT(10) UNSIGNED NOT NULL COMMENT "Numéro d'identification employé",
   PRIMARY KEY(Id_clients),
   FOREIGN KEY(Id_employees) REFERENCES employees(Id_employees)
)  ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `clients`(`Id_clients`, `cli_nom`, `cli_prenom`, `cli_adresse`, `cli_cp`, `cli_ville`, `cli_mail`, `cli_phone`, `cli_mot_pass`, `cli_ins_date`, `cli_type`, `cli_ref`, `cli_coefficient`, `Id_employees`) VALUES
(1, 'George', 'Nolan', 'CP 214, 1460 Dui Avenue',  '81313','Moerkerke','et.ultrices.posuere@pharetranibh.ca', 0129812927,'$2y$10$BBFFx.lzX3Ch6IUnVt5he.xwKhZ2k0c5FJVpbn00ylZ...','2021-02-14 00:00:00','par','AB1402', NULL, 11),
(2, 'Sandoval', 'Linda', 'Appartement 443-4185 Lacinia. Route', '12512','Torgnon','Proin.dolor@sodales.net', 0345298967,'$2y$10$BBFFx.lzX3Ch6IUnVt5he.xwKhZ2k0c5FJVpbn00ylZ...','2000-03-18 00:00:00','par','AC1803', NULL, 1),
(3, 'Johns', 'Judah', '478-741 Urna. Av.',  '68356','Baarle-Hertog','nibh.Phasellus.nulla@veliteu.co.uk', 0147649162, '$2y$10$BBFFx.lzX3Ch6IUnVt5he.xwKhZ2k0c5FJVpbn00ylZ...','2020-10-30 00:00:00', 'pro', 'PRO3010',0.2,4);







CREATE TABLE commandes(
   Id_commandes INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Clé de la table commandes',
   com_com_date DATE COMMENT "La date de commande",
   com_pay_date DATE COMMENT "La date de paiement",
   com_exp_date DATE COMMENT "La date d'expédition",
   com_status VARCHAR(50) COMMENT "Le statut de la commande",
   com_type_paiement VARCHAR(50) NOT NULL COMMENT "Le type de paiement (à la commande ou en différé)",
   com_prix_total DECIMAL(15,2) COMMENT "Le prix total de la commande",
   com_discount INT COMMENT "La remise de la commande",
   com_facture_date DATE COMMENT "La date de la facture",
   com_facture_adresse VARCHAR(255) NOT NULL COMMENT "L'adresse de facturation",
   Id_clients INT(10) UNSIGNED NOT NULL COMMENT "Numéro d'identification client",
   PRIMARY KEY(Id_commandes),
   FOREIGN KEY(Id_clients) REFERENCES clients(Id_clients)
)  ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `commandes`(`Id_commandes`, `com_com_date`, `com_pay_date`, `com_exp_date`, `com_status`, `com_type_paiement`, `com_prix_total`, `com_discount`, `com_facture_date`, `com_facture_adresse`, `Id_clients`) VALUES
(1, '2018-01-15',  '2019-01-15', '2019-01-15', 'livrée totalement' ,'en cours','4270.00',10,'2019-01-15','10 rue des corbak AMIENS 80000',3),
(2, '2018-03-18', '2019-01-15', '2019-01-15', 'livrée partiellement' ,'soldée','6400.00',15,'2019-01-15','7882 Luctus Rue Lonquimay 45354', 3),
(3, '2018-05-21',  null, '2018-10-15', 'livrée totalement' ,'soldée','2200.00',0,'2018-10-20','CP 394, 7305 Risus. Route Lunel 68624', 1),
(4, '2018-07-24',  '2018-11-15', '2018-10-15','livrée partiellement' ,'soldée','800.00',5,'2018-10-17','226-6532 Convallis Avenue Bhilai 62534', 2),
(5, '2021-06-03', '2021-07-10', '2021-06-23','livrée partiellement'  ,'soldée','1450.00',7,null,'3831 Eu Route Portland 29059',  2),
(6, '2018-11-30', '2018-12-15', '2018-12-15','livrée totalement' ,'soldée','330.00',10,'2018-12-20','9969 Aliquet Route Coevorden 40616', 1),
(7, '2018-12-22',  '2019-01-15', '2019-01-15','livrée totalement' ,'en cours','420.00',20,'2019-01-17', 'Appartement 691-6161 Non Rue Jacksonville 94276',  3);






DROP TABLE IF EXISTS `livraison`;
CREATE TABLE livraison(
   Id_livraison INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Clé de la table livraison',
   liv_num_bon INT COMMENT 'Numéro de bon de livraison',
   liv_date DATE COMMENT 'Date de livraison',
   liv_etat VARCHAR(50) COMMENT 'Etat de livraison',
   liv_adresse VARCHAR(255) COMMENT 'Adresse de livraison',
   PRIMARY KEY(Id_livraison)
)  ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `livraison`(`Id_livraison`, `liv_num_bon`, `liv_date`, `liv_etat`, `liv_adresse`) VALUES
(1,36059,'2018-05-12','total','7882 Luctus Rue Lonquimay 45354'),
(2,12579,'2019-04-14','partielle','226-6532 Convallis Avenue Bhilai 62534'),
(3,69881,'2019-07-30','total','9969 Aliquet Route Coevorden 40616'),
(4,39674,'2020-03-03','total','10 rue des corbak AMIENS 80000');










CREATE TABLE ligne_de_commande(
   Id_ligne_de_commande INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Clé de la table ligne de commande',
   lico_qty INT(10)UNSIGNED COMMENT "La quantité de produits sur la commande",
   lico_uni_prix DECIMAL(15,2) COMMENT "Prix unitaire du produit",
   Id_commandes INT(10)UNSIGNED NOT NULL COMMENT "Numéro d'identification commande",
   Id_produits INT(10) UNSIGNED NOT NULL COMMENT "numéro d'identification produit",
   PRIMARY KEY(Id_ligne_de_commande),
   FOREIGN KEY(Id_commandes) REFERENCES commandes(Id_commandes),
   FOREIGN KEY(Id_produits) REFERENCES produits(Id_produits)
)  ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `ligne_de_commande`(`Id_ligne_de_commande`, `lico_qty`, `lico_uni_prix`, `Id_commandes`, `Id_produits`) VALUES
(1,1,130,6,1),
(2,1,200,6,5),
(3,1,780,1,1);






CREATE TABLE saisir(
   Id_produits INT(10)UNSIGNED COMMENT "Numéro d'identification produit",
   Id_employees INT(10)UNSIGNED COMMENT "Numéro d'identification employé",
   sai_date DATETIME COMMENT "Date de saisie des données produit",
   sai_description TEXT COMMENT "Déscription du produit",
   PRIMARY KEY(Id_produits, Id_employees),
   FOREIGN KEY(Id_produits) REFERENCES produits(Id_produits),
   FOREIGN KEY(Id_employees) REFERENCES employees(Id_employees)
)  ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO `saisir`(`Id_produits`, `Id_employees`, `sai_date`, `sai_description`) VALUES 
(8,5,'2019-02-14 10:24:36', 'changer le prix de produit de 750 euro à 800 euro '),
(3,9, '2021-04-20 16:10:52','modifier la quantité de produit en stock de 0 à 30');

CREATE TABLE gérer(
   Id_employees INT(10)UNSIGNED COMMENT "Numéro d'identification employé",
   Id_fournisseurs INT(10)UNSIGNED COMMENT "Numéro d'identification fournisseur",
   PRIMARY KEY(Id_employees, Id_fournisseurs),
   FOREIGN KEY(Id_employees) REFERENCES employees(Id_employees),
   FOREIGN KEY(Id_fournisseurs) REFERENCES fournisseurs(Id_fournisseurs)
)  ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `gérer`(`Id_employees`, `Id_fournisseurs`) VALUES
(14,1),
(14,5),
(2,2),
(2,6),
(7,3),
(7,4),
(7,7);


CREATE TABLE livrer(
   Id_ligne_de_commande_l INT(10) UNSIGNED COMMENT "Numéro d'identification ligne de commande",
   Id_livraison_l INT(10) UNSIGNED  COMMENT "Numéro d'identification livraison",
   FOREIGN KEY(Id_ligne_de_commande_l) REFERENCES ligne_de_commande(Id_ligne_de_commande),
   FOREIGN KEY(Id_livraison_l) REFERENCES livraison(Id_livraison)
)  ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `livrer`(`Id_ligne_de_commande_l`, `Id_livraison_l`) VALUES
(1,3),
(3,2),
(2,4);