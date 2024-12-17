-- alice    : f47ac10b-58cc-4372-a567-0e02b2c3d479
-- bob      : c9bf9e57-1685-4c89-bafb-ff5af830be8a
-- charlie  : 6618f3e4-c492-474c-b925-1f4f1a0774c3 (producteur)
-- admin    : 9cbe2ee3-45eb-46ef-9ea1-59a01d6b4ff2
-- diane    : 2a0a11b7-a68c-4e21-92b4-7f7af6ffcd33
-- eric     : 50526064-7e17-4afe-9f21-f7100ab6fe62
-- fanny    : 84be57c6-4ef4-4381-bf05-a52139a50911
-- georges  : 047b6cae-6140-49f7-8c66-ef6b66cbb441

INSERT INTO "utilisateur" (id, nom_utilisateur, role, mot_de_passe) VALUES
('f47ac10b-58cc-4372-a567-0e02b2c3d479','alice',0,'passwordAlice'),
('c9bf9e57-1685-4c89-bafb-ff5af830be8a','bob',0,'passwordBob'),
('6618f3e4-c492-474c-b925-1f4f1a0774c3','charlie',1,'passwordCharlie'),
('9cbe2ee3-45eb-46ef-9ea1-59a01d6b4ff2','admin',2,'passwordAdmin'),
('2a0a11b7-a68c-4e21-92b4-7f7af6ffcd33','diane',0,'passwordDiane'),
('50526064-7e17-4afe-9f21-f7100ab6fe62','eric',0,'passwordEric'),
('84be57c6-4ef4-4381-bf05-a52139a50911','fanny',0,'passwordFanny'),
('047b6cae-6140-49f7-8c66-ef6b66cbb441','georges',1,'passwordGeorges'); -- Georges est aussi producteur par ex

INSERT INTO "public"."ingredient" 
("nom", "debut_saison", "fin_saison", "url_photo") VALUES
('Tomate', '06', '09', 'https://example.com/images/tomate.jpg'),
('Carotte', '10', '04', 'https://example.com/images/carotte.jpg'),
('Courgette', '06', '09', 'https://example.com/images/courgette.jpg'),
('Oignon', '01', '12', 'https://example.com/images/oignon.jpg'),
('Pommes de terre', '08', '03', 'https://example.com/images/pommesdeterre.jpg'),
('Champignons', '09', '12', 'https://example.com/images/champignons.jpg'),
('Brocoli', '09', '03', 'https://example.com/images/brocoli.jpg'),
('Chou-fleur', '09', '03', 'https://example.com/images/chou-fleur.jpg'),
('Poivron', '06', '09', 'https://example.com/images/poivron.jpg'),
('Persil', '05', '10', 'https://example.com/images/persil.jpg'),
('Basilic', '06', '09', 'https://example.com/images/basilic.jpg'),
('Riz', '01', '12', 'https://example.com/images/riz.jpg'),
('Pois chiches', '05', '08', 'https://example.com/images/pois-chiches.jpg'),
('Farine', '01', '12', 'https://example.com/images/farine.jpg'),
('Œufs', '01', '12', 'https://example.com/images/oeufs.jpg'),
('Lait', '01', '12', 'https://example.com/images/lait.jpg'),
('Beurre', '01', '12', 'https://example.com/images/beurre.jpg'),
('Crème fraîche', '01', '12', 'https://example.com/images/creme-fraiche.jpg'),
('Fromage', '01', '12', 'https://example.com/images/fromage.jpg'),
('Poulet', '01', '12', 'https://example.com/images/poulet.jpg'),
('Bœuf', '01', '12', 'https://example.com/images/boeuf.jpg'),
('Poisson', '01', '12', 'https://example.com/images/poisson.jpg'),
('Saumon', '01', '12', 'https://example.com/images/saumon.jpg'),
('Crevettes', '01', '12', 'https://example.com/images/crevettes.jpg'),
('Pain', '01', '12', 'https://example.com/images/pain.jpg'),
('Pâtes', '01', '12', 'https://example.com/images/pates.jpg'),
('Sel', '01', '12', 'https://example.com/images/sel.jpg'),
('Poivre', '01', '12', 'https://example.com/images/poivre.jpg'),
('Cumin', '01', '12', 'https://example.com/images/cumin.jpg'),
('Cannelle', '01', '12', 'https://example.com/images/cannelle.jpg'),
('Huile d’olive', '11', '02', 'https://example.com/images/huile-olive.jpg'),
('Miel', '01', '12', 'https://example.com/images/miel.jpg'),
('Sucre', '01', '12', 'https://example.com/images/sucre.jpg'),
('Moules', '06', '02', 'https://example.com/images/moules.jpg'),
('Chocolat', '01', '12', 'https://example.com/images/chocolat.jpg'),
('Pomme', '09', '12', 'https://example.com/images/pomme.jpg'),
('Banane', '01', '12', 'https://example.com/images/banane.jpg'),
('Fraises', '05', '07', 'https://example.com/images/fraises.jpg'),
('Cerises', '06', '07', 'https://example.com/images/cerises.jpg'),
('Orange', '12', '03', 'https://example.com/images/orange.jpg'),
('Citron', '11', '04', 'https://example.com/images/citron.jpg'),
('Arachide','01','12','http://example.com/ing/arachide.jpg');

