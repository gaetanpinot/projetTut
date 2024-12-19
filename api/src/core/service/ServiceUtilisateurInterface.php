<?php

namespace amap\core\service;

use amap\core\dto\AuthDTO;
use amap\core\dto\CredentialsDTO;
use amap\core\dto\UtilisateurDTO;

interface ServiceUtilisateurInterface
{
    public function getUtilisateurById(string $id): UtilisateurDTO;
    public function getUtilisateurByNom(string $nom): UtilisateurDTO;

}