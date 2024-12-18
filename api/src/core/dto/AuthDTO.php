<?php

namespace amap\core\dto;

use App\Entity\Utilisateur;

class AuthDTO extends DTO
{
    protected string $id;
    protected int $role;
    protected string $atoken;
    protected string $refreshToken;

    public function __construct(string $id, int $role)
    {
        $this->id = $id;
        $this->role = $role;
    }

    public function setAtoken(string $tok): void
    {
        $this->atoken = $tok;
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
        $this->id = $user->getId();
        $this->role = $user->getRole();
    }

}
