<?php

namespace amap\core\service\interfaces;

use amap\core\dto\AuthDTO;
use amap\core\dto\CredentialsDTO;
use amap\core\dto\ProfileDTO;
use amap\core\dto\UtilisateurDTO;

interface ServiceUtilisateurInterface
{
    public function getUtilisateurById(string $id): UtilisateurDTO;
    public function getUtilisateurByNom(string $nom): UtilisateurDTO;
    public function getProfileUtilisateur(string $id): ProfileDTO;
    public function getExclusIngredients(string $id): array;
    public function getUstensilesExclus(string $id): array;
    public function getAllergies(string $id): array;

    public function addAllergies(string $id_utilisateur, int $id_allergie): void;
    public function deleteAllergies(string $id_utilisateur, int $id_allergie): void;

    public function addUstensiles(string $id_utilisateur, int $id_ustensiles): void;
    public function deleteUstensiles(string $id_utilisateur, int $id_ustensiles): void;

    public function addIngredient(string $id_utilisateur, int $id_ingredients): void;
    public function deleteIngredient(string $id_utilisateur, int $id_ingredients): void;

}
