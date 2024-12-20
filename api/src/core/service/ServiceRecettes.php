<?php

namespace amap\core\service;

use amap\core\dto\RecetteDTO;
use amap\infrastructure\repository\RecetteRepository;
use amap\infrastructure\repository\RecetteRepositoryInterface;
use amap\infrastructure\repository\UtilisateurRepositoryInterface;

class ServiceRecettes implements ServiceRecettesInterface
{
    private RecetteRepositoryInterface $recetteRepository;
    public function __construct(RecetteRepositoryInterface $r)
    {
        $this->recetteRepository = $r;
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
