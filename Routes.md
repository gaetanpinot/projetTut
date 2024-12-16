## Routes  
  
POST  
/inscription  
Inscription d'un nouvel utilisateur  
RqBody:  
```json  
{  
    "nom_utilisateur": "string",  
    "mot_de_passe": "string",  
    "role": "utilisateur"  
}  
```  
  
RsBody:  
```json  
{  
    "token": "XXXX",  
    "nom_utilisateur": "string",  
    "id_utilisateur": "uuid",  
}  
```  
  
  
POST  
/connexion  
Connexion d'un utilisateur  
  
RqBody:  
```json  
{  
    "nom_utilisateur": "string",  
    "mot_de_passe": "string",  
}```  
  
RsBody:  
```json  
{  
    "token": "XXXX",  
    "utilisateur": $Utilisateur,  
}  
```  
  
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
```json  
{  
    "nom": "string",  
    "temps_preparation": "int",  
    "complexite": "int",  
    "description": "string",  
    "id_createur" : "uuid",  
    "debut_saison": "date",  
    "fin_saison": "date",  
    "id_recette_parente": "int",  
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
    ],  
    "ustensiles": [  
        {  
            "id_ustensile": 0,  
            "quantite" : "int"  
        }  
    ]  
}  
```  
  
RsBody:  
$Recette  
  
GET  
/recettes  
Recherche de recettes avec filtres  
Query:  
```  
/recettes?nom=Soupe au potimaron&temps_preparation_gt=12&temps_preparation_lt=25&complexite_gt=0&complexite_lt=5&debut_saison=01/08&fin_saison=01/11&note_gt=0&note_lt=5&id_tag=[1,3,4]&id_ingredients_principaux=[3,8]&id_ustensiles_exclus=[12,1]&id_ingredients_exclus=[4,9]&id_allergenes=[5]  
```  
  
RsBody:  
```json  
[$Recette]  
```  
  
GET  
/recettes/{id}  
Détails d'une recette  
  
RsBody:  
```json  
$Recette  
```  
  
DELETE  
/recettes/{id}  
Suppression d'une recette  
  
GET  
/tag  
Recherche de tag  
Query:  
```  
/tag?label=potimaron  
```  
  
RsBody:  
```json  
[$Tag]  
```  
  
POST  
/tag  
Creation de tag  
  
RqBody:  
```json  
{  
    "label": "string"  
}  
```  
  
RsBody:  
```json  
$Tag  
```  
  
GET  
/recettes/{id}/commentaires  
Obtenir les commentaires d'une recette  
RsBody:  
```json  
[$Commentaire]  
```  
  
POST  
/recettes/{id}/commentaires  
Ajouter un commentaire à une recette  
RqBody:  
```json  
{  
    "contenu": "string"  
}  
```  
  
PUT  
/recettes/{id}/notes  
Ajouter une note à une recette  
RqBody:  
```json  
{  
    "note": "3",  
}  
```  
  
POST  
/utilisateurs/{id}/favoris/{id_recette}  
Ajouter une recette aux favoris  
  
GET  
/utilisateurs/{id}/favoris  
Obtenir les recettes favorites  
  
RsBody:  
```json  
[$Recette]  
```  
  
POST  
/utilisateurs/{id}/producteurs/{id}  
S'abonner à un producteur  
  
DELETE  
/utilisateurs/{id}/producteurs/{id}  
Se désabonner à un producteur  
  
GET  
/producteurs/{id}/ingredients  
Obtenir les ingrédients d'un producteur  
  
RsBody:  
```json  
[$Ingredient]  
```  
  
GET  
/producteurs/{id}/panier  
Obtenir le prochain panier  
RsBody:  
```json  
$Panier  
```  
  
GET  
/ingredients  
Chercher la liste des ingrédients  
Query:  
```  
/ingredients?nom=Citrouille  
```  
  
RsBody:  
```json  
[$Ingredients]  
```  
  
POST  
/ingredients  
Créer un nouvel ingrédient  
RqBody:  
```json  
{  
    "id_allergene": [  
        "int",  
    ],  
    "nom" : "string",  
    "debut_saison": "date",  
    "fin_saison" : "date",  
  
}  
```  
  
GET  
/utilisateurs/{id}/frigo  
Obtenir le contenu du frigo  
  
PUT  
/utilisateurs/{id}/frigo/ingredient/{id_ingredient}  
Ajouter un ingrédient au frigo  
RqBody:  
```json  
{  
    "quantite": "string",  
    "date_ajout": "date",  
}  
```  
  
