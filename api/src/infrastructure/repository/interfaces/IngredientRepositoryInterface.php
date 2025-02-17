<?php

namespace amap\infrastructure\repository\interfaces;

use amap\infrastructure\entities\Ingredient;

interface IngredientRepositoryInterface
{
    public function getIngredientById(int $id): Ingredient;
}

