-- Utilisateurs (environ 8 utilisateurs)
-- UUID v4 générés (exemples) : 
-- "xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx" où x est hex et y = 8,9,A ou B
-- Quelques UUID v4 générés via un générateur externe (exemples) :
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

-- Ingrédients (une dizaine)
-- IDs auto-increment:
-- 1: Tomate, 2: Oignon, 3: Fraise, 4: Laitue, 5: Pomme, 6: Carotte, 7: Courgette, 8: Poire, 9: Menthe, 10: Basilic
INSERT INTO "ingredient" (nom, debut_saison, fin_saison, url_photo) VALUES
('Tomate','2024-06-01','2024-09-30','http://example.com/ing/tomate.jpg'),
('Oignon','2024-01-01','2024-12-31','http://example.com/ing/oignon.jpg'),
('Fraise','2024-05-01','2024-07-31','http://example.com/ing/fraise.jpg'),
('Laitue','2024-03-01','2024-10-31','http://example.com/ing/laitue.jpg'),
('Pomme','2024-09-01','2024-11-30','http://example.com/ing/pomme.jpg'),
('Carotte','2024-04-01','2024-11-30','http://example.com/ing/carotte.jpg'),
('Courgette','2024-06-01','2024-09-30','http://example.com/ing/courgette.jpg'),
('Poire','2024-08-01','2024-10-31','http://example.com/ing/poire.jpg'),
('Menthe','2024-05-01','2024-09-30','http://example.com/ing/menthe.jpg'),
('Basilic','2024-05-01','2024-09-30','http://example.com/ing/basilic.jpg');

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
('Cuillère en bois');

-- Tags (quelques-uns)
-- 1: Vegan, 2: Sans gluten, 3: Dessert, 4: Plat principal, 5: Entrée, 6: Rapide, 7: Épicé
INSERT INTO "tag" (label) VALUES
('Vegan'),
('Sans gluten'),
('Dessert'),
('Plat principal'),
('Entrée'),
('Rapide'),
('Épicé');


-- producteur_utilisateur : relier des producteurs à des utilisateurs
-- charlie (6618f3e4...) et georges (047b6cae...) sont producteurs
INSERT INTO "producteur_utilisateur" (id_producteur, id_utilisateur) VALUES
('6618f3e4-c492-474c-b925-1f4f1a0774c3','f47ac10b-58cc-4372-a567-0e02b2c3d479'), -- charlie->alice
('6618f3e4-c492-474c-b925-1f4f1a0774c3','c9bf9e57-1685-4c89-bafb-ff5af830be8a'), -- charlie->bob
('047b6cae-6140-49f7-8c66-ef6b66cbb441','2a0a11b7-a68c-4e21-92b4-7f7af6ffcd33'), -- georges->diane
('047b6cae-6140-49f7-8c66-ef6b66cbb441','50526064-7e17-4afe-9f21-f7100ab6fe62'); -- georges->eric

-- ingredient_produit : lier producteurs à ingrédients
-- charlie produit : Tomate(1), Oignon(2), Fraise(3)
INSERT INTO "ingredient_produit" (id_producteur, id_ingredient) VALUES
('6618f3e4-c492-474c-b925-1f4f1a0774c3',1),
('6618f3e4-c492-474c-b925-1f4f1a0774c3',2),
('6618f3e4-c492-474c-b925-1f4f1a0774c3',3);

-- georges produit : Laitue(4), Carotte(6), Menthe(9), Basilic(10)
INSERT INTO "ingredient_produit" (id_producteur, id_ingredient) VALUES
('047b6cae-6140-49f7-8c66-ef6b66cbb441',4),
('047b6cae-6140-49f7-8c66-ef6b66cbb441',6),
('047b6cae-6140-49f7-8c66-ef6b66cbb441',9),
('047b6cae-6140-49f7-8c66-ef6b66cbb441',10);

-- Créer plusieurs paniers pour chaque producteur
INSERT INTO "panier" (id_producteur, date) VALUES
('6618f3e4-c492-474c-b925-1f4f1a0774c3','2024-12-01'),
('6618f3e4-c492-474c-b925-1f4f1a0774c3','2024-12-05'),
('047b6cae-6140-49f7-8c66-ef6b66cbb441','2024-12-02'),
('047b6cae-6140-49f7-8c66-ef6b66cbb441','2024-12-06');

-- On a maintenant 4 paniers (id=1,2 pour charlie et id=3,4 pour georges)

-- Ingredients dans les paniers
-- Panier 1 (charlie) : Tomate(1)=2kg, Oignon(2)=1kg
INSERT INTO "ingredient_panier" (id_panier, id_ingredient, quantite) VALUES
(1,1,'2kg'),
(1,2,'1kg');

-- Panier 2 (charlie) : Fraise(3)=500g, Oignon(2)=500g
INSERT INTO "ingredient_panier" (id_panier, id_ingredient, quantite) VALUES
(2,3,'500g'),
(2,2,'500g');

-- Panier 3 (georges) : Laitue(4)=1pc, Carotte(6)=3pcs
INSERT INTO "ingredient_panier" (id_panier, id_ingredient, quantite) VALUES
(3,4,'1pc'),
(3,6,'3pcs');

-- Panier 4 (georges) : Menthe(9)=50g, Basilic(10)=50g
INSERT INTO "ingredient_panier" (id_panier, id_ingredient, quantite) VALUES
(4,9,'50g'),
(4,10,'50g');

