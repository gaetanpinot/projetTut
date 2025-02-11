<?php

namespace amap\core\service;

use amap\core\dto\RecetteDTO;
use amap\core\service\interfaces\ServiceRecettesInterface;
use amap\infrastructure\repository\interfaces\RecetteRepositoryInterface;

class ServiceRecettes implements ServiceRecettesInterface
{
    private RecetteRepositoryInterface $recetteRepository;
    public function __construct(RecetteRepositoryInterface $r)
    {
        $this->recetteRepository = $r;
    }
    public function getRecetteById($id) : RecetteDTO {
        return RecetteDTO::fromRecette($this->recetteRepository->getRecetteById($id));
    }
    public function getRecettes($args) {
        $recettes = [];
        foreach ($this->recetteRepository->getRecettes($args) as $rec) {
            array_push($recettes, RecetteDTO::fromRecette($rec));
        }
        return $recettes;
    }

    public function getRecetteById($id) {
        return RecetteDTO::fromRecette($this->recetteRepository->getRecetteById($id));
    }

    public function deleteRecette($id) {
        $this->recetteRepository->deleteRecette($id);
    }

    public function createRecette($recetteInputDTO) {
        // InputDTO to entity
    }

}
