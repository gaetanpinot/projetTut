--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: allergene; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.allergene (
    id integer NOT NULL,
    label character varying
);


ALTER TABLE public.allergene OWNER TO "user";

--
-- Name: allergene_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.allergene_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.allergene_id_seq OWNER TO "user";

--
-- Name: allergene_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.allergene_id_seq OWNED BY public.allergene.id;


--
-- Name: allergene_ingredient; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.allergene_ingredient (
    id_ingredient integer NOT NULL,
    id_allergene integer NOT NULL
);


ALTER TABLE public.allergene_ingredient OWNER TO "user";

--
-- Name: allergie_utilisateur; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.allergie_utilisateur (
    id_allergene integer NOT NULL,
    id_utilisateur uuid NOT NULL
);


ALTER TABLE public.allergie_utilisateur OWNER TO "user";

--
-- Name: commentaire; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.commentaire (
    id integer NOT NULL,
    id_utilisateur uuid,
    id_recette integer,
    contenu text
);


ALTER TABLE public.commentaire OWNER TO "user";

--
-- Name: commentaire_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.commentaire_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.commentaire_id_seq OWNER TO "user";

--
-- Name: commentaire_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.commentaire_id_seq OWNED BY public.commentaire.id;


--
-- Name: favoris; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.favoris (
    id_utilisateur uuid NOT NULL,
    id_recette integer NOT NULL
);


ALTER TABLE public.favoris OWNER TO "user";

--
-- Name: frigo; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.frigo (
    id_utilisateur uuid NOT NULL,
    id_ingredient integer NOT NULL,
    date_ajout integer NOT NULL,
    quantite character varying
);


ALTER TABLE public.frigo OWNER TO "user";

--
-- Name: ingredient; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.ingredient (
    id integer NOT NULL,
    nom character varying,
    debut_saison integer,
    fin_saison integer,
    url_photo character varying
);


ALTER TABLE public.ingredient OWNER TO "user";

--
-- Name: ingredient_exclu; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.ingredient_exclu (
    id_ingredient integer NOT NULL,
    id_utilisateur uuid NOT NULL
);


ALTER TABLE public.ingredient_exclu OWNER TO "user";

--
-- Name: ingredient_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.ingredient_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ingredient_id_seq OWNER TO "user";

--
-- Name: ingredient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.ingredient_id_seq OWNED BY public.ingredient.id;


--
-- Name: ingredient_panier; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.ingredient_panier (
    id_panier integer NOT NULL,
    id_ingredient integer NOT NULL,
    quantite character varying
);


ALTER TABLE public.ingredient_panier OWNER TO "user";

--
-- Name: ingredient_produit; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.ingredient_produit (
    id_producteur uuid NOT NULL,
    id_ingredient integer NOT NULL
);


ALTER TABLE public.ingredient_produit OWNER TO "user";

--
-- Name: ingredient_recette; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.ingredient_recette (
    id_recette integer NOT NULL,
    id_ingredient integer NOT NULL,
    quantite character varying
);


ALTER TABLE public.ingredient_recette OWNER TO "user";

--
-- Name: note_recette; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.note_recette (
    id_utilisateur uuid NOT NULL,
    id_recette integer NOT NULL,
    note integer
);


ALTER TABLE public.note_recette OWNER TO "user";

--
-- Name: panier; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.panier (
    id integer NOT NULL,
    id_producteur uuid,
    date date
);


ALTER TABLE public.panier OWNER TO "user";

--
-- Name: panier_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.panier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.panier_id_seq OWNER TO "user";

--
-- Name: panier_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.panier_id_seq OWNED BY public.panier.id;


--
-- Name: panier_utilisateur; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.panier_utilisateur (
    id_utilisateur uuid NOT NULL,
    id_panier integer NOT NULL
);


ALTER TABLE public.panier_utilisateur OWNER TO "user";

--
-- Name: producteur_utilisateur; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.producteur_utilisateur (
    id_producteur uuid NOT NULL,
    id_utilisateur uuid NOT NULL
);


ALTER TABLE public.producteur_utilisateur OWNER TO "user";

--
-- Name: recette; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.recette (
    id integer NOT NULL,
    nom character varying,
    temps_preparation integer,
    complexite integer,
    id_createur uuid,
    description text,
    debut_saison integer,
    fin_saison integer,
    id_recette_parente integer,
    url_photo character varying
);


ALTER TABLE public.recette OWNER TO "user";

--
-- Name: recette_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.recette_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.recette_id_seq OWNER TO "user";

--
-- Name: recette_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.recette_id_seq OWNED BY public.recette.id;


--
-- Name: tag; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.tag (
    id integer NOT NULL,
    label character varying
);


ALTER TABLE public.tag OWNER TO "user";

--
-- Name: tag_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tag_id_seq OWNER TO "user";

--
-- Name: tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.tag_id_seq OWNED BY public.tag.id;


--
-- Name: tag_recette; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.tag_recette (
    id_tag integer NOT NULL,
    id_recette integer NOT NULL
);


ALTER TABLE public.tag_recette OWNER TO "user";

--
-- Name: ustensile; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.ustensile (
    id integer NOT NULL,
    nom character varying
);


ALTER TABLE public.ustensile OWNER TO "user";

--
-- Name: ustensile_exclu; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.ustensile_exclu (
    id_ustensile integer NOT NULL,
    id_utilisateur uuid NOT NULL
);


ALTER TABLE public.ustensile_exclu OWNER TO "user";

--
-- Name: ustensile_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.ustensile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ustensile_id_seq OWNER TO "user";

--
-- Name: ustensile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.ustensile_id_seq OWNED BY public.ustensile.id;


--
-- Name: ustensile_recette; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.ustensile_recette (
    id_recette integer NOT NULL,
    id_ustensile integer NOT NULL
);


ALTER TABLE public.ustensile_recette OWNER TO "user";

--
-- Name: utilisateur; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.utilisateur (
    id uuid NOT NULL,
    nom_utilisateur character varying,
    role integer,
    mot_de_passe character varying
);


ALTER TABLE public.utilisateur OWNER TO "user";

--
-- Name: allergene id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.allergene ALTER COLUMN id SET DEFAULT nextval('public.allergene_id_seq'::regclass);


--
-- Name: commentaire id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.commentaire ALTER COLUMN id SET DEFAULT nextval('public.commentaire_id_seq'::regclass);


--
-- Name: ingredient id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.ingredient ALTER COLUMN id SET DEFAULT nextval('public.ingredient_id_seq'::regclass);


--
-- Name: panier id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.panier ALTER COLUMN id SET DEFAULT nextval('public.panier_id_seq'::regclass);


--
-- Name: recette id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.recette ALTER COLUMN id SET DEFAULT nextval('public.recette_id_seq'::regclass);


--
-- Name: tag id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.tag ALTER COLUMN id SET DEFAULT nextval('public.tag_id_seq'::regclass);


--
-- Name: ustensile id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.ustensile ALTER COLUMN id SET DEFAULT nextval('public.ustensile_id_seq'::regclass);


--
-- Data for Name: allergene; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.allergene (id, label) FROM stdin;
1	Gluten
2	Lactose
3	Fruits a coque
4	Arachides
5	Crustacés
6	Œufs
7	Poisson
8	Soja
9	Mollusques
10	Céleri
11	Moutarde
12	Sésame
13	Sulfites
\.


--
-- Data for Name: allergene_ingredient; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.allergene_ingredient (id_ingredient, id_allergene) FROM stdin;
42	4
14	1
25	1
26	1
16	2
17	2
18	2
19	2
13	3
24	5
15	6
22	7
23	7
8	8
34	9
32	13
\.


--
-- Data for Name: allergie_utilisateur; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.allergie_utilisateur (id_allergene, id_utilisateur) FROM stdin;
2	f47ac10b-58cc-4372-a567-0e02b2c3d479
1	c9bf9e57-1685-4c89-bafb-ff5af830be8a
3	2a0a11b7-a68c-4e21-92b4-7f7af6ffcd33
1	f47ac10b-58cc-4372-a567-0e02b2c3d479
\.


--
-- Data for Name: commentaire; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.commentaire (id, id_utilisateur, id_recette, contenu) FROM stdin;
1	c9bf9e57-1685-4c89-bafb-ff5af830be8a	1	Délicieux et facile à préparer!
2	2a0a11b7-a68c-4e21-92b4-7f7af6ffcd33	2	Ma famille a adoré.
3	50526064-7e17-4afe-9f21-f7100ab6fe62	4	Parfait pour l'automne.
\.


