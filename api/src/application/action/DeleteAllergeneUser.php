<?php

namespace amap\application\action;

use Opis\JsonSchema\Validator;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use amap\application\action\AbstractAction;
use amap\application\renderer\JsonRenderer;
use amap\application\renderer\ValidationErrorRenderer;
use amap\core\service\interfaces\ServiceUtilisateurInterface;

class DeleteAllergeneUser extends AbstractAction
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
        $id = (int)$args['id'];

        $user_id = $rq->getAttribute('idutilisateur');
        $this->service->deleteAllergies($user_id, $id);
        return JsonRenderer::render($rs, 201, []);
    }
}
