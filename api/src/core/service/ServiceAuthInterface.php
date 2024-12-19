<?php

namespace amap\core\service;

use amap\core\dto\AuthDTO;
use amap\core\dto\CredentialsDTO;

interface ServiceAuthInterface
{
    public function createUser(CredentialsDTO $credentials, int $role): string;
    public function byCredentials(CredentialsDTO $credentials): AuthDTO;

}
