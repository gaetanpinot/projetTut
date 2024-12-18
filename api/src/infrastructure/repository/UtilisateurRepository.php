<?php

namespace amap\infrastructure\repository;

use Doctrine\ORM\EntityRepository;
use amap\infrastructure\entities\Utilisateur;

/**
 * @extends EntityRepository<object>
 */
class UtilisateurRepository extends EntityRepository implements UtilisateurRepositoryInterface
{
    public function getUtilisateurById(string $id): Utilisateur
    {
    }
    public function getUtilisateurByNom(string $nomUtilisateur): Utilisateur
    {
        return $this->findOneBy(['nomUtilisateur' => $nomUtilisateur]);
    }
}
