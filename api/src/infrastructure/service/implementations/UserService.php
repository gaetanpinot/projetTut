<?php

namespace amap\infrastructure\service\implementations;

use amap\infrastructure\service\interfaces\UserServiceInterface;
use Firebase\JWT\JWT;
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

    public function registerUser(array $data)
    {
        if ($this->userRepository->findByUsername($data['nom_utilisateur'])) {
            throw new \Exception('Username already exists');
        }

        $hashedPassword = password_hash($data['mot_de_passe'], PASSWORD_BCRYPT);
        return $this->userRepository->save([
            'nom_utilisateur' => $data['nom_utilisateur'],
            'mot_de_passe' => $hashedPassword,
        ]);
    }

    public function authenticateUser(string $username, string $password)
    {
        $user = $this->userRepository->findByUsername($username);

        if (!$user || !password_verify($password, $user['mot_de_passe'])) {
            throw new \Exception('Invalid username or password');
        }

        return $user;
    }
}