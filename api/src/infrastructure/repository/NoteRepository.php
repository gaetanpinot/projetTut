<?php

namespace amap\infrastructure\repository;

use amap\infrastructure\entities\Note;
use amap\infrastructure\repository\interfaces\NoteRepositoryInterface;
use Doctrine\ORM\EntityRepository;

class NoteRepository extends EntityRepository implements NoteRepositoryInterface
{
    public function create($note, $idRecette, $idUtilisateur): Note{
        $noteObj = new Note();
        $noteObj->setNote($note);
        $noteObj->setIdRecette($idRecette);
        $noteObj->setIdUtilisateur($idUtilisateur);
        $this->getEntityManager()->persist($noteObj);
        $this->getEntityManager()->flush();
        return $noteObj;
    }
}