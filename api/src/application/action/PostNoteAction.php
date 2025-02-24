<?php

namespace amap\application\action;

use amap\application\renderer\JsonRenderer;
use amap\application\renderer\ValidationErrorRenderer;
use amap\core\service\interfaces\ServiceNoteInterface;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Psr\Log\LoggerInterface;

class PostNoteAction extends AbstractAction
{
    protected ServiceNoteInterface $service;

    public function __construct(ServiceNoteInterface $service, LoggerInterface $l)
    {
        parent::__construct($l);
        $this->service = $service;
    }

    public function __invoke(ServerRequestInterface $rq, ResponseInterface $rs, array $args): ResponseInterface
    {
        $idRecette = $args['id'];


        $idUtilisateur = $rq->getAttribute('idutilisateur');

        $note = $rq->getParsedBody()['note'];

        $this->service->createNote($note, $idRecette, $idUtilisateur);

        return JsonRenderer::render($rs, 201, "Note créée");
    }
}