--
-- Data for Name: favoris; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.favoris (id_utilisateur, id_recette) FROM stdin;
f47ac10b-58cc-4372-a567-0e02b2c3d479	1
f47ac10b-58cc-4372-a567-0e02b2c3d479	4
c9bf9e57-1685-4c89-bafb-ff5af830be8a	2
\.


--
-- Data for Name: frigo; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.frigo (id_utilisateur, id_ingredient, date_ajout, quantite) FROM stdin;
c9bf9e57-1685-4c89-bafb-ff5af830be8a	2	1739804635	2pcs
2a0a11b7-a68c-4e21-92b4-7f7af6ffcd33	3	1739804635	250g
84be57c6-4ef4-4381-bf05-a52139a50911	4	1737126235	1pc
c9bf9e57-1685-4c89-bafb-ff5af830be8a	3	1740494201	8
c9bf9e57-1685-4c89-bafb-ff5af830be8a	12	1740494201	3 cuillère
c9bf9e57-1685-4c89-bafb-ff5af830be8a	3	1740494205	8
c9bf9e57-1685-4c89-bafb-ff5af830be8a	12	1740494205	3 cuillère
f47ac10b-58cc-4372-a567-0e02b2c3d479	4	1740441600	55g
c9bf9e57-1685-4c89-bafb-ff5af830be8a	3	1740494271	8
c9bf9e57-1685-4c89-bafb-ff5af830be8a	12	1740494271	3 cuillère
f47ac10b-58cc-4372-a567-0e02b2c3d479	1	1740441600	4
f47ac10b-58cc-4372-a567-0e02b2c3d479	25	1740614400	88
f47ac10b-58cc-4372-a567-0e02b2c3d479	2	1740747207	10
c9bf9e57-1685-4c89-bafb-ff5af830be8a	2	1740747207	10
c9bf9e57-1685-4c89-bafb-ff5af830be8a	3	1740494272	8
c9bf9e57-1685-4c89-bafb-ff5af830be8a	12	1740494272	3 cuillère
c9bf9e57-1685-4c89-bafb-ff5af830be8a	4	1740497931	66
c9bf9e57-1685-4c89-bafb-ff5af830be8a	5	1740497931	2
c9bf9e57-1685-4c89-bafb-ff5af830be8a	1	1740498509	4
c9bf9e57-1685-4c89-bafb-ff5af830be8a	2	1740498553	3
c9bf9e57-1685-4c89-bafb-ff5af830be8a	1	1740583835	788
c9bf9e57-1685-4c89-bafb-ff5af830be8a	10	1740583835	53
c9bf9e57-1685-4c89-bafb-ff5af830be8a	9	1740583835	10
c9bf9e57-1685-4c89-bafb-ff5af830be8a	3	1740662168	88
c9bf9e57-1685-4c89-bafb-ff5af830be8a	5	1740662168	34
\.


--
-- Data for Name: ingredient; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.ingredient (id, nom, debut_saison, fin_saison, url_photo) FROM stdin;
1	Tomate	6	9	https://locavor.fr/data/produits/2/40017/40017-plant-tomate-cobra-1.jpg
2	Carotte	10	4	https://locavor.fr/data/produits/2/49307/49307-carottes-rouges-1.jpg
3	Courgette	6	9	https://www.lucasgreenhouses.com/_ccLib/image/plants/THUM-5153.jpg
4	Oignon	1	12	https://s.alicdn.com/@sc04/kf/A55e49ffce6d942b3b97b2b8afc3cd618s.jpeg_300x300.jpg
5	Pommes de terre	8	3	https://jow.fr/_next/image?url=https%3A%2F%2Fstatic.jow.fr%2Fingredients%2FAAfLEEPhsvb8lQ.png.webp&w=256&q=75
6	Champignons	9	12	https://croissy-fruits.fr/cdn/shop/files/ChampignondeParis_CroissyFruits_Packshot-6710.jpg?v=1723822106&width=1000
7	Brocoli	9	3	https://jow.fr/_next/image?url=https%3A%2F%2Fstatic.jow.fr%2Fingredients%2FVPneOGOf75CQDA.png.webp&w=256&q=75
8	Chou-fleur	9	3	https://jow.fr/_next/image?url=https%3A%2F%2Fstatic.jow.fr%2Fingredients%2F29GPovBmAhAarQ.jpg.webp&w=256&q=75
9	Poivron	6	9	https://jow.fr/_next/image?url=https%3A%2F%2Fstatic.jow.fr%2Fingredients%2FU4CNOum1VboHCQ.png.webp&w=256&q=75
10	Persil	5	10	https://jow.fr/_next/image?url=https%3A%2F%2Fstatic.jow.fr%2Fingredients%2FNKp1aacldEPqcA.jpg.webp&w=256&q=75
11	Basilic	6	9	https://jow.fr/_next/image?url=https%3A%2F%2Fstatic.jow.fr%2Fingredients%2FhqrPNLQsrLu6rw.jpg.webp&w=256&q=75
12	Riz	1	12	https://jow.com/_next/image?url=https%3A%2F%2Fstatic.jow.fr%2Fingredients%2FjD1SK0F4Ewui0Q.png.webp&w=256&q=75
13	Pois chiches	5	8	https://jow.com/_next/image?url=https%3A%2F%2Fstatic.jow.fr%2Fingredients%2FuK0O3IuKeMFiaA.png.webp&w=256&q=75
14	Farine	1	12	https://www.greenweez.com/_next/image?url=https%3A%2F%2Fcdn.greenweez.com%2Fproducts%2F1VBIO1492_0.jpg&w=256&q=75
15	Œufs	1	12	https://angiebegreen.com/wp-content/uploads/2023/04/2.png
16	Lait	1	12	https://www.lactalisfoodservice.fr/app/uploads/2022/07/lactalisfoodservice-lait-bio-demiecreme-1l.png
17	Beurre	1	12	https://media.auchan.fr/A0220020920000035807PRIMARY_256x256/B2CD/
18	Crème fraîche	1	12	https://mapatisserie.fr/wp-content/uploads/2024/01/recette-creme-fouettee-08.jpg
19	Fromage	1	12	https://iod.keplrstatic.com/api/ar_1,c_crop,g_north/c_fill,dpr_auto,f_auto,q_70,w_750/mon_marche/C0OP_Emmental_de_Savoie_IGP_Chabert.jpg
20	Poulet	1	12	https://boucherie-zielinger.fr/80-large_default/blanc-de-poulet.jpg
21	Bœuf	1	12	https://halalfs.com/1029-large_default/viande-hachee-de-boeuf.jpg
22	Poisson	1	12	https://static.hanos.nl/medias/256Wx256H-null?context=bWFzdGVyfHByb2R1Y3RpbWFnZXN8Mjg5MDh8aW1hZ2UvanBlZ3xjM2x6TFcxaGMzUmxjaTl3Y205a2RXTjBhVzFoWjJWekwyaGpaUzlvWldJdk1UQXpNVFk0TWpBNE1EYzNNVEF2TWpVMlYzZ3lOVFpJWDI1MWJHd3xiN2MwZjM5N2Y1YjQzY2I2ZTliM2FlY2Q2ODg2OTZjNTk3YWRlNTcyNDFhYjg3MWE2ZjZlNDVlYWE1Y2YyZjM2
23	Saumon	1	12	https://montougo.ca/wp-content/uploads/2020/09/saumon-papillote-legumes-du-jardin-1500x1500-1601995626.jpg
24	Crevettes	1	12	https://iod.keplrstatic.com/api/ar_1,c_crop,g_north/c_fill,dpr_auto,f_auto,q_70,w_750/mon_marche/T042_CREVETTES_DECORTIQUEES_NATURE.jpg
25	Pain	1	12	https://www.condifa.fr/wp-content/uploads/recette-de-pain-au-mais-agrano-condifa.jpg
26	Pâtes	1	12	https://vracbio.com/cdn/shop/products/PatesItaliennesPenneRigateBioenVrac_499x.png?v=1641221300
27	Sel	1	12	https://www.nomie-epices.fr/wp-content/uploads/2020/08/fleur-de-sel-guerande-igp-nomie-400x400-1.jpg
28	Poivre	1	12	https://www.vitalys-alpes.com/img/cms/85_cms_3fe84c608bab2e018ddc48b81f6cb55c.png
29	Cumin	1	12	https://traditionnature.fr/cdn/shop/files/cumintraditionnature_460x@2x.png?v=1700163204
30	Cannelle	1	12	https://www.maisoneskan.fr/pub/media/catalog/product/cache/3902de75d2d2cb5e11c6e783027b3090/c/a/canelle.jpg
31	Huile d’olive	11	2	https://zitelmokhtar.com/wp-content/uploads/2018/06/product23-free-img.jpg
32	Miel	1	12	https://www.mielinfrance.fr/media/istock_000022029830xsmall__071050200_1118_17122012.jpg
33	Sucre	1	12	https://audriveenpot.fr/927-home_default/sucre-semoule-n2-500g.jpg
34	Moules	6	2	https://img.cuisineaz.com/660x660/2017/07/21/i130938-moules-marinieres-au-cookeo.jpeg
35	Chocolat	1	12	https://www.monparigourmand-boutique.com/wp-content/uploads/2020/10/207.jpg
36	Pomme	9	12	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuysOGogiwiCyzMkZP21DGPTFzweBGKnlX0w&s
37	Banane	1	12	https://croissy-fruits.fr/cdn/shop/files/BananedeGuadeloupe_CroissyFruits_Packshot-6623.png?v=1715179091
38	Fraises	5	7	https://www.jaimefruitsetlegumes.ca/wp-content/uploads/2019/09/Fraise.png
39	Cerises	6	7	https://www.quercy.net/wp-content/uploads/2019/02/cerises2.jpg
40	Orange	12	3	https://www.vitabio.fr/img/modules/oh_ingredients/ingredients/3_picture.jpg
41	Citron	11	4	https://static.wixstatic.com/media/7885d7_3603545602ba4408b3491dd02b1f2ceb~mv2.png/v1/fill/w_520,h_520,al_c,q_85,usm_0.66_1.00_0.01,enc_avif,quality_auto/7885d7_3603545602ba4408b3491dd02b1f2ceb~mv2.png
42	Arachide	1	12	https://www.silvarem.com/602-thickbox_default/arachide-blanchie.jpg
\.


