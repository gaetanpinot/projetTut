<?php

namespace amap\core\service;

use amap\core\dto\UtilisateurDTO;
use amap\infrastructure\repository\UtilisateurRepositoryInterface;

class ServiceUtilisateur implements ServiceUtilisateurInterface
{
    private UtilisateurRepositoryInterface $utilisateurRepository;
    public function __construct(UtilisateurRepositoryInterface $u)
    {
        $this->utilisateurRepository = $u;
    }


    public function getUtilisateurById(string $id): UtilisateurDTO
    {
        return UtilisateurDTO::fromUtilisateur($this->utilisateurRepository->getUtilisateurById($id));
    }

    public function getUtilisateurByNom(string $nom): UtilisateurDTO
    {
        return UtilisateurDTO::fromUtilisateur($this->utilisateurRepository->getUtilisateurByNom($nom));
    }
}
