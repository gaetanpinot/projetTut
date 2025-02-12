<?php

namespace amap\core\dto;

use amap\core\dto\DTO;
use amap\infrastructure\entities\Panier;

class PanierDTO extends DTO
{
    protected int $id;
    protected string $id_producteur;
    protected \DateTime $date_creation;
    /**
     * @var array<IngredientDTO>
     */
    protected array $ingredients;

    public static function fromEntity(Panier $pa): PanierDTO
    {
        $panier = new PanierDTO();
        $panier->id = $pa->getId();
        $panier->id_producteur = $pa->getIdProducteur();
        $panier->date_creation = $pa->getDate();
        $panier->ingredients = IngredientPanierDTO::fromArrayToDTO($pa->getIngredients());
        return $panier;
    }
}
