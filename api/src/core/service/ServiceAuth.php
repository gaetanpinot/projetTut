<?php

namespace amap\core\service;

use amap\core\dto\AuthDTO;
use amap\core\dto\CredentialsDTO;
use amap\core\service\ServiceAuthInterface;
use amap\infrastructure\repository\EntityNotFoundException;
use amap\infrastructure\repository\UtilisateurRepositoryInterface;

class ServiceAuth implements ServiceAuthInterface
{
    private UtilisateurRepositoryInterface $utilisateurRepository;
    public function __construct(UtilisateurRepositoryInterface $utilisateurRepository)
    {
        $this->utilisateurRepository = $utilisateurRepository;
    }
    public function createUser(CredentialsDTO $credentials, int $role): string
    {
    }

    public function byCredentials(CredentialsDTO $credentials): AuthDTO
    {
        try {
            $nom = $credentials->nomUtilisateur;
            $user = $this->utilisateurRepository->getUtilisateurByNom($nom);
            if (!password_verify($credentials->password, $user->getMotDePasse())) {
                throw new BadInputException("Mauvais mot de passe");
            }
            return new AuthDTO($user->getId(), $user->getRole());
        } catch (EntityNotFoundException $e) {
            throw new BadInputException("Utilisateur $nom n'existe pas");
        }
    }
}
