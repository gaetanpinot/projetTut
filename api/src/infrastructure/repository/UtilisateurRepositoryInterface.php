<?php

namespace amap\infrastructure\repository;

use amap\infrastructure\entities\Allergene;
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
}
