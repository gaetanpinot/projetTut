<?php

use amap\application\action\ConnexionAction;
use amap\application\action\HomeAction;

return [


    HomeAction::class => DI\autowire(),
    ConnexionAction::class => DI\autowire(),



];
