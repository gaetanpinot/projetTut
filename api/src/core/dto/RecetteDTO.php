<?php

namespace amap\core\dto;

use amap\core\dto\DTO;
use amap\infrastructure\entities\Recette;

class RecetteDTO extends DTO
{
    protected int $id;
    protected ?string $nom;
    protected ?int $tempsPreparation;
    protected ?int $complexite;
    protected ?string $idCreateur;
    protected ?string $description;
    protected ?int $debutSaison;
    protected ?int $finSaison;
    protected ?int $idRecetteParente;
    protected ?string $urlPhoto;
    protected ?array $tags;
    protected ?array $ingredients;

    public static function fromRecette(Recette $recette): RecetteDTO
    {
        $recetteDTO = new RecetteDTO();
        $recetteDTO->id = $recette->getId();
        $recetteDTO->nom = $recette->getNom();
        $recetteDTO->tempsPreparation = $recette->getTempsPreparation();
        $recetteDTO->complexite = $recette->getComplexite();
        $recetteDTO->idCreateur = $recette->getCreateur()->getId();
        $recetteDTO->description = $recette->getDescription();
        $recetteDTO->debutSaison = $recette->getDebutSaison();
        $recetteDTO->finSaison = $recette->getFinSaison();
        $recetteDTO->tags = TagDTO::fromArrayToDTO($recette->getTags());
        /*$recetteDTO->ingredients = IngredientDTO::fromArrayToDTO($recette->getIngredients());*/
        $recetteDTO->ingredients = IngredientRecetteDTO::fromArrayToDTO($recette->getIngredientsRecette());

        //$recetteDTO->idRecetteParente = $recette->getRecetteParente()->getId();
        $recetteDTO->urlPhoto = $recette->getUrlPhoto();

        return $recetteDTO;
    }
}