--
-- Data for Name: ingredient_exclu; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.ingredient_exclu (id_ingredient, id_utilisateur) FROM stdin;
5	f47ac10b-58cc-4372-a567-0e02b2c3d479
5	2a0a11b7-a68c-4e21-92b4-7f7af6ffcd33
6	c9bf9e57-1685-4c89-bafb-ff5af830be8a
\.


--
-- Data for Name: ingredient_panier; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.ingredient_panier (id_panier, id_ingredient, quantite) FROM stdin;
1	1	2kg
1	2	1kg
2	3	500g
2	2	500g
3	4	1pc
3	6	3pcs
4	9	50g
4	10	50g
5	4	66
5	5	2
6	3	8
6	12	3 cuillère
7	1	4
8	2	3
9	3	77
10	3	88
10	5	34
11	1	788
11	10	53
11	9	10
12	2	ZZZ
13	4	770gg
13	21	555g
14	2	10
\.


--
-- Data for Name: ingredient_produit; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.ingredient_produit (id_producteur, id_ingredient) FROM stdin;
047b6cae-6140-49f7-8c66-ef6b66cbb441	5
047b6cae-6140-49f7-8c66-ef6b66cbb441	6
047b6cae-6140-49f7-8c66-ef6b66cbb441	4
047b6cae-6140-49f7-8c66-ef6b66cbb441	9
047b6cae-6140-49f7-8c66-ef6b66cbb441	10
6618f3e4-c492-474c-b925-1f4f1a0774c3	1
6618f3e4-c492-474c-b925-1f4f1a0774c3	2
6618f3e4-c492-474c-b925-1f4f1a0774c3	3
6618f3e4-c492-474c-b925-1f4f1a0774c3	4
\.


--
-- Data for Name: ingredient_recette; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.ingredient_recette (id_recette, id_ingredient, quantite) FROM stdin;
1	5	800g
1	19	150g
1	18	20cl
1	16	10cl
1	4	1
1	17	30g
1	27	1 pincée
1	28	1 pincée
2	1	4
2	3	2
2	9	2
2	4	1
2	11	5 feuilles
2	31	4 cuillères à soupe
2	27	1 pincée
2	28	1 pincée
3	20	4 blancs
3	41	2
3	31	3 cuillères à soupe
3	10	2 branches
3	27	1 pincée
3	28	1 pincée
4	6	250g
4	14	200g
4	17	100g
4	15	3
4	18	20cl
4	19	100g
4	4	1
4	27	1 pincée
4	28	1 pincée
5	38	500g
5	14	250g
5	17	125g
5	33	100g
5	15	1
5	18	20cl
6	26	400g
6	1	6
6	4	1
6	11	5 feuilles
6	31	2 cuillères à soupe
6	27	1 pincée
6	28	1 pincée
7	34	1kg
7	4	2
7	10	5 branches
7	27	1 pincée
7	28	1 pincée
8	4	1kg
8	17	50g
8	19	100g
8	25	4 tranches
8	27	1 pincée
8	28	1 pincée
9	36	6
9	14	250g
9	17	125g
9	33	100g
9	15	1
9	30	1 cuillère à café
10	21	1kg
10	2	4
10	4	2
10	6	200g
10	17	50g
10	27	1 pincée
10	28	1 pincée
11	39	500g
11	14	100g
11	33	150g
11	15	3
11	16	50cl
12	18	50cl
12	15	6 jaunes
12	33	100g
13	35	200g
13	17	200g
13	33	150g
13	14	50g
13	15	4
14	3	4
14	4	1
14	5	2
14	18	10cl
14	27	1 pincée
14	28	1 pincée
15	13	400g
15	4	1
15	10	2 branches
15	29	1 cuillère à café
15	27	1 pincée
15	28	1 pincée
15	31	2 cuillères à soupe
16	14	200g
16	33	100g
16	17	100g
16	15	1
16	35	100g
16	42	50g
17	20	1 entier
17	17	50g
17	10	5 branches
17	27	1 pincée
17	28	1 pincée
17	31	2 cuillères à soupe
18	5	3
18	4	2
18	2	2
18	18	10cl
18	27	1 pincée
18	28	1 pincée
19	20	800g
19	4	2
19	2	3
19	29	2 cuillères à café
19	30	1 cuillère à café
19	32	2 cuillères à soupe
19	31	3 cuillères à soupe
19	27	1 pincée
19	28	1 pincée
20	12	400g
20	13	300g
20	2	3
20	3	2
20	9	1
20	4	2
20	29	2 cuillères à café
20	31	3 cuillères à soupe
20	27	1 pincée
20	28	1 pincée
21	21	400g
21	25	4
21	1	2
21	4	1
21	19	100g
21	27	1 pincée
21	28	1 pincée
22	12	500g
22	24	300g
22	34	500g
22	9	2
22	1	3
22	4	2
22	31	4 cuillères à soupe
22	27	1 pincée
22	28	1 pincée
23	21	500g
23	26	500g
23	1	5
23	4	2
23	2	2
23	19	200g
23	17	50g
23	14	50g
23	16	50cl
23	27	1 pincée
23	28	1 pincée
24	15	6
24	10	2 branches
24	11	5 feuilles
24	17	30g
24	27	1 pincée
24	28	1 pincée
25	21	4 pavés
25	28	2 cuillères à soupe
25	18	20cl
25	17	30g
25	27	1 pincée
26	25	1 baguette
26	1	4
26	19	200g
26	11	10 feuilles
26	31	3 cuillères à soupe
26	27	1 pincée
26	28	1 pincée
27	1	6
27	9	1
27	4	1
27	31	4 cuillères à soupe
27	41	1
27	27	1 pincée
27	28	1 pincée
28	21	500g
28	1	4
28	4	2
28	9	1
28	12	200g
28	29	2 cuillères à café
28	27	1 pincée
28	28	1 pincée
29	1	6
29	11	1 bouquet
29	31	3 cuillères à soupe
29	27	1 pincée
29	28	1 pincée
30	38	500g
30	14	250g
30	17	125g
30	33	100g
30	15	1
30	18	20cl
37	2	500g
37	4	1 moyen
37	29	1 cuillère à café
37	16	100ml
37	31	2 cuillères à soupe
37	27	au goût
37	28	au goût
38	25	4 tranches
38	15	2
38	16	100ml
38	32	2 cuillères à soupe
38	17	20g
38	30	1 pincée
39	7	1 tête
39	19	50g
39	4	1 petit
39	31	3 cuillères à soupe
39	41	1/2
39	27	au goût
39	28	au goût
40	23	4 filets
40	41	1
40	31	2 cuillères à soupe
40	10	2 branches
40	27	au goût
40	28	au goût
41	12	300g
41	6	250g
41	4	1 moyen
41	19	50g râpé
41	17	30g
41	31	2 cuillères à soupe
41	27	au goût
41	28	au goût
42	3	1 grosse
42	11	10 feuilles
42	41	1/2
42	31	2 cuillères à soupe
42	27	au goût
42	28	au goût
43	14	250g
43	17	125g
43	15	3
43	19	150g
43	18	20cl
43	27	au goût
43	28	au goût
44	1	2 moyennes
44	9	1
44	3	1 petite
44	10	5 branches
44	31	3 cuillères à soupe
44	41	1/2
44	27	au goût
44	28	au goût
45	12	300g
45	15	2
45	24	100g
45	9	1 petit
45	4	1 petit
45	31	2 cuillères à soupe
45	27	au goût
45	28	au goût
46	2	250g
46	14	200g
46	15	3
46	33	150g
46	17	100g
46	30	1 cuillère à café
46	32	2 cuillères à soupe
47	10	2 bouquets
47	11	10 feuilles
47	1	3 moyennes
47	4	1 petit
47	31	4 cuillères à soupe
47	41	1
47	27	au goût
47	28	au goût
48	14	250g
48	17	125g
48	15	4
48	33	200g
48	41	3
48	18	50ml
49	3	3 moyennes
49	4	1 moyen
49	15	2
49	18	20cl
49	19	100g râpé
49	31	2 cuillères à soupe
49	27	au goût
49	28	au goût
172	1	3
173	26	400g
173	11	100g
174	1	3
174	20	3
175	26	100g
175	20	100g
175	27	10g
176	26	100g
176	20	100g
176	27	10g
\.


