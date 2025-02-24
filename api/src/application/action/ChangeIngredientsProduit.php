<?php

namespace amap\application\action;

use Opis\JsonSchema\Validator;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use amap\application\action\AbstractAction;
use amap\application\renderer\JsonRenderer;
use amap\application\renderer\ValidationErrorRenderer;
use amap\core\dto\FrigoInputDTO;
use amap\core\service\interfaces\ServiceUtilisateurInterface;

class ChangeIngredientsProduit extends AbstractAction
{
    protected ServiceUtilisateurInterface $service;
    protected Validator $validator;
    public function __construct(ServiceUtilisateurInterface $service, Validator $validator)
    {
        $this->service = $service;
        $this->validator = $validator;
    }

    public function __invoke(ServerRequestInterface $rq, ResponseInterface $rs, array $args): ResponseInterface
    {
        $data = json_decode($rq->getBody());
        
        $validationSchema = (object)[
            "type" => 'object',
            'properties' => (object)[
                "id_ingredients" => (object)[
                    '$ref' => 'http://amap.fr/liste_id_int#'
                ],
            ],
                "required" => ['id_ingredients']
            ];

        $resultValidation = $this->validator->validate($data, $validationSchema);
        $check = ValidationErrorRenderer::render($rs, $resultValidation);
        if ($check != false) {
            return $check;
        }
        $user_id = $rq->getAttribute('idutilisateur');
        $this->service->changerIngredientsProduits($user_id, $data->id_ingredients);
        $retour = $this->service->getFrigoUtilisateur($user_id);
        return JsonRenderer::render($rs, 200, $retour);
    }
}
