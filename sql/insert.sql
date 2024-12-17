INSERT INTO "public"."recette" 
("id", "nom", "temps_preparation", "complexite", "id_createur", "description", "id_recette_parente", "type", "url_photo")
VALUES
(1, 'Soupe de légumes', 30, 2, '2a8d962e-9c7f-452f-9033-c11d102a9c51', 'Une soupe saine et savoureuse à base de légumes frais.', NULL, 'entrée', 'https://example.com/soupe_legumes.jpg'),
(2, 'Ratatouille', 45, 3, '7e3b60e2-b1a6-4a9e-8261-91d72b52348a', 'Un classique provençal aux légumes du soleil.', NULL, 'plat_principal', 'https://example.com/ratatouille.jpg'),
(3, 'Quiche Lorraine', 60, 4, 'fc7b459e-5e29-4c1a-b5e0-91ed7f8dc6b3', 'Une quiche gourmande aux lardons et à la crème.', NULL, 'entrée', 'https://example.com/quiche_lorraine.jpg'),
(4, 'Poulet rôti au citron', 40, 3, '2a8d962e-9c7f-452f-9033-c11d102a9c51', 'Un poulet juteux rôti avec du citron et des herbes.', NULL, 'plat_principal', 'https://example.com/poulet_citron.jpg'),
(5, 'Salade César', 20, 1, '7e3b60e2-b1a6-4a9e-8261-91d72b52348a', 'Une salade croquante avec poulet, parmesan et croûtons.', NULL, 'entrée', 'https://example.com/salade_cesar.jpg'),
(6, 'Gâteau au chocolat fondant', 50, 3, 'fc7b459e-5e29-4c1a-b5e0-91ed7f8dc6b3', 'Un gâteau fondant au chocolat noir, simple et délicieux.', NULL, 'dessert', 'https://example.com/gateau_chocolat.jpg'),
(7, 'Crêpes sucrées', 25, 2, '7e3b60e2-b1a6-4a9e-8261-91d72b52348a', 'De délicieuses crêpes fines et moelleuses.', NULL, 'dessert', 'https://example.com/crepes.jpg'),
(8, 'Tarte Tatin', 45, 3, 'fc7b459e-5e29-4c1a-b5e0-91ed7f8dc6b3', 'Tarte aux pommes caramélisées cuite à l’envers.', NULL, 'dessert', 'https://example.com/tarte_tatin.jpg'),
(9, 'Gratin dauphinois', 50, 3, '2a8d962e-9c7f-452f-9033-c11d102a9c51', 'Un gratin crémeux aux pommes de terre et à la crème.', NULL, 'plat_principal', 'https://example.com/gratin_dauphinois.jpg'),
(10, 'Bœuf Bourguignon', 180, 5, '7e3b60e2-b1a6-4a9e-8261-91d72b52348a', 'Un plat mijoté avec du bœuf, des carottes et du vin rouge.', NULL, 'plat_principal', 'https://example.com/boeuf_bourguignon.jpg'),
(11, 'Pizza Margarita', 30, 2, 'fc7b459e-5e29-4c1a-b5e0-91ed7f8dc6b3', 'Pizza classique avec sauce tomate, mozzarella et basilic.', NULL, 'plat_principal', 'https://example.com/pizza_margarita.jpg'),
(12, 'Lasagnes à la bolognaise', 90, 4, '2a8d962e-9c7f-452f-9033-c11d102a9c51', 'Lasagnes savoureuses avec bolognaise et béchamel.', NULL, 'plat_principal', 'https://example.com/lasagnes.jpg'),
(13, 'Couscous royal', 120, 5, '7e3b60e2-b1a6-4a9e-8261-91d72b52348a', 'Couscous garni de légumes et de viandes variées.', NULL, 'plat_principal', 'https://example.com/couscous.jpg'),
(14, 'Poulet au curry', 35, 3, 'fc7b459e-5e29-4c1a-b5e0-91ed7f8dc6b3', 'Un poulet mijoté avec une sauce au curry épicée.', NULL, 'plat_principal', 'https://example.com/poulet_curry.jpg'),
(15, 'Tiramisu classique', 30, 3, '2a8d962e-9c7f-452f-9033-c11d102a9c51', 'Dessert italien à base de mascarpone et de café.', NULL, 'dessert', 'https://example.com/tiramisu.jpg'),
(16, 'Risotto aux champignons', 40, 4, '7e3b60e2-b1a6-4a9e-8261-91d72b52348a', 'Un risotto crémeux parfumé aux champignons.', NULL, 'plat_principal', 'https://example.com/risotto.jpg'),
(17, 'Escalope milanaise', 30, 3, 'fc7b459e-5e29-4c1a-b5e0-91ed7f8dc6b3', 'Une escalope de veau panée et dorée à la perfection.', NULL, 'plat_principal', 'https://example.com/escalope.jpg'),
(18, 'Fondue savoyarde', 60, 4, '2a8d962e-9c7f-452f-9033-c11d102a9c51', 'Un mélange onctueux de fromages fondus pour tremper du pain.', NULL, 'plat_principal', 'https://example.com/fondue.jpg'),
(19, 'Mousse au chocolat', 20, 2, '7e3b60e2-b1a6-4a9e-8261-91d72b52348a', 'Une mousse légère et aérienne au chocolat noir.', NULL, 'dessert', 'https://example.com/mousse_chocolat.jpg'),
(20, 'Paella espagnole', 120, 5, 'fc7b459e-5e29-4c1a-b5e0-91ed7f8dc6b3', 'Un plat de riz aux fruits de mer et poulet.', NULL, 'plat_principal', 'https://example.com/paella.jpg'),
(21, 'Blanquette de veau', 90, 4, '2a8d962e-9c7f-452f-9033-c11d102a9c51', 'Un mijoté de veau tendre avec une sauce crémeuse.', NULL, 'plat_principal', 'https://example.com/blanquette.jpg'),
(22, 'Gratin de courgettes', 45, 3, '7e3b60e2-b1a6-4a9e-8261-91d72b52348a', 'Des courgettes gratinées avec du fromage fondant.', NULL, 'plat_principal', 'https://example.com/gratin_courgettes.jpg'),
(23, 'Tarte aux fraises', 30, 2, 'fc7b459e-5e29-4c1a-b5e0-91ed7f8dc6b3', 'Une tarte légère garnie de fraises fraîches.', NULL, 'dessert', 'https://example.com/tarte_fraises.jpg'),
(24, 'Burger maison', 35, 2, '2a8d962e-9c7f-452f-9033-c11d102a9c51', 'Un burger généreux avec steak, salade et fromage.', NULL, 'plat_principal', 'https://example.com/burger.jpg'),
(25, 'Croque-Monsieur', 15, 1, '2a8d962e-9c7f-452f-9033-c11d102a9c51', 'Un sandwich grillé au jambon et fromage.', NULL, 'plat_principal', 'https://example.com/croque_monsieur.jpg'),
(26, 'Bœuf Stroganoff', 45, 3, '7e3b60e2-b1a6-4a9e-8261-91d72b52348a', 'Un plat russe crémeux avec du bœuf et des champignons.', NULL, 'plat_principal', 'https://example.com/boeuf_stroganoff.jpg'),
(27, 'Saumon grillé aux herbes', 30, 2, 'fc7b459e-5e29-4c1a-b5e0-91ed7f8dc6b3', 'Filet de saumon grillé assaisonné aux herbes fraîches.', NULL, 'plat_principal', 'https://example.com/saumon_herbes.jpg'),
(28, 'Salade de fruits frais', 15, 1, '2a8d962e-9c7f-452f-9033-c11d102a9c51', 'Un mélange de fruits de saison rafraîchissant.', NULL, 'dessert', 'https://example.com/salade_fruits.jpg'),
(29, 'Steak frites', 25, 2, '7e3b60e2-b1a6-4a9e-8261-91d72b52348a', 'Un steak juteux accompagné de frites dorées.', NULL, 'plat_principal', 'https://example.com/steak_frites.jpg'),
(30, 'Galettes de pommes de terre', 35, 2, 'fc7b459e-5e29-4c1a-b5e0-91ed7f8dc6b3', 'Des galettes croustillantes et dorées.', NULL, 'entrée', 'https://example.com/galettes_pdt.jpg'),
(31, 'Crème brûlée', 45, 3, '2a8d962e-9c7f-452f-9033-c11d102a9c51', 'Une crème douce avec une croûte caramélisée.', NULL, 'dessert', 'https://example.com/creme_brulee.jpg'),
(32, 'Poulet basquaise', 50, 3, '7e3b60e2-b1a6-4a9e-8261-91d72b52348a', 'Poulet mijoté avec poivrons et tomates.', NULL, 'plat_principal', 'https://example.com/poulet_basquaise.jpg'),
(33, 'Spaghetti bolognaise', 40, 2, 'fc7b459e-5e29-4c1a-b5e0-91ed7f8dc6b3', 'Pâtes à la sauce bolognaise maison.', NULL, 'plat_principal', 'https://example.com/spaghetti_bolognaise.jpg'),
(34, 'Velouté de potiron', 30, 2, '2a8d962e-9c7f-452f-9033-c11d102a9c51', 'Une soupe onctueuse au potiron et crème.', NULL, 'entrée', 'https://example.com/veloute_potiron.jpg'),
(35, 'Escargots à la bourguignonne', 25, 4, '7e3b60e2-b1a6-4a9e-8261-91d72b52348a', 'Escargots cuits avec beurre persillé.', NULL, 'entrée', 'https://example.com/escargots.jpg'),
(36, 'Riz cantonais', 30, 2, 'fc7b459e-5e29-4c1a-b5e0-91ed7f8dc6b3', 'Un riz sauté avec petits pois, jambon et œufs.', NULL, 'plat_principal', 'https://example.com/riz_cantonais.jpg'),
(37, 'Burger végétarien', 35, 2, '2a8d962e-9c7f-452f-9033-c11d102a9c51', 'Un burger garni de légumes grillés et fromage.', NULL, 'plat_principal', 'https://example.com/burger_vege.jpg'),
(38, 'Gratin de poisson', 45, 3, '7e3b60e2-b1a6-4a9e-8261-91d72b52348a', 'Filets de poisson gratinés avec une sauce béchamel.', NULL, 'plat_principal', 'https://example.com/gratin_poisson.jpg'),
(39, 'Sushi maison', 60, 5, 'fc7b459e-5e29-4c1a-b5e0-91ed7f8dc6b3', 'Sushis traditionnels avec poisson frais et riz.', NULL, 'plat_principal', 'https://example.com/sushi.jpg'),
(40, 'Gratin de pâtes au fromage', 30, 2, '2a8d962e-9c7f-452f-9033-c11d102a9c51', 'Un gratin généreux avec des pâtes et du fromage fondant.', NULL, 'plat_principal', 'https://example.com/gratin_pates.jpg'),
(41, 'Moules marinières', 25, 3, '7e3b60e2-b1a6-4a9e-8261-91d72b52348a', 'Des moules cuites au vin blanc et persil.', NULL, 'plat_principal', 'https://example.com/moules.jpg'),
(42, 'Clafoutis aux cerises', 40, 3, 'fc7b459e-5e29-4c1a-b5e0-91ed7f8dc6b3', 'Un dessert léger avec des cerises fraîches.', NULL, 'dessert', 'https://example.com/clafoutis.jpg'),
(43, 'Pain perdu', 20, 1, '2a8d962e-9c7f-452f-9033-c11d102a9c51', 'Un dessert rapide et gourmand pour recycler le pain.', NULL, 'dessert', 'https://example.com/pain_perdu.jpg'),
(44, 'Tajine de poulet aux abricots', 60, 4, '7e3b60e2-b1a6-4a9e-8261-91d72b52348a', 'Poulet mijoté avec abricots et épices douces.', NULL, 'plat_principal', 'https://example.com/tajine_poulet.jpg'),
(45, 'Œufs cocotte', 20, 2, 'fc7b459e-5e29-4c1a-b5e0-91ed7f8dc6b3', 'Œufs cuits au four avec crème et fromage.', NULL, 'entrée', 'https://example.com/oeufs_cocotte.jpg'),
(46, 'Poulet rôti aux herbes', 45, 2, '2a8d962e-9c7f-452f-9033-c11d102a9c51', 'Un poulet rôti croustillant parfumé aux herbes.', NULL, 'plat_principal', 'https://example.com/poulet_roti.jpg'),
(47, 'Baba au rhum', 50, 3, '7e3b60e2-b1a6-4a9e-8261-91d72b52348a', 'Un gâteau moelleux imbibé de rhum.', NULL, 'dessert', 'https://example.com/baba_rhum.jpg'),
(48, 'Rouleaux de printemps', 25, 3, 'fc7b459e-5e29-4c1a-b5e0-91ed7f8dc6b3', 'Des rouleaux frais garnis de crevettes et légumes.', NULL, 'entrée', 'https://example.com/rouleaux.jpg'),
(49, 'Flan pâtissier', 45, 2, '2a8d962e-9c7f-452f-9033-c11d102a9c51', 'Un flan crémeux avec une croûte sablée.', NULL, 'dessert', 'https://example.com/flan.jpg'),
(50, 'Risotto aux asperges', 40, 3, '7e3b60e2-b1a6-4a9e-8261-91d72b52348a', 'Un risotto crémeux agrémenté d’asperges fraîches.', NULL, 'plat_principal', 'https://example.com/risotto_asperges.jpg');

