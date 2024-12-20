<?php

namespace amap\application\action;

use amap\core\service\ServiceRecettes;
use amap\core\service\ServiceRecettesInterface;
use amap\infrastructure\repository\RecetteRepository;
use amap\infrastructure\repository\RecetteRepositoryInterface;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Psr\Log\LoggerInterface;
use amap\application\renderer\JsonRenderer;
use amap\infrastructure\repository\UtilisateurRepository;
use amap\infrastructure\repository\UtilisateurRepositoryInterface;

class GetRecettesAction extends AbstractAction
{
    public ServiceRecettesInterface $t;
    public function __construct(ServiceRecettesInterface $u, LoggerInterface $l)
    {
        $this->t = $u;
        parent::__construct($l);
    }
    public function __invoke(ServerRequestInterface $rq, ResponseInterface $rs, array $args): ResponseInterface
    {
        try {
            return JsonRenderer::render($rs, 200, $this->t->getRecettes($rq->getQueryParams()));
        } catch (\Error $e) {
            return JsonRenderer::render($rs, 500, $e->getMessage());
        }
        //return $rs;
    }
}
