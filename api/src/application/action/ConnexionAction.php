<?php

namespace amap\application\action;

use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Psr\Log\LoggerInterface;
use Slim\Exception\HttpBadRequestException;
use amap\application\action\AbstractAction;
use amap\application\renderer\JsonRenderer;
use amap\core\dto\CredentialsDTO;
use amap\providers\auth\AuthInvalidException;
use amap\providers\auth\AuthnProviderInterface;

class ConnexionAction extends AbstractAction
{
    private AuthnProviderInterface $authnProvider;
    public function __construct(AuthnProviderInterface $authnProvider, LoggerInterface $logger)
    {
        $this->authnProvider = $authnProvider;
        parent::__construct($logger);
    }

    public function __invoke(ServerRequestInterface $rq, ResponseInterface $rs, array $args): ResponseInterface
    {

        $body = $rq->getParsedBody();
        $credentials = new CredentialsDTO('', $body['mot_de_passe'], $body['nom_utilisateur']);
        try {
            $authDTO = $this->authnProvider->signin($credentials);
        } catch (AuthInvalidException $e) {
            return JsonRenderer::render($rs, 400, ['message' => $e->getMessage()]);
        }
        return JsonRenderer::render($rs, 201, $authDTO);
    }

}
