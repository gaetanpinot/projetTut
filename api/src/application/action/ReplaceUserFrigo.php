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

class ReplaceUserFrigo extends AbstractAction
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
                "frigo" => (object)[
                    "type" => 'array',
                    "minLength" => 1,
                    "items" => (object)[
                        "type" => 'object',
                        "required" => ['id','quantite','timestamp_ajout'],
                        "properties" => (object)[
                            "id" => (object)[
                                '$ref' => 'http://amap.fr/id_int#'
                            ],
                            "quantite" => (object)[
                                '$ref' => 'http://amap.fr/quantite#'
                            ],
                            "timestamp_ajout" => (object)[
                                'type' => 'integer',
                            ],
                        ],

                    ],
                ],
            ],
                "required" => ['frigo']
            ];

        $resultValidation = $this->validator->validate($data, $validationSchema);
        $check = ValidationErrorRenderer::render($rs, $resultValidation);
        if ($check != false) {
            return $check;
        }
        $frigoInput = array_map(fn ($i) => new FrigoInputDTO($i->id, $i->quantite, $i->timestamp_ajout), $data->frigo);
        $user_id = $rq->getAttribute('idutilisateur');
        $this->service->replaceFrigo($user_id, $frigoInput);
        $retour = $this->service->getFrigoUtilisateur($user_id);
        return JsonRenderer::render($rs, 200, $retour);
    }
}
