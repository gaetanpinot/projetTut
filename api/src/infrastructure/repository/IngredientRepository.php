<?php

namespace amap\infrastructure\repository;

use amap\infrastructure\entities\Ingredient;
use Doctrine\ORM\EntityManager;
use Doctrine\ORM\EntityRepository;
use Doctrine\ORM\Mapping\ClassMetadata;
use Psr\Container\ContainerInterface;

class IngredientRepository extends EntityRepository implements IngredientRepositoryInterface
{
    public function save(Ingredient $ingredient): void
    {
        $this->getEntityManager()->persist($ingredient);
        $this->getEntityManager()->flush();
    }
}