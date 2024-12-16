<?php

use Monolog\Logger;
use Monolog\Handler\StreamHandler;
use Monolog\Formatter\LineFormatter;
use Tuupola\Middleware\CorsMiddleware;

return [


    StreamHandler::class => DI\create(StreamHandler::class)
        ->constructor(DI\get('logs.dir'), Logger::DEBUG)
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
