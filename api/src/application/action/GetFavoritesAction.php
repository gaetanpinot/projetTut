<?php

namespace amap\application\action;

use amap\core\service\interfaces\ServiceUtilisateurInterface;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;

class GetFavoritesAction extends AbstractAction
{
    /*protected ServiceUtilisateurInterface $serviceUtilisateur;*/
    public function __construct(ServiceUtilisateurInterface $s)
    {
        parent::__construct();
    }
    public function __invoke(ServerRequestInterface $rq, ResponseInterface $rs, array $args): ResponseInterface
    {
    }
}