-- Allergènes (quelques-uns)
-- 1: Gluten, 2: Lactose, 3: Fruits a coque, 4: Arachides, 5: Crustacés
INSERT INTO "allergene" (label) VALUES
('Gluten'),
('Lactose'),
('Fruits a coque'),
('Arachides'),
('Crustacés');

-- Ustensiles (quelques-uns)
-- 1:Couteau, 2:Poêle, 3:Fouet, 4:Casserole, 5:Spatule, 6:Râpe, 7:Cuillère en bois
INSERT INTO "ustensile" (nom) VALUES
('Couteau'),
('Poêle'),
('Fouet'),
('Casserole'),
('Spatule'),
('Râpe'),
('Cuillère en bois'),
('Four'),
('Micro-onde');

INSERT INTO "tag" (label) VALUES
('Vegan'),
('Sans gluten'),
('Dessert'),
('Plat principal'),
('Entrée'),
('Rapide'),
('Épicé');


INSERT INTO "producteur_utilisateur" (id_producteur, id_utilisateur) VALUES
('6618f3e4-c492-474c-b925-1f4f1a0774c3','f47ac10b-58cc-4372-a567-0e02b2c3d479'), -- charlie->alice
('6618f3e4-c492-474c-b925-1f4f1a0774c3','c9bf9e57-1685-4c89-bafb-ff5af830be8a'), -- charlie->bob
('047b6cae-6140-49f7-8c66-ef6b66cbb441','2a0a11b7-a68c-4e21-92b4-7f7af6ffcd33'), -- georges->diane
('047b6cae-6140-49f7-8c66-ef6b66cbb441','50526064-7e17-4afe-9f21-f7100ab6fe62'); -- georges->eric

INSERT INTO "ingredient_produit" (id_producteur, id_ingredient) VALUES
('6618f3e4-c492-474c-b925-1f4f1a0774c3',1),
('6618f3e4-c492-474c-b925-1f4f1a0774c3',2),
('6618f3e4-c492-474c-b925-1f4f1a0774c3',3),
('047b6cae-6140-49f7-8c66-ef6b66cbb441',5),
('047b6cae-6140-49f7-8c66-ef6b66cbb441',6);

INSERT INTO "ingredient_produit" (id_producteur, id_ingredient) VALUES
('047b6cae-6140-49f7-8c66-ef6b66cbb441',4),
('047b6cae-6140-49f7-8c66-ef6b66cbb441',9),
('047b6cae-6140-49f7-8c66-ef6b66cbb441',10);

-- Créer plusieurs paniers pour chaque producteur
INSERT INTO "panier" (id_producteur, date) VALUES
('6618f3e4-c492-474c-b925-1f4f1a0774c3','2024-12-01'),
('6618f3e4-c492-474c-b925-1f4f1a0774c3','2024-12-05'),
('047b6cae-6140-49f7-8c66-ef6b66cbb441','2024-12-02'),
('047b6cae-6140-49f7-8c66-ef6b66cbb441','2024-12-06');

INSERT INTO "ingredient_panier" (id_panier, id_ingredient, quantite) VALUES
(1,1,'2kg'),
(1,2,'1kg'),
(2,3,'500g'),
(2,2,'500g'),
(3,4,'1pc'),
(3,6,'3pcs'),
(4,9,'50g'),
(4,10,'50g');

INSERT INTO "panier_utilisateur" (id_panier, id_utilisateur) VALUES
(1,'f47ac10b-58cc-4372-a567-0e02b2c3d479'),
(2,'c9bf9e57-1685-4c89-bafb-ff5af830be8a'),
(3,'2a0a11b7-a68c-4e21-92b4-7f7af6ffcd33'),
(4,'50526064-7e17-4afe-9f21-f7100ab6fe62');

INSERT INTO "recette" (nom, temps_preparation, complexite, id_createur, description, debut_saison, fin_saison, id_recette_parente, url_photo) VALUES
('Salade de Tomates',10,1,'f47ac10b-58cc-4372-a567-0e02b2c3d479','Une salade fraîche et simple','06','09',NULL,'http://example.com/recettes/salade_tomates.jpg'),
('Tarte aux Fraises',45,2,'c9bf9e57-1685-4c89-bafb-ff5af830be8a','Une tarte sucrée et fruitée','05','07',NULL,'http://example.com/recettes/tarte_fraises.jpg'),
('Salade de Tomates Revisitee',15,2,'f47ac10b-58cc-4372-a567-0e02b2c3d479','Une variante plus complexe','06','09',1,'http://example.com/recettes/salade_tomates_revisee.jpg'),
('Soupe de Carottes',30,1,'047b6cae-6140-49f7-8c66-ef6b66cbb441','Un velouté doux','04','11',NULL,'http://example.com/recettes/soupe_carottes.jpg'),
('Smoothie Menthe-Basilic',5,1,'9cbe2ee3-45eb-46ef-9ea1-59a01d6b4ff2','Une boisson rafraîchissante','05','09',NULL,'http://example.com/recettes/smoothie_menthe_basilic.jpg');

