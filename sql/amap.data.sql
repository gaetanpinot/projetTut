-- alice    : f47ac10b-58cc-4372-a567-0e02b2c3d479
-- bob      : c9bf9e57-1685-4c89-bafb-ff5af830be8a
-- charlie  : 6618f3e4-c492-474c-b925-1f4f1a0774c3 (producteur)
-- admin    : 9cbe2ee3-45eb-46ef-9ea1-59a01d6b4ff2
-- diane    : 2a0a11b7-a68c-4e21-92b4-7f7af6ffcd33
-- eric     : 50526064-7e17-4afe-9f21-f7100ab6fe62
-- fanny    : 84be57c6-4ef4-4381-bf05-a52139a50911
-- georges  : 047b6cae-6140-49f7-8c66-ef6b66cbb441

INSERT INTO "utilisateur" (id, nom_utilisateur, role, mot_de_passe) VALUES
('f47ac10b-58cc-4372-a567-0e02b2c3d479','alice',0,'$2y$10$uyYfJLlBRVN/ta3q15sLtuiT96gxzZe8XgXFwNmnpamWyjoqknggG'),
('c9bf9e57-1685-4c89-bafb-ff5af830be8a','bob',0,'$2y$10$uyYfJLlBRVN/ta3q15sLtuiT96gxzZe8XgXFwNmnpamWyjoqknggG'),
('6618f3e4-c492-474c-b925-1f4f1a0774c3','charlie',1,'$2y$10$uyYfJLlBRVN/ta3q15sLtuiT96gxzZe8XgXFwNmnpamWyjoqknggG'),
('9cbe2ee3-45eb-46ef-9ea1-59a01d6b4ff2','admin',2,'$2y$10$uyYfJLlBRVN/ta3q15sLtuiT96gxzZe8XgXFwNmnpamWyjoqknggG'),
('2a0a11b7-a68c-4e21-92b4-7f7af6ffcd33','diane',0,'$2y$10$uyYfJLlBRVN/ta3q15sLtuiT96gxzZe8XgXFwNmnpamWyjoqknggG'),
('50526064-7e17-4afe-9f21-f7100ab6fe62','eric',0,'$2y$10$uyYfJLlBRVN/ta3q15sLtuiT96gxzZe8XgXFwNmnpamWyjoqknggG'),
('84be57c6-4ef4-4381-bf05-a52139a50911','fanny',0,'$2y$10$uyYfJLlBRVN/ta3q15sLtuiT96gxzZe8XgXFwNmnpamWyjoqknggG'),
('047b6cae-6140-49f7-8c66-ef6b66cbb441','georges',1,'$2y$10$uyYfJLlBRVN/ta3q15sLtuiT96gxzZe8XgXFwNmnpamWyjoqknggG'); -- Georges est aussi producteur par ex

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

