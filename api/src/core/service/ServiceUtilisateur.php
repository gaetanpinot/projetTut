<?php

namespace amap\core\service;

use amap\core\dto\AllergenesDTO;
use amap\core\dto\AuthDTO;
use amap\core\dto\IngredientDTO;
use amap\core\dto\ProfileDTO;
use amap\core\dto\UstensileDTO;
use amap\core\dto\UtilisateurDTO;
use amap\core\dto\UtilisateurInputDTO;
use amap\infrastructure\entities\Utilisateur;
use amap\infrastructure\repository\UtilisateurRepositoryInterface;

class ServiceUtilisateur implements ServiceUtilisateurInterface
{
    private UtilisateurRepositoryInterface $utilisateurRepository;

    public function __construct(UtilisateurRepositoryInterface $u)
    {
        $this->utilisateurRepository = $u;
    }


    public function getUtilisateurById(string $id): UtilisateurDTO
    {
        return UtilisateurDTO::fromUtilisateur($this->utilisateurRepository->getUtilisateurById($id));
    }

    public function getUtilisateurByNom(string $nom): UtilisateurDTO
    {
        return UtilisateurDTO::fromUtilisateur($this->utilisateurRepository->getUtilisateurByNom($nom));
    }

    public function getProfileUtilisateur(string $id): ProfileDTO
    {
        $utilisateur = $this->utilisateurRepository->getUtilisateurById($id);
        $ustensiles_exclus = UstensileDTO::fromArrayToDTO($utilisateur->getUstensilesExclus());
        $allergies = AllergenesDTO::fromArrayToDTO($utilisateur->getAllergies());
        $ingredients_exclus = IngredientDTO::fromArrayToDTO($utilisateur->getIngredientsExclus());
        $profile = new ProfileDTO(UtilisateurDTO::fromUtilisateur($utilisateur), $ustensiles_exclus, $allergies, $ingredients_exclus);
        return $profile;
    }

}
