<?php

namespace amap\application\action;

use Opis\JsonSchema\Validator;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use amap\application\action\AbstractAction;
use amap\application\renderer\JsonRenderer;
use amap\application\renderer\ValidationErrorRenderer;
use amap\core\dto\IngredientDTO;
use amap\core\dto\IngredientInputDTO;
use amap\core\dto\InputPanierDTO;
use amap\core\service\interfaces\ServicePanierInterface;

class CreatePanier extends AbstractAction
{
    public function __construct(private ServicePanierInterface $service, private Validator $validator)
    {

    }

    public function __invoke(ServerRequestInterface $rq, ResponseInterface $rs, array $args): ResponseInterface
    {

        $data = $rq->getParsedBody();

        $validationSchema = (object)[
            "type" => 'object',
            'properties' => (object)[
                "ingredients" => (object)[
                    "type" => 'array',
                    "minLength" => 1,
                    "contains" => (object)[
                        "required" => ['id','quantite'],
                        "properties" => (object)[
                            "id" => (object)[
                                '$ref' => 'http://amap.fr/id_int#'
                            ],
                            "quantite" => (object)[
                                '$ref' => 'http://amap.fr/quantite#'
                            ],
                        ],

                    ],
                ],
            ],
                "required" => ['ingredients']
            ];

        $resultValidation = $this->validator->validate((object)$data, $validationSchema);
        $check = ValidationErrorRenderer::render($rs, $resultValidation);
        if ($check != false) {
            return $check;
        }

        $inputIngredientsArray = array_map(function ($ingredient) {
            return new IngredientInputDTO($ingredient['id'], $ingredient['quantite']);
        }, $data['ingredients']);

        $user_id = $rq->getAttribute('idutilisateur');

        $inputPanier = new InputPanierDTO($inputIngredientsArray, $user_id);
        $outPanier = $this->service->createPanier($inputPanier);
        return JsonRenderer::render($rs, 201, ["panier" => $outPanier]);
    }
}
