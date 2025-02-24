<?php

namespace amap\core\entities;

class UtilisateurEntity
{
    public string $id;
    public string $nomUtilisateur;
    public int $role;
    public string $motDePasse;
    public array $allergies;
    public array $ingredientsExclus;
    public array $ustensilesExclus;
    public array $frigo;
    public array $recettesFavorites;
}
