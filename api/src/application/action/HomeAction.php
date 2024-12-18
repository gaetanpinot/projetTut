<?php

namespace amap\application\action;

use Psr\Container\ContainerInterface;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Psr\Log\LoggerInterface;
use amap\application\renderer\JsonRenderer;
use amap\infrastructure\repository\UtilisateurRepository;
use amap\infrastructure\repository\UtilisateurRepositoryInterface;

class HomeAction extends AbstractAction
{
    public UtilisateurRepositoryInterface $t;
    public function __construct(ContainerInterface $cont)
    {
        parent::__construct($cont);
        $this->t = $cont->get(UtilisateurRepositoryInterface::class);
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
        return JsonRenderer::render($rs, 200, ["message" => "Bienvenue sur l'api amap"]);
    }
}
