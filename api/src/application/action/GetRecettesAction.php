<?php

namespace amap\application\action;

use amap\application\renderer\JsonRenderer;
use amap\core\service\interfaces\ServiceRecettesInterface;
use Opis\JsonSchema\Validator;
use amap\application\renderer\ValidationErrorRenderer;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Psr\Log\LoggerInterface;

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
            $itemDecodee = json_decode($item);
            // si l'item qu'on à décodée est null, on retourne l'item tel quel
            return $itemDecodee === null ? $item : $itemDecodee;
        }, $data);

        $validationSchema = (object)[
            "type" => 'object',
            "properties" => (object)[
                "nom" => (object)[
                    '$ref' => 'http://amap.fr/nom_recherche_schema#'
                ],
                "id_tag" => (object)[
                    '$ref' => 'http://amap.fr/liste_id_int#'
                ],
                "id_ingredients_principaux" => (object)[
                    '$ref' => 'http://amap.fr/liste_id_int#'
                ],
                "temps_preparation_gt" => (object)[
                    '$ref' => 'http://amap.fr/temps#'
                ],
                "temps_preparation_lt" => (object)[
                    '$ref' => 'http://amap.fr/temps#'
                ],
                "complexite_gt" => (object)[
                    '$ref' => 'http://amap.fr/complexite#'
                ],
                "complexite_lt" => (object)[
                    '$ref' => 'http://amap.fr/complexite#'
                ],
                "debut_saison" => (object)[
                    '$ref' => 'http://amap.fr/saison#'
                ],

                "fin_saison" => (object)[
                    '$ref' => 'http://amap.fr/saison#'
                ],
                "note_gt" => (object)[
                    '$ref' => 'http://amap.fr/note#'
                ],
                "note_lt" => (object)[
                    '$ref' => 'http://amap.fr/note#'
                ],
                'id_ustensiles_exclus' => (object)[
                    '$ref' => 'http://amap.fr/liste_id_int#'
                ],
                'id_ingredients_exclus' => (object)[
                    '$ref' => 'http://amap.fr/liste_id_int#'
                ],
                'id_allergenes' => (object)[
                    '$ref' => 'http://amap.fr/liste_id_int#'
                ],
                'page' => (object)[
                    '$ref' => 'http://amap.fr/page#',
                    'default' => 1
                ]
            ],
        ];
        if(!isset($data['page'])) {
            $data['page'] = 1;
        }

        $resultValidation = $this->validator->validate((object)$data, $validationSchema);
        $check = ValidationErrorRenderer::render($rs, $resultValidation);
        if ($check) {
            return $check;
        }

        try {
            return JsonRenderer::render($rs, 200, $this->serviceRecette->getRecettes($data));
        } catch (\Error $e) {
            return JsonRenderer::render($rs, 500, $e->getMessage());
        }
    }
}
