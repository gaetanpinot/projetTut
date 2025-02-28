<?php

namespace amap\infrastructure\repository;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use amap\infrastructure\entities\Ingredient;
use amap\infrastructure\entities\IngredientRecette;
use amap\infrastructure\repository\exceptions\EntityNotFoundException;
use amap\infrastructure\repository\interfaces\RecetteRepositoryInterface;
use Doctrine\DBAL\ArrayParameterType;
use Doctrine\ORM\EntityRepository;
use amap\infrastructure\entities\Recette;

class RecetteRepository extends EntityRepository implements RecetteRepositoryInterface
{
    private int $nbPagination = 20;

    public function getRecettes($args): array
    {
        $qb = $this->createQueryBuilder('r');

        $qb->groupBy('r.id');

        if (isset($args['nom'])) {
            $qb->andWhere('upper(r.nom) LIKE upper(:nom)')
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

        // on veut avoir toutes les recettes qui contienne un ou plus ingredients principaux
        // et trié par le nombre d'ingredients principaux
        if (isset($args['id_ingredients_principaux'])) {
            $idIngredient = $args['id_ingredients_principaux'];
            $nbIngredient = count($idIngredient);
            $i = 0;
            $qb->andWhere("i.id_ingredient IN (:id_ingredient)")
                ->setParameter("id_ingredient", $idIngredient, ArrayParameterType::INTEGER);
                $qb->orderBy('SUM(CASE when i.id_ingredient IN(:id_ingredient)THEN 1 ELSE 0 END)', 'DESC');
        }


        //on exclus les ustensiles
        if(isset($args['id_ustensiles_exclus'])) {
            $qb->leftJoin('r.ustensiles', 'u')
            ->setParameter('id_ustensiles_exclus', $args['id_ustensiles_exclus'], ArrayParameterType::INTEGER);
            $having[] = "SUM(CASE WHEN u.id IN (:id_ustensiles_exclus) THEN 1 ELSE 0 END) = 0";
        }

        //on exclus les ingredients
        if(isset($args['id_ingredients_exclus'])) {
            $qb->setParameter('id_ingredients_exclus', $args['id_ingredients_exclus'], ArrayParameterType::INTEGER);
            $having[] = "SUM(CASE WHEN i.id_ingredient IN (:id_ingredients_exclus) THEN 1 ELSE 0 END) = 0";
        }

        if(isset($args['id_allergenes'])) {
            $qb->leftJoin('i.ingredient', 'ing')
            ->leftJoin('ing.allergenes', 'a')
            ->setParameter('id_allergene', $args['id_allergenes'], ArrayParameterType::INTEGER);
            // si il y a des allergenes dans la liste à exclure ça fait une somme plus grande que 0 et la recette est exclue
            $having[] = "SUM(CASE WHEN a.id IN (:id_allergene) THEN 1 ELSE 0 END) = 0";
        }

        //on concatene les clauses having
        if (count($having) > 0) {
            $having = join(' AND ', $having);
            $qb->having($having);
        }

        $qb->setFirstResult(($args['page'] - 1) * $this->nbPagination)
            ->setMaxResults($this->nbPagination)
        ->addOrderBy("r.id", "ASC");

        $ret = $qb->getQuery();
        /*echo $ret->getSQL();*/
        /*echo $qb->getParameter("id_tag1")->getValue();*/
        /*echo $qb->getDQL();*/
        return $ret->getResult();

    }

    public function getRecetteById($id): Recette
    {
        //return $this->findBy(["id" => $id]);
        /** @var Recette $recette */
        $recette= $this->find($id);
        if($recette === null) {
            throw new EntityNotFoundException("Recette $id n'existe pas");
        }
        return $recette;
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

    /**
    * @param Recette $r
    * @param IngredientRecette[] $ir
    */
    public function addIngredientRecette(Recette $r, array $ir): void
    {
        foreach($ir as $ingredientRecette) {
            $this->getEntityManager()->persist($ingredientRecette);
        }
        $r->setIngredientsRecette(new ArrayCollection($ir));
        $this->getEntityManager()->persist($r);
        $this->getEntityManager()->flush();
    }

    public function createRecette(Recette $r,array $ingredientsRecette): Recette
    {
        foreach($ingredientsRecette as $ir){
            $ingredientRecette = new IngredientRecette();
            $ingredientRecette->setRecette($r);
            $ingredientRecette->setIngredient($this->getEntityManager()
                ->getReference(Ingredient::class,$ir['id']));
            $ingredientRecette->setQuantite($ir['quantite']);
            $this->getEntityManager()->persist($ingredientRecette);
            $r->getIngredientsRecette()->add($ingredientRecette);
        }
        $this->getEntityManager()->persist($r);
        $this->getEntityManager()->flush();

        return $r;
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

    public function setPagination(int $nb): void
    {
        $this->nbPagination = $nb;
    }

    public function getRandomRecettes(int $count): array
    {

        $query=$this->getEntityManager()->createQuery('SELECT r, RAND() as hidden rand FROM  amap\infrastructure\entities\Recette r 
            ORDER BY rand ')
            ->setMaxResults($count);

        return $query->getResult();
    }

}