INSERT INTO "public"."ingredient_recette" ("id_recette", "id_ingredient", "quantite")
VALUES
-- Soupe de légumes (Recette 1)
(1, 1, '3 pièces'),    -- Tomate
(1, 2, '200g'),        -- Carotte
(1, 4, '1 pièce'),     -- Oignon
(1, 6, '3 pièces'),    -- Pommes de terre
(1, 37, '2 cuillères à soupe'), -- Huile d’olive

-- Ratatouille (Recette 2)
(2, 1, '4 pièces'),    -- Tomate
(2, 3, '300g'),        -- Courgette
(2, 10, '2 pièces'),   -- Poivron
(2, 4, '1 pièce'),     -- Oignon
(2, 37, '3 cuillères à soupe'), -- Huile d’olive

-- Quiche Lorraine (Recette 3)
(3, 20, '4 pièces'),   -- Œufs
(3, 22, '100g'),       -- Beurre
(3, 23, '200ml'),      -- Crème fraîche
(3, 19, '150g'),       -- Farine
(3, 26, '150g'),       -- Lardons (Bœuf)

-- Poulet rôti au citron (Recette 4)
(4, 25, '4 morceaux'), -- Poulet
(4, 50, '1 pièce'),    -- Citron
(4, 37, '2 cuillères à soupe'), -- Huile d’olive
(4, 33, '1 pincée'),   -- Poivre
(4, 35, '1 cuillère à café'), -- Cumin

