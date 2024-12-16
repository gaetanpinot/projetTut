<?php

declare(strict_types=1);

use Slim\Exception\HttpNotFoundException;
use amap\application\action\HomeAction;

return function (\Slim\App $app): \Slim\App {


    $app->get('[/]', HomeAction::class);
    $app->options('/{routes:.+}', function ($request, $response, $args) {
        return $response;
    });
    $app->map(['GET', 'POST', 'PUT', 'DELETE', 'PATCH'], '/{routes:.+}', function ($request, $response) {
        throw new HttpNotFoundException($request);
    });


    return $app;
};
