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
    date_ajout timestamp NOT NULL,
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
\.


--
-- Data for Name: allergene_ingredient; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.allergene_ingredient (id_ingredient, id_allergene) FROM stdin;
42	4
\.


--
-- Data for Name: allergie_utilisateur; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.allergie_utilisateur (id_allergene, id_utilisateur) FROM stdin;
2	f47ac10b-58cc-4372-a567-0e02b2c3d479
1	c9bf9e57-1685-4c89-bafb-ff5af830be8a
3	2a0a11b7-a68c-4e21-92b4-7f7af6ffcd33
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
f47ac10b-58cc-4372-a567-0e02b2c3d479	1	2024-12-10	3kg
c9bf9e57-1685-4c89-bafb-ff5af830be8a	2	2024-12-11	2pcs
2a0a11b7-a68c-4e21-92b4-7f7af6ffcd33	3	2024-12-12	250g
84be57c6-4ef4-4381-bf05-a52139a50911	4	2024-12-15	1pc
\.


--
-- Data for Name: ingredient; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.ingredient (id, nom, debut_saison, fin_saison, url_photo) FROM stdin;
1	Tomate	6	9	https://example.com/images/tomate.jpg
2	Carotte	10	4	https://example.com/images/carotte.jpg
3	Courgette	6	9	https://example.com/images/courgette.jpg
4	Oignon	1	12	https://example.com/images/oignon.jpg
5	Pommes de terre	8	3	https://example.com/images/pommesdeterre.jpg
6	Champignons	9	12	https://example.com/images/champignons.jpg
7	Brocoli	9	3	https://example.com/images/brocoli.jpg
8	Chou-fleur	9	3	https://example.com/images/chou-fleur.jpg
9	Poivron	6	9	https://example.com/images/poivron.jpg
10	Persil	5	10	https://example.com/images/persil.jpg
11	Basilic	6	9	https://example.com/images/basilic.jpg
12	Riz	1	12	https://example.com/images/riz.jpg
13	Pois chiches	5	8	https://example.com/images/pois-chiches.jpg
14	Farine	1	12	https://example.com/images/farine.jpg
15	Œufs	1	12	https://example.com/images/oeufs.jpg
16	Lait	1	12	https://example.com/images/lait.jpg
17	Beurre	1	12	https://example.com/images/beurre.jpg
18	Crème fraîche	1	12	https://example.com/images/creme-fraiche.jpg
19	Fromage	1	12	https://example.com/images/fromage.jpg
20	Poulet	1	12	https://example.com/images/poulet.jpg
21	Bœuf	1	12	https://example.com/images/boeuf.jpg
22	Poisson	1	12	https://example.com/images/poisson.jpg
23	Saumon	1	12	https://example.com/images/saumon.jpg
24	Crevettes	1	12	https://example.com/images/crevettes.jpg
25	Pain	1	12	https://example.com/images/pain.jpg
26	Pâtes	1	12	https://example.com/images/pates.jpg
27	Sel	1	12	https://example.com/images/sel.jpg
28	Poivre	1	12	https://example.com/images/poivre.jpg
29	Cumin	1	12	https://example.com/images/cumin.jpg
30	Cannelle	1	12	https://example.com/images/cannelle.jpg
31	Huile d’olive	11	2	https://example.com/images/huile-olive.jpg
32	Miel	1	12	https://example.com/images/miel.jpg
33	Sucre	1	12	https://example.com/images/sucre.jpg
34	Moules	6	2	https://example.com/images/moules.jpg
35	Chocolat	1	12	https://example.com/images/chocolat.jpg
36	Pomme	9	12	https://example.com/images/pomme.jpg
37	Banane	1	12	https://example.com/images/banane.jpg
38	Fraises	5	7	https://example.com/images/fraises.jpg
39	Cerises	6	7	https://example.com/images/cerises.jpg
40	Orange	12	3	https://example.com/images/orange.jpg
41	Citron	11	4	https://example.com/images/citron.jpg
42	Arachide	1	12	http://example.com/ing/arachide.jpg
\.


--
-- Data for Name: ingredient_exclu; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.ingredient_exclu (id_ingredient, id_utilisateur) FROM stdin;
5	f47ac10b-58cc-4372-a567-0e02b2c3d479
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
\.