-- Lier paniers aux utilisateurs
-- Panier 1 -> alice
-- Panier 2 -> bob
-- Panier 3 -> diane
-- Panier 4 -> eric
INSERT INTO "panier_utilisateur" (panier_id, utilisateur_id) VALUES
(1,'f47ac10b-58cc-4372-a567-0e02b2c3d479'),
(2,'c9bf9e57-1685-4c89-bafb-ff5af830be8a'),
(3,'2a0a11b7-a68c-4e21-92b4-7f7af6ffcd33'),
(4,'50526064-7e17-4afe-9f21-f7100ab6fe62');

-- Créer des recettes
-- 1: Salade de Tomates
-- 2: Tarte aux Fraises
-- 3: Salade de Tomates Revisitee
-- 4: Soupe de Carottes
-- 5: Smoothie Menthe-Basilic
INSERT INTO "recette" (nom, temps_preparation, complexite, id_createur, description, debut_saison, fin_saison, id_recette_parente, url_photo) VALUES
('Salade de Tomates',10,1,'f47ac10b-58cc-4372-a567-0e02b2c3d479','Une salade fraîche et simple','2024-06-01','2024-09-30',NULL,'http://example.com/recettes/salade_tomates.jpg'),
('Tarte aux Fraises',45,2,'c9bf9e57-1685-4c89-bafb-ff5af830be8a','Une tarte sucrée et fruitée','2024-05-01','2024-07-31',NULL,'http://example.com/recettes/tarte_fraises.jpg'),
('Salade de Tomates Revisitee',15,2,'f47ac10b-58cc-4372-a567-0e02b2c3d479','Une variante plus complexe','2024-06-01','2024-09-30',1,'http://example.com/recettes/salade_tomates_revisee.jpg'),
('Soupe de Carottes',30,1,'047b6cae-6140-49f7-8c66-ef6b66cbb441','Un velouté doux','2024-04-01','2024-11-30',NULL,'http://example.com/recettes/soupe_carottes.jpg'),
('Smoothie Menthe-Basilic',5,1,'9cbe2ee3-45eb-46ef-9ea1-59a01d6b4ff2','Une boisson rafraîchissante','2024-05-01','2024-09-30',NULL,'http://example.com/recettes/smoothie_menthe_basilic.jpg');

-- Tags de recettes
-- Salade Tomates(1): Vegan(1), Plat principal(4)
-- Tarte Fraises(2): Dessert(3)
-- Salade Revisitee(3): Sans gluten(2), Entrée(5)
-- Soupe Carottes(4): Vegan(1), Entrée(5), Rapide(6)
-- Smoothie Menthe-Basilic(5): Vegan(1), Rapide(6), Épicé(7) [juste pour varier]
INSERT INTO "tag_recette" (tag_id, recette_id) VALUES
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


-- Favoris
-- alice fav: Salade Tomates(1), Soupe Carottes(4)
-- bob fav: Tarte Fraises(2)
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

-- Ingrédients des recettes
-- Recette 1(Salade Tomates): Tomate(1)=200g,Oignon(2)=50g
INSERT INTO "ingredient_recette" (id_recette, id_ingredient, quantite) VALUES
(1,1,'200g'),
(1,2,'50g');

-- Recette 2(Tarte Fraises): Fraise(3)=300g
INSERT INTO "ingredient_recette" (id_recette, id_ingredient, quantite) VALUES
(2,3,'300g');

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

-- Ingrédient exclu par des utilisateurs
-- alice exclut la Pomme(5)
-- bob exclut la Carotte(6)
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
INSERT INTO "ingredient" (nom, debut_saison, fin_saison, url_photo) VALUES
('Arachide','2024-01-01','2024-12-31','http://example.com/ing/arachide.jpg');

-- Lier un ingrédient à un allergène
-- Arachide=11, Arachides allergène=4
INSERT INTO "ingredient_allergene" (ingredient_id, allergene_id) VALUES
(11,4);

-- Ustensiles utilisés dans les recettes (recette_ustensile)
-- Recette 1(Salade Tomates): Couteau(1)
INSERT INTO "recette_ustensile" (recette_id, ustensile_id) VALUES
(1,1);

-- Recette 2(Tarte Fraises): Couteau(1), Casserole(4)
INSERT INTO "recette_ustensile" (recette_id, ustensile_id) VALUES
(2,1),
(2,4);

-- Recette 3(Salade Revisitee): Couteau(1), Fouet(3)
INSERT INTO "recette_ustensile" (recette_id, ustensile_id) VALUES
(3,1),
(3,3);

-- Recette 4(Soupe Carottes): Couteau(1), Spatule(5), Cuillère en bois(7)
INSERT INTO "recette_ustensile" (recette_id, ustensile_id) VALUES
(4,1),
(4,5),
(4,7);

-- Recette 5(Smoothie Menthe-Basilic): Couteau(1), Poêle(2) [pour faire griller un peu la menthe, imagination], Fouet(3)
INSERT INTO "recette_ustensile" (recette_id, ustensile_id) VALUES
(5,1),
(5,2),
(5,3);

-- Allergènes des utilisateurs
-- alice allergique au Lactose(2), bob allergique au Gluten(1), diane allergique aux Fruits a coque(3)
INSERT INTO "allergene_utilisateur" (allergene_id, utilisateur_id) VALUES
(2,'f47ac10b-58cc-4372-a567-0e02b2c3d479'),
(1,'c9bf9e57-1685-4c89-bafb-ff5af830be8a'),
(3,'2a0a11b7-a68c-4e21-92b4-7f7af6ffcd33');