INSERT INTO "tag_recette" (id_tag, id_recette) VALUES
(1,1),(4,1),
(3,2),
(2,3),(5,3),
(1,4),(5,4),(6,4),
(1,5),(6,5),(7,5);

-- Commentaires
INSERT INTO "commentaire" (id_utilisateur, id_recette, contenu) VALUES
('c9bf9e57-1685-4c89-bafb-ff5af830be8a',1,'Délicieux et facile à préparer!'),
('2a0a11b7-a68c-4e21-92b4-7f7af6ffcd33',2,'Ma famille a adoré.'),
('50526064-7e17-4afe-9f21-f7100ab6fe62',4,'Parfait pour l''automne.');


INSERT INTO "favoris" (id_utilisateur, id_recette) VALUES
('f47ac10b-58cc-4372-a567-0e02b2c3d479',1),
('f47ac10b-58cc-4372-a567-0e02b2c3d479',4),
('c9bf9e57-1685-4c89-bafb-ff5af830be8a',2);

-- Notes
-- alice note Salade de Tomates(1)=5, bob note Tarte Fraises(2)=4, diane note Salade Revisitee(3)=3
INSERT INTO "note_recette" (id_utilisateur, id_recette, note) VALUES
('f47ac10b-58cc-4372-a567-0e02b2c3d479',1,5),
('c9bf9e57-1685-4c89-bafb-ff5af830be8a',2,4),
('2a0a11b7-a68c-4e21-92b4-7f7af6ffcd33',3,3);


-- Frigo des utilisateurs
-- alice a Tomate(1)=3kg, bob a Oignon(2)=2pcs, diane a Fraise(3)=250g, fanny a Laitue(4)=1pc
INSERT INTO "frigo" (id_utilisateur, id_ingredient, date_ajout, quantite) VALUES
('f47ac10b-58cc-4372-a567-0e02b2c3d479',1,'2024-12-10','3kg'),
('c9bf9e57-1685-4c89-bafb-ff5af830be8a',2,'2024-12-11','2pcs'),
('2a0a11b7-a68c-4e21-92b4-7f7af6ffcd33',3,'2024-12-12','250g'),
('84be57c6-4ef4-4381-bf05-a52139a50911',4,'2024-12-15','1pc');

INSERT INTO "ingredient_recette" (id_recette, id_ingredient, quantite) VALUES
(1,1,'200g'),
(1,2,'50g');

-- Recette 2(Tarte Fraises): Fraise(3)=300g
INSERT INTO "ingredient_recette" (id_recette, id_ingredient, quantite) VALUES
(2,3,'300g'),
(2,42,'10g');

-- Recette 3(Salade Revisitee): Tomate(1)=250g,Laitue(4)=100g
INSERT INTO "ingredient_recette" (id_recette, id_ingredient, quantite) VALUES
(3,1,'250g'),
(3,4,'100g');

-- Recette 4(Soupe Carottes): Carotte(6)=500g,Oignon(2)=100g
INSERT INTO "ingredient_recette" (id_recette, id_ingredient, quantite) VALUES
(4,6,'500g'),
(4,2,'100g');

-- Recette 5(Smoothie Menthe-Basilic): Menthe(9)=30g,Basilic(10)=30g,Pomme(5)=100g
INSERT INTO "ingredient_recette" (id_recette, id_ingredient, quantite) VALUES
(5,9,'30g'),
(5,10,'30g'),
(5,5,'100g');

INSERT INTO "ingredient_exclu" (id_ingredient, id_utilisateur) VALUES
(5,'f47ac10b-58cc-4372-a567-0e02b2c3d479'),
(6,'c9bf9e57-1685-4c89-bafb-ff5af830be8a');

-- Ustensile exclu par des utilisateurs
-- diane exclut le Fouet(3)
-- eric exclut la Râpe(6)
INSERT INTO "ustensile_exclu" (id_ustensile, id_utilisateur) VALUES
(3,'2a0a11b7-a68c-4e21-92b4-7f7af6ffcd33'),
(6,'50526064-7e17-4afe-9f21-f7100ab6fe62');

-- Ajouter un nouvel ingrédient pour démonstration d'allergène
-- 11:Arachide

INSERT INTO "allergene_ingredient" (id_ingredient, id_allergene) VALUES
(42,4);

INSERT INTO "ustensile_recette" (id_recette, id_ustensile) VALUES
(1,1),
(2,1),
(2,4),
(3,1),
(3,3),
(4,1),
(4,5),
(4,7),
(5,1),
(5,2),
(5,3);

-- Allergènes des utilisateurs
-- alice allergique au Lactose(2), bob allergique au Gluten(1), diane allergique aux Fruits a coque(3)
INSERT INTO "allergie_utilisateur" (id_allergene, id_utilisateur) VALUES
(2,'f47ac10b-58cc-4372-a567-0e02b2c3d479'),
(1,'c9bf9e57-1685-4c89-bafb-ff5af830be8a'),
(3,'2a0a11b7-a68c-4e21-92b4-7f7af6ffcd33');
