<?php

namespace amap\application\action;
use amap\application\renderer\JsonRenderer;
use amap\infrastructure\service\interfaces\UserServiceInterface;
use DI\Container;
use Psr\Container\ContainerInterface;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;

class InscriptionAction extends AbstractAction
{
    private UserServiceInterface $userService;

    public function __construct(ContainerInterface $cont)
    {
        parent::__construct($cont);
        $this->userService = $cont->get(UserServiceInterface::class);
    }

    public function __invoke(ServerRequestInterface $rq, ResponseInterface $rs, array $args): ResponseInterface
    {
        $data = $rq->getParsedBody();

        if (empty($data['nom_utilisateur']) || empty($data['mot_de_passe'])) {
            return JsonRenderer::render($rs, 400, ['error' => 'Missing username or password']);
        }

        try {
            $result = $this->userService->registerUser($data);
            return JsonRenderer::render($rs, 201, ['success' => true, 'user' => $result]);
        } catch (\Exception $e) {
            return JsonRenderer::render($rs, 500, ['error' => $e->getMessage()]);
        }
    }
}