--
-- Data for Name: note_recette; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.note_recette (id_utilisateur, id_recette, note) FROM stdin;
f47ac10b-58cc-4372-a567-0e02b2c3d479	1	5
c9bf9e57-1685-4c89-bafb-ff5af830be8a	2	4
2a0a11b7-a68c-4e21-92b4-7f7af6ffcd33	3	3
c9bf9e57-1685-4c89-bafb-ff5af830be8a	6	4
c9bf9e57-1685-4c89-bafb-ff5af830be8a	7	4
c9bf9e57-1685-4c89-bafb-ff5af830be8a	8	2
c9bf9e57-1685-4c89-bafb-ff5af830be8a	9	4
c9bf9e57-1685-4c89-bafb-ff5af830be8a	10	2
6618f3e4-c492-474c-b925-1f4f1a0774c3	11	3
6618f3e4-c492-474c-b925-1f4f1a0774c3	12	2
6618f3e4-c492-474c-b925-1f4f1a0774c3	13	5
6618f3e4-c492-474c-b925-1f4f1a0774c3	14	2
6618f3e4-c492-474c-b925-1f4f1a0774c3	15	3
9cbe2ee3-45eb-46ef-9ea1-59a01d6b4ff2	16	3
9cbe2ee3-45eb-46ef-9ea1-59a01d6b4ff2	17	1
9cbe2ee3-45eb-46ef-9ea1-59a01d6b4ff2	18	3
9cbe2ee3-45eb-46ef-9ea1-59a01d6b4ff2	19	5
9cbe2ee3-45eb-46ef-9ea1-59a01d6b4ff2	20	1
50526064-7e17-4afe-9f21-f7100ab6fe62	26	2
50526064-7e17-4afe-9f21-f7100ab6fe62	27	5
50526064-7e17-4afe-9f21-f7100ab6fe62	28	3
50526064-7e17-4afe-9f21-f7100ab6fe62	29	4
50526064-7e17-4afe-9f21-f7100ab6fe62	30	4
84be57c6-4ef4-4381-bf05-a52139a50911	31	4
84be57c6-4ef4-4381-bf05-a52139a50911	32	1
84be57c6-4ef4-4381-bf05-a52139a50911	33	3
84be57c6-4ef4-4381-bf05-a52139a50911	34	5
84be57c6-4ef4-4381-bf05-a52139a50911	35	5
047b6cae-6140-49f7-8c66-ef6b66cbb441	36	1
047b6cae-6140-49f7-8c66-ef6b66cbb441	37	4
047b6cae-6140-49f7-8c66-ef6b66cbb441	38	5
047b6cae-6140-49f7-8c66-ef6b66cbb441	39	3
047b6cae-6140-49f7-8c66-ef6b66cbb441	40	1
35c4cabe-bb38-485a-96e6-7d530c70b91e	41	3
35c4cabe-bb38-485a-96e6-7d530c70b91e	42	3
35c4cabe-bb38-485a-96e6-7d530c70b91e	43	4
35c4cabe-bb38-485a-96e6-7d530c70b91e	44	4
35c4cabe-bb38-485a-96e6-7d530c70b91e	45	2
097b6d7e-6ab9-47bd-a4b8-f8f342bb7215	46	4
097b6d7e-6ab9-47bd-a4b8-f8f342bb7215	47	1
097b6d7e-6ab9-47bd-a4b8-f8f342bb7215	48	3
097b6d7e-6ab9-47bd-a4b8-f8f342bb7215	49	5
\.


--
-- Data for Name: panier; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.panier (id, id_producteur, date) FROM stdin;
1	6618f3e4-c492-474c-b925-1f4f1a0774c3	2024-12-01
2	6618f3e4-c492-474c-b925-1f4f1a0774c3	2024-12-05
3	047b6cae-6140-49f7-8c66-ef6b66cbb441	2024-12-02
4	047b6cae-6140-49f7-8c66-ef6b66cbb441	2024-12-06
6	6618f3e4-c492-474c-b925-1f4f1a0774c3	2025-02-25
5	6618f3e4-c492-474c-b925-1f4f1a0774c3	2025-02-25
7	6618f3e4-c492-474c-b925-1f4f1a0774c3	2025-02-25
8	6618f3e4-c492-474c-b925-1f4f1a0774c3	2025-02-25
9	6618f3e4-c492-474c-b925-1f4f1a0774c3	\N
11	6618f3e4-c492-474c-b925-1f4f1a0774c3	2025-02-26
12	6618f3e4-c492-474c-b925-1f4f1a0774c3	\N
13	6618f3e4-c492-474c-b925-1f4f1a0774c3	\N
10	6618f3e4-c492-474c-b925-1f4f1a0774c3	2025-02-27
14	6618f3e4-c492-474c-b925-1f4f1a0774c3	2025-02-28
\.


--
-- Data for Name: panier_utilisateur; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.panier_utilisateur (id_utilisateur, id_panier) FROM stdin;
f47ac10b-58cc-4372-a567-0e02b2c3d479	1
c9bf9e57-1685-4c89-bafb-ff5af830be8a	2
2a0a11b7-a68c-4e21-92b4-7f7af6ffcd33	3
50526064-7e17-4afe-9f21-f7100ab6fe62	4
\.


--
-- Data for Name: producteur_utilisateur; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.producteur_utilisateur (id_producteur, id_utilisateur) FROM stdin;
6618f3e4-c492-474c-b925-1f4f1a0774c3	f47ac10b-58cc-4372-a567-0e02b2c3d479
6618f3e4-c492-474c-b925-1f4f1a0774c3	c9bf9e57-1685-4c89-bafb-ff5af830be8a
047b6cae-6140-49f7-8c66-ef6b66cbb441	2a0a11b7-a68c-4e21-92b4-7f7af6ffcd33
047b6cae-6140-49f7-8c66-ef6b66cbb441	50526064-7e17-4afe-9f21-f7100ab6fe62
047b6cae-6140-49f7-8c66-ef6b66cbb441	f47ac10b-58cc-4372-a567-0e02b2c3d479
\.


