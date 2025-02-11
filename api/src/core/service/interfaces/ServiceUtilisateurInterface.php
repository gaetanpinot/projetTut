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

}
