<?php

namespace amap\application\action;
use amap\application\renderer\JsonRenderer;
use amap\infrastructure\service\interfaces\UserServiceInterface;
use Psr\Container\ContainerInterface;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Respect\Validation\Exceptions\ValidatorException;
use Respect\Validation\Validator;

class ConnexionAction extends AbstractAction
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

        $nom_utilisateur = $data['nom_utilisateur'];
        $password = $data['mot_de_passe'];

        Validator::email()->assert($nom_utilisateur);
        Validator::stringType()->assert($password);

        try {
            $jwt = $this->userService->authenticateUser($nom_utilisateur, $password);
            return JsonRenderer::render($rs, 200, ['token' => $jwt]);
        }catch (ValidatorException $e) {
            return JsonRenderer::render($rs, 400, ['error' => $e->getMessage()]);
//        } catch (NoDataFoundException){
//            return JsonRenderer::render($rs, 404, ['error' => 'Utilisateur non trouvé.']);
//        }
//        catch (\PDOException $e) {
//            return JsonRenderer::render($rs, 500, ['error' => $e->getMessage()]);
        }
        catch (\Exception $e) {
            return JsonRenderer::render($rs, 500, ['error' => $e->getMessage()]);
        }
    }
}