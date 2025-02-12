<?php

namespace amap\core\dto;

use amap\core\dto\DTO;

class IngredientInputDTO extends DTO
{
    protected int $id;
    protected string $quantite;

    public function __construct(int $id, string $quantite)
    {
        $this->id = $id;
        $this->quantite = $quantite;
    }
}
