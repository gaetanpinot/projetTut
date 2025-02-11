<?php

namespace amap\core\dto;

use amap\core\dto\DTO;
use amap\infrastructure\entities\Recette;
use amap\core\dto\TagDTO;

class RecetteDTO extends DTO
{
    protected int $id;
    protected ?string $nom;
    protected ?int $temps_preparation;
    protected ?int $complexite;
    protected ?string $id_createur;
    protected ?string $description;
    protected ?int $debut_saison;
    protected ?int $fin_saison;
    protected ?int $id_recette_parente;
    protected ?string $url_photo;
    protected ?array $tags;
    protected ?array $ingredients;
    protected ?array $ustensiles;

    public static function fromRecette(Recette $recette): self
    {
        $recetteDTO = new self();
        $recetteDTO->id = $recette->getId();
        $recetteDTO->nom = $recette->getNom();
        $recetteDTO->temps_preparation = $recette->getTempsPreparation();
        $recetteDTO->complexite = $recette->getComplexite();
        $recetteDTO->id_createur = $recette->getCreateur();
        $recetteDTO->description = $recette->getDescription();
        $recetteDTO->debut_saison = $recette->getDebutSaison();
        $recetteDTO->fin_saison = $recette->getFinSaison();
        $recetteDTO->tags = TagDTO::fromArrayToDTO($recette->getTags());
        $recetteDTO->ingredients = IngredientRecetteDTO::fromArrayToDTO($recette->getIngredientsRecette());
        $recetteDTO->ustensiles = UstensileDTO::fromArrayToDTO($recette->getUstensiles());

        //$recetteDTO->idRecetteParente = $recette->getRecetteParente()->getId();
        $recetteDTO->url_photo = $recette->getUrlPhoto();

        return $recetteDTO;
    }
}

