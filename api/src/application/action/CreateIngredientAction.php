<?php

namespace amap\application\action;
use amap\application\renderer\JsonRenderer;
use amap\core\service\ServiceIngredientInterface;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Psr\Log\LoggerInterface;

class CreateIngredientAction extends AbstractAction
{
    private ServiceIngredientInterface $serviceIngredient;

    public function __construct(ServiceIngredientInterface $serviceIngredient, LoggerInterface $logger)
    {
        $this->serviceIngredient = $serviceIngredient;
        parent::__construct($logger);
    }

    public function __invoke(ServerRequestInterface $request, ResponseInterface $response, array $args): ResponseInterface
    {
        $data = json_decode((string) $request->getBody(), true);

        if (!isset($data['nom']) || empty($data['nom'])) {
            return JsonRenderer::render($response, 400, ['error' => 'nom est obligatoire']);
        }

        try {
            $ingredient = $this->serviceIngredient->createIngredient($data);
            return JsonRenderer::render($response, 201, $ingredient);
        } catch (\Exception $e) {
            return JsonRenderer::render($response, 400, ['error' => $e->getMessage()]);
        }
    }
}