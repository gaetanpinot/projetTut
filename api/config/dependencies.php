<?php

use amap\core\service\ServiceAllergie;
use amap\core\service\interfaces\ServiceAllergenesInterface;
use amap\core\service\interfaces\ServiceAuthInterface;
use amap\core\service\interfaces\ServiceIngredientInterface;
use amap\core\service\interfaces\ServiceNoteInterface;
use amap\core\service\interfaces\ServicePanierInterface;
use amap\core\service\interfaces\ServiceRecettesInterface;
use amap\core\service\interfaces\ServiceUtilisateurInterface;
use amap\core\service\ServiceAuth;
use amap\core\service\ServiceIngredient;
use amap\core\service\ServiceNote;
use amap\core\service\ServicePanier;
use amap\core\service\ServiceRecettes;
use amap\infrastructure\entities\Allergene;
use amap\infrastructure\entities\Ingredient;
use amap\infrastructure\entities\Note;
use amap\infrastructure\entities\Panier;
use amap\infrastructure\entities\Recette;
use amap\infrastructure\entities\Ustensile;
use amap\infrastructure\repository\AllergenesRepository;
use amap\infrastructure\repository\doctrine\Rand;
use amap\infrastructure\repository\interfaces\AllergieRepositoryInterface;
use amap\infrastructure\repository\interfaces\IngredientRepositoryInterface;
use amap\core\service\ServiceUtilisateur;
use amap\infrastructure\entities\Utilisateur;
use amap\infrastructure\repository\interfaces\NoteRepositoryInterface;
use amap\infrastructure\repository\interfaces\PanierRepositoryInterface;
use amap\infrastructure\repository\interfaces\RecetteRepositoryInterface;
use amap\infrastructure\repository\interfaces\UstensileRepositoryInterface;
use amap\infrastructure\repository\interfaces\UtilisateurRepositoryInterface;
use amap\infrastructure\repository\NoteRepository;
use amap\infrastructure\repository\PanierRepository;
use amap\infrastructure\repository\RecetteRepository;
use amap\infrastructure\repository\UstensileRepository;
use amap\middleware\CorsMiddleware;
use amap\providers\auth\AuthnProviderInterface;
use amap\providers\auth\JWTAuthnProvider;
use amap\providers\auth\JWTManager;
use Doctrine\DBAL\Connection;
use Doctrine\DBAL\DriverManager;
use Doctrine\ORM\EntityManager;
use Doctrine\ORM\ORMSetup;
use Monolog\Formatter\LineFormatter;
use Monolog\Handler\StreamHandler;
use Monolog\Level;
use Monolog\Logger;
use Opis\JsonSchema\Validator;
use Psr\Container\ContainerInterface;

use Psr\Log\LoggerInterface;
use function DI\autowire;
use function DI\create;
use function DI\get;

