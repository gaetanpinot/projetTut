<?php

return [

    //entités doctrine
    'doctrine.entities' => __DIR__ . "/../src/infrastructure/entities",
    'displayErrorDetails' => true,
    'logs.dir' => __DIR__ . '/../var/logs',
    'db.config' => parse_ini_file(__DIR__ . "/db.ini"),
    'pagination.nb' => 10,


];
