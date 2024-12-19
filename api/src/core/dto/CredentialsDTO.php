<?php

namespace amap\core\dto;

use amap\core\dto\DTO;

class CredentialsDTO extends DTO
{
    public string $nomUtilisateur;
    public string $id;
    public int $role;
    public string $password;

    public function setPassword(string $password): void
    {
        $this->password = $password;
    }

    public function __construct(string $id, string $password, string $nomUtilisateur, int $role = 0)
    {
        $this->password = $password;
        $this->id = $id;
        $this->nomUtilisateur = $nomUtilisateur;
        $this->role = $role;
    }

}
