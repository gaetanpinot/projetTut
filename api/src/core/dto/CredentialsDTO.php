<?php

namespace amap\core\dto;

use amap\core\dto\DTO;

class CredentialsDTO extends DTO
{
    public string $nomUtilisateur;
    public string $id;
    public string $password;

    public function __construct(string $id, string $password, string $nomUtilisateur)
    {
        $this->password = $password;
        $this->id = $id;
        $this->nomUtilisateur = $nomUtilisateur;
    }

}
