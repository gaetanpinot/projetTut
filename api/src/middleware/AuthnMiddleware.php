<?php

namespace amap\middleware;

use Psr\Log\LoggerInterface;
use amap\providers\auth\AuthInvalidException;
use amap\providers\auth\AuthnProviderInterface;
use DI\Container;
use Exception;
use Monolog\Logger;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Psr\Http\Server\MiddlewareInterface;
use Psr\Http\Server\RequestHandlerInterface;
use Slim\Exception\HttpUnauthorizedException;

class AuthnMiddleware implements MiddlewareInterface
{
    protected AuthnProviderInterface $authProvider;
    protected LoggerInterface $loger;

    public function __construct(AuthnProviderInterface $authProvider, LoggerInterface $loger)
    {
        $this->authProvider = $authProvider;
        $this->loger = $loger;
    }

    public function process(ServerRequestInterface $rq, RequestHandlerInterface $next): ResponseInterface
    {
        if (!$rq->hasHeader("Authorization")) {
            /*foreach ($rq->getHeaders() as $s) {*/
            /*    $this->loger->error($s[0]);*/
            /*}*/
            throw new HttpUnauthorizedException($rq, "Header Authorization manquante, veuillez vous enregistrer");
        }
        try {
            $token = $rq->getHeader("Authorization")[0];
            $token = sscanf($token, "Bearer %s");
            if ($token == null) {
                throw new Exception("Mauvais token");
            }
            $token = $token[0];
            $user = $this->authProvider->getSignedInUser($token);
            $rq = $rq->withAttribute('idutilisateur', $user->id);
        } catch (AuthInvalidException $e) {
            $this->loger->error($e->getMessage());
            throw new HttpUnauthorizedException($rq, "Votre authentification n'est pas valide, veuillez vous reconnecter");
        } catch (\Error $e) {
            $this->loger->error($e->getMessage());
            throw new HttpUnauthorizedException($rq, "Erreur lors de l'authentification veuillez verifier votre token");
        }


        // avant requête
        //authz middleware
        // $authz = new AuthzMiddleware($user->role);
        // $rs = $authz->process($rq, $next);



        $rs = $next->handle($rq);
        //après requete
        return $rs;
    }

}
