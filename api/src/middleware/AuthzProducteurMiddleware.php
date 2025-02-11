<?php

namespace amap\middleware;

use Psr\Log\LoggerInterface;
use Slim\Routing\RouteContext;
use Slim\Routing\RouteParser;
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
    public function __construct()
    {
    }

    public function process(ServerRequestInterface $rq, RequestHandlerInterface $next): ResponseInterface
    {

        $id_user = $rq->getAttribute('idutilisateur');
        if($id_user === null) {
            throw new HttpUnauthorizedException($rq, "Vous n'êtes pas connécté");
        }
        $id_panier = RouteContext::fromRequest($rq)->getRoute()->getArgument('id_panier');

        if($id_panier === null) {
            $rs = $next->handle($rq);
            //après requete
            return $rs;
        }

    }

}