--
-- Data for Name: ingredient_produit; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.ingredient_produit (id_producteur, id_ingredient) FROM stdin;
6618f3e4-c492-474c-b925-1f4f1a0774c3	1
6618f3e4-c492-474c-b925-1f4f1a0774c3	2
6618f3e4-c492-474c-b925-1f4f1a0774c3	3
047b6cae-6140-49f7-8c66-ef6b66cbb441	5
047b6cae-6140-49f7-8c66-ef6b66cbb441	6
047b6cae-6140-49f7-8c66-ef6b66cbb441	4
047b6cae-6140-49f7-8c66-ef6b66cbb441	9
047b6cae-6140-49f7-8c66-ef6b66cbb441	10
\.


--
-- Data for Name: ingredient_recette; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.ingredient_recette (id_recette, id_ingredient, quantite) FROM stdin;
1	1	200g
1	2	50g
2	3	300g
2	42	10g
3	1	250g
3	4	100g
4	6	500g
4	2	100g
5	9	30g
5	10	30g
5	5	100g
\.


--
-- Data for Name: note_recette; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.note_recette (id_utilisateur, id_recette, note) FROM stdin;
f47ac10b-58cc-4372-a567-0e02b2c3d479	1	5
c9bf9e57-1685-4c89-bafb-ff5af830be8a	2	4
2a0a11b7-a68c-4e21-92b4-7f7af6ffcd33	3	3
\.


--
-- Data for Name: panier; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.panier (id, id_producteur, date) FROM stdin;
1	6618f3e4-c492-474c-b925-1f4f1a0774c3	2024-12-01
2	6618f3e4-c492-474c-b925-1f4f1a0774c3	2024-12-05
3	047b6cae-6140-49f7-8c66-ef6b66cbb441	2024-12-02
4	047b6cae-6140-49f7-8c66-ef6b66cbb441	2024-12-06
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
\.


