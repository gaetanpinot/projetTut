<?php

namespace amap\infrastructure\repository;

use Doctrine\ORM\EntityRepository;
use amap\core\dto\InputPanierDTO;
use amap\infrastructure\entities\DateIdType;
use amap\infrastructure\entities\Frigo;
use amap\infrastructure\entities\Ingredient;
use amap\infrastructure\entities\IngredientPanier;
use amap\infrastructure\entities\Utilisateur;
use amap\infrastructure\repository\exceptions\EntityNotFoundException ;
use amap\infrastructure\entities\Panier;
use amap\infrastructure\repository\interfaces\PanierRepositoryInterface;

/**
 * @extends EntityRepository<object>
 */
class PanierRepository extends EntityRepository implements PanierRepositoryInterface
{
    /**
 * @throws EntityNotFoundException
 */
    public function getPanierById(int $id): Panier
    {
        $panier = $this->find($id);
        if ($panier === null) {
            throw new EntityNotFoundException("Panier $id doesn't exist");
        }
        return $panier;
    }

    public function publierPanier(int $id_panier): void
    {
        //si la date est null le panier n'est pas publié
        $panier = $this->getPanierById($id_panier);
        if($panier->getDate() !== null) {
            /*return;*/
        }

        $date_panier = new DateIdType();
        /*$date_panier = $date_panier->getTimestamp();*/
        $panier->setDate($date_panier);

        //get utilisateur abonné a producteur
        $users = $panier->getProducteur()->getAbonnees();

        //ajouter panier à utilisateur
        $ingredientsFrigo = [];
        $timestamp_ajout = $date_panier->getTimestamp();
        foreach($panier->getIngredients() as $ingred) {
            $ingredFrigo = new Frigo();
            $ingredFrigo->setIngredient($ingred->getIngredient());
            $ingredFrigo->setQuantite($ingred->getQuantite());
            $ingredFrigo->setTimestampAjout($timestamp_ajout);
            $ingredientsFrigo[] = $ingredFrigo;
        }

        foreach($users as $user) {
            foreach($ingredientsFrigo as $ingredFrigo) {
                //clone pour persister des objet different pour chaque utilisateur
                $ingredFrigoUser = clone $ingredFrigo;
                $ingredFrigoUser->setUtilisateur($user);
                $user->addIngredientFrigo($ingredFrigoUser);
                $this->getEntityManager()->persist($ingredFrigoUser);
            }
        }

        $this->getEntityManager()->persist($panier);
        $this->getEntityManager()->flush();
    }

    public function createPanier(InputPanierDTO $panierInput): Panier
    {
        try {
            $panier = new Panier();
            /*$panier->setIdProducteur($panierInput->id_producteur);*/
            $panier->setProducteur($this->getEntityManager()->getRepository(Utilisateur::class)->find($panierInput->id_producteur));
            $this->getEntityManager()->persist($panier);
            $this->getEntityManager()->flush();
            /*echo $panier->getId();*/

            $repoIngredient = $this->getEntityManager()->getRepository(Ingredient::class);

            $ingredients = [];
            foreach($panierInput->ingredients as $ingredientInput) {
                $ingredient = new IngredientPanier();
                $ingredient->setIdIngredient($ingredientInput->id);
                $ingredient->setIngredient($repoIngredient->find($ingredientInput->id));
                $ingredient->setQuantite($ingredientInput->quantite);
                /*echo $panier->getId();*/
                $ingredient->setIdpanier($panier->getId());
                $ingredient->setPanier($panier);
                /*echo $ingredient->getIdpanier(). " ". $ingredient->getIdIngredient()."\n";*/
                $this->getEntityManager()->persist($ingredient);
            }
            $this->getEntityManager()->flush();
            $this->getEntityManager()->clear();
            return $this->getPanierById($panier->getId());
        } catch(\Exception $e) {
            /*echo $e->getTraceAsString();*/
            throw $e;
        }
    }
    /**
     * @param array<IngredientPanier> $ingredients
     */
    public function addIngredients(Panier $panier, array $ingredients): void
    {
        foreach ($ingredients as $ingredient) {
            $this->getEntityManager()->persist($ingredient);
        }
        $this->getEntityManager()->persist($panier);
        $this->getEntityManager()->flush();
    }

    /**
     * @return array<Panier> $ingredients
     */
    public function getPanierProducteur(string $id_producteur):array{
        return $this->findBy(['id_producteur' => $id_producteur],['id' => 'DESC']);
    }
}
