<?php

namespace amap\core\entities;

use amap\core\dto\IngredientInputDTO;

class IngredientEntity
{
    public int $id;
    public string $nom;
    public int $debutSaison;
    public int $finSaison;
    public string $urlPhoto;
    public string $quantite;
    /*public Collection $allergenes;*/
    /*public Collection $recettes;*/
    /*public Collection $utilisateursExclus;*/

    public static function fromDTO(IngredientInputDTO $ingredient): IngredientEntity
    {
        $entity = new self();
        $entity->id = $ingredient->id;
        $entity->quantite = $ingredient->quantite;
        return $entity;
    }
    /**
     * @return IngredientEntity[]
     * @param array<IngredientInputDTO> $ingredients
     */
    public static function fromDTOs(array $ingredients): array
    {
        $entities = [];
        foreach ($ingredients as $ingredient) {
            $entities[] = self::fromDTO($ingredient);
        }
        return $entities;
    }
}