--
-- Data for Name: recette; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.recette (id, nom, temps_preparation, complexite, id_createur, description, debut_saison, fin_saison, id_recette_parente, url_photo) FROM stdin;
1	Gratin de pommes de terre	45	2	\N	Un gratin crémeux à base de pommes de terre et de fromage.	8	3	\N	https://assets.afcdn.com/recipe/20180123/77042_w1024h1024c1cx2625cy1750cxt0cyt0cxb5250cyb3500.jpg
2	Ratatouille	50	3	\N	Un plat provençal avec tomates, courgettes et poivrons.	6	9	\N	https://cdn.loveandlemons.com/wp-content/uploads/2024/07/ratatouille.jpg
3	Poulet au citron	40	2	\N	Un poulet tendre mariné au citron et à l’huile d’olive.	11	4	\N	https://img.cuisineaz.com/660x660/2013/12/20/i13051-poulet-citron.jpeg
4	Quiche aux champignons	45	2	\N	Une quiche savoureuse aux champignons et à la crème fraîche.	9	12	\N	https://assets.afcdn.com/recipe/20221010/135915_w1024h1024c1cx999cy749cxt0cyt0cxb1999cyb1499.jpg
5	Tarte aux fraises	60	3	\N	Une tarte gourmande garnie de fraises fraîches.	5	7	\N	https://assets.afcdn.com/recipe/20161116/53080_w1024h1024c1cx2808cy1872.jpg
6	Pâtes à la sauce tomate	25	1	\N	Des pâtes savoureuses avec une sauce tomate maison.	6	9	\N	https://www.papillesetpupilles.fr/wp-content/uploads/2023/02/P%C3%A2tes-sauce-tomate-Copyright-Lablascovegmenu-CCBY20-.jpg
7	Moules marinières	30	2	\N	Des moules cuites dans un bouillon parfumé à l’ail et au vin blanc.	6	2	\N	https://img.cuisineaz.com/660x660/2017/07/21/i130938-moules-marinieres-au-cookeo.jpeg
8	Soupe à l’oignon	40	2	\N	Une soupe traditionnelle gratinée à l’oignon.	1	12	\N	https://assets.afcdn.com/recipe/20210104/116953_w1024h1024c1cx806cy863cxt0cyt382cxb1641cyb1350.jpg
9	Tarte aux pommes	50	2	\N	Une tarte sucrée aux pommes caramélisées.	9	12	\N	https://assets.afcdn.com/recipe/20220128/128250_w1024h1024c1cx1294cy688cxt0cyt0cxb2037cyb1472.webp
10	Bœuf bourguignon	180	4	\N	Un ragoût mijoté de bœuf et de vin rouge.	1	12	\N	https://assets.afcdn.com/recipe/20220707/133382_w1024h1024c1cx1396cy931cxt0cyt162cxb2162cyb1386.webp
11	Clafoutis aux cerises	45	2	\N	Un dessert fondant avec des cerises fraîches.	6	7	\N	https://assets.afcdn.com/recipe/20180126/77154_w1024h1024c1cx2808cy1872cxt0cyt0cxb5616cyb3744.jpg
12	Crème brûlée	50	3	\N	Un dessert onctueux avec une croûte de sucre caramélisé.	1	12	\N	https://www.markal.fr/application/files/medias_markal/recettes/988-recette-creme-brulee.jpg
13	Gâteau au chocolat	60	2	\N	Un gâteau moelleux au chocolat noir.	1	12	\N	https://odelices.ouest-france.fr/images/recettes/2013/gateau_au_chocolat1.jpg
14	Velouté de courgettes	30	1	\N	Une soupe veloutée de courgettes et crème fraîche.	6	9	\N	https://assets.afcdn.com/recipe/20200508/110752_w1024h1024c1cx960cy540cxt0cyt0cxb1920cyb1080.webp
15	Galettes de pois chiches	40	2	\N	Des galettes croustillantes à base de pois chiches et d’épices.	5	8	\N	https://assets.tmecosys.com/image/upload/t_web767x639/img/recipe/ras/Assets/F5CE0B6C-392E-4766-9FEF-595802E0C0E6/Derivates/6669A720-8BB6-4A21-8A2A-41A10D6B9578.jpg
16	Cookies maison	30	1	\N	Des cookies moelleux aux pépites de chocolat.	1	12	\N	https://assets.afcdn.com/recipe/20190529/93153_w1024h1024c1cx2220cy1728cxt0cyt0cxb4441cyb3456.jpg
17	Poulet rôti	90	2	\N	Un poulet entier rôti avec des herbes et du beurre.	1	12	\N	https://img.cuisineaz.com/660x660/2016/10/23/i113627-poulet-roti-au-four.jpg
18	Soupe de poireaux	30	1	\N	Une soupe légère aux poireaux et pommes de terre.	1	12	\N	https://fgdjrynm.filerobot.com/recipes/5e44c6fed4cffe8d5b0e60aece98fc485c933c922a9ebe29f8f14bb9f22a7d81.jpg?vh=d0afa2&h=800&w=800&q=60
19	Tajine de poulet aux abricots	120	3	\N	Un plat marocain sucré-salé avec du poulet et des abricots.	1	12	\N	https://mccormick.widen.net/content/doccnjyvjs/original/tajine_de_poulet_au_citron_et_aux_olives_800x800.jpg
20	Couscous végétarien	50	2	\N	Un couscous aux légumes de saison et pois chiches.	5	10	\N	https://assets.afcdn.com/recipe/20201207/116184_w1024h1024c1cx458cy1458cxt0cyt0cxb4005cyb3046.jpg
21	Burger maison	40	2	\N	Un burger avec un steak haché maison et des légumes frais.	1	12	\N	https://img.cuisineaz.com/660x660/2016/05/21/i86551-burger-au-bacon-et-au-cheddar.jpg
22	Paella aux fruits de mer	60	4	\N	Une paella espagnole avec crevettes, moules et calamars.	6	10	\N	https://cdn.pratico-pratiques.com/app/uploads/sites/4/2018/08/30191438/paella-traditionnelle-aux-fruits-de-mer.jpeg
23	Lasagnes à la bolognaise	90	3	\N	Des lasagnes italiennes classiques avec une sauce bolognaise.	1	12	\N	https://assets.afcdn.com/recipe/20180119/76936_w1024h1024c1cx2680cy1786cxt0cyt0cxb5361cyb3573.webp
24	Omelette aux herbes	15	1	\N	Une omelette légère agrémentée d’herbes fraîches.	1	12	\N	https://img.cuisineaz.com/660x660/2015/04/24/i97790-l-omelette-aux-fines-herbes-des-recettes-du-bonheur.jpg
25	Pavé de bœuf sauce au poivre	35	3	\N	Un pavé de bœuf grillé servi avec une sauce crémeuse au poivre.	1	12	\N	https://images.radio-canada.ca/v1/alimentation/recette/1x1/contre-filet-boeuf-sauce-poivre-carottes-roties.jpg
26	Bruschetta tomate mozzarella	20	1	\N	Des tranches de pain grillées garnies de tomates fraîches et mozzarella.	6	9	\N	https://assets.afcdn.com/recipe/20170112/42222_w1024h1024c1cx1500cy1000.jpg
27	Gaspacho andalou	15	1	\N	Une soupe froide aux tomates et poivrons rouges, parfaite pour l’été.	6	9	\N	https://images.radio-canada.ca/v1/alimentation/1x1/gaspacho-tomate-soupe-froide-54503.jpg
28	Chili con carne	75	3	\N	Un plat épicé de viande hachée, haricots rouges et tomates.	1	12	\N	https://assets.afcdn.com/recipe/20211222/126214_w1024h1024c1cx1124cy721cxt0cyt0cxb2119cyb1415.jpg
29	Salade de tomates et basilic	10	1	9cbe2ee3-45eb-46ef-9ea1-59a01d6b4ff2	Une salade fraîche avec des tomates juteuses et du basilic parfumé.	6	9	\N	https://img.cuisineaz.com/660x660/2016/04/18/i76550-salade-de-tomates-au-basilic.jpg
30	Tarte aux Fraises	45	2	c9bf9e57-1685-4c89-bafb-ff5af830be8a	Une tarte sucrée et fruitée	5	7	\N	https://assets.afcdn.com/recipe/20161116/53080_w1024h1024c1cx2808cy1872.jpg
31	Soupe de Carottes	30	1	047b6cae-6140-49f7-8c66-ef6b66cbb441	Un velouté doux	4	11	\N	https://img.cuisineaz.com/660x660/2013/12/20/i78964-photo-de-soupe-aux-carottes.jpeg
32	Smoothie Menthe-Basilic	5	1	9cbe2ee3-45eb-46ef-9ea1-59a01d6b4ff2	Une boisson rafraîchissante	5	9	\N	https://assets.afcdn.com/recipe/20100120/26542_w1024h1024c1cx256cy192.jpg
33	Blinis au saumon fumé	30	2	\N	De petits blinis moelleux garnis de saumon fumé et de crème fraîche.	1	12	\N	https://assets.afcdn.com/recipe/20130924/35903_w1024h1024c1cx1416cy2128.webp
34	Brownie au chocolat	40	2	\N	Un brownie fondant et gourmand au chocolat noir.	1	12	\N	https://img.cuisineaz.com/660x660/2013/12/20/i42812-brownie.jpeg
172	3	0	0	f47ac10b-58cc-4372-a567-0e02b2c3d479	3	2	2	\N	3
35	Salade de Tomates	10	1	f47ac10b-58cc-4372-a567-0e02b2c3d479	Une salade fraîche et simple	6	9	\N	https://img.cuisineaz.com/660x660/2018/02/24/i135965-salade-tomate-mozzarella.jpeg
36	Salade de Tomates Revisitee	15	2	f47ac10b-58cc-4372-a567-0e02b2c3d479	Une variante plus complexe	6	9	1	https://www.tables-auberges.com/storage/uploads/2022/04/AdobeStock_232182614.jpeg
37	Soupe de carottes	30	1	\N	Une soupe réconfortante avec des carottes et une touche de cumin.	10	4	\N	https://cdn.chefclub.tools/uploads/recipes/cover-thumbnail/64873260-9467-4214-abc0-dd8ef0860896.jpg
38	Pain perdu au miel	15	1	\N	Une recette anti-gaspillage avec du pain rassis et du miel.	1	12	\N	https://recettes.belly-media.com/wp-content/uploads/2022/10/french-toast3-1280x1280.jpg
39	Salade de brocoli	20	1	\N	Une salade croquante avec du brocoli et une sauce légère.	9	3	\N	https://cdn.pratico-pratiques.com/app/uploads/sites/2/2022/12/05142857/salade-de-brocoli-au-fromage-en-grains.jpg
40	Filet de saumon grillé	25	2	\N	Un filet de saumon grillé avec une sauce citronnée.	1	12	\N	https://images.radio-canada.ca/v1/alimentation/recette/1x1/paves-saumon-grille-champignons-huile-amande.jpg
41	Risotto aux champignons	40	3	\N	Un risotto crémeux aux champignons et au parmesan.	9	12	\N	https://assets.afcdn.com/recipe/20171019/73517_w1024h1024c1cx3000cy2000cxt0cyt0cxb6000cyb4000.jpg
42	Salade de concombre et menthe	10	1	\N	Une salade rafraîchissante avec du concombre et de la menthe.	5	9	\N	https://cdn.pratico-pratiques.com/app/uploads/sites/3/2018/08/24081930/salade-de-concombres-olives-et-feta-550x550.jpeg
43	Tarte salée aux épinards et fromage	45	2	\N	Une tarte feuilletée garnie d’épinards et de fromage.	4	9	\N	https://recettesdejulie.fr/wp-content/uploads/2019/10/tarte-epinards-4.jpg
44	Salade de quinoa et légumes	25	1	\N	Une salade équilibrée avec du quinoa, des légumes croquants et une vinaigrette.	5	9	\N	https://assets.afcdn.com/recipe/20220805/134070_w1024h1024c1cx1218cy803cxt0cyt0cxb2121cyb1414.jpg
45	Riz cantonais	30	2	\N	Un riz sauté avec des œufs, petits pois, jambon et crevettes.	1	12	\N	https://assets.afcdn.com/recipe/20200907/114005_w1024h1024c1cx540cy960cxt0cyt0cxb1080cyb1920.jpg
46	Gâteau aux carottes	60	3	\N	Un gâteau moelleux aux carottes et aux épices, surmonté d’un glaçage.	1	12	\N	https://cdn.pratico-pratiques.com/app/uploads/sites/2/2018/08/27231215/gateau-aux-carottes-nouveau515.jpeg
47	Taboulé libanais	20	1	\N	Une salade fraîche de persil, menthe, tomates et boulgour.	5	10	\N	https://assets.afcdn.com/recipe/20200518/111358_w1024h1024c1cx540cy960cxt0cyt0cxb1080cyb1920.webp
48	Tarte au citron meringuée	70	4	\N	Une tarte sucrée au citron avec une meringue dorée.	11	4	\N	https://cdn.chefclub.tools/uploads/recipes/cover-thumbnail/9b334398-8b7a-49c0-ae79-b0ab1f2ea22b_JSoQmra.jpg
49	Gratin de courgettes	45	2	\N	Un gratin savoureux avec des courgettes fondantes et du fromage.	6	9	\N	https://assets.afcdn.com/recipe/20190529/93185_w1024h1024c1cx2736cy1824cxt0cyt0cxb5472cyb3648.jpg
171	Pate au pesto	30	3	f47ac10b-58cc-4372-a567-0e02b2c3d479	Faite cuire des pates 10 min, mettez 2 cuillère de l'eau de cuisson dans votre pesto, essorez les pates, puis mellangez les pates avec le pesto et servez avec du parmesan	1	12	\N	https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Foversixtydev.blob.core.windows.net%2Fmedia%2F3757%2Fpesto-pasta.jpg&f=1&nofb=1&ipt=38707c5fad544b9c70cb96fe10a9cfa210f89df4e90add88be854e4233e64478&ipo=images
173	Pate au pesto	30	3	f47ac10b-58cc-4372-a567-0e02b2c3d479	Faite cuire des pates 10 min, mettez 2 cuillère de l'eau de cuisson dans votre pesto, essorez les pates, puis mellangez les pates avec le pesto et servez avec du parmesan	1	12	\N	https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Foversixtydev.blob.core.windows.net%2Fmedia%2F3757%2Fpesto-pasta.jpg&f=1&nofb=1&ipt=38707c5fad544b9c70cb96fe10a9cfa210f89df4e90add88be854e4233e64478&ipo=images
174	Turltututu	50	3	f47ac10b-58cc-4372-a567-0e02b2c3d479	Clown man	2	2	\N	https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fimaclown.weebly.com%2Fuploads%2F3%2F5%2F9%2F3%2F3593582%2F1798066.jpg&f=1&nofb=1&ipt=ac920c453301b2d521e3c67e8c854d3b5b995fd27b68b5432015c50a9b4d9547&ipo=images
175	Pate au poulet	15	1	f47ac10b-58cc-4372-a567-0e02b2c3d479	Ceci est une description de recette\netape 1 mettez le poulet dans la poele et faite le cuire jusqu'a ce qu'il soit cuit\nEtape 2 mettez beaucoup de sel dans une casserole et remplissez au 2/3 d'eau, faite bouillire\nEtape 3 Metez les pates pendant 10 min puit égoutez\nServez frait	1	12	\N	https://www.sprinklesandsprouts.com/wp-content/uploads/2018/11/Garlic-Butter-Pasta-with-Garlic-Chicken-SQ-500x375.jpg
176	Pate au poulet	15	1	f47ac10b-58cc-4372-a567-0e02b2c3d479	Ceci est une description de recette\netape 1 mettez le poulet dans la poele et faite le cuire jusqu'a ce qu'il soit cuit\nEtape 2 mettez beaucoup de sel dans une casserole et remplissez au 2/3 d'eau, faite bouillire\nEtape 3 Metez les pates pendant 10 min puit égoutez\nServez frait	1	12	\N	https://www.sprinklesandsprouts.com/wp-content/uploads/2018/11/Garlic-Butter-Pasta-with-Garlic-Chicken-SQ-500x375.jpg
\.


