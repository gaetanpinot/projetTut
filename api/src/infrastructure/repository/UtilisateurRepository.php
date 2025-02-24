<?php

namespace amap\infrastructure\repository;


use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\DBAL\Exception\UniqueConstraintViolationException;
use Doctrine\ORM\EntityRepository;
use amap\core\entities\FrigoEntity;
use amap\infrastructure\entities\Allergene;
use amap\infrastructure\entities\DateIdType;
use amap\infrastructure\entities\Frigo;
use amap\infrastructure\entities\Ingredient;
use amap\infrastructure\entities\Utilisateur;
use amap\infrastructure\repository\exceptions\EntityConstraintViolation;
use amap\infrastructure\repository\exceptions\EntityNotFoundException;
use amap\infrastructure\repository\interfaces\UtilisateurRepositoryInterface;

/**
 * @extends EntityRepository<object>
 */
class UtilisateurRepository extends EntityRepository implements UtilisateurRepositoryInterface
{
    public function getProducteurs(): array
    {
        $producteurs = $this->findBy(['role' => 1]);
        return $producteurs;
    }

    public function getUtilisateurById(string $id): Utilisateur
    {
         $utilisateur = $this->findOneBy(['id' => $id]);
        if($utilisateur === null){
            throw new EntityNotFoundException("Utilisateur $id non trouvé");
        }
        return $utilisateur;
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

    /**
     * @param FrigoEntity[] $frigo
     */
    public function remplaceFrigo(string $id_utilisateur, array $frigo): void
    {
        $user = $this->getUtilisateurById($id_utilisateur);
        $ingredRepo = $this->getEntityManager()->getRepository(Ingredient::class);
        /*$frigoRepo = $this->getEntityManager()->getRepository(Frigo::class);*/
        $frigos =new ArrayCollection();
        $frigoUser = $user->getFrigo();
        foreach($frigoUser as $f) {
            $this->getEntityManager()->remove($f);
        }
        $this->getEntityManager()->flush();
        foreach($frigo as $f) {
            $ingred = $ingredRepo->find($f->id_ingredient);
            $ingredientFrigo = new Frigo();
            $ingredientFrigo->setIngredient($ingred);
            $ingredientFrigo->setQuantite($f->quantite);
            $ingredientFrigo->setTimestampAjout($f->timestamp_ajout);
            $ingredientFrigo->setUtilisateur($user);
            $frigos->add($ingredientFrigo);
            $this->getEntityManager()->persist($ingredientFrigo);
        }
        $user->setFrigo($frigos);
        $this->getEntityManager()->persist($user);
        $this->getEntityManager()->flush();
    }

    public function getPanierProducteur(string $id_producteur): array
    {
        $producteur = $this->getProducteur($id_producteur);
        $paniers = $producteur->getPaniersProducteur();
        return $paniers->toArray(); 
    }

    public function getProducteur(string $id_producteur): Utilisateur{
        $producteur = $this->find($id_producteur);
        if($producteur ===null || $producteur->getRole() !==1 ){
            throw new EntityNotFoundException("Producteur $id_producteur non trouvé");
        }
        return $producteur;
    }

    public function setUstensiles($user_id, $ustensiles): void
    {
        $user = $this->find($user_id);
        if (!$user) {
            throw new \Exception("User $user_id not found");
        }

        $user->getUstensilesExclus()->clear();

        foreach ($ustensiles as $ustensile) {
            $user->getUstensilesExclus()->add($ustensile);
        }

        $this->getEntityManager()->flush();
    }

    public function getIngredientProducteur(string $id_producteur): array
    {
        $producteur = $this->getProducteur($id_producteur);
        $ingredients = $producteur->getIngredientsProduits();
        return $ingredients->toArray();
    }

    public function addProducteurToUtilisateur(string $id_utilisateur, string $id_producteur): void
    {
        $producteur = $this->getProducteur($id_producteur);
        $user = $this->getUtilisateurById($id_utilisateur);
        try{
        $user->addProducteur($producteur);
        $this->getEntityManager()->persist($user);
        $this->getEntityManager()->flush();
        }catch(UniqueConstraintViolationException $e) {
            //l'utilisateur est déjà abonné pas besoin de lui retournée une erreur
        }
    }

    public function deleteProducteurToUtilisateur(string $id_utilisateur, string $id_producteur): void
    {
        $producteur = $this->getProducteur($id_producteur);
        $user = $this->getUtilisateurById($id_utilisateur);
        $user->deleteProducteur($producteur);
        $this->getEntityManager()->persist($user);
        $this->getEntityManager()->flush();
    }
}
