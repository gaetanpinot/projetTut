<?php

namespace amap\application\action;

use amap\application\renderer\JsonRenderer;
use amap\core\service\interfaces\ServiceRecettesInterface;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Psr\Log\LoggerInterface;

class GetRandomRecettes extends AbstractAction
{
    protected ServiceRecettesInterface $serviceRecette;
    public function __construct(ServiceRecettesInterface $serviceRecette, LoggerInterface $l)
    {
        parent::__construct($l);
        $this->serviceRecette = $serviceRecette;
    }
    public function __invoke(ServerRequestInterface $rq, ResponseInterface $rs, array $args): ResponseInterface
    {

        $recette = $this->serviceRecette->getRandomRecettes(3);

        return JsonRenderer::render($rs, 200, $recette);
    }
}
