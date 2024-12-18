<?php

declare(strict_types=1);

use amap\application\action\ConnexionAction;
use amap\application\action\CreateRecettesAction;
use amap\application\action\HomeAction;
use amap\application\action\InscriptionAction;
use Slim\Exception\HttpNotFoundException;

return function (\Slim\App $app): \Slim\App {


    $app->get('[/]', HomeAction::class);

    $app->post('/inscription[/]', InscriptionAction::class);
    $app->post('/connexion[/]', ConnexionAction::class);

    $app->delete('/commentaires/{id}', DeleteCommentAction::class);
    $app->delete('/utilisateurs/{id}', DeleteUserAction::class);

    $app->post('/recettes', CreateRecettesAction::class);
    $app->get('/recettes', GetRecettesAction::class);
    $app->get('/recettes/{id}', GetRecettesDetailsAction::class);
    $app->delete('/recettes/{id}', DeleteRecettesAction::class);

    $app->post('/tag', CreateTagAction::class);
    $app->get('/tag', GetTagsAction::class);

    $app->get('/recettes/{id}/commentaires', GetCommentsAction::class);
    $app->post('/recettes/{id}/commentaires', AddCommentAction::class);
    $app->put('/recettes/{id}/note', AddNoteAction::class);

    $app->post('/utilisateurs/{id}/favoris/{id_recette}', AddToFavoritesAction::class);
    $app->get('/utilisateurs/{id}/favoris', GetFavoritesAction::class);

    $app->post('/utilisateurs/{id}/producteurs/{id}', SubscribeProducteurAction::class);
    $app->delete('/utilisateurs/{id}/producteurs/{id}', UnsubscribeProducteurAction::class);

    $app->get('/producteurs/{id}/ingredients', GetProducteurIngredientsAction::class);
    $app->get('/producteurs/{id}/panier', GetProducteurBasketAction::class);

    $app->get('/ingredients', GetIngredientsAction::class);
    $app->post('/ingredients', CreateIngredientAction::class);

    $app->get('/utilisateurs/{id}/frigo', GetFrigoContentAction::class);
    $app->put('/utilisateurs/{id}/frigo/ingredient/{id_ingredient}', AddToFrigoAction::class);
    $app->patch('/utilisateurs/{id}/frigo/ingredient/{id_ingredient}', UpdateFrigoIngredientAction::class);
    $app->delete('/utilisateurs/{id}/frigo/ingredient/{id_ingredient}', RemoveFromFrigoAction::class);

    $app->get('/utilisateurs/{id}/allergenes', GetUserAllergensAction::class);
    $app->post('/utilisateurs/{id}/allergenes', AddAllergenAction::class);
    $app->delete('/utilisateurs/{id}/allergenes', DeleteAllergenAction::class);

    $app->get('/utilisateurs/{id}/ustensiles', GetExcluUtensilsAction::class);
    $app->post('/utilisateurs/{id}/ustensiles', AddExcluUtensilAction::class);
    $app->delete('/utilisateurs/{id}/ustensiles', DeleteExcluUtensilAction::class);

    $app->get('/ustensiles', GetUtensilsAction::class);
    $app->post('/ustensiles', CreateUtensilAction::class);

    $app->post('/paniers', CreateBasketAction::class);
    $app->put('/paniers/{id}', UpdateBasketAction::class);
    $app->post('/paniers/{id}', SendBasketAction::class);


    $app->options('/{routes:.+}', function ($request, $response, $args) {
        return $response;
    });
    $app->map(['GET', 'POST', 'PUT', 'DELETE', 'PATCH'], '/{routes:.+}', function ($request, $response) {
        throw new HttpNotFoundException($request);
    });


    return $app;
};
