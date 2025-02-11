drop table if exists
 allergene,
 allergene_ingredient,
 allergie_utilisateur,
 commentaire,
 favoris,
 frigo,
 ingredient,
 ingredient_exclu,
 ingredient_panier,
 ingredient_produit,
 ingredient_recette,
 note_recette,
 panier,
 panier_utilisateur,
 producteur_utilisateur,
 recette,
 tag,
 tag_recette,
 ustensile,
 ustensile_exclu,
 ustensile_recette,
 utilisateur CASCADE;

CREATE TABLE "utilisateur" (
  "id" uuid PRIMARY KEY,
  "nom_utilisateur" varchar UNIQUE,
  "role" int,
  "mot_de_passe" varchar
);

CREATE TABLE "ingredient_produit" (
  "id_producteur" uuid,
  "id_ingredient" int,
  PRIMARY KEY ("id_producteur", "id_ingredient")
);

CREATE TABLE "producteur_utilisateur" (
  "id_producteur" uuid,
  "id_utilisateur" uuid,
  PRIMARY KEY ("id_producteur", "id_utilisateur")
);

CREATE TABLE "panier" (
  "id" serial PRIMARY KEY,
  "id_producteur" uuid,
  "date" date
);

CREATE TABLE "ingredient_panier" (
  "id_panier" int,
  "id_ingredient" int,
  "quantite" varchar,
  PRIMARY KEY ("id_panier", "id_ingredient")
);

CREATE TABLE "panier_utilisateur" (
  "id_utilisateur" uuid,
  "id_panier" int,
  PRIMARY KEY ("id_utilisateur", "id_panier")
);

CREATE TABLE "recette" (
  "id" serial PRIMARY KEY,
  "nom" varchar,
  "temps_preparation" int,
  "complexite" int,
  "id_createur" uuid,
  "description" text,
  "debut_saison" int,
  "fin_saison" int,
  "id_recette_parente" int,
  "url_photo" varchar
);

CREATE TABLE "tag_recette" (
  "id_tag" int,
  "id_recette" int,
  PRIMARY KEY ("id_tag", "id_recette")
);

CREATE TABLE "tag" (
  "id" serial PRIMARY KEY,
  "label" varchar UNIQUE
);

CREATE TABLE "commentaire" (
  "id" serial PRIMARY KEY,
  "id_utilisateur" uuid,
  "id_recette" int,
  "contenu" text
);

CREATE TABLE "favoris" (
  "id_utilisateur" uuid,
  "id_recette" int,
  PRIMARY KEY ("id_utilisateur", "id_recette")
);

CREATE TABLE "ustensile" (
  "id" serial PRIMARY KEY,
  "nom" varchar UNIQUE
);

CREATE TABLE "ingredient" (
  "id" serial PRIMARY KEY,
  "nom" varchar UNIQUE,
  "debut_saison" int,
  "fin_saison" int,
  "url_photo" varchar
);

CREATE TABLE "note_recette" (
  "id_utilisateur" uuid,
  "id_recette" int,
  "note" int,
  PRIMARY KEY ("id_utilisateur", "id_recette")
);

CREATE TABLE "allergene" (
  "id" serial PRIMARY KEY,
  "label" varchar UNIQUE
);

CREATE TABLE "frigo" (
  "id_utilisateur" uuid,
  "id_ingredient" int,
  "date_ajout" date,
  "quantite" varchar,
  PRIMARY KEY ("id_utilisateur", "id_ingredient", "date_ajout")
);

CREATE TABLE "ingredient_recette" (
  "id_recette" int,
  "id_ingredient" int,
  "quantite" varchar,
  PRIMARY KEY ("id_recette", "id_ingredient")
);

CREATE TABLE "allergene_ingredient" (
  "id_ingredient" int,
  "id_allergene" int,
  PRIMARY KEY ("id_ingredient", "id_allergene")
);

CREATE TABLE "ustensile_recette" (
  "id_recette" int,
  "id_ustensile" int,
  PRIMARY KEY ("id_recette", "id_ustensile")
);

CREATE TABLE "allergie_utilisateur" (
  "id_allergene" int,
  "id_utilisateur" uuid,
  PRIMARY KEY ("id_allergene", "id_utilisateur")
);

CREATE TABLE "ingredient_exclu" (
  "id_ingredient" int,
  "id_utilisateur" uuid,
  PRIMARY KEY ("id_ingredient", "id_utilisateur")
);

CREATE TABLE "ustensile_exclu" (
  "id_ustensile" int,
  "id_utilisateur" uuid,
  PRIMARY KEY ("id_ustensile", "id_utilisateur")
);

