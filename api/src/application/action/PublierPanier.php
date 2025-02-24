<?php

namespace amap\application\action;

use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use amap\application\action\AbstractAction;
use amap\application\renderer\JsonRenderer;
use amap\core\service\interfaces\ServicePanierInterface;

class PublierPanier extends AbstractAction
{
    public function __construct(protected ServicePanierInterface $service)
    {
    }

    public function __invoke(ServerRequestInterface $rq, ResponseInterface $rs, array $args): ResponseInterface
    {
        $this->service->publierPanier($args['id']);
        return JsonRenderer::render($rs, 201, []);
    }
}