-- Salade César (Recette 5)
(5, 25, '2 morceaux'), -- Poulet
(5, 12, '50g'),        -- Persil
(5, 30, '2 tranches'), -- Pain (croûtons)
(5, 23, '50ml'),       -- Crème fraîche
(5, 24, '100g'),       -- Fromage

-- Gâteau au chocolat (Recette 6)
(6, 20, '4 pièces'),   -- Œufs
(6, 42, '200g'),       -- Chocolat
(6, 19, '200g'),       -- Farine
(6, 40, '150g'),       -- Sucre
(6, 22, '100g'),       -- Beurre

-- Crêpes sucrées (Recette 7)
(7, 20, '3 pièces'),   -- Œufs
(7, 19, '200g'),       -- Farine
(7, 21, '500ml'),      -- Lait
(7, 40, '50g'),        -- Sucre
(7, 22, '50g'),        -- Beurre

-- Tarte Tatin (Recette 8)
(8, 44, '4 pièces'),   -- Pommes
(8, 19, '200g'),       -- Farine
(8, 22, '100g'),       -- Beurre
(8, 40, '100g'),       -- Sucre
(8, 36, '1 cuillère à café'), -- Cannelle

-- Gratin dauphinois (Recette 9)
(9, 6, '5 pièces'),    -- Pommes de terre
(9, 23, '200ml'),      -- Crème fraîche
(9, 24, '100g'),       -- Fromage
(9, 22, '50g'),        -- Beurre
(9, 33, '1 pincée'),   -- Poivre