--
-- Data for Name: recette; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.recette (id, nom, temps_preparation, complexite, id_createur, description, debut_saison, fin_saison, id_recette_parente, url_photo) FROM stdin;
7	Gratin de pommes de terre	45	2	\N	Un gratin crémeux à base de pommes de terre et de fromage.	8	3	\N	https://assets.afcdn.com/recipe/20180123/77042_w1024h1024c1cx2625cy1750cxt0cyt0cxb5250cyb3500.jpg
9	Ratatouille	50	3	\N	Un plat provençal avec tomates, courgettes et poivrons.	6	9	\N	https://cdn.loveandlemons.com/wp-content/uploads/2024/07/ratatouille.jpg
10	Poulet au citron	40	2	\N	Un poulet tendre mariné au citron et à l’huile d’olive.	11	4	\N	https://img.cuisineaz.com/660x660/2013/12/20/i13051-poulet-citron.jpeg
11	Quiche aux champignons	45	2	\N	Une quiche savoureuse aux champignons et à la crème fraîche.	9	12	\N	https://assets.afcdn.com/recipe/20221010/135915_w1024h1024c1cx999cy749cxt0cyt0cxb1999cyb1499.jpg
12	Tarte aux fraises	60	3	\N	Une tarte gourmande garnie de fraises fraîches.	5	7	\N	https://assets.afcdn.com/recipe/20161116/53080_w1024h1024c1cx2808cy1872.jpg
13	Pâtes à la sauce tomate	25	1	\N	Des pâtes savoureuses avec une sauce tomate maison.	6	9	\N	https://www.papillesetpupilles.fr/wp-content/uploads/2023/02/P%C3%A2tes-sauce-tomate-Copyright-Lablascovegmenu-CCBY20-.jpg
14	Moules marinières	30	2	\N	Des moules cuites dans un bouillon parfumé à l’ail et au vin blanc.	6	2	\N	https://img.cuisineaz.com/660x660/2017/07/21/i130938-moules-marinieres-au-cookeo.jpeg
16	Soupe à l’oignon	40	2	\N	Une soupe traditionnelle gratinée à l’oignon.	1	12	\N	https://assets.afcdn.com/recipe/20210104/116953_w1024h1024c1cx806cy863cxt0cyt382cxb1641cyb1350.jpg
17	Tarte aux pommes	50	2	\N	Une tarte sucrée aux pommes caramélisées.	9	12	\N	https://assets.afcdn.com/recipe/20220128/128250_w1024h1024c1cx1294cy688cxt0cyt0cxb2037cyb1472.webp
18	Bœuf bourguignon	180	4	\N	Un ragoût mijoté de bœuf et de vin rouge.	1	12	\N	https://assets.afcdn.com/recipe/20220707/133382_w1024h1024c1cx1396cy931cxt0cyt162cxb2162cyb1386.webp
19	Clafoutis aux cerises	45	2	\N	Un dessert fondant avec des cerises fraîches.	6	7	\N	https://assets.afcdn.com/recipe/20180126/77154_w1024h1024c1cx2808cy1872cxt0cyt0cxb5616cyb3744.jpg
21	Crème brûlée	50	3	\N	Un dessert onctueux avec une croûte de sucre caramélisé.	1	12	\N	https://www.markal.fr/application/files/medias_markal/recettes/988-recette-creme-brulee.jpg
22	Gâteau au chocolat	60	2	\N	Un gâteau moelleux au chocolat noir.	1	12	\N	https://odelices.ouest-france.fr/images/recettes/2013/gateau_au_chocolat1.jpg
23	Velouté de courgettes	30	1	\N	Une soupe veloutée de courgettes et crème fraîche.	6	9	\N	https://assets.afcdn.com/recipe/20200508/110752_w1024h1024c1cx960cy540cxt0cyt0cxb1920cyb1080.webp
25	Galettes de pois chiches	40	2	\N	Des galettes croustillantes à base de pois chiches et d’épices.	5	8	\N	https://assets.tmecosys.com/image/upload/t_web767x639/img/recipe/ras/Assets/F5CE0B6C-392E-4766-9FEF-595802E0C0E6/Derivates/6669A720-8BB6-4A21-8A2A-41A10D6B9578.jpg
26	Cookies maison	30	1	\N	Des cookies moelleux aux pépites de chocolat.	1	12	\N	https://assets.afcdn.com/recipe/20190529/93153_w1024h1024c1cx2220cy1728cxt0cyt0cxb4441cyb3456.jpg
27	Poulet rôti	90	2	\N	Un poulet entier rôti avec des herbes et du beurre.	1	12	\N	https://img.cuisineaz.com/660x660/2016/10/23/i113627-poulet-roti-au-four.jpg
29	Soupe de poireaux	30	1	\N	Une soupe légère aux poireaux et pommes de terre.	1	12	\N	https://fgdjrynm.filerobot.com/recipes/5e44c6fed4cffe8d5b0e60aece98fc485c933c922a9ebe29f8f14bb9f22a7d81.jpg?vh=d0afa2&h=800&w=800&q=60
31	Tajine de poulet aux abricots	120	3	\N	Un plat marocain sucré-salé avec du poulet et des abricots.	1	12	\N	https://mccormick.widen.net/content/doccnjyvjs/original/tajine_de_poulet_au_citron_et_aux_olives_800x800.jpg
32	Couscous végétarien	50	2	\N	Un couscous aux légumes de saison et pois chiches.	5	10	\N	https://assets.afcdn.com/recipe/20201207/116184_w1024h1024c1cx458cy1458cxt0cyt0cxb4005cyb3046.jpg
34	Burger maison	40	2	\N	Un burger avec un steak haché maison et des légumes frais.	1	12	\N	https://img.cuisineaz.com/660x660/2016/05/21/i86551-burger-au-bacon-et-au-cheddar.jpg
35	Paella aux fruits de mer	60	4	\N	Une paella espagnole avec crevettes, moules et calamars.	6	10	\N	https://cdn.pratico-pratiques.com/app/uploads/sites/4/2018/08/30191438/paella-traditionnelle-aux-fruits-de-mer.jpeg
36	Lasagnes à la bolognaise	90	3	\N	Des lasagnes italiennes classiques avec une sauce bolognaise.	1	12	\N	https://assets.afcdn.com/recipe/20180119/76936_w1024h1024c1cx2680cy1786cxt0cyt0cxb5361cyb3573.webp
38	Omelette aux herbes	15	1	\N	Une omelette légère agrémentée d’herbes fraîches.	1	12	\N	https://img.cuisineaz.com/660x660/2015/04/24/i97790-l-omelette-aux-fines-herbes-des-recettes-du-bonheur.jpg
39	Pavé de bœuf sauce au poivre	35	3	\N	Un pavé de bœuf grillé servi avec une sauce crémeuse au poivre.	1	12	\N	https://images.radio-canada.ca/v1/alimentation/recette/1x1/contre-filet-boeuf-sauce-poivre-carottes-roties.jpg
40	Bruschetta tomate mozzarella	20	1	\N	Des tranches de pain grillées garnies de tomates fraîches et mozzarella.	6	9	\N	https://assets.afcdn.com/recipe/20170112/42222_w1024h1024c1cx1500cy1000.jpg
41	Gaspacho andalou	15	1	\N	Une soupe froide aux tomates et poivrons rouges, parfaite pour l’été.	6	9	\N	https://images.radio-canada.ca/v1/alimentation/1x1/gaspacho-tomate-soupe-froide-54503.jpg
42	Chili con carne	75	3	\N	Un plat épicé de viande hachée, haricots rouges et tomates.	1	12	\N	https://assets.afcdn.com/recipe/20211222/126214_w1024h1024c1cx1124cy721cxt0cyt0cxb2119cyb1415.jpg
6	Salade de tomates et basilic	10	1	9cbe2ee3-45eb-46ef-9ea1-59a01d6b4ff2	Une salade fraîche avec des tomates juteuses et du basilic parfumé.	6	9	\N	https://img.cuisineaz.com/660x660/2016/04/18/i76550-salade-de-tomates-au-basilic.jpg
2	Tarte aux Fraises	45	2	c9bf9e57-1685-4c89-bafb-ff5af830be8a	Une tarte sucrée et fruitée	5	7	\N	https://assets.afcdn.com/recipe/20161116/53080_w1024h1024c1cx2808cy1872.jpg
4	Soupe de Carottes	30	1	047b6cae-6140-49f7-8c66-ef6b66cbb441	Un velouté doux	4	11	\N	https://img.cuisineaz.com/660x660/2013/12/20/i78964-photo-de-soupe-aux-carottes.jpeg
5	Smoothie Menthe-Basilic	5	1	9cbe2ee3-45eb-46ef-9ea1-59a01d6b4ff2	Une boisson rafraîchissante	5	9	\N	https://assets.afcdn.com/recipe/20100120/26542_w1024h1024c1cx256cy192.jpg
48	Blinis au saumon fumé	30	2	\N	De petits blinis moelleux garnis de saumon fumé et de crème fraîche.	1	12	\N	https://assets.afcdn.com/recipe/20130924/35903_w1024h1024c1cx1416cy2128.webp
49	Brownie au chocolat	40	2	\N	Un brownie fondant et gourmand au chocolat noir.	1	12	\N	https://img.cuisineaz.com/660x660/2013/12/20/i42812-brownie.jpeg
1	Salade de Tomates	10	1	f47ac10b-58cc-4372-a567-0e02b2c3d479	Une salade fraîche et simple	6	9	\N	https://img.cuisineaz.com/660x660/2018/02/24/i135965-salade-tomate-mozzarella.jpeg
3	Salade de Tomates Revisitee	15	2	f47ac10b-58cc-4372-a567-0e02b2c3d479	Une variante plus complexe	6	9	1	https://www.tables-auberges.com/storage/uploads/2022/04/AdobeStock_232182614.jpeg
8	Soupe de carottes	30	1	\N	Une soupe réconfortante avec des carottes et une touche de cumin.	10	4	\N	https://cdn.chefclub.tools/uploads/recipes/cover-thumbnail/64873260-9467-4214-abc0-dd8ef0860896.jpg
15	Pain perdu au miel	15	1	\N	Une recette anti-gaspillage avec du pain rassis et du miel.	1	12	\N	https://recettes.belly-media.com/wp-content/uploads/2022/10/french-toast3-1280x1280.jpg
20	Salade de brocoli	20	1	\N	Une salade croquante avec du brocoli et une sauce légère.	9	3	\N	https://cdn.pratico-pratiques.com/app/uploads/sites/2/2022/12/05142857/salade-de-brocoli-au-fromage-en-grains.jpg
24	Filet de saumon grillé	25	2	\N	Un filet de saumon grillé avec une sauce citronnée.	1	12	\N	https://images.radio-canada.ca/v1/alimentation/recette/1x1/paves-saumon-grille-champignons-huile-amande.jpg
28	Risotto aux champignons	40	3	\N	Un risotto crémeux aux champignons et au parmesan.	9	12	\N	https://assets.afcdn.com/recipe/20171019/73517_w1024h1024c1cx3000cy2000cxt0cyt0cxb6000cyb4000.jpg
30	Salade de concombre et menthe	10	1	\N	Une salade rafraîchissante avec du concombre et de la menthe.	5	9	\N	https://cdn.pratico-pratiques.com/app/uploads/sites/3/2018/08/24081930/salade-de-concombres-olives-et-feta-550x550.jpeg
33	Tarte salée aux épinards et fromage	45	2	\N	Une tarte feuilletée garnie d’épinards et de fromage.	4	9	\N	https://recettesdejulie.fr/wp-content/uploads/2019/10/tarte-epinards-4.jpg
37	Salade de quinoa et légumes	25	1	\N	Une salade équilibrée avec du quinoa, des légumes croquants et une vinaigrette.	5	9	\N	https://assets.afcdn.com/recipe/20220805/134070_w1024h1024c1cx1218cy803cxt0cyt0cxb2121cyb1414.jpg
43	Riz cantonais	30	2	\N	Un riz sauté avec des œufs, petits pois, jambon et crevettes.	1	12	\N	https://assets.afcdn.com/recipe/20200907/114005_w1024h1024c1cx540cy960cxt0cyt0cxb1080cyb1920.jpg
44	Gâteau aux carottes	60	3	\N	Un gâteau moelleux aux carottes et aux épices, surmonté d’un glaçage.	1	12	\N	https://cdn.pratico-pratiques.com/app/uploads/sites/2/2018/08/27231215/gateau-aux-carottes-nouveau515.jpeg
45	Taboulé libanais	20	1	\N	Une salade fraîche de persil, menthe, tomates et boulgour.	5	10	\N	https://assets.afcdn.com/recipe/20200518/111358_w1024h1024c1cx540cy960cxt0cyt0cxb1080cyb1920.webp
46	Tarte au citron meringuée	70	4	\N	Une tarte sucrée au citron avec une meringue dorée.	11	4	\N	https://cdn.chefclub.tools/uploads/recipes/cover-thumbnail/9b334398-8b7a-49c0-ae79-b0ab1f2ea22b_JSoQmra.jpg
47	Gratin de courgettes	45	2	\N	Un gratin savoureux avec des courgettes fondantes et du fromage.	6	9	\N	https://assets.afcdn.com/recipe/20190529/93185_w1024h1024c1cx2736cy1824cxt0cyt0cxb5472cyb3648.jpg
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
860c6722-a0e1-450f-a1d3-7ffe452c7245	test	0	$2y$10$uU8uJAXU81lDfr2ijZVleu41KoXmSsQoawPVUs9Y5hQH9QsLldW7C
f7134bc3-6d06-4e19-8503-68bae02a2362	user	0	$2y$10$aMMhcSPVvEiLNQTI6FHeI.sXaxzPi8vjz5rOkES588cmc8pwakGhy
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

