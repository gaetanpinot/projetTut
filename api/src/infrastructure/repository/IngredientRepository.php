<?php

namespace amap\infrastructure\repository;

use amap\infrastructure\entities\Ingredient;
use amap\infrastructure\repository\interfaces\IngredientRepositoryInterface;
use Doctrine\ORM\EntityRepository;

class IngredientRepository extends EntityRepository implements IngredientRepositoryInterface
{
    public function save(Ingredient $ingredient): void
    {
        $this->getEntityManager()->persist($ingredient);
        $this->getEntityManager()->flush();
    }
}