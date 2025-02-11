<?php

namespace amap\core\service;

use amap\core\dto\AllergenesDTO;
use amap\core\dto\AuthDTO;
use amap\core\dto\IngredientDTO;
use amap\core\dto\ProfileDTO;
use amap\core\dto\UstensileDTO;
use amap\core\dto\UtilisateurDTO;
use amap\core\dto\UtilisateurInputDTO;
use amap\infrastructure\entities\Allergene;
use amap\infrastructure\entities\Utilisateur;
use amap\infrastructure\repository\interfaces\AllergieRepositoryInterface;
use amap\core\service\interfaces\ServiceUtilisateurInterface;
use amap\infrastructure\repository\interfaces\UtilisateurRepositoryInterface;

class ServiceUtilisateur implements ServiceUtilisateurInterface
{
    private UtilisateurRepositoryInterface $utilisateurRepository;
    private AllergieRepositoryInterface $allergieRepo;

    public function __construct(UtilisateurRepositoryInterface $u, AllergieRepositoryInterface $a)
    {
        $this->utilisateurRepository = $u;
        $this->allergieRepo = $a;
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

    public function getExclusIngredients(string $id): array
    {
        return IngredientDTO::fromArrayToDTO($this->utilisateurRepository->getUtilisateurById($id)->getIngredientsExclus());
    }

    public function getAllergies(string $id): array
    {
        $allergies = AllergenesDTO::fromArrayToDTO($this->utilisateurRepository->getUtilisateurById($id)->getAllergies());
        return $allergies;
    }

    public function getUstensilesExclus(string $id): array
    {
        $ustensiles_exclus = UstensileDTO::fromArrayToDTO($this->utilisateurRepository->getUtilisateurById($id)->getUstensilesExclus());
        return $ustensiles_exclus;
    }

    public function addAllergies(string $id_utilisateur, int $id_allergie): void
    {
        $allergie = $this->allergieRepo->getAllergieById($id_allergie);
        $this->utilisateurRepository->addAllergies($id_utilisateur, $allergie);
    }

    public function deleteAllergies(string $id_utilisateur, int $id_allergie): void
    {
        $allergie = $this->allergieRepo->getAllergieById($id_allergie);
        $this->utilisateurRepository->deleteAllergies($id_utilisateur, $allergie);
    }

    public function addUstensiles(string $id_utilisateur, int $id_ustensiles): void
    {
    }

    public function deleteUstensiles(string $id_utilisateur, int $id_ustensiles): void
    {
    }

    public function addIngredient(string $id_utilisateur, int $id_ingredients): void
    {
    }

    public function deleteIngredient(string $id_utilisateur, int $id_ingredients): void
    {
    }

}
