<?php

namespace amap\application\action;

use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use amap\application\renderer\JsonRenderer;

class HomeAction extends AbstractAction
{
    public function __invoke(ServerRequestInterface $rq, ResponseInterface $rs, array $args): ResponseInterface
    {
        $this->loger->info("Home action");
        return JsonRenderer::render($rs, 200, ["message" => "Bienvenue sur l'api amap"]);
    }
}
