<?php

namespace amap\infrastructure\repository;

use Doctrine\ORM\EntityRepository;
use amap\infrastructure\entities\Recette;

class RecetteRepository extends EntityRepository implements RecetteRepositoryInterface
{

    public function getRecettes($args): array
    {
        $recettes = $this->findAll();

        if(isset($args["nom"])) {
            $nom = $args['nom'];
            $recettes = array_filter($recettes, function ($recette) use ($nom) {
                return stripos($recette->getNom(), $nom) !== false;
            });
        }

        if(isset($args["temps_preparation_gt"])) {
            $temps_preparation_gt = $args['temps_preparation_gt'];
            $recettes = array_filter($recettes, function ($recette) use ($temps_preparation_gt) {
                return $recette->getTempsPreparation() >= $temps_preparation_gt;
            });
        }

        if(isset($args["temps_preparation_lt"])) {
            $temps_preparation_lt = $args['temps_preparation_lt'];
            $recettes = array_filter($recettes, function ($recette) use ($temps_preparation_lt) {
                return $recette->getTempsPreparation() <= $temps_preparation_lt;
            });
        }

        if(isset($args["complexite_gt"])) {
            $complexite_gt = $args['complexite_gt'];
            $recettes = array_filter($recettes, function ($recette) use ($complexite_gt) {
                return $recette->getComplexite() >= $complexite_gt;
            });
        }

        if(isset($args["complexite_lt"])) {
            $complexite_lt = $args['complexite_lt'];
            $recettes = array_filter($recettes, function ($recette) use ($complexite_lt) {
                return $recette->getComplexite() <= $complexite_lt;
            });
        }

        if(isset($args["debut_saison"])) {
            $debut_saison = $args['debut_saison'];
            $recettes = array_filter($recettes, function ($recette) use ($debut_saison) {
                return $recette->getDebutSaison() === $debut_saison;
            });
        }

        if(isset($args["fin_saison"])) {
            $fin_saison = $args['debut_saison'];
            $recettes = array_filter($recettes, function ($recette) use ($fin_saison) {
                return $recette->getFinSaison() === $fin_saison;
            });
        }

        return $recettes;
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
