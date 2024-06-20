INSERT INTO client (nom, prenom, telephone, email, mot_de_passe) VALUES
('Dupont', 'Jean', '0612345678', 'jean.dupont@example.com', 'password1'),
('Martin', 'Sophie', '0623456789', 'sophie.martin@example.com', 'password2'),
('Bernard', 'Luc', '0634567890', 'luc.bernard@example.com', 'password3'),
('Dubois', 'Emma', '0645678901', 'emma.dubois@example.com', 'password4'),
('Thomas', 'Louis', '0656789012', 'louis.thomas@example.com', 'password5'),
('Robert', 'Alice', '0667890123', 'alice.robert@example.com', 'password6'),
('Richard', 'Pierre', '0678901234', 'pierre.richard@example.com', 'password7'),
('Petit', 'Julie', '0689012345', 'julie.petit@example.com', 'password8');


INSERT INTO tables (emplacement) VALUES
('Salle 1 - Coin fenêtre'),
('Salle 1 - Milieu'),
('Salle 1 - Proche entrée'),
('Salle 2 - Coin fenêtre'),
('Salle 2 - Milieu'),
('Salle 2 - Proche entrée'),
('Terrasse - Coin ombragé'),
('Terrasse - Proche entrée');


INSERT INTO reserver (date_reservation, heure_reservation, numero_table, nombre_de_personnes, id_client) VALUES
('2024-06-20', '12:00', 1, 4, 1),
('2024-06-20', '13:00', 2, 2, 2),
('2024-06-21', '12:30', 3, 6, 3),
('2024-06-21', '19:00', 4, 3, 4),
('2024-06-22', '20:00', 5, 2, 5),
('2024-06-22', '21:00', 6, 4, 6),
('2024-06-23', '18:30', 7, 5, 7),
('2024-06-23', '19:30', 8, 3, 8),
('2024-06-25', '14:00', 3, 2, 2),
('2024-06-26', '18:00', 4, 3, 3);

INSERT INTO serveur (nom, prenom, telephone) VALUES
('Leroy', 'Marie', '0712345678'),
('Muller', 'Paul', '0723456789'),
('Fontaine', 'Claire', '0734567890'),
('Garcia', 'Antoine', '0745678901'),
('Legrand', 'Isabelle', '0756789012'),
('Garnier', 'Julien', '0767890123'),
('Lambert', 'Celine', '0778901234'),
('Rousseau', 'François', '0789012345');


INSERT INTO commande (date_heure_commande, id_client, numero_table, id_serveur) VALUES
('2024-06-20 12:15:00', 1, 1, 1),
('2024-06-20 13:10:00', 2, 2, 2),
('2024-06-21 12:45:00', 3, 3, 3),
('2024-06-21 19:15:00', 4, 4, 4),
('2024-06-22 20:10:00', 5, 5, 5),
('2024-06-22 21:15:00', 6, 6, 6),
('2024-06-23 18:45:00', 7, 7, 7),
('2024-06-23 19:45:00', 8, 8, 8);


INSERT INTO paiement (date_paiement, montant, id_commande) VALUES
('2024-06-20 14:00:00', 50.00, 1),
('2024-06-20 15:00:00', 30.00, 2),
('2024-06-21 14:00:00', 75.00, 3),
('2024-06-21 20:30:00', 40.00, 4),
('2024-06-22 22:00:00', 60.00, 5),
('2024-06-22 23:00:00', 45.00, 6),
('2024-06-23 20:00:00', 90.00, 7),
('2024-06-23 21:00:00', 35.00, 8);


INSERT INTO plats (nom, prix) VALUES
('Pizza Margherita', 12.50),
('Spaghetti Carbonara', 10.00),
('Salade César', 8.00),
('Burger Classique', 11.00),
('Steak Frites', 15.00),
('Soupe à l''oignon', 7.00),
('Tarte Tatin', 6.50),
('Crème Brûlée', 5.50);


INSERT INTO contenir (id_commande, id_plat, quantite) VALUES
(1, 1, 2), 
(1, 2, 1),
(2, 3, 1),
(2, 4, 1), 
(3, 5, 2), 
(3, 6, 1), 
(4, 7, 1), 
(4, 8, 1), 
(5, 1, 1),
(5, 3, 2), 
(6, 4, 1), 
(6, 5, 1), 
(7, 6, 2), 
(7, 7, 1), 
(8, 8, 2), 
(8, 1, 1); 
