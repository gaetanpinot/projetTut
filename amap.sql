-- Adminer 4.8.1 PostgreSQL 17.2 (Debian 17.2-1.pgdg120+1) dump

DROP TABLE IF EXISTS "allergene";
DROP SEQUENCE IF EXISTS allergene_id_seq;
CREATE SEQUENCE allergene_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."allergene" (
    "id" integer DEFAULT nextval('allergene_id_seq') NOT NULL,
    "labelle" character varying,
    CONSTRAINT "allergene_labelle_key" UNIQUE ("labelle"),
    CONSTRAINT "allergene_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "allergene_utilisateur";
DROP SEQUENCE IF EXISTS allergene_utilisateur_allergene_id_seq;
CREATE SEQUENCE allergene_utilisateur_allergene_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."allergene_utilisateur" (
    "allergene_id" integer DEFAULT nextval('allergene_utilisateur_allergene_id_seq') NOT NULL,
    "utilisateur_id" uuid NOT NULL,
    CONSTRAINT "allergene_utilisateur_pkey" PRIMARY KEY ("allergene_id", "utilisateur_id")
) WITH (oids = false);


DROP TABLE IF EXISTS "commentaire";
DROP SEQUENCE IF EXISTS commentaire_id_seq;
CREATE SEQUENCE commentaire_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."commentaire" (
    "id" integer DEFAULT nextval('commentaire_id_seq') NOT NULL,
    "id_utilisateur" uuid,
    "id_recette" integer,
    "contenu" text,
    CONSTRAINT "commentaire_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "favoris";
CREATE TABLE "public"."favoris" (
    "id_utilisateur" uuid NOT NULL,
    "id_recette" integer NOT NULL,
    CONSTRAINT "favoris_pkey" PRIMARY KEY ("id_utilisateur", "id_recette")
) WITH (oids = false);


DROP TABLE IF EXISTS "frigo";
CREATE TABLE "public"."frigo" (
    "id_utilisateur" uuid NOT NULL,
    "id_ingredient" integer NOT NULL,
    "date_ajout" date NOT NULL,
    "quantite" character varying,
    CONSTRAINT "frigo_pkey" PRIMARY KEY ("id_utilisateur", "id_ingredient", "date_ajout")
) WITH (oids = false);


DROP TABLE IF EXISTS "ingredient";
DROP SEQUENCE IF EXISTS ingredient_id_seq;
CREATE SEQUENCE ingredient_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."ingredient" (
    "id" integer DEFAULT nextval('ingredient_id_seq') NOT NULL,
    "nom" character varying,
    "debut_saison" date,
    "fin_saison" date,
    "url_photo" character varying,
    CONSTRAINT "ingredient_nom_key" UNIQUE ("nom"),
    CONSTRAINT "ingredient_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "ingredient_allergene";
DROP SEQUENCE IF EXISTS ingredient_allergene_ingredient_id_seq;
CREATE SEQUENCE ingredient_allergene_ingredient_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

DROP SEQUENCE IF EXISTS ingredient_allergene_allergene_id_seq;
CREATE SEQUENCE ingredient_allergene_allergene_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."ingredient_allergene" (
    "ingredient_id" integer DEFAULT nextval('ingredient_allergene_ingredient_id_seq') NOT NULL,
    "allergene_id" integer DEFAULT nextval('ingredient_allergene_allergene_id_seq') NOT NULL,
    CONSTRAINT "ingredient_allergene_pkey" PRIMARY KEY ("ingredient_id", "allergene_id")
) WITH (oids = false);


DROP TABLE IF EXISTS "ingredient_exclu";
CREATE TABLE "public"."ingredient_exclu" (
    "id_ingredient" integer NOT NULL,
    "id_utilisateur" uuid NOT NULL,
    CONSTRAINT "ingredient_exclu_pkey" PRIMARY KEY ("id_ingredient", "id_utilisateur")
) WITH (oids = false);


DROP TABLE IF EXISTS "ingredient_panier";
CREATE TABLE "public"."ingredient_panier" (
    "id_panier" integer NOT NULL,
    "id_ingredient" integer NOT NULL,
    "quantite" character varying,
    CONSTRAINT "ingredient_panier_pkey" PRIMARY KEY ("id_panier", "id_ingredient")
) WITH (oids = false);


DROP TABLE IF EXISTS "ingredient_produit";
CREATE TABLE "public"."ingredient_produit" (
    "id_producteur" uuid NOT NULL,
    "id_ingredient" integer NOT NULL,
    CONSTRAINT "ingredient_produit_pkey" PRIMARY KEY ("id_producteur", "id_ingredient")
) WITH (oids = false);


DROP TABLE IF EXISTS "ingredient_recette";
CREATE TABLE "public"."ingredient_recette" (
    "id_recette" integer NOT NULL,
    "id_ingredient" integer NOT NULL,
    "quantite" character varying,
    CONSTRAINT "ingredient_recette_pkey" PRIMARY KEY ("id_recette", "id_ingredient")
) WITH (oids = false);


DROP TABLE IF EXISTS "note_recette";
CREATE TABLE "public"."note_recette" (
    "id_utilisateur" uuid NOT NULL,
    "id_recette" integer NOT NULL,
    "note" integer,
    CONSTRAINT "note_recette_pkey" PRIMARY KEY ("id_utilisateur", "id_recette")
) WITH (oids = false);


DROP TABLE IF EXISTS "panier";
DROP SEQUENCE IF EXISTS panier_id_seq;
CREATE SEQUENCE panier_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."panier" (
    "id" integer DEFAULT nextval('panier_id_seq') NOT NULL,
    "id_producteur" uuid,
    "date" date,
    CONSTRAINT "panier_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "panier_utilisateur";
DROP SEQUENCE IF EXISTS panier_utilisateur_panier_id_seq;
CREATE SEQUENCE panier_utilisateur_panier_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."panier_utilisateur" (
    "panier_id" integer DEFAULT nextval('panier_utilisateur_panier_id_seq') NOT NULL,
    "utilisateur_id" uuid NOT NULL,
    CONSTRAINT "panier_utilisateur_pkey" PRIMARY KEY ("panier_id", "utilisateur_id")
) WITH (oids = false);


DROP TABLE IF EXISTS "producteur_utilisateur";
CREATE TABLE "public"."producteur_utilisateur" (
    "id_producteur" uuid NOT NULL,
    "id_utilisateur" uuid NOT NULL,
    CONSTRAINT "producteur_utilisateur_pkey" PRIMARY KEY ("id_producteur", "id_utilisateur")
) WITH (oids = false);


DROP TABLE IF EXISTS "recette";
DROP SEQUENCE IF EXISTS recette_id_seq;
CREATE SEQUENCE recette_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."recette" (
    "id" integer DEFAULT nextval('recette_id_seq') NOT NULL,
    "nom" character varying,
    "temps_preparation" integer,
    "complexite" integer,
    "id_createur" uuid,
    "description" text,
    "id_recette_parente" integer,
    "type" type_plat,
    "url_photo" character varying,
    CONSTRAINT "recette_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "recette_ustensile";
DROP SEQUENCE IF EXISTS recette_ustensile_recette_id_seq;
CREATE SEQUENCE recette_ustensile_recette_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

DROP SEQUENCE IF EXISTS recette_ustensile_ustensile_id_seq;
CREATE SEQUENCE recette_ustensile_ustensile_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."recette_ustensile" (
    "recette_id" integer DEFAULT nextval('recette_ustensile_recette_id_seq') NOT NULL,
    "ustensile_id" integer DEFAULT nextval('recette_ustensile_ustensile_id_seq') NOT NULL,
    CONSTRAINT "recette_ustensile_pkey" PRIMARY KEY ("recette_id", "ustensile_id")
) WITH (oids = false);


DROP TABLE IF EXISTS "tag";
DROP SEQUENCE IF EXISTS tag_id_seq;
CREATE SEQUENCE tag_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."tag" (
    "id" integer DEFAULT nextval('tag_id_seq') NOT NULL,
    "labelle" character varying,
    CONSTRAINT "tag_labelle_key" UNIQUE ("labelle"),
    CONSTRAINT "tag_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "tag_recette";
DROP SEQUENCE IF EXISTS tag_recette_tag_id_seq;
CREATE SEQUENCE tag_recette_tag_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

DROP SEQUENCE IF EXISTS tag_recette_recette_id_seq;
CREATE SEQUENCE tag_recette_recette_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."tag_recette" (
    "tag_id" integer DEFAULT nextval('tag_recette_tag_id_seq') NOT NULL,
    "recette_id" integer DEFAULT nextval('tag_recette_recette_id_seq') NOT NULL,
    CONSTRAINT "tag_recette_pkey" PRIMARY KEY ("tag_id", "recette_id")
) WITH (oids = false);


DROP TABLE IF EXISTS "ustensile";
DROP SEQUENCE IF EXISTS ustensile_id_seq;
CREATE SEQUENCE ustensile_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."ustensile" (
    "id" integer DEFAULT nextval('ustensile_id_seq') NOT NULL,
    "nom" character varying,
    CONSTRAINT "ustensile_nom_key" UNIQUE ("nom"),
    CONSTRAINT "ustensile_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "ustensile_exclu";
CREATE TABLE "public"."ustensile_exclu" (
    "id_ustensile" integer NOT NULL,
    "id_utilisateur" uuid NOT NULL,
    CONSTRAINT "ustensile_exclu_pkey" PRIMARY KEY ("id_ustensile", "id_utilisateur")
) WITH (oids = false);


DROP TABLE IF EXISTS "utilisateur";
CREATE TABLE "public"."utilisateur" (
    "id" uuid NOT NULL,
    "nom_utilisateur" character varying,
    "role" character varying,
    "mot_de_passe" character varying,
    CONSTRAINT "utilisateur_nom_utilisateur_key" UNIQUE ("nom_utilisateur"),
    CONSTRAINT "utilisateur_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


ALTER TABLE ONLY "public"."allergene_utilisateur" ADD CONSTRAINT "allergene_utilisateur_allergene_id_fkey" FOREIGN KEY (allergene_id) REFERENCES allergene(id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."allergene_utilisateur" ADD CONSTRAINT "allergene_utilisateur_utilisateur_id_fkey" FOREIGN KEY (utilisateur_id) REFERENCES utilisateur(id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."commentaire" ADD CONSTRAINT "commentaire_id_recette_fkey" FOREIGN KEY (id_recette) REFERENCES recette(id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."commentaire" ADD CONSTRAINT "commentaire_id_utilisateur_fkey" FOREIGN KEY (id_utilisateur) REFERENCES utilisateur(id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."favoris" ADD CONSTRAINT "favoris_id_recette_fkey" FOREIGN KEY (id_recette) REFERENCES recette(id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."favoris" ADD CONSTRAINT "favoris_id_utilisateur_fkey" FOREIGN KEY (id_utilisateur) REFERENCES utilisateur(id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."frigo" ADD CONSTRAINT "frigo_id_ingredient_fkey" FOREIGN KEY (id_ingredient) REFERENCES ingredient(id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."frigo" ADD CONSTRAINT "frigo_id_utilisateur_fkey" FOREIGN KEY (id_utilisateur) REFERENCES utilisateur(id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."ingredient_allergene" ADD CONSTRAINT "ingredient_allergene_allergene_id_fkey" FOREIGN KEY (allergene_id) REFERENCES allergene(id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."ingredient_allergene" ADD CONSTRAINT "ingredient_allergene_ingredient_id_fkey" FOREIGN KEY (ingredient_id) REFERENCES ingredient(id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."ingredient_exclu" ADD CONSTRAINT "ingredient_exclu_id_ingredient_fkey" FOREIGN KEY (id_ingredient) REFERENCES ingredient(id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."ingredient_exclu" ADD CONSTRAINT "ingredient_exclu_id_utilisateur_fkey" FOREIGN KEY (id_utilisateur) REFERENCES utilisateur(id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."ingredient_panier" ADD CONSTRAINT "ingredient_panier_id_ingredient_fkey" FOREIGN KEY (id_ingredient) REFERENCES ingredient(id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."ingredient_panier" ADD CONSTRAINT "ingredient_panier_id_panier_fkey" FOREIGN KEY (id_panier) REFERENCES panier(id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."ingredient_produit" ADD CONSTRAINT "ingredient_produit_id_ingredient_fkey" FOREIGN KEY (id_ingredient) REFERENCES ingredient(id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."ingredient_produit" ADD CONSTRAINT "ingredient_produit_id_producteur_fkey" FOREIGN KEY (id_producteur) REFERENCES utilisateur(id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."ingredient_recette" ADD CONSTRAINT "ingredient_recette_id_ingredient_fkey" FOREIGN KEY (id_ingredient) REFERENCES ingredient(id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."ingredient_recette" ADD CONSTRAINT "ingredient_recette_id_recette_fkey" FOREIGN KEY (id_recette) REFERENCES recette(id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."note_recette" ADD CONSTRAINT "note_recette_id_recette_fkey" FOREIGN KEY (id_recette) REFERENCES recette(id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."note_recette" ADD CONSTRAINT "note_recette_id_utilisateur_fkey" FOREIGN KEY (id_utilisateur) REFERENCES utilisateur(id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."panier" ADD CONSTRAINT "panier_id_producteur_fkey" FOREIGN KEY (id_producteur) REFERENCES utilisateur(id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."panier_utilisateur" ADD CONSTRAINT "panier_utilisateur_panier_id_fkey" FOREIGN KEY (panier_id) REFERENCES panier(id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."panier_utilisateur" ADD CONSTRAINT "panier_utilisateur_utilisateur_id_fkey" FOREIGN KEY (utilisateur_id) REFERENCES utilisateur(id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."producteur_utilisateur" ADD CONSTRAINT "producteur_utilisateur_id_producteur_fkey" FOREIGN KEY (id_producteur) REFERENCES utilisateur(id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."producteur_utilisateur" ADD CONSTRAINT "producteur_utilisateur_id_utilisateur_fkey" FOREIGN KEY (id_utilisateur) REFERENCES utilisateur(id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."recette" ADD CONSTRAINT "recette_id_createur_fkey" FOREIGN KEY (id_createur) REFERENCES utilisateur(id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."recette" ADD CONSTRAINT "recette_id_recette_parente_fkey" FOREIGN KEY (id_recette_parente) REFERENCES recette(id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."recette_ustensile" ADD CONSTRAINT "recette_ustensile_recette_id_fkey" FOREIGN KEY (recette_id) REFERENCES recette(id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."recette_ustensile" ADD CONSTRAINT "recette_ustensile_ustensile_id_fkey" FOREIGN KEY (ustensile_id) REFERENCES ustensile(id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."tag_recette" ADD CONSTRAINT "tag_recette_recette_id_fkey" FOREIGN KEY (recette_id) REFERENCES recette(id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."tag_recette" ADD CONSTRAINT "tag_recette_tag_id_fkey" FOREIGN KEY (tag_id) REFERENCES tag(id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."ustensile_exclu" ADD CONSTRAINT "ustensile_exclu_id_ustensile_fkey" FOREIGN KEY (id_ustensile) REFERENCES ustensile(id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."ustensile_exclu" ADD CONSTRAINT "ustensile_exclu_id_utilisateur_fkey" FOREIGN KEY (id_utilisateur) REFERENCES utilisateur(id) NOT DEFERRABLE;

-- 2024-12-14 17:56:59.270151+00
