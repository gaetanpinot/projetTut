<?php

namespace amap\application\action;

use Opis\JsonSchema\Validator;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use amap\application\action\AbstractAction;
use amap\application\renderer\JsonRenderer;
use amap\application\renderer\ValidationErrorRenderer;
use amap\core\service\interfaces\ServiceUtilisateurInterface;

class CreateAllergenesUser extends AbstractAction
{
    protected ServiceUtilisateurInterface $service;
    private Validator $validator;
    public function __construct(Validator $valid, ServiceUtilisateurInterface $service)
    {
        $this->service = $service;
        $this->validator = $valid;
    }

    public function __invoke(ServerRequestInterface $rq, ResponseInterface $rs, array $args): ResponseInterface
    {
        $data = $rq->getParsedBody();

        $validationSchema = (object)[
            "type" => 'object',
            "properties" => (object)[
                "id_allergene" => (object)[
                    'type' => 'integer',
                    'minimum' => 0,

                ],
            ],
            "required" => ['id_allergene']
        ];

        $resultValidation = $this->validator->validate((object)$data, $validationSchema);
        $check = ValidationErrorRenderer::render($rs, $resultValidation);
        if ($check != false) {
            return $check;
        }
        $user_id = $rq->getAttribute('idutilisateur');
        $this->service->addAllergies($user_id, $data['id_allergene']);
        return JsonRenderer::render($rs, 201, []);
    }
}
