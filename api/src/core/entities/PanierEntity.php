<?php

namespace amap\core\entities;

use amap\core\dto\IngredientInputDTO;
use amap\core\dto\InputPanierDTO;

class PanierEntity
{
    public int $id;
    /**
     * @var array<IngredientEntity>
     */
    public array $ingredients;
    public UtilisateurEntity $producteur;

    public static function fromDTO(InputPanierDTO $panier): PanierEntity
    {
        $entity = new self();
        $entity->ingredients = IngredientEntity::fromDTOs($panier->ingredients);
        $entity->producteur = new UtilisateurEntity();
        $entity->producteur->id = $panier->id_producteur;
        return $entity;
    }
}
