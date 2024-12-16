<?php

namespace amap\application\action;

use DI\Container;
use Monolog\Logger;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;

abstract class AbstractAction
{
    protected Logger $loger;
    /**
     * @param ServiceRDVInterface $srdv
     * @param ServicePraticienInterface $sprt
     * @param string $formatDate
     */
    public function __construct(Container $cont)
    {
        $this->loger = $cont->get(Logger::class)->withName(get_class($this));


    }

    /**
     * @param array<int,mixed> $args
     */
    abstract public function __invoke(ServerRequestInterface $rq, ResponseInterface $rs, array $args): ResponseInterface ;


}
