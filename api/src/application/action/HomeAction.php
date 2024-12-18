<?php

namespace amap\application\action;

use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Psr\Log\LoggerInterface;
use amap\application\renderer\JsonRenderer;
use amap\infrastructure\repository\UtilisateurRepository;
use amap\infrastructure\repository\UtilisateurRepositoryInterface;

class HomeAction extends AbstractAction
{
    public UtilisateurRepositoryInterface $t;
    public function __construct(UtilisateurRepositoryInterface $u, LoggerInterface $l)
    {
        $this->t = $u;
        parent::__construct($l);
    }
    public function __invoke(ServerRequestInterface $rq, ResponseInterface $rs, array $args): ResponseInterface
    {
        $retour = $this->t->getUtilisateurByNom("alice");
        /*echo $retour->getId();*/
        /*var_dump($retour->getRecettes());*/
        /*$rec = $retour->getRecettes();*/
        /*foreach ($rec as $r) {*/
        /*    echo $r->getCreateur()->getId();*/
        /*}*/
        $this->loger->info("Home action");
        return $rs;
        return JsonRenderer::render($rs, 200, ["message" => "Bienvenue sur l'api amap"]);
    }
}
