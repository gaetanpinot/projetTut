<?php

namespace amap\middleware;

use Psr\Log\LoggerInterface;
use Slim\Exception\HttpForbiddenException;
use Slim\Routing\RouteContext;
use Slim\Routing\RouteParser;
use amap\core\service\interfaces\ServicePanierInterface;
use amap\providers\auth\AuthInvalidException;
use amap\providers\auth\AuthnProviderInterface;
use Exception;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Psr\Http\Server\MiddlewareInterface;
use Psr\Http\Server\RequestHandlerInterface;
use Slim\Exception\HttpUnauthorizedException;

class AuthzProducteurMiddleware implements MiddlewareInterface
{
    public function __construct(protected ServicePanierInterface $servicePanier)
    {
    }

    public function process(ServerRequestInterface $rq, RequestHandlerInterface $next): ResponseInterface
    {

        $id_user = $rq->getAttribute('idutilisateur');
        $role_user = $rq->getAttribute('role_utilisateur');
        if($id_user === null) {
            throw new HttpUnauthorizedException($rq, "Vous n'êtes pas connécté");
        }
        if($role_user !== 1) {
            throw new HttpForbiddenException($rq, "Vous n'êtes pas autorisé à accéder à cette ressource");
        }

        $id_panier = RouteContext::fromRequest($rq)->getRoute()->getArgument('id_panier');

        if($id_panier !== null) {
            $panier = $this->servicePanier->getPanierById($id_panier);
            if($panier->producteur->id !== $id_user) {
                throw new HttpUnauthorizedException($rq, "Vous n'êtes pas le producteur de ce panier");
            }
        }

        $rs = $next->handle($rq);
        return $rs;

    }

}