--
-- Data for Name: tag; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.tag (id, label) FROM stdin;
1	Vegan
2	Sans gluten
3	Dessert
4	Plat principal
5	Entrée
6	Rapide
7	Épicé
\.


--
-- Data for Name: tag_recette; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.tag_recette (id_tag, id_recette) FROM stdin;
1	1
4	1
3	2
2	3
5	3
1	4
5	4
6	4
1	5
6	5
7	5
\.


--
-- Data for Name: ustensile; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.ustensile (id, nom) FROM stdin;
1	Couteau
2	Poêle
3	Fouet
4	Casserole
5	Spatule
6	Râpe
7	Cuillère en bois
8	Four
9	Micro-onde
\.


--
-- Data for Name: ustensile_exclu; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.ustensile_exclu (id_ustensile, id_utilisateur) FROM stdin;
3	2a0a11b7-a68c-4e21-92b4-7f7af6ffcd33
6	50526064-7e17-4afe-9f21-f7100ab6fe62
\.


--
-- Data for Name: ustensile_recette; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.ustensile_recette (id_recette, id_ustensile) FROM stdin;
1	1
2	1
2	4
3	1
3	3
4	1
4	5
4	7
5	1
5	2
5	3
\.


--
-- Data for Name: utilisateur; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.utilisateur (id, nom_utilisateur, role, mot_de_passe) FROM stdin;
f47ac10b-58cc-4372-a567-0e02b2c3d479	alice	0	$2y$10$uyYfJLlBRVN/ta3q15sLtuiT96gxzZe8XgXFwNmnpamWyjoqknggG
c9bf9e57-1685-4c89-bafb-ff5af830be8a	bob	0	$2y$10$uyYfJLlBRVN/ta3q15sLtuiT96gxzZe8XgXFwNmnpamWyjoqknggG
6618f3e4-c492-474c-b925-1f4f1a0774c3	charlie	1	$2y$10$uyYfJLlBRVN/ta3q15sLtuiT96gxzZe8XgXFwNmnpamWyjoqknggG
9cbe2ee3-45eb-46ef-9ea1-59a01d6b4ff2	admin	2	$2y$10$uyYfJLlBRVN/ta3q15sLtuiT96gxzZe8XgXFwNmnpamWyjoqknggG
2a0a11b7-a68c-4e21-92b4-7f7af6ffcd33	diane	0	$2y$10$uyYfJLlBRVN/ta3q15sLtuiT96gxzZe8XgXFwNmnpamWyjoqknggG
50526064-7e17-4afe-9f21-f7100ab6fe62	eric	0	$2y$10$uyYfJLlBRVN/ta3q15sLtuiT96gxzZe8XgXFwNmnpamWyjoqknggG
84be57c6-4ef4-4381-bf05-a52139a50911	fanny	0	$2y$10$uyYfJLlBRVN/ta3q15sLtuiT96gxzZe8XgXFwNmnpamWyjoqknggG
047b6cae-6140-49f7-8c66-ef6b66cbb441	georges	1	$2y$10$uyYfJLlBRVN/ta3q15sLtuiT96gxzZe8XgXFwNmnpamWyjoqknggG
35c4cabe-bb38-485a-96e6-7d530c70b91e	sasha	0	$2y$10$R7w4KcarcOlO73d1Z3dy7.Tmq0v7vOL4GHgybaiD5gbfCILxioNAG
097b6d7e-6ab9-47bd-a4b8-f8f342bb7215	test	0	$2y$10$XNyCbHW397jFWP1pmgDqCe3aB.fduIZ5KFKNl3DAUKuq487zHSzSu
2cf49514-367f-4ddc-a7e6-52df3cd5869b	sashaagri	1	$2y$10$ywj4IeRXMse8yRmQMSQuMuSM8W0LvvobKHrnwBMZKNiYJ.K6FiRmm
\.


