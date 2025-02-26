<?php

namespace amap\infrastructure\repository;

use amap\infrastructure\entities\Ingredient;
use amap\infrastructure\repository\exceptions\EntityNotFoundException;
use amap\infrastructure\repository\interfaces\IngredientRepositoryInterface;
use Doctrine\ORM\EntityRepository;

class IngredientRepository extends EntityRepository implements IngredientRepositoryInterface
{
    public function save(Ingredient $ingredient): void
    {
        $this->getEntityManager()->persist($ingredient);
        $this->getEntityManager()->flush();
    }


    public function getIngredientById(int $id): Ingredient
    {
        $ingredient = $this->find($id);
        if($ingredient === null) {
            throw new EntityNotFoundException("Ingredient $id doesn't exist");
        }
        return $ingredient;
    }

    /**
     * @param int[] $ids
     * @return Ingredient[]
     */
    public function getIngredientsById(array $ids): array
    {
        $ingredients = $this->findBy(['id' => $ids]);
        return $ingredients;
    }

    public function getRandomIngredients()
    {
        $query=$this->getEntityManager()->createQuery('SELECT r, RAND() as hidden rand FROM  amap\infrastructure\entities\Ingredient r 
            ORDER BY rand ')
            ->setMaxResults(4);

        return $query->getResult();
    }
}

