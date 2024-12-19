<?php

namespace amap\core\service;

use amap\infrastructure\service\implementations\UserRepository;
use Psr\Container\ContainerInterface;

class UserService implements UserServiceInterface
{
    private UserRepository $userRepository;
    private string $jwtSecretKey;

    public function __construct(ContainerInterface $cont)
    {
        $this->userRepository = $cont->get(UserRepository::class);
        $this->jwtSecretKey = getenv('JWT_SECRET_KEY');
    }
}