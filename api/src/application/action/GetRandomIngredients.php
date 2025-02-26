<?php

namespace amap\application\action;

use amap\application\renderer\JsonRenderer;
use amap\core\service\interfaces\ServiceIngredientInterface;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Psr\Log\LoggerInterface;

class GetRandomIngredients extends AbstractAction
{
    private ServiceIngredientInterface $serviceIngredient;

    public function __construct(ServiceIngredientInterface $serviceIngredient, LoggerInterface $logger)
    {
        $this->serviceIngredient = $serviceIngredient;
        parent::__construct($logger);
    }

    public function __invoke(ServerRequestInterface $rq, ResponseInterface $rs, array $args): ResponseInterface
    {
        $ingredients = $this->serviceIngredient->getRandomIngredients();

        return JsonRenderer::render($rs, 200, $ingredients);
    }
}

