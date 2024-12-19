<?php

namespace amap\core\service;

use amap\core\dto\AuthDTO;
use amap\core\dto\CredentialsDTO;
use amap\core\dto\UtilisateurDTO;
use amap\core\dto\UtilisateurInputDTO;
use amap\core\service\ServiceAuthInterface;
use amap\infrastructure\entities\Utilisateur;
use amap\infrastructure\repository\EntityConstraintViolation;
use amap\infrastructure\repository\EntityNotFoundException;
use amap\infrastructure\repository\UtilisateurRepositoryInterface;

class ServiceAuth implements ServiceAuthInterface
{
    private UtilisateurRepositoryInterface $utilisateurRepository;
    public function __construct(UtilisateurRepositoryInterface $utilisateurRepository)
    {
        $this->utilisateurRepository = $utilisateurRepository;
    }

    public function byCredentials(CredentialsDTO $credentials): AuthDTO
    {
        try {
            $nom = $credentials->nomUtilisateur;
            $user = $this->utilisateurRepository->getUtilisateurByNom($nom);
            if (!password_verify($credentials->password, $user->getMotDePasse())) {
                throw new BadInputException("Mauvais mot de passe");
            }
            return  AuthDTO::fromUser($user);
        } catch (EntityNotFoundException $e) {
            throw new BadInputException("Utilisateur $nom n'existe pas");
        }
    }

    public function createUtilisateur(CredentialsDTO $utilisateurInput): AuthDTO
    {
        $utilisateurInput->setPassword(password_hash($utilisateurInput->password, PASSWORD_DEFAULT));
        $user =  Utilisateur::fromCredentialsDTO($utilisateurInput);
        try {
            $this->utilisateurRepository->createUtilisateur($user);
        } catch (EntityConstraintViolation $e) {
            throw new BadInputException($e->getMessage());
        }
        return AuthDTO::fromUser($user);

    }
}
