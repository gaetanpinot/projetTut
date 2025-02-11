<?php

namespace amap\core\service\interfaces;

use amap\core\dto\UtilisateurDTO;
use amap\core\dto\UtilisateurInputDTO;

interface ServiceUtilisateurInterface
{
    public function getUtilisateurById(string $id): UtilisateurDTO;
    public function getUtilisateurByNom(string $nom): UtilisateurDTO;

}
