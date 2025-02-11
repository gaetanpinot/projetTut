<?php

namespace amap\application\action;

use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use amap\application\action\AbstractAction;
use amap\application\renderer\JsonRenderer;
use amap\core\service\ServiceUtilisateurInterface;

class GetUserAllergensAction extends AbstractAction
{
    protected ServiceUtilisateurInterface $service;
    public function __construct(ServiceUtilisateurInterface $service)
    {
        $this->service = $service;
    }

    public function __invoke(ServerRequestInterface $rq, ResponseInterface $rs, array $args): ResponseInterface
    {
        $user_id = $rq->getAttribute('idutilisateur');
        $retour = $this->service->getAllergies($user_id);
        return JsonRenderer::render($rs, 200, $retour);
    }
}
