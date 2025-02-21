<?php

namespace amap\infrastructure\repository\interfaces;

use amap\infrastructure\entities\Allergene;
use amap\infrastructure\entities\Frigo;
use amap\infrastructure\entities\Ingredient;
use amap\infrastructure\entities\Panier;
use amap\infrastructure\entities\Utilisateur;

interface UtilisateurRepositoryInterface
{
    public function getUtilisateurById(string $id): Utilisateur;
    public function getUtilisateurByNom(string $nomUtilisateur): Utilisateur;
    public function createUtilisateur(Utilisateur $utilisateur): Utilisateur;
    public function addAllergies(string $id_utilisateur, Allergene $allergie): void;
    public function deleteAllergies(string $id_utilisateur, Allergene $allergie): void;

    public function addUstensiles(string $id_utilisateur, int $id_ustensiles): void;
    public function deleteUstensiles(string $id_utilisateur, int $id_ustensiles): void;

    public function addIngredient(string $id_utilisateur, int $id_ingredients): void;
    public function deleteIngredient(string $id_utilisateur, int $id_ingredients): void;

    /**
     * @param Frigo[] $frigo
     */
    public function remplaceFrigo(string $id_utilisateur, array $frigo): void;

    /**
     * @return Panier[]
     */
    public function getPanierProducteur(string $id_producteur): array;

    /**
    * @return Ingredient[]
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
     * @return Utilisateur[]
     */
    public function getProducteurs(): array;
}
