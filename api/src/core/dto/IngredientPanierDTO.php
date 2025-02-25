<?php

namespace amap\core\dto;

use amap\infrastructure\entities\IngredientPanier;

class IngredientPanierDTO extends DTO
{
    protected string $quantite;
    protected IngredientDTO $ingredient;
    public static function fromIngredient(IngredientPanier $ingredient): IngredientPanierDTO
    {
        $dto = new self();
        $dto->quantite = $ingredient->getQuantite();
        $dto->ingredient = IngredientDTO::fromIngredient($ingredient->getIngredient());
        return $dto;
    }

    /**
     * @param mixed $data
     */
    public static function fromArrayToDTO($data): array
    {
        $res = [];
        foreach ($data as $ingredient) {
            $res[] = self::fromIngredient($ingredient);
        }
        return $res;
    }
}
