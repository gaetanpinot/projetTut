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

CREATE TABLE "recette" (
  "id" serial PRIMARY KEY,
  "nom" varchar,
  "temps_preparation" int,
  "complexite" int,
  "id_createur" uuid,
  "description" text,
  "debut_saison" date,
  "fin_saison" date,
  "id_recette_parente" int,
  "url_photo" varchar
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
  "debut_saison" date,
  "fin_saison" date,
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

CREATE TABLE "panier_utilisateur" (
  "panier_id" serial,
  "utilisateur_id" uuid,
  PRIMARY KEY ("panier_id", "utilisateur_id")
);

ALTER TABLE "panier_utilisateur" ADD FOREIGN KEY ("panier_id") REFERENCES "panier" ("id");

ALTER TABLE "panier_utilisateur" ADD FOREIGN KEY ("utilisateur_id") REFERENCES "utilisateur" ("id");


ALTER TABLE "recette" ADD FOREIGN KEY ("id_createur") REFERENCES "utilisateur" ("id");

ALTER TABLE "recette" ADD FOREIGN KEY ("id_recette_parente") REFERENCES "recette" ("id");

CREATE TABLE "tag_recette" (
  "tag_id" serial,
  "recette_id" serial,
  PRIMARY KEY ("tag_id", "recette_id")
);

ALTER TABLE "tag_recette" ADD FOREIGN KEY ("tag_id") REFERENCES "tag" ("id");

ALTER TABLE "tag_recette" ADD FOREIGN KEY ("recette_id") REFERENCES "recette" ("id");


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

CREATE TABLE "ingredient_allergene" (
  "ingredient_id" serial,
  "allergene_id" serial,
  PRIMARY KEY ("ingredient_id", "allergene_id")
);

ALTER TABLE "ingredient_allergene" ADD FOREIGN KEY ("ingredient_id") REFERENCES "ingredient" ("id");

ALTER TABLE "ingredient_allergene" ADD FOREIGN KEY ("allergene_id") REFERENCES "allergene" ("id");


CREATE TABLE "recette_ustensile" (
  "recette_id" serial,
  "ustensile_id" serial,
  PRIMARY KEY ("recette_id", "ustensile_id")
);

ALTER TABLE "recette_ustensile" ADD FOREIGN KEY ("recette_id") REFERENCES "recette" ("id");

ALTER TABLE "recette_ustensile" ADD FOREIGN KEY ("ustensile_id") REFERENCES "ustensile" ("id");


CREATE TABLE "allergene_utilisateur" (
  "allergene_id" serial,
  "utilisateur_id" uuid,
  PRIMARY KEY ("allergene_id", "utilisateur_id")
);

ALTER TABLE "allergene_utilisateur" ADD FOREIGN KEY ("allergene_id") REFERENCES "allergene" ("id");

ALTER TABLE "allergene_utilisateur" ADD FOREIGN KEY ("utilisateur_id") REFERENCES "utilisateur" ("id");


ALTER TABLE "ingredient_exclu" ADD FOREIGN KEY ("id_ingredient") REFERENCES "ingredient" ("id");

ALTER TABLE "ingredient_exclu" ADD FOREIGN KEY ("id_utilisateur") REFERENCES "utilisateur" ("id");

ALTER TABLE "ustensile_exclu" ADD FOREIGN KEY ("id_ustensile") REFERENCES "ustensile" ("id");

ALTER TABLE "ustensile_exclu" ADD FOREIGN KEY ("id_utilisateur") REFERENCES "utilisateur" ("id");
