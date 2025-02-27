<?php

namespace amap\core\service;

use amap\core\dto\AllergenesDTO;
use amap\core\service\interfaces\ServiceAllergenesInterface;
use amap\infrastructure\repository\interfaces\AllergieRepositoryInterface;

class ServiceAllergie implements ServiceAllergenesInterface{
    public function __construct(private AllergieRepositoryInterface $allergieRepository)
    {
    }

    public function getAllergieById(int $id): AllergenesDTO
    {
    }

    public function getAllergies(): array
    {
        $allergies = $this->allergieRepository->getAllergies();
        return AllergenesDTO::fromArrayToDTO($allergies);
    }

}
