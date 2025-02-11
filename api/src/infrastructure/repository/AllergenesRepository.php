<?php

namespace amap\infrastructure\repository;

use Doctrine\ORM\EntityRepository;
use amap\infrastructure\entities\Allergene;
use amap\infrastructure\repository\interfaces\AllergieRepositoryInterface;

/**
 * @extends EntityRepository<object>
 */
class AllergenesRepository extends EntityRepository implements AllergieRepositoryInterface
{
    public function getAllergieById(int $id): Allergene
    {
        $allergie =
         $this->find($id);
        if($allergie === null) {
            throw new EntityNotFoundException("Allergie $id doesn't exist");
        }
        return $allergie;
    }
}
