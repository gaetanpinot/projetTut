// Problématique:
// - Explication de ce que c'est une amap
// - Quelle recette faire avec ces ingredients
//
// Solution (explication des fonctionnalitées réalisée)
// - Site de partage de recette dédié au amap
// Amapiens partages les différentes recettes qu'ils font avec les ingrédients
// Les producteurs déclare ce qu'il y aura dans le panier pour que les utilisateurs qui sont abonnées puisse le visualiser
// - Recherche de recettes par ingrédients
// Un utilisateur peut séléctionner differents ingrédients qu'il souhaite utiliser dans sa recette
// ainsi que differents filtres pour affiner sa recherche
// Un utilisateur connéctée possède aussi des préférences pour certain filtres (comme les ingredients à exclure, et les allérgies) qui sont enregistrées, et qui peuvent être appliquées à une recherche avec un seul clic, facilitant la recherche regulière
// - Abonnement à des producteurs pour avoir leurs panier dans notre frigo
// Un utilisateur peut s'abonner a un producteur qui produit son panier
// (à noter que cet abonnement est complètement non officiel, aucune
// résponsabilité n'est engagée par l'abonnement sur le site, il sert
// simplement à afficher les ingredients du panier du producteur dans le
// frigo, *la gestion du paiement et de la collecte du panier se fait par
// les méthodes spécifique à chaque AMAP, se site n'est là que pour
// faciliter le partage des recettes*)
// - Frigo
//
// Le frigo regroupe les ingredients possédé par l'utilisateur, ceux qu'il déclare lui meme, et ceux qui sont mis quand un producteur auquel l'utilisateur et abonné publie un panier
// Il permet de faire rapidement une recherche pour trouver des recette qui lui 
// permette d'utiliser un maximum d'ingredient qu'il possède dans son  frigo
//
// - Amélioration possible
// Gestion des utilisateurs, “J’ai oublié mon mot de passe"
// Noter et commenter les recettes
// Outil de modération pour supprimer le contenu non approprié
// Possibilité d’ajouter des ingrédients non présent dans la bd
// Support des Ustensiles, Tags
// Mettre en avant les productions à la création de panier (créer un panier a partir d’un autre panier)
// Possibilité de faires des recettes associés à une autre recette, qu'on puisse voir dans une section "recette dérivée" sur la page d'une recette

// Conclusion (avis sur le projet)

== Problématique : Recettes et Paniers AMAP
Une Association pour le
Maintien de l'Agriculture Paysanne (AMAP) est une forme de partenariat
de proximité entre un groupe de consommateurs et un ou plusieurs
producteurs. Les consommateurs s'engagent à acheter à l'avance une
partie de la production, généralement sous forme de paniers de légumes,
fruits ou autres produits de la ferme, distribués régulièrement. Ce
système permet aux producteurs de sécuriser leurs revenus et aux
consommateurs de bénéficier de produits frais, de saison, souvent
biologiques, et de soutenir l'agriculture locale.

Chaque semaine apporte son lot de surprises et, parfois, de défis
culinaires. Face à une variété de légumes, certains très familiers
et d'autres moins courants, la question se pose souvent : "Que vais-je
bien pouvoir cuisiner avec ces ingrédients cette semaine ?" Les membres
se retrouvent ainsi à chercher des idées de recettes adaptées aux
contenus spécifiques de leurs paniers, une tâche qui peut s'avérer
chronophage et parfois frustrante lorsqu'il s'agit d'utiliser des légumes
moins connus ou d'associer des produits inattendus. Comment tirer le
meilleur parti de chaque panier reçu et éviter le gaspillage, tout en
variant les plaisirs et en découvrant de nouvelles saveurs ? C'est là
toute la problématique à laquelle sont confrontés les amapiens dans
leur quotidien.

== Solution proposée : Plateforme de Recettes AMAP
Pour répondre aux défis
rencontrés par les amapiens dans l'utilisation de leurs paniers, la
solution proposée est la création d'une plateforme web collaborative
dédiée au partage de recettes.

=== Site de partage de recettes dédié aux AMAP 
Cette plateforme
servira de lieu d'échange où les amapiens pourront partager les
différentes recettes qu'ils réalisent avec les ingrédients de leurs
paniers. L'objectif est de mutualiser les expériences culinaires et de
fournir une base de données de recettes testées et approuvées par
la communauté. Les producteurs auront également la possibilité de
déclarer le contenu des paniers à venir, permettant aux utilisateurs
abonnés de visualiser à l'avance les ingrédients qu'ils recevront.

