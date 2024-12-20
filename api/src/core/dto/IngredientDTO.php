<?php

namespace amap\core\dto;

use amap\infrastructure\entities\Ingredient;

class IngredientDTO extends DTO
{
    protected int $id;
    protected string $nom;
    protected int $debut_saison;
    protected int $fin_saison;
    protected ?string $url_photo;
    public static function fromIngredient(Ingredient $ingredient): IngredientDTO
    {
        $dto = new self();
        $dto->id = $ingredient->getId();
        $dto->nom = $ingredient->getNom();
        $dto->debut_saison = $ingredient->getDebutSaison();
        $dto->fin_saison = $ingredient->getFinSaison();
        $dto->url_photo = $ingredient->getUrlPhoto();
        return $dto;
    }

    public static function fromArrayToDTO($data): array
    {
        $res = [];
        foreach ($data as $ingredient) {
            $res[] = self::fromIngredient($ingredient);
        }
        return $res;
    }
}