-- Bœuf Bourguignon (Recette 10)
(10, 26, '500g'),      -- Bœuf
(10, 4, '1 pièce'),    -- Oignon
(10, 1, '2 pièces'),   -- Tomate
(10, 37, '2 cuillères à soupe'), -- Huile d’olive
(10, 33, '1 pincée'),  -- Poivre

-- Velouté de potiron (Recette 11)
(11, 6, '4 pièces'),   -- Potiron
(11, 23, '150ml'),     -- Crème fraîche
(11, 22, '30g'),       -- Beurre
(11, 33, '1 pincée'),  -- Poivre
(11, 32, '1 pincée'),  -- Sel

-- Spaghetti Bolognaise (Recette 12)
(12, 31, '200g'),      -- Pâtes
(12, 26, '200g'),      -- Bœuf
(12, 1, '2 pièces'),   -- Tomate
(12, 4, '1 pièce'),    -- Oignon
(12, 37, '2 cuillères à soupe'), -- Huile d’olive

-- Risotto aux champignons (Recette 13)
(13, 16, '200g'),      -- Riz
(13, 7, '150g'),       -- Champignons
(13, 23, '100ml'),     -- Crème fraîche
(13, 24, '50g'),       -- Fromage
(13, 22, '30g'),       -- Beurre

-- Saumon grillé (Recette 14)
(14, 28, '2 filets'),  -- Saumon
(14, 50, '1 pièce'),   -- Citron
(14, 37, '2 cuillères à soupe'), -- Huile d’olive
(14, 12, '10g'),       -- Persil
(14, 33, '1 pincée'),  -- Poivre

-- Couscous royal (Recette 15)
(15, 26, '200g'),      -- Bœuf
(15, 2, '150g'),       -- Carotte
(15, 18, '100g'),      -- Pois chiches
(15, 35, '1 cuillère à café'), -- Cumin
(15, 37, '2 cuillères à soupe'), -- Huile d’olive

-- Fondue savoyarde (Recette 16)
(16, 24, '300g'),      -- Fromage
(16, 30, '1 baguette'),-- Pain
(16, 37, '1 cuillère à soupe'), -- Huile d’olive
(16, 33, '1 pincée'),  -- Poivre
(16, 32, '1 pincée'),  -- Sel

-- Paella (Recette 17)
(17, 16, '300g'),      -- Riz
(17, 27, '200g'),      -- Poisson
(17, 29, '150g'),      -- Crevettes
(17, 4, '1 pièce'),    -- Oignon
(17, 10, '1 pièce'),   -- Poivron

-- Recette 18 : Croque-Monsieur
(18, 30, '2 tranches'),  -- Pain
(18, 24, '50g'),         -- Fromage
(18, 26, '50g'),         -- Jambon
(18, 22, '10g'),         -- Beurre

