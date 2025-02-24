<?php

namespace amap\core\dto;

use amap\core\dto\DTO;

class InputPanierDTO extends DTO
{
    /**
     * @var array<IngredientInputDTO>
     */
    protected array $ingredients;
    protected string $id_producteur;

    /**
     * @param array<int,mixed> $ingredients
     */
    public function __construct(array $ingredients, string $id_producteur)
    {
        $this->ingredients = $ingredients;
        $this->id_producteur = $id_producteur;
    }
}
