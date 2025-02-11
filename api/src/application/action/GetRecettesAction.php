<?php

namespace amap\application\action;

use amap\application\renderer\JsonRenderer;
use amap\core\service\interfaces\ServiceRecettesInterface;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Psr\Log\LoggerInterface;

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
    }
}
