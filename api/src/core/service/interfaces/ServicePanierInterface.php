<?php

namespace amap\core\service\interfaces;

use amap\core\dto\InputPanierDTO;
use amap\core\dto\PanierDTO;

interface ServicePanierInterface
{
    public function getPanierById(int $id): PanierDTO;
    public function createPanier(InputPanierDTO $panier): PanierDTO;
    public function publierPanier(int $id_panier): void;
    public function getPanierByProducteur(string $id_producteur): array;
    public function getLatestPaniers(): array;
}
