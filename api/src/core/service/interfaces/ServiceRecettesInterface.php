<?php

namespace amap\core\service\interfaces;

interface ServiceRecettesInterface
{
    public function getRecettes($args);

    public function getRandomRecettes(int $int);
}
