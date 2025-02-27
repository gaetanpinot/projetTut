<?php

namespace amap\core\service\interfaces;

use amap\core\dto\AllergenesDTO;

interface ServiceAllergenesInterface
{
    public function getAllergieById(int $id): AllergenesDTO;
    /**
     * @return AllergenesDTO[]
     */
    public function getAllergies(): array;
}