SELECT pg_catalog.setval('public.panier_id_seq', 4, true);


--
-- Name: recette_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.recette_id_seq', 49, true);


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
    ADD CONSTRAINT commentaire_id_recette_fkey FOREIGN KEY (id_recette) REFERENCES public.recette(id);


--
-- Name: commentaire commentaire_id_utilisateur_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.commentaire
    ADD CONSTRAINT commentaire_id_utilisateur_fkey FOREIGN KEY (id_utilisateur) REFERENCES public.utilisateur(id);


--
-- Name: favoris favoris_id_recette_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.favoris
    ADD CONSTRAINT favoris_id_recette_fkey FOREIGN KEY (id_recette) REFERENCES public.recette(id);


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
    ADD CONSTRAINT ingredient_recette_id_recette_fkey FOREIGN KEY (id_recette) REFERENCES public.recette(id);


--
-- Name: note_recette note_recette_id_recette_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.note_recette
    ADD CONSTRAINT note_recette_id_recette_fkey FOREIGN KEY (id_recette) REFERENCES public.recette(id);


--
-- Name: note_recette note_recette_id_utilisateur_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.note_recette
    ADD CONSTRAINT note_recette_id_utilisateur_fkey FOREIGN KEY (id_utilisateur) REFERENCES public.utilisateur(id);


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
    ADD CONSTRAINT recette_id_recette_parente_fkey FOREIGN KEY (id_recette_parente) REFERENCES public.recette(id);


--
-- Name: tag_recette tag_recette_id_recette_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.tag_recette
    ADD CONSTRAINT tag_recette_id_recette_fkey FOREIGN KEY (id_recette) REFERENCES public.recette(id);


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
    ADD CONSTRAINT ustensile_recette_id_recette_fkey FOREIGN KEY (id_recette) REFERENCES public.recette(id);


--
-- Name: ustensile_recette ustensile_recette_id_ustensile_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.ustensile_recette
    ADD CONSTRAINT ustensile_recette_id_ustensile_fkey FOREIGN KEY (id_ustensile) REFERENCES public.ustensile(id);


--
-- PostgreSQL database dump complete
--

