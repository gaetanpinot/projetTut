<?php

namespace amap\infrastructure\repository\interfaces;

use amap\infrastructure\entities\Panier;

interface PanierRepositoryInterface
{
    public function getPanierById(int $id): Panier;
}
