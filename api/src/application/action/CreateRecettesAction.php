<?php

namespace amap\application\action;
use amap\application\renderer\JsonRenderer;
use amap\core\service\RecetteServiceInterface;
use Psr\Container\ContainerInterface;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;

class CreateRecettesAction extends AbstractAction
{
    private RecetteServiceInterface $recetteService;

    public function __construct(ContainerInterface $cont)
    {
        parent::__construct($cont);
        $this->recetteService = $cont->get(RecetteServiceInterface::class);
    }

    public function __invoke(ServerRequestInterface $rq, ResponseInterface $rs, array $args): ResponseInterface
    {
        $data = $rq->getParsedBody();

        if (empty($data['nom']) || empty($data['temps_preparation']) || empty($data['id_createur'])) {
            return JsonRenderer::render($rs, 400, ['error' => 'Invalid input data']);
        }

        try {
            $result = $this->recetteService->createRecette($data);
            return JsonRenderer::render($rs, 201, $result);
        } catch (\Exception $e) {
            return JsonRenderer::render($rs, 500, ['error' => 'Internal server error', 'message' => $e->getMessage()]);
        }
    }
}