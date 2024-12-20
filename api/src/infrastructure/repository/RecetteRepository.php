<?php

namespace amap\infrastructure\repository;

use Doctrine\DBAL\ArrayParameterType;
use Doctrine\ORM\EntityRepository;
use Doctrine\ORM\QueryBuilder;
use amap\infrastructure\entities\Recette;

class RecetteRepository extends EntityRepository implements RecetteRepositoryInterface
{
    public function getRecettes($args): array
    {
        $qb = $this->createQueryBuilder('r');

        if (isset($args['nom'])) {
            $qb->andWhere('r.nom LIKE :nom')
                ->setParameter('nom', '%' . $args['nom'] . '%');
        }

        if (isset($args['temps_preparation_gt'])) {
            $qb->andWhere('r.tempsPreparation >= :temps_preparation_gt')
                ->setParameter('temps_preparation_gt', $args['temps_preparation_gt']);
        }

        if (isset($args['temps_preparation_lt'])) {
            $qb->andWhere('r.tempsPreparation <= :temps_preparation_lt')
                ->setParameter('temps_preparation_lt', $args['temps_preparation_lt']);
        }

        if (isset($args['complexite_gt'])) {
            $qb->andWhere('r.complexite >= :complexite_gt')
                ->setParameter('complexite_gt', $args['complexite_gt']);
        }

        if (isset($args['complexite_lt'])) {
            $qb->andWhere('r.complexite <= :complexite_lt')
                ->setParameter('complexite_lt', $args['complexite_lt']);
        }

        if (isset($args['debut_saison'])) {
            $qb->andWhere('r.debutSaison = :debut_saison')
                ->setParameter('debut_saison', $args['debut_saison']);
        }

        if (isset($args['fin_saison'])) {
            $qb->andWhere('r.finSaison = :fin_saison')
                ->setParameter('fin_saison', $args['fin_saison']);
        }

        if (isset($args['id_tag'])) {
            $qb->join('r.tags', 't');
            $i = 0;
            $qb->andWhere("t.id IN (:id_tags)")
            ->setParameter("id_tags", $args['id_tag'], ArrayParameterType::INTEGER);
            /*foreach ($args['id_tag'] as $tag) {*/
            /*    $qb->andWhere("t.id IN (:id_tag$i)")*/
            /*    ->setParameter("id_tag$i", $tag);*/
            /*    $i++;*/
            /*}*/
        }

        $ret = $qb->getQuery();
        /*echo $qb->getParameter("id_tag1")->getValue();*/
        /*echo $qb->getDQL();*/
        return $ret->getResult();
    }

    public function getRecetteById($id): Recette
    {
        return $this->findBy(["id" => $id]);
    }

    public function deleteRecette(): void
    {

    }

    public function createRecette(): void
    {

    }

    public function getRecetteCommentaires(): array
    {
        return [];
    }

    public function addRecetteCommentaires(): array
    {
        return [];
    }

    public function setRecetteNote(): array
    {
        return [];
    }
}
