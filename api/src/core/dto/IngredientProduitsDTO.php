<?php

namespace amap\core\dto;

use amap\core\dto\DTO;

class IngredientProduitsDTO extends DTO{
    protected string $id;
    protected string $nom;
    /**
     * @var IngredientDTO[]
     */
    protected array $ingredients;
    /**
     * @param array<IngredientDTO> $ingredients
     */
    public function __construct(string $id, string $nom, array $ingredients)
    {
        $this->id = $id;
        $this->nom = $nom;
        $this->ingredients = $ingredients;
    }
}