-- Recette 19 : Burger végétarien
(19, 30, '1 pain burger'), -- Pain
(19, 3, '100g'),           -- Courgette
(19, 10, '1 pièce'),       -- Poivron
(19, 24, '30g'),           -- Fromage
(19, 37, '1 cuillère à soupe'), -- Huile d’olive

-- Recette 20 : Pizza Margarita
(20, 1, '2 pièces'),      -- Tomate
(20, 19, '150g'),         -- Farine
(20, 24, '100g'),         -- Fromage
(20, 13, '20g'),          -- Basilic
(20, 37, '1 cuillère à soupe'), -- Huile d’olive

-- Recette 21 : Galettes de pommes de terre
(21, 6, '3 pièces'),      -- Pommes de terre
(21, 20, '1 pièce'),      -- Œuf
(21, 22, '20g'),          -- Beurre
(21, 33, '1 pincée'),     -- Poivre
(21, 32, '1 pincée'),     -- Sel

-- Recette 22 : Poulet basquaise
(22, 25, '2 morceaux'),   -- Poulet
(22, 10, '1 pièce'),      -- Poivron
(22, 4, '1 pièce'),       -- Oignon
(22, 37, '2 cuillères à soupe'), -- Huile d’olive
(22, 1, '2 pièces'),      -- Tomate

-- Recette 23 : Risotto aux asperges
(23, 16, '200g'),         -- Riz
(23, 7, '100g'),          -- Asperges
(23, 23, '100ml'),        -- Crème fraîche
(23, 24, '50g'),          -- Fromage
(23, 37, '1 cuillère à soupe'), -- Huile d’olive

-- Recette 24 : Paella espagnole
(24, 16, '250g'),         -- Riz
(24, 27, '150g'),         -- Poisson
(24, 29, '100g'),         -- Crevettes
(24, 10, '1 pièce'),      -- Poivron
(24, 37, '2 cuillères à soupe'), -- Huile d’olive

-- Recette 25 : Gratin de courgettes
(25, 3, '3 pièces'),      -- Courgette
(25, 24, '100g'),         -- Fromage
(25, 23, '150ml'),        -- Crème fraîche
(25, 22, '30g'),          -- Beurre
(25, 33, '1 pincée'),     -- Poivre

-- Recette 26 : Clafoutis aux cerises
(26, 47, '300g'),         -- Cerises
(26, 20, '3 pièces'),     -- Œufs
(26, 40, '100g'),         -- Sucre
(26, 19, '100g'),         -- Farine
(26, 22, '50g'),          -- Beurre

-- Recette 27 : Tajine de poulet aux abricots
(27, 25, '2 morceaux'),   -- Poulet
(27, 37, '1 cuillère à soupe'), -- Huile d’olive
(27, 40, '50g'),          -- Sucre
(27, 35, '1 cuillère à café'), -- Cumin
(27, 39, '50g'),          -- Miel

-- Recette 28 : Sushi maison
(28, 16, '200g'),         -- Riz
(28, 28, '100g'),         -- Saumon
(28, 12, '10g'),          -- Persil
(28, 37, '1 cuillère à soupe'), -- Huile d’olive
(28, 32, '1 pincée'),     -- Sel

-- Recette 29 : Blanquette de veau
(29, 26, '300g'),         -- Veau
(29, 23, '200ml'),        -- Crème fraîche
(29, 6, '2 pièces'),      -- Pommes de terre
(29, 4, '1 pièce'),       -- Oignon
(29, 37, '1 cuillère à soupe'), -- Huile d’olive

-- Recette 30 : Mousse au chocolat
(30, 42, '200g'),         -- Chocolat
(30, 20, '3 pièces'),     -- Œufs
(30, 40, '50g'),          -- Sucre
(30, 23, '50ml'),         -- Crème fraîche

-- Recette 31 : Fondue savoyarde
(31, 24, '300g'),         -- Fromage
(31, 30, '1 baguette'),   -- Pain
(31, 37, '1 cuillère à soupe'), -- Huile d’olive
(31, 32, '1 pincée'),     -- Sel

-- Recette 32 : Gratin de pâtes au fromage
(32, 31, '200g'),         -- Pâtes
(32, 24, '150g'),         -- Fromage
(32, 23, '100ml'),        -- Crème fraîche
(32, 22, '30g'),          -- Beurre
(32, 33, '1 pincée'),     -- Poivre

-- Recette 33 : Velouté de brocolis
(33, 8, '300g'),          -- Brocoli
(33, 23, '100ml'),        -- Crème fraîche
(33, 22, '20g'),          -- Beurre
(33, 32, '1 pincée'),     -- Sel
(33, 33, '1 pincée'),     -- Poivre

