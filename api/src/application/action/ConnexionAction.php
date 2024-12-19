<?php

namespace amap\application\action;

use Opis\JsonSchema\Validator;
use Opis\JsonSchema\Errors\ErrorFormatter;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Psr\Log\LoggerInterface;
use Slim\Exception\HttpBadRequestException;
use amap\application\action\AbstractAction;
use amap\application\renderer\JsonRenderer;
use amap\application\renderer\ValidationErrorRenderer;
use amap\core\dto\CredentialsDTO;
use amap\providers\auth\AuthInvalidException;
use amap\providers\auth\AuthnProviderInterface;

class ConnexionAction extends AbstractAction
{
    private AuthnProviderInterface $authnProvider;
    private Validator $validator;
    public function __construct(AuthnProviderInterface $authnProvider, LoggerInterface $logger, Validator $validator)
    {
        $this->validator = $validator;
        $this->authnProvider = $authnProvider;
        parent::__construct($logger);
    }

    public function __invoke(ServerRequestInterface $rq, ResponseInterface $rs, array $args): ResponseInterface
    {
        $schema = (object) [
            'type' => 'object',
            'properties' => (object)[
                'nom_utilisateur' => (object)[
                    'type' => 'string',
                    'minLength' => 4,
                    'maxLength' => 100,
                ],
                'mot_de_passe' => (object)[
                    'type' => 'string',
                    'minLength' => 4,
                    'maxLength' => 100,
                ]
            ],
            'required' => ['nom_utilisateur','mot_de_passe']
        ];

        $data = (object) $rq->getParsedBody();

        $resultValidation = $this->validator->validate($data, $schema);
        $checkValidite = ValidationErrorRenderer::render($rs, $resultValidation);
        if ($checkValidite != false) {
            return $checkValidite;
        }

        $credentials = new CredentialsDTO('', $data->mot_de_passe, $data->nom_utilisateur);
        try {
            $authDTO = $this->authnProvider->signin($credentials);
        } catch (AuthInvalidException $e) {
            return JsonRenderer::render($rs, 400, ['message' => $e->getMessage()]);
        }
        return JsonRenderer::render($rs, 201, $authDTO);
    }

}