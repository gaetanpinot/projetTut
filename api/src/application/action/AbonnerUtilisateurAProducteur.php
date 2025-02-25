<?php

namespace amap\application\action;

use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use amap\application\action\AbstractAction;
use amap\application\renderer\JsonRenderer;
use amap\core\service\interfaces\ServiceUtilisateurInterface;

class AbonnerUtilisateurAProducteur extends AbstractAction
{
    protected ServiceUtilisateurInterface $serviceUtilisateur;
    public function __construct(ServiceUtilisateurInterface $service)
    {
        $this->serviceUtilisateur = $service;
    }

    public function __invoke(ServerRequestInterface $rq, ResponseInterface $rs, array $args): ResponseInterface
    {
        $producteur_id =  $args['id'];
        $utilisateur_id = $rq->getAttribute('idutilisateur');
        $retour = $this->serviceUtilisateur->addProducteurToUtilisateur($utilisateur_id, $producteur_id);
        return JsonRenderer::render($rs, 201, []);
    }
}