-- Recette 34 : Saumon grillé au citron
(34, 28, '2 filets'),     -- Saumon
(34, 50, '1 pièce'),      -- Citron
(34, 37, '1 cuillère à soupe'), -- Huile d’olive
(34, 12, '10g'),          -- Persil

-- Recette 35 : Omelette aux herbes
(35, 20, '3 pièces'),     -- Œufs
(35, 12, '20g'),          -- Persil
(35, 22, '20g'),          -- Beurre
(35, 33, '1 pincée'),     -- Poivre

-- Recette 36 : Riz cantonais
(36, 16, '200g'),         -- Riz
(36, 20, '2 pièces'),     -- Œufs
(36, 26, '100g'),         -- Jambon
(36, 2, '50g'),           -- Carottes
(36, 32, '1 pincée'),     -- Sel

-- Recette 37 : Gratin de poisson
(37, 27, '2 filets'),     -- Poisson
(37, 23, '150ml'),        -- Crème fraîche
(37, 24, '100g'),         -- Fromage
(37, 6, '2 pièces'),      -- Pommes de terre
(37, 33, '1 pincée'),     -- Poivre

-- Recette 38 : Escalope milanaise
(38, 26, '200g'),         -- Escalope de bœuf
(38, 19, '100g'),         -- Farine
(38, 20, '2 pièces'),     -- Œufs
(38, 22, '30g'),          -- Beurre
(38, 32, '1 pincée'),     -- Sel

-- Recette 39 : Baba au rhum
(39, 20, '4 pièces'),     -- Œufs
(39, 19, '150g'),         -- Farine
(39, 40, '100g'),         -- Sucre
(39, 36, '50ml'),         -- Rhum
(39, 22, '50g'),          -- Beurre

-- Recette 40 : Rouleaux de printemps
(40, 29, '100g'),         -- Crevettes
(40, 3, '50g'),           -- Courgettes
(40, 10, '1 pièce'),      -- Poivron
(40, 16, '50g'),          -- Riz
(40, 12, '10g'),          -- Persil

-- Recette 41 : Flan pâtissier
(41, 20, '3 pièces'),     -- Œufs
(41, 19, '100g'),         -- Farine
(41, 40, '80g'),          -- Sucre
(41, 21, '250ml'),        -- Lait
(41, 22, '20g'),          -- Beurre

-- Recette 42 : Poulet rôti aux herbes
(42, 25, '2 morceaux'),   -- Poulet
(42, 50, '1 pièce'),      -- Citron
(42, 12, '20g'),          -- Persil
(42, 37, '2 cuillères à soupe'), -- Huile d’olive
(42, 33, '1 pincée'),     -- Poivre

-- Recette 43 : Gratin de courge
(43, 6, '2 pièces'),      -- Pommes de terre
(43, 3, '200g'),          -- Courgette
(43, 23, '150ml'),        -- Crème fraîche
(43, 24, '100g'),         -- Fromage
(43, 33, '1 pincée'),     -- Poivre

-- Recette 44 : Moules marinières
(44, 41, '500g'),         -- Moules
(44, 4, '1 pièce'),       -- Oignon
(44, 37, '2 cuillères à soupe'), -- Huile d’olive
(44, 32, '1 pincée'),     -- Sel
(44, 33, '1 pincée'),     -- Poivre

-- Recette 45 : Pain perdu
(45, 30, '4 tranches'),   -- Pain
(45, 20, '2 pièces'),     -- Œufs
(45, 21, '100ml'),        -- Lait
(45, 40, '50g'),          -- Sucre
(45, 22, '20g'),          -- Beurre

-- Recette 46 : Salade de fruits frais
(46, 44, '1 pièce'),      -- Pomme
(46, 45, '1 pièce'),      -- Banane
(46, 46, '100g'),         -- Fraises
(46, 49, '1 pièce'),      -- Orange
(46, 50, '1 pièce'),      -- Citron

-- Recette 47 : Velouté de chou-fleur
(47, 9, '300g'),          -- Chou-fleur
(47, 4, '1 pièce'),       -- Oignon
(47, 23, '150ml'),        -- Crème fraîche
(47, 22, '20g'),          -- Beurre
(47, 32, '1 pincée'),     -- Sel

-- Recette 48 : Spaghetti carbonara
(48, 31, '200g'),         -- Pâtes
(48, 26, '100g'),         -- Lardons (bœuf)
(48, 20, '2 pièces'),     -- Œufs
(48, 23, '50ml'),         -- Crème fraîche
(48, 33, '1 pincée'),     -- Poivre

-- Recette 49 : Tiramisu
(49, 20, '4 pièces'),     -- Œufs
(49, 23, '200g'),         -- Crème fraîche
(49, 40, '100g'),         -- Sucre
(49, 42, '100g'),         -- Chocolat
(49, 41, '50ml'),         -- Café

