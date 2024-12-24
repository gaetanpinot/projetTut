<?php

namespace amap\application\action;

use Opis\JsonSchema\Uri;
use Opis\JsonSchema\Validator;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Psr\Log\LoggerInterface;
use amap\application\action\AbstractAction;
use amap\application\renderer\JsonRenderer;
use amap\application\renderer\ValidationErrorRenderer;
use amap\core\dto\CredentialsDTO;
use amap\core\service\BadInputException;
use amap\core\service\ServiceAuthInterface;
use amap\providers\auth\AuthInvalidException;
use amap\providers\auth\AuthnProviderInterface;

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
                    '$ref' => 'http://amap.fr/nom_utilisateur_schema#'
                ],
                'mot_de_passe' => (object)[
                    '$ref' => 'http://amap.fr/mot_de_passe_schema#'
                ],
                'role' => (object)[
                    '$ref' => 'http://amap.fr/role_input#'
                    /*'type' => 'integer',*/
                    /*'default' => 0,*/
                ],
            ],
            'required' => ['nom_utilisateur','mot_de_passe']
        ];


        var_dump($data);
        $resultValidation = $this->validator->validate($data, $schema);
        var_dump($data);
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
