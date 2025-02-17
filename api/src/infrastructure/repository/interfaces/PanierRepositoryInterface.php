<?php

namespace amap\infrastructure\repository\interfaces;

use amap\core\dto\InputPanierDTO;
use amap\core\entities\PanierEntity;
use amap\infrastructure\entities\Panier;

interface PanierRepositoryInterface
{
    public function getPanierById(int $id): Panier;
    public function createPanier(InputPanierDTO $panier): Panier;
}
