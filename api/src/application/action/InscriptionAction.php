<?php

namespace amap\application\action;

use amap\application\renderer\JsonRenderer;
use amap\application\renderer\ValidationErrorRenderer;
use amap\core\dto\CredentialsDTO;
use amap\providers\auth\AuthInvalidException;
use amap\providers\auth\AuthnProviderInterface;
use Opis\JsonSchema\Validator;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Psr\Log\LoggerInterface;

class InscriptionAction extends AbstractAction
{
    protected AuthnProviderInterface $authProvider;
    protected Validator $validator;

    public function __construct(LoggerInterface $logger, AuthnProviderInterface $authProvider, Validator $validator)
    {
        $this->validator = $validator;
        $this->authProvider = $authProvider;
        parent::__construct($logger);
    }

    public function __invoke(ServerRequestInterface $rq, ResponseInterface $rs, array $args): ResponseInterface
    {
        $data = (object) $rq->getParsedBody();
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
                ],
                'role' => (object)[
                    'type' => 'integer',
                    'minimum' => 0,
                    'maximum' => 1,
                    'default' => 0,
                ]
            ],
            'required' => ['nom_utilisateur', 'mot_de_passe']
        ];

        $resultValidation = $this->validator->validate($data, $schema);
        $checkValidite = ValidationErrorRenderer::render($rs, $resultValidation);
        if ($checkValidite != false) {
            return $checkValidite;
        }

        $userInput = new CredentialsDTO('', $data->mot_de_passe, $data->nom_utilisateur, $data->role);
        try {
            $user = $this->authProvider->inscription($userInput);
        } catch (AuthInvalidException $e) {
            return JsonRenderer::render($rs, 400, ['message' => $e->getMessage()]);
        }
        return JsonRenderer::render($rs, 201, $user);
    }
}