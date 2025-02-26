<?php

namespace amap\core\service;

use amap\core\dto\input\InputRecetteDTO;
use amap\core\dto\RecetteDTO;
use amap\core\service\interfaces\ServiceRecettesInterface;
use amap\infrastructure\entities\Recette;
use amap\infrastructure\entities\Utilisateur;
use amap\infrastructure\repository\interfaces\RecetteRepositoryInterface;
use amap\infrastructure\repository\interfaces\UtilisateurRepositoryInterface;

class ServiceRecettes implements ServiceRecettesInterface
{
    private RecetteRepositoryInterface $recetteRepository;
    private UtilisateurRepositoryInterface $utilisateurRepository;


    public function __construct(RecetteRepositoryInterface $recetteRepository, UtilisateurRepositoryInterface $utilisateurRepository )
    {
        $this->recetteRepository = $recetteRepository;
        $this->utilisateurRepository = $utilisateurRepository;
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

    public function createRecette(InputRecetteDTO $inputRecette) : RecetteDTO
    {
        $createur = $this->utilisateurRepository->getUtilisateurById($inputRecette->getIdCreateur());
        $recette = Recette::fromInputRecetteDTO($inputRecette, $createur);
        $res = $this->recetteRepository->createRecette($recette);

        return RecetteDTO::fromRecette($res);
    }

    public function getRandomRecettes(int $count)
    {
        $recettes = [];
        foreach ($this->recetteRepository->getRandomRecettes($count) as $rec) {
            array_push($recettes, RecetteDTO::fromRecette($rec));
        }
        return $recettes;
    }
}
