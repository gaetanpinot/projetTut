<?php

use amap\application\action\ConnexionAction;
use amap\application\action\GetIngredientsAction;
use amap\application\action\GetRecetteByIdAction;
use amap\application\action\HomeAction;

return [
    HomeAction::class => DI\autowire(),
    ConnexionAction::class => DI\autowire(),
    GetIngredientsAction::class => DI\autowire(),
    GetRecetteByIdAction::class => DI\autowire(),
];
