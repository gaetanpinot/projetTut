<?php

use amap\application\action\ConnexionAction;
use amap\application\action\PostCreateRecetteAction;
use amap\application\action\GetIngredientsAction;
use amap\application\action\GetRecetteByIdAction;
use amap\application\action\GetUtilisateurProfile;
use amap\application\action\HomeAction;
use amap\application\action\PatchUtilisateurUstensiles;

return [
    HomeAction::class => DI\autowire(),
    ConnexionAction::class => DI\autowire(),
    GetIngredientsAction::class => DI\autowire(),
    GetRecetteByIdAction::class => DI\autowire(),
    GetUtilisateurProfile::class => DI\autowire(),
    PostCreateRecetteAction::class => DI\autowire(),
    PatchUtilisateurUstensiles::class => DI\autowire(),
];
