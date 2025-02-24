<?php

namespace amap\infrastructure\repository;


use amap\infrastructure\repository\interfaces\UstensileRepositoryInterface;
use amap\infrastructure\repository\interfaces\UtilisateurRepositoryInterface;
use Doctrine\ORM\EntityRepository;

/**
 * @extends EntityRepository<object>
 */
class UstensileRepository extends EntityRepository implements UstensileRepositoryInterface
{
    public function getUstensilesByIds($usts_id):array{
        $res = [];
        foreach ($usts_id as $id){
            $res[] = $this->find($id);
        }
        return $res;
    }

}