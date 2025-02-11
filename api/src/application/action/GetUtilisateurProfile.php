<?php

namespace amap\application\action;

use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Psr\Log\LoggerInterface;
use amap\application\action\AbstractAction;
use amap\application\renderer\JsonRenderer;
use amap\core\service\interfaces\ServiceUtilisateurInterface;

class GetUtilisateurProfile extends AbstractAction
{
    protected ServiceUtilisateurInterface $serviceUtilisateur;
    public function __construct(ServiceUtilisateurInterface $service, LoggerInterface $l)
    {
        $this->serviceUtilisateur = $service;
        parent::__construct($l);
    }
    public function __invoke(ServerRequestInterface $rq, ResponseInterface $rs, array $args): ResponseInterface
    {
        $user_id = $rq->getAttribute('idutilisateur');
        $profile = $this->serviceUtilisateur->getProfileUtilisateur($user_id);
        return JsonRenderer::render($rs, 200, $profile);
    }
}