--
-- Name: allergene_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.allergene_id_seq', 5, true);


--
-- Name: commentaire_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.commentaire_id_seq', 3, true);


--
-- Name: ingredient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.ingredient_id_seq', 42, true);


--
-- Name: panier_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.panier_id_seq', 14, true);


--
-- Name: recette_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.recette_id_seq', 176, true);


--
-- Name: tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.tag_id_seq', 7, true);


--
-- Name: ustensile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.ustensile_id_seq', 9, true);


--
-- Name: allergene_ingredient allergene_ingredient_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.allergene_ingredient
    ADD CONSTRAINT allergene_ingredient_pkey PRIMARY KEY (id_ingredient, id_allergene);


--
-- Name: allergene allergene_label_key; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.allergene
    ADD CONSTRAINT allergene_label_key UNIQUE (label);


--
-- Name: allergene allergene_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.allergene
    ADD CONSTRAINT allergene_pkey PRIMARY KEY (id);


--
-- Name: allergie_utilisateur allergie_utilisateur_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.allergie_utilisateur
    ADD CONSTRAINT allergie_utilisateur_pkey PRIMARY KEY (id_allergene, id_utilisateur);


--
-- Name: commentaire commentaire_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.commentaire
    ADD CONSTRAINT commentaire_pkey PRIMARY KEY (id);


--
-- Name: favoris favoris_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.favoris
    ADD CONSTRAINT favoris_pkey PRIMARY KEY (id_utilisateur, id_recette);


--
-- Name: frigo frigo_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.frigo
    ADD CONSTRAINT frigo_pkey PRIMARY KEY (id_utilisateur, id_ingredient, date_ajout);


--
-- Name: ingredient_exclu ingredient_exclu_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.ingredient_exclu
    ADD CONSTRAINT ingredient_exclu_pkey PRIMARY KEY (id_ingredient, id_utilisateur);


--
-- Name: ingredient ingredient_nom_key; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.ingredient
    ADD CONSTRAINT ingredient_nom_key UNIQUE (nom);


--
-- Name: ingredient_panier ingredient_panier_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.ingredient_panier
    ADD CONSTRAINT ingredient_panier_pkey PRIMARY KEY (id_panier, id_ingredient);


--
-- Name: ingredient ingredient_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.ingredient
    ADD CONSTRAINT ingredient_pkey PRIMARY KEY (id);


--
-- Name: ingredient_produit ingredient_produit_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.ingredient_produit
    ADD CONSTRAINT ingredient_produit_pkey PRIMARY KEY (id_producteur, id_ingredient);


--
-- Name: ingredient_recette ingredient_recette_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.ingredient_recette
    ADD CONSTRAINT ingredient_recette_pkey PRIMARY KEY (id_recette, id_ingredient);


--
-- Name: note_recette note_recette_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.note_recette
    ADD CONSTRAINT note_recette_pkey PRIMARY KEY (id_utilisateur, id_recette);


--
-- Name: panier panier_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.panier
    ADD CONSTRAINT panier_pkey PRIMARY KEY (id);


--
-- Name: panier_utilisateur panier_utilisateur_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.panier_utilisateur
    ADD CONSTRAINT panier_utilisateur_pkey PRIMARY KEY (id_utilisateur, id_panier);


--
-- Name: producteur_utilisateur producteur_utilisateur_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.producteur_utilisateur
    ADD CONSTRAINT producteur_utilisateur_pkey PRIMARY KEY (id_producteur, id_utilisateur);


--
-- Name: recette recette_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.recette
    ADD CONSTRAINT recette_pkey PRIMARY KEY (id);


--
-- Name: tag tag_label_key; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_label_key UNIQUE (label);


--
-- Name: tag tag_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_pkey PRIMARY KEY (id);


--
-- Name: tag_recette tag_recette_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.tag_recette
    ADD CONSTRAINT tag_recette_pkey PRIMARY KEY (id_tag, id_recette);


--
-- Name: ustensile_exclu ustensile_exclu_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.ustensile_exclu
    ADD CONSTRAINT ustensile_exclu_pkey PRIMARY KEY (id_ustensile, id_utilisateur);


--
-- Name: ustensile ustensile_nom_key; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.ustensile
    ADD CONSTRAINT ustensile_nom_key UNIQUE (nom);


--
-- Name: ustensile ustensile_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.ustensile
    ADD CONSTRAINT ustensile_pkey PRIMARY KEY (id);


--
-- Name: ustensile_recette ustensile_recette_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.ustensile_recette
    ADD CONSTRAINT ustensile_recette_pkey PRIMARY KEY (id_recette, id_ustensile);


--
-- Name: utilisateur utilisateur_nom_utilisateur_key; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.utilisateur
    ADD CONSTRAINT utilisateur_nom_utilisateur_key UNIQUE (nom_utilisateur);


