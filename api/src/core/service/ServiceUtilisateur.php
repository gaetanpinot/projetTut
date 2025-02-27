<?php

namespace amap\core\service;

use amap\core\dto\AllergenesDTO;
use amap\core\dto\FrigoDTO;
use amap\core\dto\FrigoInputDTO;
use amap\core\dto\IngredientDTO;
use amap\core\dto\IngredientProduitsDTO;
use amap\core\dto\PanierDTO;
use amap\core\dto\ProfileDTO;
use amap\core\dto\UstensileDTO;
use amap\core\dto\UtilisateurDTO;
use amap\core\entities\FrigoEntity;
use amap\infrastructure\repository\interfaces\AllergieRepositoryInterface;
use amap\core\service\interfaces\ServiceUtilisateurInterface;
use amap\infrastructure\repository\interfaces\UstensileRepositoryInterface;
use amap\infrastructure\repository\interfaces\UtilisateurRepositoryInterface;

class ServiceUtilisateur implements ServiceUtilisateurInterface
{

    private UtilisateurRepositoryInterface $utilisateurRepository;
    private AllergieRepositoryInterface $allergieRepo;
    private UstensileRepositoryInterface $ustensileRepository;

    public function __construct(UtilisateurRepositoryInterface $u, AllergieRepositoryInterface $a, UstensileRepositoryInterface $ustensileRepository)
    {
        $this->utilisateurRepository = $u;
        $this->allergieRepo = $a;
        $this->ustensileRepository = $ustensileRepository;
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

        $frigo = [];

        foreach($utilisateur->getFrigo() as $f) {
            $frigo[] = new FrigoDTO(
                $f->getIngredient()->getId(),
                $f->getIngredient()->getNom(),
                $f->getIngredient()->getUrlPhoto(),
                $f->getQuantite(),
                \DateTime::createFromFormat('U',$f->getTimestampAjout()),
            );
        }

        $profile = new ProfileDTO(UtilisateurDTO::fromUtilisateur($utilisateur), $ustensiles_exclus, $allergies, $ingredients_exclus, $frigo);
        return $profile;
    }

    /**
    * @return FrigoDTO[]
    */
    public function getFrigoUtilisateur(string $id): array{
        $utilisateur = $this->utilisateurRepository->getUtilisateurById($id);

        $frigo = [];

        foreach($utilisateur->getFrigo() as $f) {
            $frigo[] = new FrigoDTO(
                $f->getIngredient()->getId(),
                $f->getIngredient()->getNom(),
                $f->getIngredient()->getUrlPhoto(),
                $f->getQuantite(),
                \DateTime::createFromFormat('U',$f->getTimestampAjout()),
            );
        }

        return $frigo;
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

    public function setUstensiles($user_id, $ustensiles_ids): void
    {
        $ustensiles = $this->ustensileRepository->getUstensilesByIds($ustensiles_ids);
        $this->utilisateurRepository->setUstensiles($user_id, $ustensiles);
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

    /**
     * @param FrigoInputDTO[] $ingredients_frigo
     */
    public function replaceFrigo(string $id_utilisateur, array $ingredients_frigo):void{
        $frigo = [];
        foreach($ingredients_frigo as $f) {
            $ingredient = new FrigoEntity($f->id_ingredient, $f->quantite, $f->timestamp_ajout);
            $frigo[] = $ingredient;
        }
        $this->utilisateurRepository->remplaceFrigo($id_utilisateur, $frigo);
    }

    public function getPanierProducteur(string $id_producteur): array
    {
        $paniers = $this->utilisateurRepository->getPanierProducteur($id_producteur);
        $paniersDTO = [];
        foreach($paniers as $p){
            $paniersDTO[] = PanierDTO::fromEntity($p);
        }
        return $paniersDTO;
    }

    public function getIngredientProducteur(string $id_producteur): IngredientProduitsDTO
    {
        $producteur = $this->utilisateurRepository->getProducteur($id_producteur);
        $ingredients = $this->utilisateurRepository->getIngredientProducteur($id_producteur);
        $ingredientsDTO = array_map(
        fn ($i) => IngredientDTO::fromIngredient($i),$ingredients);
        $ingredientProduit = new IngredientProduitsDTO($producteur->getId(), $producteur->getNomUtilisateur(), $ingredientsDTO);
        return $ingredientProduit;
    }

    public function addProducteurToUtilisateur(string $id_utilisateur, string $id_producteur): void
    {
        $this->utilisateurRepository->addProducteurToUtilisateur($id_utilisateur, $id_producteur);
    }

    public function deleteProducteurToUtilisateur(string $id_utilisateur, string $id_producteur): void
    {
        $this->utilisateurRepository->deleteProducteurToUtilisateur($id_utilisateur, $id_producteur);
    }

    public function getProducteurs(): array{

        $producteurs = $this->utilisateurRepository->getProducteurs();
        $producteursDTO = array_map(
        fn ($p) => UtilisateurDTO::fromUtilisateur($p),$producteurs);
        return $producteursDTO;
    }

    public function changerIngredientsProduits(string $id_producteur, array $ingredients): void
    {
        $producteur = $this->utilisateurRepository->changerIngredientsProduits($id_producteur, $ingredients);
    }

    public function getProduceursOfUtilisateur(string $id_utilisateur): array
    {
        $producteurs = $this->utilisateurRepository->getProduceursOfUtilisateur($id_utilisateur);
        $producteursDTO = UtilisateurDTO::fromArrayUtilisateur($producteurs);
return $producteursDTO;
    }


}
