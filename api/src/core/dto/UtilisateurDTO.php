<?php

namespace amap\core\dto;

use amap\core\dto\DTO;
use amap\infrastructure\entities\Utilisateur;

class UtilisateurDTO extends DTO
{
    protected string $id;
    protected ?string $nomUtilisateur;
    protected ?int $role;
    protected array $recettes;
    protected array $paniers;
    protected array $allergies;
    protected array $ingredientsExclus;
    protected array $ustensilesExclus;
    protected array $frigo;
    protected array $recettesFavorites;

    public static function fromUtilisateur(Utilisateur $u): UtilisateurDTO
    {
        $utilisateur = new UtilisateurDTO();
        $utilisateur->id = $u->getId();
        $utilisateur->nomUtilisateur = $u->getNomUtilisateur();
        $utilisateur->role = $u->getRole();
        $utilisateur->recettes = $u->getRecettes()->map(fn ($r) => $r->getId())->toArray();
        return $utilisateur;

    }
}
