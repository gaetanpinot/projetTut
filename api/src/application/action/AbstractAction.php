<?php

namespace amap\application\action;

use Monolog\Logger;
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
    public function __construct(LoggerInterface $l)
    {
        $this->loger = $l;
    }

    /**
     * @param array<int,mixed> $args
     */
    abstract public function __invoke(ServerRequestInterface $rq, ResponseInterface $rs, array $args): ResponseInterface ;


}