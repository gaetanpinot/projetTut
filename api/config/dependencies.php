<?php

use Doctrine\DBAL\Connection;
use Doctrine\DBAL\DriverManager;
use Doctrine\ORM\EntityManager;
use Doctrine\ORM\ORMSetup;
use Monolog\Logger;
use Monolog\Level;
use Monolog\Handler\StreamHandler;
use Monolog\Formatter\LineFormatter;
use Psr\Container\ContainerInterface;
use Tuupola\Middleware\CorsMiddleware;

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

    StreamHandler::class => DI\create(StreamHandler::class)
        ->constructor(DI\get('logs.dir'), Level::Debug)
        ->method('setFormatter', DI\get(LineFormatter::class)),


    LineFormatter::class => function () {
        $dateFormat = "Y-m-d H:i"; // Format de la date que tu veux
        $output = "[%datetime%] %channel%.%level_name%: %message% %context%\n"; // Format des logs
        return new LineFormatter($output, $dateFormat);
    },

    Logger::class => DI\create(Logger::class)->constructor('Toubeelib_logger', [DI\get(StreamHandler::class)]),


    //midleware
    CorsMiddleware::class => DI\autowire(CorsMiddleware::class),


];
