<?php

namespace amap\core\service;

use amap\core\dto\IngredientDTO;

interface ServiceIngredientInterface
{
    public function getAllIngredients(): array;
    public function createIngredient(array $data): IngredientDTO;
}