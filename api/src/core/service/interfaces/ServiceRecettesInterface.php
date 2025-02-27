<?php

namespace amap\core\service\interfaces;
use amap\core\dto\RecetteDTO;

use amap\core\dto\input\InputRecetteDTO;

interface ServiceRecettesInterface
{
    public function getRecettes($args);

    public function getRandomRecettes(int $int);
    public function createRecette(InputRecetteDTO $inputRecette) : RecetteDTO;
}