return [

    //doctrine:
    'doctrine.config' => function (ContainerInterface $c) {
        $config =  ORMSetup::createAttributeMetadataConfiguration([$c->get('doctrine.entities')], true);
        $config->addCustomNumericFunction('RAND', Rand::class);
        return $config;
    } ,
    Connection::class => function (ContainerInterface $c) {
        return DriverManager::getConnection($c->get('db.config'), $c->get('doctrine.config'));
    },
    EntityManager::class => DI\autowire()->constructor(get(Connection::class), get('doctrine.config')),

    //repository
    UtilisateurRepositoryInterface::class => function (ContainerInterface $c) {
        $em = $c->get(EntityManager::class);
        return $em->getRepository(Utilisateur::class);
    },

    IngredientRepositoryInterface::class => function (ContainerInterface $c) {
        $em = $c->get(\Doctrine\ORM\EntityManager::class);
        return $em->getRepository(Ingredient::class);
    },

    //service
    ServiceUtilisateurInterface::class => DI\autowire(ServiceUtilisateur::class),

    ServiceAuthInterface::class => DI\autowire(ServiceAuth::class),

    ServiceIngredientInterface::class => DI\autowire(ServiceIngredient::class),

    ServicePanierInterface::class => DI\autowire(ServicePanier::class),

    ServiceRecettesInterface::class => DI\autowire(ServiceRecettes::class),

    ServiceNoteInterface::class => DI\autowire(ServiceNote::class),

    //provider
    AuthnProviderInterface::class => DI\autowire(JWTAuthnProvider::class),
    JWTManager::class => DI\autowire(JWTManager::class),

    //validator
    //références de schémas de validation
    'validator.schema' => (object) [
        (object)       [
            '$id' => 'http://amap.fr/nom_utilisateur_schema#',
            'type' => 'string',
            'minLength' => 4,
            'maxLength' => 100,
        ],

        (object)[
            '$id' => 'http://amap.fr/mot_de_passe_schema#',
            'type' => 'string',
            'minLength' => 4,
            'maxLength' => 100,
        ],

        (object)[
            '$id' => 'http://amap.fr/nom_recherche_schema#',
            "type" => 'string',
            "minLength" => 1
        ],

        (object)[
            '$id' => 'http://amap.fr/liste_id_int#',
            "type" => 'array',
            "minLength" => 1,
            "contains" => (object)[
                "type" => "integer"
            ],
        ],

        (object)[
            '$id' => 'http://amap.fr/complexite#',
            "type" => 'integer',
            "minimum" => 0,
            "maximum" => 5
        ],

        (object)[
            '$id' => 'http://amap.fr/note#',
            '$ref' => 'http://amap.fr/complexite#'
        ],

        (object)[
            '$id' => 'http://amap.fr/saison#',
            "type" => 'integer',
            "minimum" => 1,
            "maximum" => 12
        ],

        (object)[
            '$id' => 'http://amap.fr/temps#',
            "type" => 'integer',
            "minimum" => 0
        ],

        (object)[
            '$id' => "http://amap.fr/role_input#",
            "type" => "integer",
            "minimum" => 0,
            "maximum" => 1,
            "default" => 0
        ],
        (object)[
        '$id' => 'http://amap.fr/page#',
            'type' => 'integer',
            'minimum' => 1,
            'default' => 1,
        ],
        (object)[
        '$id' => 'http://amap.fr/date#',
            'type' => 'string',
            'format' => 'date-time',
        ],
        (object)[
            '$id' => 'http://amap.fr/id_int#',
            'type' => 'integer',
            'minimum' => 1,
        ],
        (object)[
            '$id' => 'http://amap.fr/quantite#',
            'type' => 'string',
        ],
    ],

    Validator::class => function (ContainerInterface $c) {
        $validator = new Validator();
        $validator->parser()->setOption("allowDefaults", true);
        foreach ($c->get('validator.schema') as $schema) {
            $validator->resolver()->registerRaw($schema);
        }
        /*$validator->resolver()->registerRaw($c->get('validator.schema'));*/
        return $validator;
    },

    UstensileRepositoryInterface::class => get(UstensileRepository::class),
    UstensileRepository::class => function (ContainerInterface $c) {
        $em = $c->get(EntityManager::class);
        $repo = $em->getRepository(Ustensile::class);
        return $repo;
    },

    NoteRepositoryInterface::class => get(NoteRepository::class),
    NoteRepository::class => function (ContainerInterface $c){
        $em = $c->get(EntityManager::class);
        $repo = $em->getRepository(Note::class);
        return $repo;
    },

    AllergieRepositoryInterface::class => get(AllergenesRepository::class),
    AllergenesRepository::class => function (ContainerInterface $c) {
        $em = $c->get(EntityManager::class);
        $repo = $em->getRepository(Allergene::class);
        return $repo;
    },

    PanierRepositoryInterface::class => get(PanierRepository::class),
    PanierRepository::class => function (ContainerInterface $c) {
        $em = $c->get(EntityManager::class);
        $repo = $em->getRepository(Panier::class);
        return $repo;
    },

    RecetteRepositoryInterface::class => get(RecetteRepository::class),
    RecetteRepository::class => function (ContainerInterface $c) {
        $em = $c->get(EntityManager::class);
        $repo = $em->getRepository(Recette::class);
        $repo->setPagination($c->get('pagination.nb'));
        return $repo;
    },

    AllergieRepositoryInterface::class => get(AllergenesRepository::class),
    AllergenesRepository::class => function(ContainerInterface $c) {
        $em = $c->get(EntityManager::class);
        $repo = $em->getRepository(Allergene::class);
        return $repo;
    },

    ServiceAllergenesInterface::class => DI\autowire(ServiceAllergie::class),
    ServiceAllergie::class=> autowire(),

    StreamHandler::class => DI\create(StreamHandler::class)
        ->constructor(DI\get('logs.dir'), Level::Debug)
        ->method('setFormatter', DI\get(LineFormatter::class)),


    LineFormatter::class => function () {
        $dateFormat = "Y-m-d H:i"; // Format de la date que tu veux
        $output = "[%datetime%] %channel%.%level_name%: %message% %context%\n"; // Format des logs
        return new LineFormatter($output, $dateFormat);
    },

    LoggerInterface::class => DI\create(Logger::class)->constructor('Amap_loger', [DI\get(StreamHandler::class)]),


    //midleware
    CorsMiddleware::class => DI\autowire(CorsMiddleware::class),


];
