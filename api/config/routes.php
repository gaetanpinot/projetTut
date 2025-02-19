<?php

declare(strict_types=1);

use Slim\Routing\RouteCollectorProxy;
use amap\application\action\CreateAllergenesUser;
use amap\application\action\CreatePanier;
use amap\application\action\DeleteAllergeneUser;
use amap\application\action\GetExclusIngredientsAction;
use amap\application\action\GetExclusUstensiles;
use amap\application\action\GetIngredientsAction;
use amap\application\action\GetPanierAction;
use amap\application\action\GetRecettesAction;
use Slim\Exception\HttpNotFoundException;
use amap\application\action\GetFavoritesAction;
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

    $app->post('/recettes', CreateRecettesAction::class);
    $app->get('/recettes', GetRecettesAction::class);
    $app->get('/recettes/{id}', GetRecettesDetailsAction::class);
    $app->delete('/recettes/{id}', DeleteRecettesAction::class);

    $app->post('/tag', CreateTagAction::class);
    $app->get('/tag', GetTagsAction::class);

    $app->get('/recettes/{id}/commentaires', GetCommentsAction::class);
    $app->post('/recettes/{id}/commentaires', AddCommentAction::class);
    $app->put('/recettes/{id}/note', AddNoteAction::class);

    $app->group('/utilisateurs', function (RouteCollectorProxy $group) {
        $group->get('[/]', GetUtilisateurProfile::class)->add(AuthnMiddleware::class);
        $group->get('/ingredients[/]', GetExclusIngredientsAction::class)->add(AuthnMiddleware::class);
        $group->get('/ustensiles[/]', GetExclusUstensiles::class)->add(AuthnMiddleware::class);
        $group->get('/allergenes[/]', GetUserAllergensAction::class)->add(AuthnMiddleware::class);
        $group->post('/allergenes[/]', CreateAllergenesUser::class)->add(AuthnMiddleware::class);
        $group->delete('/allergenes[/]', DeleteAllergeneUser::class)->add(AuthnMiddleware::class);
        $group->get('/frigo[/]', GetUserFrigo::class)->add(AuthnMiddleware::class);
        $group->put('/frigo[/]', ReplaceUserFrigo::class)->add(AuthnMiddleware::class);
    });

    $app->group('/paniers', function (RouteCollectorProxy $group) {
        $group->post('[/]', CreatePanier::class)->add(AuthzProducteurMiddleware::class)
            ->add(AuthnMiddleware::class);
        $group->post('/{id}[/]', PublierPanier::class)->add(AuthzProducteurMiddleware::class)
            ->add(AuthnMiddleware::class);
        $group->get('/{id}', GetPanierAction::class)->add(AuthnMiddleware::class);
    });

    $app->post('/utilisateurs/{id}/favoris/{id_recette}', AddToFavoritesAction::class);
    $app->get('/utilisateurs/{id}/favoris', GetFavoritesAction::class);

    $app->post('/utilisateurs/{id}/producteurs/{id_producteur}', SubscribeProducteurAction::class);
    $app->delete('/utilisateurs/{id}/producteurs/{id_producteur}', UnsubscribeProducteurAction::class);

    $app->get('/producteurs/{id}/ingredients', GetProducteurIngredientsAction::class);
    $app->get('/producteurs/{id}/panier', GetProducteurBasketAction::class);

    $app->get('/ingredients', GetIngredientsAction::class);
    $app->post('/ingredients', CreateIngredientAction::class);

    $app->get('/utilisateurs/{id}/frigo', GetFrigoContentAction::class);
    $app->put('/utilisateurs/{id}/frigo/ingredient/{id_ingredient}', AddToFrigoAction::class);
    $app->patch('/utilisateurs/{id}/frigo/ingredient/{id_ingredient}', UpdateFrigoIngredientAction::class);
    $app->delete('/utilisateurs/{id}/frigo/ingredient/{id_ingredient}', RemoveFromFrigoAction::class);

    $app->get('/utilisateurs/{id}/ustensiles', GetExcluUtensilsAction::class);
    $app->post('/utilisateurs/{id}/ustensiles', AddExcluUtensilAction::class);
    $app->delete('/utilisateurs/{id}/ustensiles', DeleteExcluUtensilAction::class);

    $app->get('/ustensiles', GetUtensilsAction::class);
    $app->post('/ustensiles', CreateUtensilAction::class);

    $app->options('/{routes:.+}', function ($request, $response, $args) {
        return $response;
    });

    $app->map(['GET', 'POST', 'PUT', 'DELETE', 'PATCH'], '/{routes:.+}', function ($request, $response) {
        throw new HttpNotFoundException($request);
    });


    return $app;
};
