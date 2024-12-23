<?php

namespace amap\infrastructure\repository;

use Doctrine\DBAL\ArrayParameterType;
use amap\core\dto\RecetteDTO;
use Doctrine\ORM\EntityRepository;
use Doctrine\ORM\QueryBuilder;
use amap\infrastructure\entities\Recette;

class RecetteRepository extends EntityRepository implements RecetteRepositoryInterface
{
    public function getRecettes($args): array
    {
        $qb = $this->createQueryBuilder('r');

        $qb->groupBy('r.id');

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
            $qb->andWhere('r.debutSaison >= :debut_saison')
                ->setParameter('debut_saison', $args['debut_saison']);
        }

        if (isset($args['fin_saison'])) {
            $qb->andWhere('r.finSaison <= :fin_saison')
                ->setParameter('fin_saison', $args['fin_saison']);
        }
        

        //on ne peut avoir qu'un seul ->having sur la requê
        //on ajoute les having à une array et on join plus tard avec AND comme séparateur
        $having = [];

        if (isset($args['id_tag'])) {
            $nbTag = count($args['id_tag']);
            $qb->leftJoin('r.tags', 't');
            $i = 0;
            $qb->andWhere("t.id IN (:id_tags)")
                ->setParameter("id_tags", $args['id_tag'], ArrayParameterType::INTEGER)
                /*->having('COUNT(DISTINCT t.id) = :nbTag')*/
                ->setParameter('nbTag', $nbTag);
            $having[] = "COUNT(DISTINCT t.id) = :nbTag";
        }

        // on join les ingredients car on peut les utiliser dans les deux cas et on ne peut le faire qu'une fois
        $qb->leftJoin('r.ingredients_recette', 'i');

        if (isset($args['id_ingredients_principaux'])) {
            $idIngredient = $args['id_ingredients_principaux'];
            $nbIngredient = count($idIngredient);
            $i = 0;
            $qb->andWhere("i.id_ingredient IN (:id_ingredient)")
                ->setParameter("id_ingredient", $idIngredient, ArrayParameterType::INTEGER)
                /*->having('COUNT(DISTINCT i.id_ingredient) = :nbIngredient')*/
                ->setParameter('nbIngredient', $nbIngredient);
            $having[] = " COUNT(DISTINCT i.id_ingredient) = :nbIngredient";
        }

        if( isset($args['id_allergenes']) ){
            $qb->leftJoin('i.ingredient', 'ing')
            ->leftJoin('ing.allergenes', 'a')
            ->setParameter('id_allergene', $args['id_allergenes'], ArrayParameterType::INTEGER );
            // si il y a des allergenes dans la liste à exclure ça fait une somme plus grande que 0 et la recette est exclue
            $having[] = "SUM(CASE WHEN a.id IN (:id_allergene) THEN 1 ELSE 0 END) = 0";
        }

        //on concatene les clauses having
        if (count($having) > 0) {
            $having = join(' AND ', $having);
            $qb->having($having);
        }

        $ret = $qb->getQuery();
        /*echo $ret->getSQL();*/
        /*echo $qb->getParameter("id_tag1")->getValue();*/
        /*echo $qb->getDQL();*/
        return $ret->getResult();

    }

    public function getRecetteById($id): Recette
    {
        return $this->findBy(["id" => $id]);
    }

    public function deleteRecette(int $id): void
    {
        $recette = $this->find($id);

        if (!$recette) {
            throw new \Exception("Recette with ID $id not found.");
        }

        $this->getEntityManager()->remove($recette);
        $this->getEntityManager()->flush();
    }

    public function createRecette(Recette $r): Recette
    {
        $data = $r;
        $recette = new Recette();

        if (isset($data['nom'])) {
            $recette->setNom($data['nom']);
        }
        if (isset($data['tempsPreparation'])) {
            $recette->setTempsPreparation($data['tempsPreparation']);
        }
        if (isset($data['complexite'])) {
            $recette->setComplexite($data['complexite']);
        }
        if (isset($data['description'])) {
            $recette->setDescription($data['description']);
        }
        if (isset($data['debutSaison'])) {
            $recette->setDebutSaison($data['debutSaison']);
        }
        if (isset($data['finSaison'])) {
            $recette->setFinSaison($data['finSaison']);
        }
        if (isset($data['urlPhoto'])) {
            $recette->setUrlPhoto($data['urlPhoto']);
        }
        if (isset($data['createur'])) {
            $recette->setCreateur($data['createur']);
        }

        $this->getEntityManager()->persist($recette);
        $this->getEntityManager()->flush();

        return $recette;
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
