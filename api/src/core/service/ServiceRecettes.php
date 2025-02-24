<?php

namespace amap\core\service;

use amap\core\dto\input\InputRecetteDTO;
use amap\core\dto\RecetteDTO;
use amap\core\service\interfaces\ServiceRecettesInterface;
use amap\infrastructure\entities\Recette;
use amap\infrastructure\repository\interfaces\RecetteRepositoryInterface;
use Ramsey\Uuid\Uuid;

class ServiceRecettes implements ServiceRecettesInterface
{
    private RecetteRepositoryInterface $recetteRepository;
    public function __construct(RecetteRepositoryInterface $r)
    {
        $this->recetteRepository = $r;
    }

    public function getRecetteById($id): RecetteDTO
    {
        return RecetteDTO::fromRecette($this->recetteRepository->getRecetteById($id));
    }

    public function getRecettes($args)
    {
        $recettes = [];
        foreach ($this->recetteRepository->getRecettes($args) as $rec) {
            array_push($recettes, RecetteDTO::fromRecette($rec));
        }
        return $recettes;
    }

    public function deleteRecette($id)
    {
        $this->recetteRepository->deleteRecette($id);
    }

    public function createRecette(InputRecetteDTO $recetteInputDTO) : RecetteDTO
    {

        $res = $this->recetteRepository->createRecette($recetteInputDTO);

//        var_dump($res->getId());
        return RecetteDTO::fromRecette($res);
    }
}
