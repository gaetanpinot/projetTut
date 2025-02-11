<?php

namespace amap\infrastructure\repository;

use amap\infrastructure\entities\Allergene;

interface AllergieRepositoryInterface
{
    public function getAllergieById(int $id): Allergene;
}
