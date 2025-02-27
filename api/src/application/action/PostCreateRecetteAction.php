<?php

namespace amap\application\action;

use amap\application\renderer\JsonRenderer;
use amap\core\dto\input\InputRecetteDTO;
use amap\core\service\interfaces\ServiceRecettesInterface;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Psr\Log\LoggerInterface;

class PostCreateRecetteAction extends AbstractAction
{
    private ServiceRecettesInterface $serviceRecette;

    public function __construct(ServiceRecettesInterface $serviceRecette, LoggerInterface $l)
    {
        parent::__construct($l);
        $this->serviceRecette = $serviceRecette;
    }

    public function __invoke(ServerRequestInterface $rq, ResponseInterface $rs, array $args): ResponseInterface
    {

        $id_utilisateur = $rq->getAttribute('idutilisateur');
        $data = $rq->getParsedBody();
        $inputDto = new InputRecetteDTO
        (
            $data['nom'] ?? null,
            $data['temps_preparation'] ?? null,
            $data['complexite'] ?? null,
$id_utilisateur,
            $data['description'] ?? null,
            $data['debut_saison'] ?? null,
            $data['fin_saison'] ?? null,
            $data['url_photo'] ?? null,
            $data['id_recette_parente'] ?? null,
            $data['tags'] ?? [],
            $data['ingredients_recette'] ?? [],
            $data['ustensiles'] ?? [],
            $data['notes'] ?? []
        );

        $res = $this->serviceRecette->createRecette($inputDto);
        return JsonRenderer::render($rs, 201, $res);
    }
}