RsBody:  
```json  
$Frigo  
```  
  
PATCH  
/utilisateurs/{id}/frigo/ingredient/{id_ingredient}  
Modifier un ingrédient au frigo  
RqBody:  
```json  
{  
    "quantite": "string",  
    "date_ajout": "date",  
}  
```  
  
RsBody:  
```json  
$Frigo  
```  
  
  
DELETE  
/utilisateurs/{id}/frigo/ingredient/{id_ingredient}  
Enlever un ingrédient au frigo  
RqBody:  
```json  
{  
    "date_ajout": "date",  
}  
```  
  
RsBody:  
```json  
$Frigo  
```  
  
GET  
/utilisateurs/{id}/allergenes  
Obtenir la liste d'allergènes  
  
RsBody:  
```json  
[$Allergene]  
```  
  
POST  
/utilisateurs/{id}/allergenes  
Ajouter un allergène à l'utilisateur  
  
RqBody:  
```json  
{  
    "id_allergene" : "int",  
}  
```  
  
DELETE  
/utilisateurs/{id}/allergenes  
Supprimer un allergène de l'utilisateur l'utilisateur  
  
RqBody:  
```json  
{  
    "id_allergene" : "int",  
}  
```  
  
GET  
/utilisateurs/{id}/ustensiles  
Obtenir la liste des ustensiles exclus  
  
RsBody:  
```json  
[$Allergene]  
```  
  
POST  
/utilisateurs/{id}/ustensiles  
Ajouter un ustensile à la liste d'exclusion  
  
RqBody:  
```json  
{  
    "id_ustensile" : "id",  
}  
```  
  
DELETE  
/utilisateurs/{id}/ustensiles  
Supprimer un ustensile de la liste d'exclusion  
  
RqBody:  
```json  
{  
    "id_ustensile" : "id",  
}  
```  
  
GET  
/ustensiles  
Rechercher des ustensiles  
Query:  
```  
/ustensiles?nom=batteur  
```  
  
RsBody:  
```json  
[$Ustensiles]  
```  
  
POST  
/ustensiles  
Créer un ustensile  
RqBody:  
```json  
{  
    "nom": "string",  
}  
```  
  
POST  
/paniers  
Créer un nouveau panier  
  
PUT  
/paniers/{id}  
Modifier un panier  
  
POST  
/paniers/{id}  
Envoyer un panier  
  
### References  
Les template de ce que doit renvoyer l'api  
$Tag :  
```json  
{  
    "id": "int"  
    "label": "string"  
}  
```  
  
$Recette:  
```json  
{  
    "nom": "string",  
    "temps_preparation": "int",  
    "complexite": "int",  
    "description": "string",  
    "id_createur" : "uuid",  
    "debut_saison": "date",  
    "fin_saison": "date",  
    "id_recette_parente": "int",  
    "note": "int",  
    "tag" : [  
        $Tag  
    ],  
    "ingredients": [  
    {"ingredient": $Ingredient,  
    "quantite" :"string"}  
    ],  
"ustensiles": [  
    $Ustensiles  
]  
}  
```  
  
$Ingredient:  
```json  
{  
    "id": "int",  
    "nom": "string",  
    "debut_saison": "date",  
    "fin_saison": "date",  
    "url_photo": "string",  
    "allergenes": [  
        $Allergene  
    ]  
}  
```  
  
$Panier:  
```json  
{  
    "id": "int",  
    "id_producteur": "int",  
    "date": "12/12/2001",  
    "ingredients": [  
    {"ingredient" : $Ingredient ,  
    "quantite": "string"}  
    ],  
}  
```  
  
$Utilisateur:  
```json  
{  
    "id": "uuid",  
    "nom_utilisateur": "string",  
    "role": "5",  
}  
```  
  
$Frigo:  
```json  
{  
    "id_utilisateur": "uuid",  
    "ingredients": [  
    {"ingredient": $Ingredient,  
    "quantite": "int",  
    "date_ajout":"date"}  
    ],  
}  
```  
  
$Preference:  
```json  
{  
    "allergenes":[$Allergene],  
    "ingredients_exclus": [$Ingredient],  
    "ustensiles_exclus": [$Ustensile],  
}  
```  
  
$Commentaire:  
```json  
{  
    "nom_utilisateur": "string",  
    "contenu": "string",  
    "id_recette": "int",  
}  
```  
  
$Allergene:  
```json  
{  
    "id": "int",  
    "label" : "string",  
}  
```  
  
$Ustensile:  
```json  
{  
    "id": "int",  
    "nom": "string",  
}  
```  

