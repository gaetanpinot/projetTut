<?php

namespace amap\infrastructure\repository;

use Doctrine\ORM\EntityRepository;
use amap\core\dto\InputPanierDTO;
use amap\core\entities\PanierEntity;
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
    public function getPanierById(int $id): Panier
    {
        $panier = $this->find($id);
        if ($panier === null) {
            throw new EntityNotFoundException("Panier $id doesn't exist");
        }
        return $panier;
    }

    public function createPanier(InputPanierDTO $panierInput): Panier
    {
        try {
            $panier = new Panier();
            $panier->setIdProducteur($panierInput->id_producteur);
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
}
