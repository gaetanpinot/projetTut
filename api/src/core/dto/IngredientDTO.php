<?php

namespace amap\core\dto;

use amap\infrastructure\entities\Ingredient;

class IngredientDTO extends DTO
{
    protected int $id;
    protected string $nom;
    protected int $debutSaison;
    protected int $finSaison;
    protected ?string $urlPhoto;
    public static function fromIngredient(Ingredient $ingredient): IngredientDTO
    {
        $dto = new self();
        $dto->id = $ingredient->getId();
        $dto->nom = $ingredient->getNom();
        $dto->debutSaison = $ingredient->getDebutSaison();
        $dto->finSaison = $ingredient->getFinSaison();
        $dto->urlPhoto = $ingredient->getUrlPhoto();
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

