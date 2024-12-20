<?php

namespace amap\core\dto;

use amap\infrastructure\entities\Ingredient;
use amap\infrastructure\entities\IngredientRecette;

class IngredientRecetteDTO extends DTO
{
    protected string $quantite;
    protected IngredientDTO $ingredient;
    public static function fromIngredient(IngredientRecette $ingredient): IngredientRecetteDTO
    {
        $dto = new self();
        $dto->quantite = $ingredient->getQuantite();
        $dto->ingredient = IngredientDTO::fromIngredient($ingredient->getIngredient());
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
