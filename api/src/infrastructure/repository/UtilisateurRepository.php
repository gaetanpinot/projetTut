<?php

namespace amap\infrastructure\repository;

use amap\infrastructure\entities\Utilisateur;
use amap\infrastructure\repository\exceptions\EntityConstraintViolation;
use amap\infrastructure\repository\exceptions\EntityNotFoundException;
use amap\infrastructure\repository\interfaces\UtilisateurRepositoryInterface;
use Doctrine\DBAL\Exception\UniqueConstraintViolationException;
use Doctrine\ORM\EntityRepository;

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

    public function createUtilisateur(Utilisateur $utilisateur): Utilisateur
    {
        $em = $this->getEntityManager();
        try {
            $em->persist($utilisateur);
            $em->flush();
        } catch (UniqueConstraintViolationException $e) {
            $name = $utilisateur->getNomUtilisateur();
            throw new EntityConstraintViolation("Utilisateur $name déjà existant");
        }
        return $utilisateur;
    }
}
