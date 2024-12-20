<?php

use amap\core\service\ServiceRecettes;
use amap\core\service\ServiceIngredient;
use amap\core\service\ServiceRecettesInterface;
use amap\core\service\ServiceIngredientInterface;
use amap\infrastructure\entities\Ingredient;
use amap\infrastructure\entities\Recette;
use amap\infrastructure\repository\RecetteRepositoryInterface;
use amap\infrastructure\repository\IngredientRepositoryInterface;
use Doctrine\DBAL\Connection;
use Doctrine\DBAL\DriverManager;
use Doctrine\ORM\EntityManager;
use Doctrine\ORM\ORMSetup;
use Monolog\Logger;
use Monolog\Level;
use Monolog\Handler\StreamHandler;
use Monolog\Formatter\LineFormatter;
use Opis\JsonSchema\Validator;
use Psr\Container\ContainerInterface;
use Psr\Log\LoggerInterface;
use Tuupola\Middleware\CorsMiddleware;
use amap\core\service\ServiceAuth;
use amap\core\service\ServiceAuthInterface;
use amap\core\service\ServiceUtilisateur;
use amap\core\service\ServiceUtilisateurInterface;
use amap\infrastructure\entities\Utilisateur;
use amap\infrastructure\repository\UtilisateurRepositoryInterface;
use amap\providers\auth\AuthnProviderInterface;
use amap\providers\auth\JWTAuthnProvider;
use amap\providers\auth\JWTManager;

use function DI\get;

return [

    //doctrine:
    'doctrine.config' => function (ContainerInterface $c) {
        return ORMSetup::createAttributeMetadataConfiguration([$c->get('doctrine.entities')], true);
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

    //provider
    AuthnProviderInterface::class => DI\autowire(JWTAuthnProvider::class),
    JWTManager::class => DI\autowire(JWTManager::class),

    //validator
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
        ]
    ],
    Validator::class => function (ContainerInterface $c) {
        $validator = new Validator();
        foreach ($c->get('validator.schema') as $schema) {
            $validator->resolver()->registerRaw($schema);
        }
        /*$validator->resolver()->registerRaw($c->get('validator.schema'));*/
        return $validator;
    },

    RecetteRepositoryInterface::class => function (ContainerInterface $c) {
        $em = $c->get(EntityManager::class);
        return $em->getRepository(Recette::class);
    },
    ServiceRecettesInterface::class => DI\autowire(ServiceRecettes::class),

    StreamHandler::class => DI\create(StreamHandler::class)
        ->constructor(DI\get('logs.dir'), Level::Debug)
        ->method('setFormatter', DI\get(LineFormatter::class)),


    LineFormatter::class => function () {
        $dateFormat = "Y-m-d H:i"; // Format de la date que tu veux
        $output = "[%datetime%] %channel%.%level_name%: %message% %context%\n"; // Format des logs
        return new LineFormatter($output, $dateFormat);
    },

    LoggerInterface::class => DI\create(Logger::class)->constructor('Toubeelib_logger', [DI\get(StreamHandler::class)]),


    //midleware
    CorsMiddleware::class => DI\autowire(CorsMiddleware::class),


];