-- Recette 50 : Ratatouille express
(50, 1, '2 pièces'),      -- Tomates
(50, 3, '2 pièces'),      -- Courgettes
(50, 10, '1 pièce'),      -- Poivron
(50, 4, '1 pièce'),       -- Oignon
(50, 37, '2 cuillères à soupe'); -- Huile d’olive


INSERT INTO "public"."ustensile" ("id", "nom")
VALUES
(1, 'Couteau de chef'),
(2, 'Planche à découper'),
(3, 'Poêle'),
(4, 'Casserole'),
(5, 'Mixeur plongeant'),
(6, 'Four'),
(7, 'Moule à gâteau'),
(8, 'Spatule en bois'),
(9, 'Cuillère en bois'),
(10, 'Fouet'),
(11, 'Râpe'),
(12, 'Éplucheur'),
(13, 'Passoire'),
(14, 'Saladier'),
(15, 'Balance de cuisine'),
(16, 'Loupe à soupe'),
(17, 'Cocotte en fonte'),
(18, 'Plaque de cuisson'),
(19, 'Bol doseur'),
(20, 'Tamis');


INSERT INTO "public"."ustensile_recette" ("id_recette", "id_ustensile")
VALUES
-- Recette 1 : Soupe de légumes
(1, 4), -- Casserole
(1, 5), -- Mixeur plongeant
(1, 9), -- Cuillère en bois

-- Recette 2 : Ratatouille
(2, 3), -- Poêle
(2, 4), -- Casserole
(2, 9), -- Cuillère en bois

-- Recette 3 : Quiche Lorraine
(3, 6), -- Four
(3, 7), -- Moule à gâteau
(3, 8), -- Spatule en bois
(3, 15), -- Balance de cuisine

-- Recette 4 : Poulet rôti au citron
(4, 6), -- Four
(4, 3), -- Poêle
(4, 8), -- Spatule en bois

-- Recette 5 : Salade César
(5, 2), -- Planche à découper
(5, 1), -- Couteau de chef
(5, 14), -- Saladier

-- Recette 6 : Gâteau au chocolat
(6, 6), -- Four
(6, 7), -- Moule à gâteau
(6, 10), -- Fouet
(6, 15), -- Balance de cuisine

-- Recette 7 : Crêpes sucrées
(7, 3), -- Poêle
(7, 10), -- Fouet
(7, 19), -- Bol doseur

-- Recette 8 : Tarte Tatin
(8, 6), -- Four
(8, 7), -- Moule à gâteau
(8, 10), -- Fouet
(8, 8), -- Spatule en bois

-- Recette 9 : Gratin dauphinois
(9, 6), -- Four
(9, 4), -- Casserole
(9, 17), -- Cocotte en fonte

-- Recette 10 : Bœuf Bourguignon
(10, 17), -- Cocotte en fonte
(10, 4), -- Casserole
(10, 9), -- Cuillère en bois

-- Recette 11 : Velouté de potiron
(11, 4), -- Casserole
(11, 5), -- Mixeur plongeant
(11, 9), -- Cuillère en bois

-- Recette 12 : Spaghetti Bolognaise
(12, 4), -- Casserole
(12, 3), -- Poêle
(12, 2), -- Planche à découper

-- Recette 13 : Risotto aux champignons
(13, 4), -- Casserole
(13, 8), -- Spatule en bois
(13, 15), -- Balance de cuisine

-- Recette 14 : Saumon grillé
(14, 3), -- Poêle
(14, 2), -- Planche à découper
(14, 1), -- Couteau de chef

-- Recette 15 : Couscous royal
(15, 17), -- Cocotte en fonte
(15, 4), -- Casserole
(15, 8), -- Spatule en bois

-- Recette 16 : Fondue savoyarde
(16, 17), -- Cocotte en fonte
(16, 14), -- Saladier
(16, 8), -- Spatule en bois

-- Recette 17 : Paella
(17, 3), -- Poêle
(17, 17), -- Cocotte en fonte
(17, 8), -- Spatule en bois

-- Recette 18 : Croque-Monsieur
(18, 3), -- Poêle
(18, 6), -- Four
(18, 8), -- Spatule en bois

-- Recette 19 : Burger végétarien
(19, 2), -- Planche à découper
(19, 1), -- Couteau de chef
(19, 3), -- Poêle

-- Recette 20 : Pizza Margarita
(20, 6), -- Four
(20, 7), -- Moule à gâteau
(20, 8), -- Spatule en bois

-- Recette 21 : Galettes de pommes de terre
(21, 3), -- Poêle
(21, 12), -- Éplucheur
(21, 8), -- Spatule en bois

-- Recette 22 : Poulet basquaise
(22, 3), -- Poêle
(22, 4), -- Casserole
(22, 8), -- Spatule en bois

-- Recette 23 : Risotto aux asperges
(23, 4), -- Casserole
(23, 8), -- Spatule en bois
(23, 15), -- Balance de cuisine