INSERT INTO "recette" ("id", "nom", "temps_preparation", "complexite", "id_createur", "description", "debut_saison", "fin_saison", "id_recette_parente", "url_photo") VALUES
(7,	'Gratin de pommes de terre',	45,	2,	NULL,	'Un gratin crémeux à base de pommes de terre et de fromage.',	8,	3,	NULL,	'https://assets.afcdn.com/recipe/20180123/77042_w1024h1024c1cx2625cy1750cxt0cyt0cxb5250cyb3500.jpg'),
(9,	'Ratatouille',	50,	3,	NULL,	'Un plat provençal avec tomates, courgettes et poivrons.',	6,	9,	NULL,	'https://cdn.loveandlemons.com/wp-content/uploads/2024/07/ratatouille.jpg'),
(10,	'Poulet au citron',	40,	2,	NULL,	'Un poulet tendre mariné au citron et à l’huile d’olive.',	11,	4,	NULL,	'https://img.cuisineaz.com/660x660/2013/12/20/i13051-poulet-citron.jpeg'),
(11,	'Quiche aux champignons',	45,	2,	NULL,	'Une quiche savoureuse aux champignons et à la crème fraîche.',	9,	12,	NULL,	'https://assets.afcdn.com/recipe/20221010/135915_w1024h1024c1cx999cy749cxt0cyt0cxb1999cyb1499.jpg'),
(12,	'Tarte aux fraises',	60,	3,	NULL,	'Une tarte gourmande garnie de fraises fraîches.',	5,	7,	NULL,	'https://assets.afcdn.com/recipe/20161116/53080_w1024h1024c1cx2808cy1872.jpg'),
(13,	'Pâtes à la sauce tomate',	25,	1,	NULL,	'Des pâtes savoureuses avec une sauce tomate maison.',	6,	9,	NULL,	'https://www.papillesetpupilles.fr/wp-content/uploads/2023/02/P%C3%A2tes-sauce-tomate-Copyright-Lablascovegmenu-CCBY20-.jpg'),
(14,	'Moules marinières',	30,	2,	NULL,	'Des moules cuites dans un bouillon parfumé à l’ail et au vin blanc.',	6,	2,	NULL,	'https://img.cuisineaz.com/660x660/2017/07/21/i130938-moules-marinieres-au-cookeo.jpeg'),
(16,	'Soupe à l’oignon',	40,	2,	NULL,	'Une soupe traditionnelle gratinée à l’oignon.',	1,	12,	NULL,	'https://assets.afcdn.com/recipe/20210104/116953_w1024h1024c1cx806cy863cxt0cyt382cxb1641cyb1350.jpg'),
(17,	'Tarte aux pommes',	50,	2,	NULL,	'Une tarte sucrée aux pommes caramélisées.',	9,	12,	NULL,	'https://assets.afcdn.com/recipe/20220128/128250_w1024h1024c1cx1294cy688cxt0cyt0cxb2037cyb1472.webp'),
(18,	'Bœuf bourguignon',	180,	4,	NULL,	'Un ragoût mijoté de bœuf et de vin rouge.',	1,	12,	NULL,	'https://assets.afcdn.com/recipe/20220707/133382_w1024h1024c1cx1396cy931cxt0cyt162cxb2162cyb1386.webp'),
(19,	'Clafoutis aux cerises',	45,	2,	NULL,	'Un dessert fondant avec des cerises fraîches.',	6,	7,	NULL,	'https://assets.afcdn.com/recipe/20180126/77154_w1024h1024c1cx2808cy1872cxt0cyt0cxb5616cyb3744.jpg'),
(21,	'Crème brûlée',	50,	3,	NULL,	'Un dessert onctueux avec une croûte de sucre caramélisé.',	1,	12,	NULL,	'https://www.markal.fr/application/files/medias_markal/recettes/988-recette-creme-brulee.jpg'),
(22,	'Gâteau au chocolat',	60,	2,	NULL,	'Un gâteau moelleux au chocolat noir.',	1,	12,	NULL,	'https://odelices.ouest-france.fr/images/recettes/2013/gateau_au_chocolat1.jpg'),
(23,	'Velouté de courgettes',	30,	1,	NULL,	'Une soupe veloutée de courgettes et crème fraîche.',	6,	9,	NULL,	'https://assets.afcdn.com/recipe/20200508/110752_w1024h1024c1cx960cy540cxt0cyt0cxb1920cyb1080.webp'),
(25,	'Galettes de pois chiches',	40,	2,	NULL,	'Des galettes croustillantes à base de pois chiches et d’épices.',	5,	8,	NULL,	'https://assets.tmecosys.com/image/upload/t_web767x639/img/recipe/ras/Assets/F5CE0B6C-392E-4766-9FEF-595802E0C0E6/Derivates/6669A720-8BB6-4A21-8A2A-41A10D6B9578.jpg'),
(26,	'Cookies maison',	30,	1,	NULL,	'Des cookies moelleux aux pépites de chocolat.',	1,	12,	NULL,	'https://assets.afcdn.com/recipe/20190529/93153_w1024h1024c1cx2220cy1728cxt0cyt0cxb4441cyb3456.jpg'),
(27,	'Poulet rôti',	90,	2,	NULL,	'Un poulet entier rôti avec des herbes et du beurre.',	1,	12,	NULL,	'https://img.cuisineaz.com/660x660/2016/10/23/i113627-poulet-roti-au-four.jpg'),
(29,	'Soupe de poireaux',	30,	1,	NULL,	'Une soupe légère aux poireaux et pommes de terre.',	1,	12,	NULL,	'https://fgdjrynm.filerobot.com/recipes/5e44c6fed4cffe8d5b0e60aece98fc485c933c922a9ebe29f8f14bb9f22a7d81.jpg?vh=d0afa2&h=800&w=800&q=60'),
(31,	'Tajine de poulet aux abricots',	120,	3,	NULL,	'Un plat marocain sucré-salé avec du poulet et des abricots.',	1,	12,	NULL,	'https://mccormick.widen.net/content/doccnjyvjs/original/tajine_de_poulet_au_citron_et_aux_olives_800x800.jpg'),
(32,	'Couscous végétarien',	50,	2,	NULL,	'Un couscous aux légumes de saison et pois chiches.',	5,	10,	NULL,	'https://assets.afcdn.com/recipe/20201207/116184_w1024h1024c1cx458cy1458cxt0cyt0cxb4005cyb3046.jpg'),
(34,	'Burger maison',	40,	2,	NULL,	'Un burger avec un steak haché maison et des légumes frais.',	1,	12,	NULL,	'https://img.cuisineaz.com/660x660/2016/05/21/i86551-burger-au-bacon-et-au-cheddar.jpg'),
(35,	'Paella aux fruits de mer',	60,	4,	NULL,	'Une paella espagnole avec crevettes, moules et calamars.',	6,	10,	NULL,	'https://cdn.pratico-pratiques.com/app/uploads/sites/4/2018/08/30191438/paella-traditionnelle-aux-fruits-de-mer.jpeg'),
(36,	'Lasagnes à la bolognaise',	90,	3,	NULL,	'Des lasagnes italiennes classiques avec une sauce bolognaise.',	1,	12,	NULL,	'https://assets.afcdn.com/recipe/20180119/76936_w1024h1024c1cx2680cy1786cxt0cyt0cxb5361cyb3573.webp'),
(38,	'Omelette aux herbes',	15,	1,	NULL,	'Une omelette légère agrémentée d’herbes fraîches.',	1,	12,	NULL,	'https://img.cuisineaz.com/660x660/2015/04/24/i97790-l-omelette-aux-fines-herbes-des-recettes-du-bonheur.jpg'),
(39,	'Pavé de bœuf sauce au poivre',	35,	3,	NULL,	'Un pavé de bœuf grillé servi avec une sauce crémeuse au poivre.',	1,	12,	NULL,	'https://images.radio-canada.ca/v1/alimentation/recette/1x1/contre-filet-boeuf-sauce-poivre-carottes-roties.jpg'),
(40,	'Bruschetta tomate mozzarella',	20,	1,	NULL,	'Des tranches de pain grillées garnies de tomates fraîches et mozzarella.',	6,	9,	NULL,	'https://assets.afcdn.com/recipe/20170112/42222_w1024h1024c1cx1500cy1000.jpg'),
(41,	'Gaspacho andalou',	15,	1,	NULL,	'Une soupe froide aux tomates et poivrons rouges, parfaite pour l’été.',	6,	9,	NULL,	'https://images.radio-canada.ca/v1/alimentation/1x1/gaspacho-tomate-soupe-froide-54503.jpg'),
(42,	'Chili con carne',	75,	3,	NULL,	'Un plat épicé de viande hachée, haricots rouges et tomates.',	1,	12,	NULL,	'https://assets.afcdn.com/recipe/20211222/126214_w1024h1024c1cx1124cy721cxt0cyt0cxb2119cyb1415.jpg'),
(6,	'Salade de tomates et basilic',	10,	1,	'9cbe2ee3-45eb-46ef-9ea1-59a01d6b4ff2',	'Une salade fraîche avec des tomates juteuses et du basilic parfumé.',	6,	9,	NULL,	'https://img.cuisineaz.com/660x660/2016/04/18/i76550-salade-de-tomates-au-basilic.jpg'),
(2,	'Tarte aux Fraises',	45,	2,	'c9bf9e57-1685-4c89-bafb-ff5af830be8a',	'Une tarte sucrée et fruitée',	5,	7,	NULL,	'https://assets.afcdn.com/recipe/20161116/53080_w1024h1024c1cx2808cy1872.jpg'),
(4,	'Soupe de Carottes',	30,	1,	'047b6cae-6140-49f7-8c66-ef6b66cbb441',	'Un velouté doux',	4,	11,	NULL,	'https://img.cuisineaz.com/660x660/2013/12/20/i78964-photo-de-soupe-aux-carottes.jpeg'),
(5,	'Smoothie Menthe-Basilic',	5,	1,	'9cbe2ee3-45eb-46ef-9ea1-59a01d6b4ff2',	'Une boisson rafraîchissante',	5,	9,	NULL,	'https://assets.afcdn.com/recipe/20100120/26542_w1024h1024c1cx256cy192.jpg'),
(48,	'Blinis au saumon fumé',	30,	2,	NULL,	'De petits blinis moelleux garnis de saumon fumé et de crème fraîche.',	1,	12,	NULL,	'https://assets.afcdn.com/recipe/20130924/35903_w1024h1024c1cx1416cy2128.webp'),
(49,	'Brownie au chocolat',	40,	2,	NULL,	'Un brownie fondant et gourmand au chocolat noir.',	1,	12,	NULL,	'https://img.cuisineaz.com/660x660/2013/12/20/i42812-brownie.jpeg'),
(1,	'Salade de Tomates',	10,	1,	'f47ac10b-58cc-4372-a567-0e02b2c3d479',	'Une salade fraîche et simple',	6,	9,	NULL,	'https://img.cuisineaz.com/660x660/2018/02/24/i135965-salade-tomate-mozzarella.jpeg'),
(3,	'Salade de Tomates Revisitee',	15,	2,	'f47ac10b-58cc-4372-a567-0e02b2c3d479',	'Une variante plus complexe',	6,	9,	1,	'https://www.tables-auberges.com/storage/uploads/2022/04/AdobeStock_232182614.jpeg'),
(8,	'Soupe de carottes',	30,	1,	NULL,	'Une soupe réconfortante avec des carottes et une touche de cumin.',	10,	4,	NULL,	'https://cdn.chefclub.tools/uploads/recipes/cover-thumbnail/64873260-9467-4214-abc0-dd8ef0860896.jpg'),
(15,	'Pain perdu au miel',	15,	1,	NULL,	'Une recette anti-gaspillage avec du pain rassis et du miel.',	1,	12,	NULL,	'https://recettes.belly-media.com/wp-content/uploads/2022/10/french-toast3-1280x1280.jpg'),
(20,	'Salade de brocoli',	20,	1,	NULL,	'Une salade croquante avec du brocoli et une sauce légère.',	9,	3,	NULL,	'https://cdn.pratico-pratiques.com/app/uploads/sites/2/2022/12/05142857/salade-de-brocoli-au-fromage-en-grains.jpg'),
(24,	'Filet de saumon grillé',	25,	2,	NULL,	'Un filet de saumon grillé avec une sauce citronnée.',	1,	12,	NULL,	'https://images.radio-canada.ca/v1/alimentation/recette/1x1/paves-saumon-grille-champignons-huile-amande.jpg'),
(28,	'Risotto aux champignons',	40,	3,	NULL,	'Un risotto crémeux aux champignons et au parmesan.',	9,	12,	NULL,	'https://assets.afcdn.com/recipe/20171019/73517_w1024h1024c1cx3000cy2000cxt0cyt0cxb6000cyb4000.jpg'),
(30,	'Salade de concombre et menthe',	10,	1,	NULL,	'Une salade rafraîchissante avec du concombre et de la menthe.',	5,	9,	NULL,	'https://cdn.pratico-pratiques.com/app/uploads/sites/3/2018/08/24081930/salade-de-concombres-olives-et-feta-550x550.jpeg'),
(33,	'Tarte salée aux épinards et fromage',	45,	2,	NULL,	'Une tarte feuilletée garnie d’épinards et de fromage.',	4,	9,	NULL,	'https://recettesdejulie.fr/wp-content/uploads/2019/10/tarte-epinards-4.jpg'),
(37,	'Salade de quinoa et légumes',	25,	1,	NULL,	'Une salade équilibrée avec du quinoa, des légumes croquants et une vinaigrette.',	5,	9,	NULL,	'https://assets.afcdn.com/recipe/20220805/134070_w1024h1024c1cx1218cy803cxt0cyt0cxb2121cyb1414.jpg'),
(43,	'Riz cantonais',	30,	2,	NULL,	'Un riz sauté avec des œufs, petits pois, jambon et crevettes.',	1,	12,	NULL,	'https://assets.afcdn.com/recipe/20200907/114005_w1024h1024c1cx540cy960cxt0cyt0cxb1080cyb1920.jpg'),
(44,	'Gâteau aux carottes',	60,	3,	NULL,	'Un gâteau moelleux aux carottes et aux épices, surmonté d’un glaçage.',	1,	12,	NULL,	'https://cdn.pratico-pratiques.com/app/uploads/sites/2/2018/08/27231215/gateau-aux-carottes-nouveau515.jpeg'),
(45,	'Taboulé libanais',	20,	1,	NULL,	'Une salade fraîche de persil, menthe, tomates et boulgour.',	5,	10,	NULL,	'https://assets.afcdn.com/recipe/20200518/111358_w1024h1024c1cx540cy960cxt0cyt0cxb1080cyb1920.webp'),
(46,	'Tarte au citron meringuée',	70,	4,	NULL,	'Une tarte sucrée au citron avec une meringue dorée.',	11,	4,	NULL,	'https://cdn.chefclub.tools/uploads/recipes/cover-thumbnail/9b334398-8b7a-49c0-ae79-b0ab1f2ea22b_JSoQmra.jpg'),
(47,	'Gratin de courgettes',	45,	2,	NULL,	'Un gratin savoureux avec des courgettes fondantes et du fromage.',	6,	9,	NULL,	'https://assets.afcdn.com/recipe/20190529/93185_w1024h1024c1cx2736cy1824cxt0cyt0cxb5472cyb3648.jpg');
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
('f47ac10b-58cc-4372-a567-0e02b2c3d479',1,1739891035,'3kg'),
('c9bf9e57-1685-4c89-bafb-ff5af830be8a',2,1739804635,'2pcs'),
('2a0a11b7-a68c-4e21-92b4-7f7af6ffcd33',3,1739804635,'250g'),
('84be57c6-4ef4-4381-bf05-a52139a50911',4,1737126235,'1pc');

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
(5,'2a0a11b7-a68c-4e21-92b4-7f7af6ffcd33'),
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
