<?php

namespace amap\application\action;

use amap\application\renderer\JsonRenderer;
use amap\core\service\interfaces\ServiceRecettesInterface;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Psr\Log\LoggerInterface;

class DeleteRecetteAction extends AbstractAction
{
    private ServiceRecettesInterface $serviceRecette;

    public function __construct(ServiceRecettesInterface $serviceRecette, LoggerInterface $l)
    {
        parent::__construct($l);
        $this->serviceRecette = $serviceRecette;
    }

    public function __invoke(ServerRequestInterface $rq, ResponseInterface $rs, array $args): ResponseInterface
    {
        $id = $args['id'];

        $this->serviceRecette->deleteRecette($id);

        return JsonRenderer::render($rs, 200, "Recette supprimée");
    }
}