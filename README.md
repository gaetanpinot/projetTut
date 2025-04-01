# Projet Tutoré recette amap
DAZA Sasha  
PEROT Mathis  
PINOT Gaëtan  
PRYKHODKO Yehor  

Retro planning (gant)

# log 

client     -- alice   1234
producteur -- charlie 1234

# Liens:
## Docketu:
Api: <http://docketu.iutnc.univ-lorraine.fr:12200>
Adminer: <http://docketu.iutnc.univ-lorraine.fr:12201>

## TODO PRES:
- [ ] Vidéo de présentation
    - [ ] Tuto utilisateur
    - [ ] Tuto producteur
    - [ ] Vidéo techniques
- [ ] Présentation orale
    - [ ] Powerpoint
- [ ] Démo
- [ ] CMS gestion (gantt+heure-homme)


## Docu technique
Ce site web est fait pour être déployé sur un serveur
linux.
### Config
Les fichiers d'environnement sont des fichiers
qui contienne des informations qui doivent être 
changé en fonction de l'environnement dans lequel
l'appliquation tourne.  

Les fichiers terminant par `.dist` sont des fichiers 
d'exemple qu'il faut copier en enlevant le .dist
pour deployer l'application.
`.env` Contient les ports des service  

`db.env` Contient les informations que la base de donnée
utilise pour les mots de passe et les utilisateurs
**ATTENTION** ces informations permette aussi d'acceder
à la base de donnée avec Adminer, il faut donc faire attention
à ne pas les divulguer, sinon la base de donnée risque d'être
attaqué.  

Le fichier `./api/config/db.ini` contient les informations
utilisé par l'API pour se connecter a la base de donnée 
ils doivent être cohérent avec ce qui est dans `db.env`  

Le fichier `secret.env` contient le secret utilisé
par le token JWT  

`./Front/src/environment.ts` contient l'adresse de l'API
utilisé par le Front end pour se connecter a l'API,
c'est l'url de l'endroit ou votre serveur API est déployé

### Docker
L'application utilise des conteneurs docker pour
deployer l'application.
Une fois que les fichiers de configuration sont copiés
on peut passer au lancement des conteneurs.
On commence par installer les dépendances php avec 
la commande 
`docker compose run php sh -c "composer install && composer upgrade"`  
Puis on lance les conteneurs avec la commande 
`docker compose up -d --remove-orphans;`  
Une fois les containeurs lancés, si la base de donnée 
n'est pas initialisé, on peut le faire avec la commande
`docker compose exec amap.db bash -c "psql -U user amap < /var/sql/dump_2802.sql"`  
Cela inserera les tables ainsi que les données de base de
l'application.  
Normalement à ce moment là l'appplication est fonctionnelle

## Maintenance
Pour maintenir l'application il vous faut des conaissances 
techniques differentes en fonction de ce que vous voulez 
modifier.  
Je ne rentrerais pas dans les détails du fonctionnement
de l'application, mais je vais donner les grandes lignes
### Front end
Le front end est fait avec angular, il est dans le dossier
`./Front` vous pouvez vous familiariser avec angular
sur <https://angular.dev>
Si vous changer quelque chose dans le front end, il faut
relancer le conteneur front-build avec la commande
`docker compose up front-build`  
Chaque [composant](https://angular.dev/essentials/components)
est divisé en 3 fichiers, un fichier html pour le contenu
un fichier css pour le style et un fichier ts pour le 
comportement.  
Si vous voulez modifier certaines parties du texte affichés,
comme les titres des menus ou les textes des boutons, vous
devez aller modifier les fichiers html.
Je vous conseille d'utiliser un outil de recherche
textuel sur plusieurs fichier pour trouver ce que vous
cherchez.  
Si vous voulez changer les couleurs de l'application,
les couleurs principales sont dans le fichier styles.scss

### Back end
Le back end est dans le fichier `./api`
il est fait en php avec la librairie [slim](https://www.slimframework.com/) pour le routing
et [doctrine](https://www.doctrine-project.org/)
pour la base de donnée.
Vous n'avez pas besoin de recompiler le back end.

### Base de donnée
Le site ne possède pas de systeme d'administration, 
si vous voulez enlever des recettes, il faudrat le faire 
directement sur la base de donnée.  
Pour ça il y a un site adminer dans le conteneur.
Il vous permet de se connecter à la base de donnée 
**ATTENTION** il n'y a pas de système de backup, si vous
supprimez des données, elles sont perdues.  
Pour vous connecter à la base de donnée, il vous faut
entré les infos suivantes:
- System: PostgreSQL
- Server: amap.db (c'est le nom du service dans le docker-compose)
- Username: le nom d'utilisateur du fichier `db.env`
- Password: le mot de passe du fichier `db.env`
- Database: la database du fichier `db.env`
Il est conseillé d'avoir des conaissances en SQL pour 
modifier la base de donnée. Cependant il est possible
de modifier directement les table avec les outils d'adminer 
sans ecrire de requête sql.  




