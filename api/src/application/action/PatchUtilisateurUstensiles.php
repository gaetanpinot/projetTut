<?php

namespace amap\application\action;

use amap\application\renderer\JsonRenderer;
use amap\core\service\interfaces\ServiceUtilisateurInterface;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Psr\Log\LoggerInterface;

class PatchUtilisateurUstensiles extends AbstractAction
{
    protected ServiceUtilisateurInterface $service;

    public function __construct(ServiceUtilisateurInterface $service, LoggerInterface $l)
    {
        parent::__construct($l);
        $this->service = $service;
    }

    public function __invoke(ServerRequestInterface $rq, ResponseInterface $rs, array $args): ResponseInterface
    {
        $user_id = $rq->getAttribute('idutilisateur');
        $ustensiles = $rq->getParsedBody();
        $this->service->setUstensiles($user_id, $ustensiles);
        return JsonRenderer::render($rs, 200, "Ustensiles enregistrés");
    }
}