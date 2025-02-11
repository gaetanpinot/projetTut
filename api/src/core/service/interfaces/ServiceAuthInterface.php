<?php

namespace amap\core\service\interfaces;

use amap\core\dto\AuthDTO;
use amap\core\dto\CredentialsDTO;

interface ServiceAuthInterface
{
    public function byCredentials(CredentialsDTO $credentials): AuthDTO;
    public function createUtilisateur(CredentialsDTO $utilisateur): AuthDTO;

}
