<?php

namespace amap\infrastructure\repository\interfaces;

use amap\infrastructure\entities\Utilisateur;

interface UtilisateurRepositoryInterface
{
    public function getUtilisateurById(string $id): Utilisateur;
    public function getUtilisateurByNom(string $nomUtilisateur): Utilisateur;
    public function createUtilisateur(Utilisateur $utilisateur): Utilisateur;
}
