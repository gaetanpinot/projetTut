<?php

declare(strict_types=1);

use amap\application\action\ChangeIngredientsProduit;
use amap\application\action\CreateRecetteAction;
use amap\application\action\DeleteRecetteAction;
use amap\application\action\GetIngredientsAction;
use amap\application\action\GetPanierByProducteurAction;
use amap\application\action\GetRandomRecettes;
use amap\application\action\GetRecetteByIdAction;
use amap\application\action\PostCreateRecetteAction;
use amap\application\action\PatchUtilisateurUstensiles;
use amap\application\action\PostNoteAction;
use Slim\Routing\RouteCollectorProxy;
use amap\application\action\AbonnerUtilisateurAProducteur;
use amap\application\action\CreateAllergenesUser;
use amap\application\action\CreatePanier;
use amap\application\action\DeleteAllergeneUser;
use amap\application\action\DesabonnerUtilisateurAProducteur;
use amap\application\action\GetExclusIngredientsAction;
use amap\application\action\GetExclusUstensiles;
use amap\application\action\GetPanierAction;
use amap\application\action\GetProducteurIngredients;
use amap\application\action\GetProducteurPaniers;
use amap\application\action\GetProducteursList;
use amap\application\action\GetRecettesAction;
use Slim\Exception\HttpNotFoundException;
use amap\application\action\ConnexionAction;
use amap\application\action\GetUserAllergensAction;
use amap\application\action\GetUserFrigo;
use amap\application\action\GetUtilisateurProfile;
use amap\application\action\HomeAction;
use amap\application\action\InscriptionAction;
use amap\application\action\PublierPanier;
use amap\application\action\ReplaceUserFrigo;
use amap\middleware\AuthnMiddleware;
use amap\middleware\AuthzProducteurMiddleware;


return function (\Slim\App $app): \Slim\App {


    $app->get('[/]', HomeAction::class);

    $app->post('/inscription[/]', InscriptionAction::class);
    $app->post('/connexion[/]', ConnexionAction::class);

    $app->delete('/commentaires/{id}', DeleteCommentAction::class);

    $app->post('/recettes[/]', PostCreateRecetteAction::class);
    $app->get('/recettes[/]', GetRecettesAction::class);
    $app->get('/recettes/{id}', GetRecetteByIdAction::class);
    $app->delete('/recettes/{id}', DeleteRecetteAction::class);

    $app->get('/recettes/random[/]', GetRandomRecettes::class);

    $app->post('/tag', CreateTagAction::class);
    $app->get('/tag', GetTagsAction::class);

    $app->get('/recettes/{id}/commentaires', GetCommentsAction::class);
    $app->post('/recettes/{id}/commentaires', AddCommentAction::class);

    $app->post('/recettes/{id}/note', PostNoteAction::class)->add(AuthnMiddleware::class);

    $app->group('/ingredients', function (RouteCollectorProxy $group){
        $group->get('[/]', GetIngredientsAction::class);
    });

    $app->group('/utilisateurs', function (RouteCollectorProxy $group) {
        $group->get('[/]', GetUtilisateurProfile::class)->add(AuthnMiddleware::class);
        $group->get('/ingredients[/]', GetExclusIngredientsAction::class)->add(AuthnMiddleware::class);

        $group->get('/ustensiles[/]', GetExclusUstensiles::class)->add(AuthnMiddleware::class);
        $group->patch('/ustensiles[/]', PatchUtilisateurUstensiles::class)->add(AuthnMiddleware::class);

        $group->get('/allergenes[/]', GetUserAllergensAction::class)->add(AuthnMiddleware::class);
        $group->post('/allergenes[/]', CreateAllergenesUser::class)->add(AuthnMiddleware::class);
        $group->delete('/allergenes[/]', DeleteAllergeneUser::class)->add(AuthnMiddleware::class);

        $group->get('/frigo[/]', GetUserFrigo::class)->add(AuthnMiddleware::class);
        $group->put('/frigo[/]', ReplaceUserFrigo::class)->add(AuthnMiddleware::class);
        $group->post('/producteurs/{id}[/]', AbonnerUtilisateurAProducteur::class)->add(AuthnMiddleware::class);
        $group->delete('/producteurs/{id}[/]', DesabonnerUtilisateurAProducteur::class)->add(AuthnMiddleware::class);
    });

    $app->group('/paniers', function (RouteCollectorProxy $group) {
        $group->post('[/]', CreatePanier::class)->add(AuthzProducteurMiddleware::class)
            ->add(AuthnMiddleware::class);
        $group->get('[/]', GetPanierByProducteurAction::class)->add(AuthzProducteurMiddleware::class)
            ->add(AuthnMiddleware::class);
        $group->post('/{id}[/]', PublierPanier::class)->add(AuthzProducteurMiddleware::class)
            ->add(AuthnMiddleware::class);
        $group->get('/{id}', GetPanierAction::class)->add(AuthnMiddleware::class);
    });

    $app->group('/producteurs', function(RouteCollectorProxy $group){
        $group->get('[/]', GetProducteursList::class);
        $group->get('/{id}/paniers', GetProducteurPaniers::class)->add(AuthnMiddleware::class);
        $group->get('/{id}/ingredients', GetProducteurIngredients::class)->add(AuthnMiddleware::class);
        $group->put('/ingredients[/]', ChangeIngredientsProduit::class)->add(AuthzProducteurMiddleware::class)
            ->add(AuthnMiddleware::class);
    });

    $app->options('/{routes:.+}', function ($request, $response, $args) {
        return $response;
    });

    $app->map(['GET', 'POST', 'PUT', 'DELETE', 'PATCH'], '/{routes:.+}', function ($request, $response) {
        throw new HttpNotFoundException($request);
    });


    return $app;
};
