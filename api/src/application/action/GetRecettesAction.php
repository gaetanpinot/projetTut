<?php

namespace amap\application\action;

use Opis\JsonSchema\Validator;
use amap\application\renderer\ValidationErrorRenderer;
use amap\core\service\ServiceRecettes;
use amap\core\service\ServiceRecettesInterface;
use amap\infrastructure\repository\RecetteRepository;
use amap\infrastructure\repository\RecetteRepositoryInterface;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Psr\Log\LoggerInterface;
use amap\application\renderer\JsonRenderer;
use amap\infrastructure\repository\UtilisateurRepository;
use amap\infrastructure\repository\UtilisateurRepositoryInterface;

class GetRecettesAction extends AbstractAction
{
    public ServiceRecettesInterface $serviceRecette;
    private Validator $validator;
    public function __construct(Validator $valid, ServiceRecettesInterface $u, LoggerInterface $l)
    {
        $this->validator = $valid;
        $this->serviceRecette = $u;
        parent::__construct($l);
    }
    public function __invoke(ServerRequestInterface $rq, ResponseInterface $rs, array $args): ResponseInterface
    {
        /*var_dump(json_decode($rq->getQueryParams()['tt']));*/

        $data = $rq->getQueryParams();
        // on transforme les arguments qui commence par [ en tableau pour les valider
        $data =  array_map(function ($item) {
            if ($item[0] == '[') {
                return json_decode($item);
            }
            return $item;
        }, $data);
        $validationSchema = (object)[
            "type" => 'object',
            "properties" => (object)[
                "nom" => (object)[
                    "type" => 'string',
                    "minLength" => 1
                ],
                "id_tag" => (object)[
                    "type" => 'array',
                    "minLength" => 0,
                    "contains" => (object)[
                    "type" => "integer"
                ]
                ],
                "id_ingredients_principaux" => (object)[
                    "type" => 'array',
                    "minLength" => 0,
                    "contains" => (object)[
                    "type" => "integer"
                ]
                ],
            ],
        ];

        $resultValidation = $this->validator->validate((object)$data, $validationSchema);
        $check = ValidationErrorRenderer::render($rs, $resultValidation);
        if ($check != false) {
            return $check;
        }

        try {
            return JsonRenderer::render($rs, 200, $this->serviceRecette->getRecettes($data));
        } catch (\Error $e) {
            return JsonRenderer::render($rs, 500, $e->getMessage());
        }
        //return $rs;
    }
}