=== Recherche de recettes par ingrédients et filtres
Un élément central de la plateforme sera un moteur de recherche
performant. Les utilisateurs pourront sélectionner les ingrédients
qu'ils souhaitent utiliser, et la recherche affichera les recettes
correspondantes. Des filtres supplémentaires permettront d'affiner les
résultats (ingrédients à exclure, allergies) , pour les utilisateurs
connectés, il sera possible d'enregistrer des préférences de ces
filtres précédent qui pourront être appliquées rapidement aux
recherches, facilitant ainsi la découverte de recettes adaptées.

=== Abonnement aux producteurs et "Frigo" virtuel 
Les utilisateurs pourront s'abonner aux producteurs auprès desquels ils prennent leurs
paniers. Cet abonnement, purement informatif sur le site, permettra
d'ajouter automatiquement les ingrédients du panier annoncé par le
producteur dans un "Frigo" virtuel personnel de l'utilisateur. Le "Frigo"
regroupera l'ensemble des ingrédients possédés par l'utilisateur,
qu'ils proviennent d'un panier déclaré ou qu'ils aient été ajoutés
manuellement. Il offrira une vue d'ensemble des produits disponibles et
permettra de lancer rapidement une recherche de recettes utilisant un
maximum de ces ingrédients. Il est important de noter que l'abonnement
à un producteur via le site est informatif uniquement et ne gère en
aucun cas le paiement ou la distribution réelle des paniers, qui restent
gérés par les méthodes spécifiques à chaque AMAP.

=== Améliorations possibles 
Plusieurs pistes d'amélioration ont été
identifiées pour enrichir la plateforme à l'avenir :
- Gestion des utilisateurs et fonctionnalités associées (récupération de mot de passe).
- Possibilité de noter et commenter les recettes.
- Mise en place d'outils de modération pour assurer la qualité du contenu.
- Ajout d'ingrédients non présents initialement dans la base de données.
- Prise en compte des ustensiles nécessaires et ajout de tags aux recettes pour une meilleure catégorisation.
- Faciliter la création de nouveaux paniers pour les producteurs en se basant sur des paniers existants.
- Permettre de lier des recettes entre elles pour créer des "recettes dérivées".

== Gestion du projet
Pour se répartir le travail, nous avons découpé le projet en taches distinctes, qu'on à 
renseigné sur un trello, avec plusieurs colonnes à faire, en cours et fait.
Cela permet de savoir qui à fait quoi et de pouvoir commencer la tâche suivante sans 
consulter l'ensemble du groupe.
Nous n'avions pas noté d'estimation de temps, mais nous avons estimé le temps passé 
sur chaque tâche pour chaque personne à la fin du projet.
On peut estimer, en fonction du taux horaire de développeur, que le projet
aurait pu couter entre 23K€ et 35K€ au client. Cependant, nous sommes des développeurs 
assez peu expérimenté, si le projet avait été mené par des personnes avec plus 
d'éxperience, il aurait certainement prit moins de temps, et donc couté moins cher.

#figure(
table(
columns: (1fr,1fr,1fr,1fr,1fr,1fr,1fr,1fr,1fr,1fr,1fr,),
    inset: 10pt,
    [Noms],[ Wireframe ],[ Figma ],[ Accés Données ],[ Fonctionnalités],[BD ],[Docker],[View (Angular)],[Css],[CMS], [Total],
[ Gaëtan ],[1],[1],[20],[45],[14],[15],[25],[8],[1],[130],
[ Mathis ],[2],[5],[16],[18],[11],[1],[35],[31],[1],[120],
[ Sasha ],[4],[15],[0.5],[2],[10],[0],[27],[45],[1],[104.5],
[ Yehor ],[1],[1],[12],[18],[16],[20],[31],[19],[1],[119],
[ Total ],[8],[22],[48.5],[83],[51],[36],[118],[103],[4],[473.5],
),
caption: "Répartition des tâches et temps estimé en heures"
)

== Conclusion
Selon nous, ce projet est réussit, nous avons obtenu un site qui fonctionne et qui répond
à la problématique de base. 
Les délais données ont permis la réalisation complète des fonctionnalités de base sans soucis.

Certaines choses aurait pu être faite différemment. 
La plupart des opération de notre API 
sont des lecture simple ou mise à jour de données, ce qui pourrait être fait par un CMS Headless
sans que nous ayons besoin de faire nous memes les routes et apelles à la BD, ce qui nous aurait fait gagner
beaucoup de temps et aurait permit d'intégrer certaines fonctionnalitées plus difficile.

