<?php

namespace amap\application\action;

use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use amap\application\action\AbstractAction;
use amap\application\renderer\JsonRenderer;
use amap\core\service\interfaces\ServiceAllergenesInterface;
use amap\core\service\interfaces\ServiceUtilisateurInterface;

class GetAllergenes extends AbstractAction
{
    public function __construct(private ServiceAllergenesInterface $serviceAllergenes)
    {
    }

    public function __invoke(ServerRequestInterface $rq, ResponseInterface $rs, array $args): ResponseInterface
    {
        $retour = $this->serviceAllergenes->getAllergies();
        return JsonRenderer::render($rs, 200, $retour);
    }
}
