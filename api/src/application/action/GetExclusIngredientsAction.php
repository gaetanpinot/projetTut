<?php

namespace amap\application\action;

use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use amap\application\action\AbstractAction;
use amap\application\renderer\JsonRenderer;
use amap\core\service\ServiceUtilisateurInterface;

class GetExclusIngredientsAction extends AbstractAction
{
    protected ServiceUtilisateurInterface $serviceUtilisateur;

    public function __construct(ServiceUtilisateurInterface $service)
    {
        $this->serviceUtilisateur = $service;
    }

    public function __invoke(ServerRequestInterface $rq, ResponseInterface $rs, array $args): ResponseInterface
    {
        $user_id = $rq->getAttribute('idutilisateur');
        $ingredients = $this->serviceUtilisateur->getExclusIngredients($user_id);
        return JsonRenderer::render($rs, 200, $ingredients);
    }
}
