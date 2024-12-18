<?php

namespace amap\infrastructure\repository;

use amap\infrastructure\entities\Utilisateur;

interface UtilisateurRepositoryInterface
{
    public function getUtilisateurById(string $id): Utilisateur;
    public function getUtilisateurByNom(string $nomUtilisateur): Utilisateur;
}
