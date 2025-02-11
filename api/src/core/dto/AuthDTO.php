<?php

namespace amap\core\dto;

use amap\infrastructure\entities\Utilisateur;

class AuthDTO extends DTO
{
    protected string $id;
    protected UtilisateurDTO $utilisateur;
    protected int $role;
    protected string $token;
    protected string $refreshToken;

    public function __construct(string $id, int $role)
    {
        $this->id = $id;
        $this->role = $role;
    }

    public function setUtilisateur(UtilisateurDTO $utilisateur): void
    {
        $this->utilisateur = $utilisateur;
    }
    public function setAtoken(string $tok): void
    {
        $this->token = $tok;
    }

    public function setId(string $id)
    {
        $this->id = $id;
    }
    public function setRole(int $role)
    {
        $this->role = $role;
    }

    public static function fromUser(Utilisateur $user)
    {
        $retour = new AuthDTO($user->getId(), $user->getRole());
        $retour->setUtilisateur(UtilisateurDTO::fromUtilisateur($user));
        return $retour;
    }

    public function jsonSerialize(): array
    {
        $retour = parent::jsonSerialize();
        unset($retour['id']);
        unset($retour['role']);
        return $retour;
    }

}
