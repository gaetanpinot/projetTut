<?php

namespace amap\infrastructure\repository\interfaces;

use amap\infrastructure\entities\Allergene;

interface AllergieRepositoryInterface
{
    public function getAllergieById(int $id): Allergene;
    public function getAllergies(): array;
}