-- Recette 24 : Paella espagnole
(24, 3), -- Poêle
(24, 17), -- Cocotte en fonte
(24, 2), -- Planche à découper

-- Recette 25 : Gratin de courgettes
(25, 6), -- Four
(25, 4), -- Casserole
(25, 7), -- Moule à gâteau

-- Recette 26 : Clafoutis aux cerises
(26, 6),  -- Four
(26, 7),  -- Moule à gâteau
(26, 10), -- Fouet
(26, 15), -- Balance de cuisine

-- Recette 27 : Tajine de poulet aux abricots
(27, 17), -- Cocotte en fonte
(27, 1),  -- Couteau de chef
(27, 2),  -- Planche à découper
(27, 8),  -- Spatule en bois

-- Recette 28 : Sushi maison
(28, 1),  -- Couteau de chef
(28, 2),  -- Planche à découper
(28, 13), -- Passoire
(28, 15), -- Balance de cuisine

-- Recette 29 : Blanquette de veau
(29, 17), -- Cocotte en fonte
(29, 4),  -- Casserole
(29, 8),  -- Spatule en bois
(29, 9),  -- Cuillère en bois

-- Recette 30 : Mousse au chocolat
(30, 10), -- Fouet
(30, 14), -- Saladier
(30, 19), -- Bol doseur
(30, 6),  -- Four (optionnel pour chocolat fondu)

-- Recette 31 : Fondue savoyarde
(31, 17), -- Cocotte en fonte
(31, 8),  -- Spatule en bois
(31, 14), -- Saladier

-- Recette 32 : Gratin de pâtes au fromage
(32, 6),  -- Four
(32, 4),  -- Casserole
(32, 7),  -- Moule à gratin
(32, 8),  -- Spatule en bois

-- Recette 33 : Velouté de brocolis
(33, 4),  -- Casserole
(33, 5),  -- Mixeur plongeant
(33, 9),  -- Cuillère en bois

-- Recette 34 : Saumon grillé au citron
(34, 3),  -- Poêle
(34, 2),  -- Planche à découper
(34, 1),  -- Couteau de chef

-- Recette 35 : Omelette aux herbes
(35, 3),  -- Poêle
(35, 10), -- Fouet
(35, 14), -- Saladier

-- Recette 36 : Riz cantonais
(36, 4),  -- Casserole
(36, 3),  -- Poêle
(36, 2),  -- Planche à découper
(36, 1),  -- Couteau de chef

-- Recette 37 : Gratin de poisson
(37, 6),  -- Four
(37, 7),  -- Moule à gratin
(37, 4),  -- Casserole

-- Recette 38 : Escalope milanaise
(38, 3),  -- Poêle
(38, 1),  -- Couteau de chef
(38, 2),  -- Planche à découper

-- Recette 39 : Baba au rhum
(39, 6),  -- Four
(39, 7),  -- Moule à gâteau
(39, 10), -- Fouet
(39, 19), -- Bol doseur

-- Recette 40 : Rouleaux de printemps
(40, 2),  -- Planche à découper
(40, 1),  -- Couteau de chef
(40, 14), -- Saladier

-- Recette 41 : Flan pâtissier
(41, 6),  -- Four
(41, 7),  -- Moule à gâteau
(41, 10), -- Fouet
(41, 19), -- Bol doseur

-- Recette 42 : Poulet rôti aux herbes
(42, 6),  -- Four
(42, 3),  -- Poêle
(42, 8),  -- Spatule en bois

-- Recette 43 : Gratin de courge
(43, 6),  -- Four
(43, 4),  -- Casserole
(43, 7),  -- Moule à gratin

-- Recette 44 : Moules marinières
(44, 4),  -- Casserole
(44, 13), -- Passoire
(44, 9),  -- Cuillère en bois

-- Recette 45 : Pain perdu
(45, 3),  -- Poêle
(45, 10), -- Fouet
(45, 14), -- Saladier

-- Recette 46 : Salade de fruits frais
(46, 1),  -- Couteau de chef
(46, 2),  -- Planche à découper
(46, 14), -- Saladier

-- Recette 47 : Velouté de chou-fleur
(47, 4),  -- Casserole
(47, 5),  -- Mixeur plongeant
(47, 9),  -- Cuillère en bois

-- Recette 48 : Spaghetti carbonara
(48, 4),  -- Casserole
(48, 3),  -- Poêle
(48, 9),  -- Cuillère en bois

-- Recette 49 : Tiramisu
(49, 14), -- Saladier
(49, 10), -- Fouet
(49, 19), -- Bol doseur

-- Recette 50 : Ratatouille express
(50, 3),  -- Poêle
(50, 2),  -- Planche à découper
(50, 9),  -- Cuillère en bois
(50, 1);  -- Couteau de chef
