<?php

namespace amap\infrastructure\repository;

use Doctrine\DBAL\Exception\UniqueConstraintViolationException;
use Doctrine\ORM\EntityManager;
use Doctrine\ORM\EntityRepository;
use amap\infrastructure\entities\Allergene;
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

    public function addAllergies(string $id_utilisateur, Allergene $allergie): void
    {
        $user = $this->getUtilisateurById($id_utilisateur);
        try {
            $user->addAllergie($allergie);
            $this->getEntityManager()->persist($user);
            $this->getEntityManager()->flush();
        } catch(UniqueConstraintViolationException $e) {

        }
    }

    public function deleteAllergies(string $id_utilisateur, Allergene $allergie): void
    {
        $user = $this->getUtilisateurById($id_utilisateur);
        try {
            $user->deleteAllergie($allergie);
            $this->getEntityManager()->persist($user);
            $this->getEntityManager()->flush();
        } catch(UniqueConstraintViolationException $e) {

        }
    }

    public function addUstensiles(string $id_utilisateur, int $id_ustensiles): void
    {
    }

    public function deleteUstensiles(string $id_utilisateur, int $id_ustensiles): void
    {
    }

    public function addIngredient(string $id_utilisateur, int $id_ingredients): void
    {
    }

    public function deleteIngredient(string $id_utilisateur, int $id_ingredients): void
    {
    }
}