--
-- Name: utilisateur utilisateur_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.utilisateur
    ADD CONSTRAINT utilisateur_pkey PRIMARY KEY (id);


--
-- Name: allergene_ingredient allergene_ingredient_id_allergene_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.allergene_ingredient
    ADD CONSTRAINT allergene_ingredient_id_allergene_fkey FOREIGN KEY (id_allergene) REFERENCES public.allergene(id);


--
-- Name: allergene_ingredient allergene_ingredient_id_ingredient_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.allergene_ingredient
    ADD CONSTRAINT allergene_ingredient_id_ingredient_fkey FOREIGN KEY (id_ingredient) REFERENCES public.ingredient(id);


--
-- Name: allergie_utilisateur allergie_utilisateur_id_allergene_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.allergie_utilisateur
    ADD CONSTRAINT allergie_utilisateur_id_allergene_fkey FOREIGN KEY (id_allergene) REFERENCES public.allergene(id);


--
-- Name: allergie_utilisateur allergie_utilisateur_id_utilisateur_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.allergie_utilisateur
    ADD CONSTRAINT allergie_utilisateur_id_utilisateur_fkey FOREIGN KEY (id_utilisateur) REFERENCES public.utilisateur(id);


--
-- Name: commentaire commentaire_id_recette_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.commentaire
    ADD CONSTRAINT commentaire_id_recette_fkey FOREIGN KEY (id_recette) REFERENCES public.recette(id) ON DELETE CASCADE;


--
-- Name: commentaire commentaire_id_utilisateur_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.commentaire
    ADD CONSTRAINT commentaire_id_utilisateur_fkey FOREIGN KEY (id_utilisateur) REFERENCES public.utilisateur(id) ON DELETE CASCADE;


--
-- Name: favoris favoris_id_recette_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.favoris
    ADD CONSTRAINT favoris_id_recette_fkey FOREIGN KEY (id_recette) REFERENCES public.recette(id) ON DELETE CASCADE;


--
-- Name: favoris favoris_id_utilisateur_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.favoris
    ADD CONSTRAINT favoris_id_utilisateur_fkey FOREIGN KEY (id_utilisateur) REFERENCES public.utilisateur(id);


--
-- Name: frigo frigo_id_ingredient_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.frigo
    ADD CONSTRAINT frigo_id_ingredient_fkey FOREIGN KEY (id_ingredient) REFERENCES public.ingredient(id);


--
-- Name: frigo frigo_id_utilisateur_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.frigo
    ADD CONSTRAINT frigo_id_utilisateur_fkey FOREIGN KEY (id_utilisateur) REFERENCES public.utilisateur(id);


--
-- Name: ingredient_exclu ingredient_exclu_id_ingredient_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.ingredient_exclu
    ADD CONSTRAINT ingredient_exclu_id_ingredient_fkey FOREIGN KEY (id_ingredient) REFERENCES public.ingredient(id);


--
-- Name: ingredient_exclu ingredient_exclu_id_utilisateur_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.ingredient_exclu
    ADD CONSTRAINT ingredient_exclu_id_utilisateur_fkey FOREIGN KEY (id_utilisateur) REFERENCES public.utilisateur(id);


--
-- Name: ingredient_panier ingredient_panier_id_ingredient_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.ingredient_panier
    ADD CONSTRAINT ingredient_panier_id_ingredient_fkey FOREIGN KEY (id_ingredient) REFERENCES public.ingredient(id);


--
-- Name: ingredient_panier ingredient_panier_id_panier_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.ingredient_panier
    ADD CONSTRAINT ingredient_panier_id_panier_fkey FOREIGN KEY (id_panier) REFERENCES public.panier(id);


--
-- Name: ingredient_produit ingredient_produit_id_ingredient_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.ingredient_produit
    ADD CONSTRAINT ingredient_produit_id_ingredient_fkey FOREIGN KEY (id_ingredient) REFERENCES public.ingredient(id);


--
-- Name: ingredient_produit ingredient_produit_id_producteur_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.ingredient_produit
    ADD CONSTRAINT ingredient_produit_id_producteur_fkey FOREIGN KEY (id_producteur) REFERENCES public.utilisateur(id);


--
-- Name: ingredient_recette ingredient_recette_id_ingredient_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.ingredient_recette
    ADD CONSTRAINT ingredient_recette_id_ingredient_fkey FOREIGN KEY (id_ingredient) REFERENCES public.ingredient(id);


--
-- Name: ingredient_recette ingredient_recette_id_recette_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.ingredient_recette
    ADD CONSTRAINT ingredient_recette_id_recette_fkey FOREIGN KEY (id_recette) REFERENCES public.recette(id) ON DELETE CASCADE;


--
-- Name: note_recette note_recette_id_recette_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.note_recette
    ADD CONSTRAINT note_recette_id_recette_fkey FOREIGN KEY (id_recette) REFERENCES public.recette(id) ON DELETE CASCADE;


--
-- Name: note_recette note_recette_id_utilisateur_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.note_recette
    ADD CONSTRAINT note_recette_id_utilisateur_fkey FOREIGN KEY (id_utilisateur) REFERENCES public.utilisateur(id) ON DELETE CASCADE;


--
-- Name: panier panier_id_producteur_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.panier
    ADD CONSTRAINT panier_id_producteur_fkey FOREIGN KEY (id_producteur) REFERENCES public.utilisateur(id);


--
-- Name: panier_utilisateur panier_utilisateur_id_panier_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.panier_utilisateur
    ADD CONSTRAINT panier_utilisateur_id_panier_fkey FOREIGN KEY (id_panier) REFERENCES public.panier(id);


--
-- Name: panier_utilisateur panier_utilisateur_id_utilisateur_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.panier_utilisateur
    ADD CONSTRAINT panier_utilisateur_id_utilisateur_fkey FOREIGN KEY (id_utilisateur) REFERENCES public.utilisateur(id);


--
-- Name: producteur_utilisateur producteur_utilisateur_id_producteur_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.producteur_utilisateur
    ADD CONSTRAINT producteur_utilisateur_id_producteur_fkey FOREIGN KEY (id_producteur) REFERENCES public.utilisateur(id);


--
-- Name: producteur_utilisateur producteur_utilisateur_id_utilisateur_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.producteur_utilisateur
    ADD CONSTRAINT producteur_utilisateur_id_utilisateur_fkey FOREIGN KEY (id_utilisateur) REFERENCES public.utilisateur(id);


--
-- Name: recette recette_id_createur_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.recette
    ADD CONSTRAINT recette_id_createur_fkey FOREIGN KEY (id_createur) REFERENCES public.utilisateur(id);


--
-- Name: recette recette_id_recette_parente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.recette
    ADD CONSTRAINT recette_id_recette_parente_fkey FOREIGN KEY (id_recette_parente) REFERENCES public.recette(id) ON DELETE SET NULL;


--
-- Name: tag_recette tag_recette_id_recette_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.tag_recette
    ADD CONSTRAINT tag_recette_id_recette_fkey FOREIGN KEY (id_recette) REFERENCES public.recette(id) ON DELETE CASCADE;


--
-- Name: tag_recette tag_recette_id_tag_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.tag_recette
    ADD CONSTRAINT tag_recette_id_tag_fkey FOREIGN KEY (id_tag) REFERENCES public.tag(id);


--
-- Name: ustensile_exclu ustensile_exclu_id_ustensile_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.ustensile_exclu
    ADD CONSTRAINT ustensile_exclu_id_ustensile_fkey FOREIGN KEY (id_ustensile) REFERENCES public.ustensile(id);


--
-- Name: ustensile_exclu ustensile_exclu_id_utilisateur_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.ustensile_exclu
    ADD CONSTRAINT ustensile_exclu_id_utilisateur_fkey FOREIGN KEY (id_utilisateur) REFERENCES public.utilisateur(id);


--
-- Name: ustensile_recette ustensile_recette_id_recette_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.ustensile_recette
    ADD CONSTRAINT ustensile_recette_id_recette_fkey FOREIGN KEY (id_recette) REFERENCES public.recette(id) ON DELETE CASCADE;


--
-- Name: ustensile_recette ustensile_recette_id_ustensile_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.ustensile_recette
    ADD CONSTRAINT ustensile_recette_id_ustensile_fkey FOREIGN KEY (id_ustensile) REFERENCES public.ustensile(id);


--
-- PostgreSQL database dump complete
--

