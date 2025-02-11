<?php

namespace amap\infrastructure\repository;

use Doctrine\ORM\EntityRepository;
use amap\infrastructure\entities\Panier;
use amap\infrastructure\repository\interfaces\PanierRepositoryInterface;

class PanierRepository extends EntityRepository implements PanierRepositoryInterface
{
    public function getPanierById(int $id): Panier
    {
    }
}
