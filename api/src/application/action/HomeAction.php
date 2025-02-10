<?php

namespace amap\application\action;

use Psr\Container\ContainerInterface;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Psr\Log\LoggerInterface;
use amap\application\renderer\JsonRenderer;
use amap\core\service\ServiceUtilisateurInterface;

class HomeAction extends AbstractAction
{
    public ServiceUtilisateurInterface $serviceUtilisateur;
    public function __construct(ServiceUtilisateurInterface $service, LoggerInterface $l)
    {
        $this->serviceUtilisateur = $service;
        parent::__construct($l);
    }
    public function __invoke(ServerRequestInterface $rq, ResponseInterface $rs, array $args): ResponseInterface
    {
        /*$retour = $this->serviceUtilisateur->getUtilisateurByNom("alice");*/
        /*$this->loger->info("Home action");*/
        /*return $rs;*/
        return JsonRenderer::render($rs, 200, ["message" => "Bienvenue sur l'api amap"]);
    }
}
