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
        return $this->findOneBy(['id' => $id]);
    }
    public function getUtilisateurByNom(string $nomUtilisateur): Utilisateur
    {

        $retour =  $this->findOneBy(['nomUtilisateur' => $nomUtilisateur]);
        if ($retour == null) {
            throw new EntityNotFoundException("Utilisateur non trouvé");
        }
        return $retour;
    }
}
