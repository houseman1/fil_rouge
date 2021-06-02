DROP TABLE IF EXISTS `fournisseurs`;
CREATE TABLE fournisseurs(
   Id_fournisseurs INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Clé de la table fournisseurs',
   fou_nom VARCHAR(50) COMMENT 'Nom du fournisseur',
   fou_ville VARCHAR(50) COMMENT 'Ville du fournisseur',
   fou_pays VARCHAR(50) COMMENT 'Pays du fournisseur',
   fou_adresse VARCHAR(255) COMMENT 'Adresse du fournisseur',
   fou_cp VARCHAR(50) COMMENT 'Code postal du fournisseur',
   fou_mail VARCHAR(50) COMMENT 'Adresse e-mail du fournisseur',
   fou_nom_contact VARCHAR(50) COMMENT 'Le nom de contact chez le fournisseur',
   fou_contact_phone INT COMMENT 'Le numéro de téléphone du contact chez le fournisseur',
   fou_type VARCHAR(50) COMMENT 'Le type de fournisseur (constructeurs ou importateurs)',
   PRIMARY KEY(Id_fournisseurs)
)  ENGINE=InnoDB DEFAULT CHARSET=utf8
;

CREATE TABLE categories(
   Id_categories INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Clé de la table categories',
   cat_nom VARCHAR(50) COMMENT 'Nom de catégorie',
   cat_desc VARCHAR(255) 'Description de la catégorie',
   Id_categories_1 INT NOT NULL COMMENT 'Nom de la catégorie parente',
   PRIMARY KEY(Id_categories),
   FOREIGN KEY(Id_categories_1) REFERENCES categories(Id_categories)
)  ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE livraison(
   Id_livraison INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Clé de la table livraison',
   liv_num_bon INT COMMENT 'Numéro de bon de livraison',
   liv_date DATE COMMENT 'Date de livraison',
   liv_etat VARCHAR(50) COMMENT 'Etat de livraison',
   liv_adresse VARCHAR(255) COMMENT 'Adresse de livraison',
   PRIMARY KEY(Id_livraison)
)  ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE poste(
   Id_poste INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Clé de la table poste',
   pos_libelle VARCHAR(50) COMMENT 'Nom du poste',
   PRIMARY KEY(Id_poste)
)  ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE produits(
   Id_produits INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Clé de la table produits',
   pro_lib_court VARCHAR(50) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Brève description du produit',
   pro_lib_long VARCHAR(255) COMMENT 'Description longue du produit',
   pro_fou_ref VARCHAR(50) COMMENT 'Référence du fournisseur',
   pro_photo VARCHAR(50) COMMENT 'Photo du produit',
   pro_pri_achat DECIMAL(15,2) COMMENT 'Prix du produit',
   pro_bloque BOOLEAN COMMENT "Produit bloqué au moment d'achat",
   Id_fournisseurs INT NOT NULL COMMENT 'ID du fournisseur',
   Id_categories INT NOT NULL COMMENT 'ID de la catégorie',
   PRIMARY KEY(Id_produits),
   FOREIGN KEY(Id_fournisseurs) REFERENCES fournisseurs(Id_fournisseurs),
   FOREIGN KEY(Id_categories) REFERENCES categories(Id_categories)
)  ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE employees(
   Id_employees INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Clé de la table employees',
   emp_nom VARCHAR(50) COMMENT `Nom de l'employé`,
   emp_prenom VARCHAR(50) COMMENT `Prénom de l'employé`,
   emp_poste VARCHAR(50) COMMENT `Poste de l'employé`,
   emp_adresse VARCHAR(255) COMMENT `Adresse de l'employé`,
   emp_cp VARCHAR(50) COMMENT `Code postal de l'employé`,
   emp_mail VARCHAR(50) COMMENT `Adresse e-mail de l'employé`,
   emp_phone INT COMMENT `Le numéro de téléphone de l'employé`,
   emp_mot_pass VARCHAR(50) COMMENT `Le mot de passe de l'employé`,
   Id_poste INT NOT NULL COMMENT 'ID de poste',
   PRIMARY KEY(Id_employees),
   FOREIGN KEY(Id_poste) REFERENCES poste(Id_poste)
);

CREATE TABLE clients(
   Id_clients INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Clé de la table clients',
   cli_nom VARCHAR(50) COMMENT `Nom du client`,
   cli_prenom VARCHAR(50) COMMENT `Préom du client`,
   cli_adresse VARCHAR(50) COMMENT `Adresse du client`,
   cli_cp VARCHAR(50) COMMENT `Code postal du client`,
   cli_ville VARCHAR(50) COMMENT `Ville du client`,
   cli_mail VARCHAR(50) COMMENT `Adresse e-mail du client`,
   cli_phone INT COMMENT `Le numéro de téléphone du client`,
   cli_mot_pass VARCHAR(50) COMMENT `Le mot de passe du client`,
   cli_ins_date DATETIME,
   cli_type VARCHAR(50) NOT NULL COMMENT `Le type du client (particulier ou professionel`,
   cli_ref VARCHAR(50) NOT NULL COMMENT `Le référence du client`,
   cli_coefficient BYTE,
   Id_employees INT NOT NULL ,
   PRIMARY KEY(Id_clients),
   FOREIGN KEY(Id_employees) REFERENCES employees(Id_employees)
);

CREATE TABLE commandes(
   Id_commandes COUNTER,
   com_com_date DATETIME,
   com_pay_date DATETIME,
   com_exp_date DATETIME,
   com_status VARCHAR(50),
   com_type_paiement VARCHAR(50) NOT NULL,
   com_prix_total DECIMAL(15,2),
   com_discount INT,
   com_facture_date DATE,
   com_facture_adresse VARCHAR(255) NOT NULL,
   Id_clients INT NOT NULL,
   PRIMARY KEY(Id_commandes),
   FOREIGN KEY(Id_clients) REFERENCES clients(Id_clients)
);

CREATE TABLE ligne_de_commande(
   Id_ligne_de_commande COUNTER,
   lico_qty INT,
   lico_uni_prix DECIMAL(15,2),
   Id_commandes INT NOT NULL,
   Id_produits INT NOT NULL,
   PRIMARY KEY(Id_ligne_de_commande),
   FOREIGN KEY(Id_commandes) REFERENCES commandes(Id_commandes),
   FOREIGN KEY(Id_produits) REFERENCES produits(Id_produits)
);

CREATE TABLE saisir(
   Id_produits INT,
   Id_employees INT,
   sai_date DATETIME,
   sai_description TEXT,
   PRIMARY KEY(Id_produits, Id_employees),
   FOREIGN KEY(Id_produits) REFERENCES produits(Id_produits),
   FOREIGN KEY(Id_employees) REFERENCES employees(Id_employees)
);

CREATE TABLE gérer(
   Id_employees INT,
   Id_fournisseurs INT,
   PRIMARY KEY(Id_employees, Id_fournisseurs),
   FOREIGN KEY(Id_employees) REFERENCES employees(Id_employees),
   FOREIGN KEY(Id_fournisseurs) REFERENCES fournisseurs(Id_fournisseurs)
);

CREATE TABLE livrer(
   Id_ligne_de_commande INT,
   Id_livraison INT,
   PRIMARY KEY(Id_ligne_de_commande, Id_livraison),
   FOREIGN KEY(Id_ligne_de_commande) REFERENCES ligne_de_commande(Id_ligne_de_commande),
   FOREIGN KEY(Id_livraison) REFERENCES livraison(Id_livraison)
);
