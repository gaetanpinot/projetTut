<?php

namespace amap\core\service\interfaces;

use amap\core\dto\AllergenesDTO;
use amap\core\dto\AuthDTO;
use amap\core\dto\CredentialsDTO;
use amap\core\dto\FrigoDTO;
use amap\core\dto\IngredientDTO;
use amap\core\dto\PanierDTO;
use amap\core\dto\ProfileDTO;
use amap\core\dto\UtilisateurDTO;

interface ServiceUtilisateurInterface
{
    public function getUtilisateurById(string $id): UtilisateurDTO;
    public function getUtilisateurByNom(string $nom): UtilisateurDTO;
    public function getProfileUtilisateur(string $id): ProfileDTO;
    public function getExclusIngredients(string $id): array;
    public function getUstensilesExclus(string $id): array;

    /**
     * @return AllergenesDTO[]
     */
    public function getAllergies(string $id): array;

    public function addAllergies(string $id_utilisateur, int $id_allergie): void;
    public function deleteAllergies(string $id_utilisateur, int $id_allergie): void;

    public function addUstensiles(string $id_utilisateur, int $id_ustensiles): void;
    public function deleteUstensiles(string $id_utilisateur, int $id_ustensiles): void;

    public function addIngredient(string $id_utilisateur, int $id_ingredients): void;
    public function deleteIngredient(string $id_utilisateur, int $id_ingredients): void;

    /**
     * @return FrigoDTO[]
     */
    public function getFrigoUtilisateur(string $id): array;
    public function replaceFrigo(string $id_utilisateur, array $ingredients_frigo):void;
    
    /**
     * @return PanierDTO[]
     */
    public function getPanierProducteur(string $id_producteur): array;

    /**
    * @return IngredientDTO[]
    */
    public function getIngredientProducteur(string $id_producteur): array;

    /**
    * s'abonner à un producteur
    */
    public function addProducteurToUtilisateur(string $id_utilisateur, string $id_producteur): void;

    /**
    * se desabonner à un producteur
    */
    public function deleteProducteurToUtilisateur(string $id_utilisateur, string $id_producteur): void;
    /**
    * @return UtilisateurDTO[]
    */
    public function getProducteurs(): array;
    public function changerIngredientsProduits(string $id_producteur, array $ingredients): void;
}
