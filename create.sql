create database gestion_resto;

\c gestion_resto

create table client (
	id_client serial primary key,
	nom varchar(100) not null,
	prenom varchar(100),
	telephone varchar(13),
	email varchar(100) unique not null,
	mot_de_passe varchar(20) not null
);

create table tables (
	numero_table serial primary key,
	emplacement varchar(100)
);

create table reserver (
	id_reservation serial primary key,
	date_reservation date default current_date,
	heure_reservation time default current_time,
	numero_table int,
	nombre_de_personnes int,
	id_client int,
	CONSTRAINT fk_client FOREIGN KEY (id_client) REFERENCES client(id_client),
	CONSTRAINT fk_table FOREIGN KEY (numero_table) REFERENCES tables(numero_table)
);

create table serveur (
	id_serveur serial primary key,
	nom varchar(100),
	prenom varchar(100),
	telephone varchar(13)
);

create table commande (
	id_commande serial primary key,
	date_heure_commande timestamp,
	id_client int,
	numero_table int,
	id_serveur int,
	CONSTRAINT fk_client FOREIGN KEY (id_client) REFERENCES client(id_client),	
	CONSTRAINT fk_table FOREIGN KEY (numero_table) REFERENCES tables(numero_table),
	CONSTRAINT fk_serveur FOREIGN KEY (id_serveur) REFERENCES serveur(id_serveur)	
);

create table paiement (
	id_paiement serial primary key,
	date_paiement timestamp,
	montant float,
	id_commande int,
	CONSTRAINT fk_commande FOREIGN KEY (id_commande) REFERENCES commande(id_commande)

);

create table plats (
	id_plat serial primary key,
	nom varchar(100),
	prix float
);

create table contenir (
	id_commande INT,
    id_plat INT,
    quantite INT NOT NULL,
    PRIMARY KEY (id_commande, id_plat),
	 FOREIGN KEY (id_commande) REFERENCES commande(id_commande) ,
    FOREIGN KEY (id_plat) REFERENCES plats(id_plat)
);

