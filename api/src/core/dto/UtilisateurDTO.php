<?php

namespace amap\core\dto;

use amap\core\dto\DTO;
use amap\infrastructure\entities\Utilisateur;

class UtilisateurDTO extends DTO
{
    protected string $id;
    protected ?string $nom_utilisateur;
    protected ?int $role;
    protected array $recettes;
    protected array $paniers;
    protected array $allergies;
    protected array $ingredients_exclus;
    protected array $ustensiles_exclus;
    protected array $frigo;
    protected array $recettes_favorites;

    public static function fromUtilisateur(Utilisateur $u): UtilisateurDTO
    {
        $utilisateur = new UtilisateurDTO();
        $utilisateur->id = $u->getId();
        $utilisateur->nom_utilisateur = $u->getNomUtilisateur();
        $utilisateur->role = $u->getRole();
        /*$utilisateur->frigo = $u->getFrigo();*/
        /*$utilisateur->recettes = $u->getRecettes()->map(fn ($r) => $r->getId())->toArray();*/
        return $utilisateur;

    }
    /**
     * @param array<Utilisateur> $u
     * @return UtilisateurDTO[]
     */
    public static function fromArrayUtilisateur($u): array
    {
        $retour = [];
        foreach($u as $utilisateur) {
            $retour[] = self::fromUtilisateur($utilisateur);
        }
        return $retour;
    }
}
