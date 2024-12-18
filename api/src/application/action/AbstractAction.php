<?php

namespace amap\application\action;

use DI\Container;
use Monolog\Logger;
use Psr\Container\ContainerInterface;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Psr\Log\LoggerInterface;

abstract class AbstractAction
{
    protected Logger $loger;
    /**
     * @param ServiceRDVInterface $srdv
     * @param ServicePraticienInterface $sprt
     * @param string $formatDate
     */
    public function __construct(ContainerInterface $cont)
    {
        $this->loger = $cont->get(LoggerInterface::class)->withName(get_class($this));
    }

    /**
     * @param array<int,mixed> $args
     */
    abstract public function __invoke(ServerRequestInterface $rq, ResponseInterface $rs, array $args): ResponseInterface ;


}
