<?php

namespace amap\application\action;

use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use amap\application\action\AbstractAction;
use amap\application\renderer\JsonRenderer;
use amap\core\service\interfaces\ServicePanierInterface;

class GetPanierLatestAction extends AbstractAction
{
    public function __construct(protected ServicePanierInterface $servicePanier)
    {
    }
    public function __invoke(ServerRequestInterface $rq, ResponseInterface $rs, array $args): ResponseInterface
    {
        $panier = $this->servicePanier->getLatestPaniers();
        return JsonRenderer::render($rs, 200, ["paniers" => $panier]);
    }
}
