# Projet Tutoré recette amap
DAZA Sasha  
PEROT Mathis  
PINOT Gaëtan  
PRYKHODKO Yehor  

## Routes

POST
/inscription
Inscription d'un nouvel utilisateur
RqBody:
{
  "nom_utilisateur": "string",
  "mot_de_passe": "string",
  "role": "utilisateur"
}

RsBody:
{
    "token": "XXXX",
    "nom_utilisateur": "string",
    "id_utilisateur": "uuid",
}


POST
/connexion
Connexion d'un utilisateur
RqBody:
{
  "nom_utilisateur": "string",
  "mot_de_passe": "string",
}
RsBody:
{
    "token": "XXXX",
    "nom_utilisateur": "string",
    "id_utilisateur": "uuid",
}

DELETE
/commentaires/{id}
Suppression d'un commentaire

DELETE
/utilisateurs/{id}
Suppression d'un utilisateur

POST
/recettes
Création d'une recette
RqBody:
{
  "nom": "string",
  "temps_preparation": "int",
  "complexite": "int",
  "description": "string",
"id_createur" : "uuid",
"debut_saison": "date",
"fin_saison": "date",
"id_recette_parente"": "int",
"tag" : [
{
"id_tag": "int",
}
],
  "ingredients": [
    {
      "id_ingredient": "int",
      "quantite": "string"
    }
  ]
"ustensiles": [
{
"id_ustensile": 0,
"quantite" : "int"
}
]
}

GET
/recettes
Recherche de recettes avec filtres

GET
/recettes/{id}
Détails d'une recette

DELETE
/recettes/{id}
Suppression d'une recette

GET
/tag
Recherche de tag

POST
/tag
Creation de tag
RqBody:
{
"labelle": "string"
}

RsBody:
$Tag

POST
/recettes/{id}/commentaires
Ajouter un commentaire à une recette

POST
/recettes/{id}/favoris
Ajouter une recette aux favoris

GET
/recettes/{id}/favoris
Obtenir les recettes favorites

POST
/producteurs/{id}/abonnement
S'abonner à un producteur

GET
/producteurs/{id}/ingredients
Obtenir les ingrédients d'un producteur

GET
/paniers/prochain
Obtenir le prochain panier

GET
/ingredients
Obtenir la liste des ingrédients

POST
/ingredients
Créer un nouvel ingrédient

GET
/frigo
Obtenir le contenu du frigo

PATCH
/frigo
Ajouter/Enlever un ingrédient au frigo

GET
/utilisateurs/{id}/allergenes
Obtenir la liste d'allergènes 

POST
/utilisateurs/{id}/allergenes
Ajouter un allergène à l'utilisateur

DELETE
/utilisateurs/{id}/allergenes
Supprimer un allergène de l'utilisateur l'utilisateur

GET
/utilisateurs/{id}/ustensiles
Obtenir la liste des ustensiles exclus

POST
/utilisateurs/{id}/ustensiles
Ajouter un ustensile à la liste d'exclusion

DELETE
/utilisateurs/{id}/ustensiles
Supprimer un ustensile de la liste d'exclusion

POST
/paniers
Créer un nouveau panier

PUT
/paniers/{id}
Modifier un panier

POST
/paniers/{id}
Envoyer un panier

$Tag :
{
"id": "int"
"labelle": "string"
}
