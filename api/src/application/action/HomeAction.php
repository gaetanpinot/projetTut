<?php

namespace amap\application\action;

use amap\core\service\ServiceRecettesInterface;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Psr\Log\LoggerInterface;
use amap\application\renderer\JsonRenderer;
use amap\core\service\ServiceUtilisateurInterface;

class HomeAction extends AbstractAction
{
    public ServiceRecettesInterface $serviceRecettes;
    public function __construct(ServiceRecettesInterface $service, LoggerInterface $l)
    {
        $this->serviceRecettes = $service;
        parent::__construct($l);
    }
    public function __invoke(ServerRequestInterface $rq, ResponseInterface $rs, array $args): ResponseInterface
    {
        $retour = $this->serviceRecettes->getRecettes($rq->getQueryParams());
        return JsonRenderer::render($rs, 200, [$retour]);
    }
}
