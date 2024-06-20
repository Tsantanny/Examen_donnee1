--Lister toutes les réservations pour une date spécifique :
SELECT * FROM reserver WHERE date_reservation = '2024-06-20';

--Compter le nombre de réservations par jour :
SELECT date_reservation, COUNT(*) AS nombre_reservations FROM reserver GROUP BY date_reservation;

-- Un client veut s'assurer que ses réservations sont correctement enregistrées et confirmées avant un événement spéciale.
SELECT 
    r.id_reservation,
    r.date_reservation,
    r.heure_reservation,
    r.numero_table,
    r.nombre_de_personnes
FROM reserver r
JOIN client c ON r.id_client = c.id_client
WHERE  
    c.nom = 'Dupont'
    AND c.prenom = 'Jean';

--le gérant veut verifier toutes les commandes d'une date spécifique :
SELECT 
    com.id_commande,
    com.date_heure_commande,
    cli.nom AS nom_client,
    cli.prenom AS prenom_client,
    t.emplacement AS emplacement_table,
    s.nom AS nom_serveur,
    s.prenom AS prenom_serveur
FROM commande com
JOIN client cli ON com.id_client = cli.id_client
JOIN tables t ON com.numero_table = t.numero_table
JOIN serveur s ON com.id_serveur = s.id_serveur
WHERE DATE(com.date_heure_commande) = '2024-06-21';

--Lister les détails d'une commande spécifique :
SELECT c.*, p.* FROM commande c
JOIN contenir co ON c.id_commande = co.id_commande
JOIN plats p ON co.id_plat = p.id_plat
WHERE c.id_commande = 1;

--Lister les plats commandés par un client spécifique :
SELECT 
    c.nom AS nom_client,
    c.prenom AS prenom_client,
    p.nom AS nom_plat,
    co.quantite AS quantite_commandee
FROM client c
JOIN commande com ON c.id_client = com.id_client
JOIN contenir co ON com.id_commande = co.id_commande
JOIN plats p ON co.id_plat = p.id_plat
WHERE c.id_client = 1; 

--Ajouter un nouveau plat au menu :
INSERT INTO plats (nom, prix)
VALUES ('Ratatouille', 9.50);

--Mettre à jour le prix d'un plat spécifique :
UPDATE plats SET prix = 16.00 WHERE nom = 'Steak Frites';

--Lister tous les paiements effectués à une date spécifique :
SELECT * FROM paiement WHERE date_paiement::date = '2024-06-23';

--Calculer le montant total des paiements pour une période donnée :
SELECT SUM(montant) AS total_paiements
FROM paiement
WHERE date_paiement BETWEEN '2024-06-20' AND '2024-06-22';

--Lister les paiements d'une commande spécifique :
SELECT 
    p.id_paiement,
    p.date_paiement,
    p.montant,
    c.nom AS nom_client,
    c.prenom AS prenom_client
FROM paiement p
JOIN commande com ON p.id_commande = com.id_commande
JOIN client c ON com.id_client = c.id_client
WHERE p.id_commande = 2;

--Lister tous les clients ayant fait des réservations dans une période donnée :
SELECT 
    c.nom AS nom_client,
    c.prenom AS prenom_client,
    r.date_reservation,
    r.heure_reservation,
    r.nombre_de_personnes
FROM client c
JOIN reserver r ON c.id_client = r.id_client
WHERE r.date_reservation BETWEEN '2024-06-20' AND '2024-06-23';

--Lister les clients ayant dépensé le plus d'argent :
SELECT 
    c.id_client,
    c.nom,
    c.prenom,
    SUM(p.montant) AS total_depense
FROM client c
JOIN commande com ON c.id_client = com.id_client
JOIN paiement p ON com.id_commande = p.id_commande
GROUP BY c.id_client, c.nom, c.prenom
ORDER BY total_depense DESC;

--Lister les commandes gérées par un serveur spécifique :
SELECT 
    com.id_commande,
    com.date_heure_commande,
    c.nom AS nom_client,
    c.prenom AS prenom_client,
    t.emplacement AS table_emplacement,
    s.nom AS nom_serveur,
    s.prenom AS prenom_serveur
FROM commande com
JOIN client c ON com.id_client = c.id_client
JOIN tables t ON com.numero_table = t.numero_table
JOIN serveur s ON com.id_serveur = s.id_serveur
WHERE 
    s.nom = 'Fontaine' 
    AND s.prenom = 'Claire';  


--Calculer le nombre de commandes prises par chaque serveur :
SELECT s.id_serveur, s.nom, s.prenom, COUNT(*) AS nombre_commandes
FROM serveur s
JOIN commande c ON s.id_serveur = c.id_serveur
GROUP BY s.id_serveur, s.nom, s.prenom;

--Lister les plats les plus commandés :
SELECT p.nom, SUM(co.quantite) AS quantite_commandee
FROM plats p
JOIN contenir co ON p.id_plat = co.id_plat
GROUP BY p.nom
ORDER BY quantite_commandee DESC;

--Calculer les revenus générés par chaque plat :
SELECT p.nom, SUM(co.quantite * p.prix) AS revenus
FROM plats p
JOIN contenir co ON p.id_plat = co.id_plat
GROUP BY p.nom
ORDER BY revenus DESC;

--Lister les tables disponibles à une date et heure spécifique :
SELECT t.numero_table,t.emplacement
FROM tables t
WHERE t.numero_table 
NOT IN (SELECT r.numero_table FROM reserver r WHERE r.date_reservation = '2024-06-20' AND r.heure_reservation = '14:00');
