<?php

namespace amap\infrastructure\service\interfaces;

interface UserServiceInterface
{
    public function registerUser(array $data);

    public function authenticateUser(string $username, string $password);
}