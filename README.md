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

### Maintenance