ALTER TABLE "ingredient_produit" ADD FOREIGN KEY ("id_producteur") REFERENCES "utilisateur" ("id");

ALTER TABLE "ingredient_produit" ADD FOREIGN KEY ("id_ingredient") REFERENCES "ingredient" ("id");

ALTER TABLE "producteur_utilisateur" ADD FOREIGN KEY ("id_producteur") REFERENCES "utilisateur" ("id");

ALTER TABLE "producteur_utilisateur" ADD FOREIGN KEY ("id_utilisateur") REFERENCES "utilisateur" ("id");

ALTER TABLE "panier" ADD FOREIGN KEY ("id_producteur") REFERENCES "utilisateur" ("id");

ALTER TABLE "ingredient_panier" ADD FOREIGN KEY ("id_panier") REFERENCES "panier" ("id");

ALTER TABLE "ingredient_panier" ADD FOREIGN KEY ("id_ingredient") REFERENCES "ingredient" ("id");

ALTER TABLE "panier_utilisateur" ADD FOREIGN KEY ("id_utilisateur") REFERENCES "utilisateur" ("id");

ALTER TABLE "panier_utilisateur" ADD FOREIGN KEY ("id_panier") REFERENCES "panier" ("id");

ALTER TABLE "recette" ADD FOREIGN KEY ("id_createur") REFERENCES "utilisateur" ("id");

ALTER TABLE "recette" ADD FOREIGN KEY ("id_recette_parente") REFERENCES "recette" ("id");

ALTER TABLE "tag_recette" ADD FOREIGN KEY ("id_tag") REFERENCES "tag" ("id");

ALTER TABLE "tag_recette" ADD FOREIGN KEY ("id_recette") REFERENCES "recette" ("id");

ALTER TABLE "commentaire" ADD FOREIGN KEY ("id_utilisateur") REFERENCES "utilisateur" ("id");

ALTER TABLE "commentaire" ADD FOREIGN KEY ("id_recette") REFERENCES "recette" ("id");

ALTER TABLE "favoris" ADD FOREIGN KEY ("id_utilisateur") REFERENCES "utilisateur" ("id");

ALTER TABLE "favoris" ADD FOREIGN KEY ("id_recette") REFERENCES "recette" ("id");

ALTER TABLE "note_recette" ADD FOREIGN KEY ("id_utilisateur") REFERENCES "utilisateur" ("id");

ALTER TABLE "note_recette" ADD FOREIGN KEY ("id_recette") REFERENCES "recette" ("id");

ALTER TABLE "frigo" ADD FOREIGN KEY ("id_utilisateur") REFERENCES "utilisateur" ("id");

ALTER TABLE "frigo" ADD FOREIGN KEY ("id_ingredient") REFERENCES "ingredient" ("id");

ALTER TABLE "ingredient_recette" ADD FOREIGN KEY ("id_recette") REFERENCES "recette" ("id");

ALTER TABLE "ingredient_recette" ADD FOREIGN KEY ("id_ingredient") REFERENCES "ingredient" ("id");

ALTER TABLE "allergene_ingredient" ADD FOREIGN KEY ("id_ingredient") REFERENCES "ingredient" ("id");

ALTER TABLE "allergene_ingredient" ADD FOREIGN KEY ("id_allergene") REFERENCES "allergene" ("id");

ALTER TABLE "ustensile_recette" ADD FOREIGN KEY ("id_recette") REFERENCES "recette" ("id");

ALTER TABLE "ustensile_recette" ADD FOREIGN KEY ("id_ustensile") REFERENCES "ustensile" ("id");

ALTER TABLE "allergie_utilisateur" ADD FOREIGN KEY ("id_allergene") REFERENCES "allergene" ("id");

ALTER TABLE "allergie_utilisateur" ADD FOREIGN KEY ("id_utilisateur") REFERENCES "utilisateur" ("id");

ALTER TABLE "ingredient_exclu" ADD FOREIGN KEY ("id_ingredient") REFERENCES "ingredient" ("id");

ALTER TABLE "ingredient_exclu" ADD FOREIGN KEY ("id_utilisateur") REFERENCES "utilisateur" ("id");

ALTER TABLE "ustensile_exclu" ADD FOREIGN KEY ("id_ustensile") REFERENCES "ustensile" ("id");

ALTER TABLE "ustensile_exclu" ADD FOREIGN KEY ("id_utilisateur") REFERENCES "utilisateur" ("id");
