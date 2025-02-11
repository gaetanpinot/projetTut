<?php

namespace amap\core\service;

use amap\core\dto\IngredientDTO;
use amap\core\service\interfaces\ServiceIngredientInterface;
use amap\infrastructure\entities\Ingredient;
use amap\infrastructure\repository\interfaces\IngredientRepositoryInterface;

class ServiceIngredient implements ServiceIngredientInterface
{
    private IngredientRepositoryInterface $ingredientRepository;

    public function __construct(IngredientRepositoryInterface $ingredientRepository)
    {
        $this->ingredientRepository = $ingredientRepository;
    }

    public function getAllIngredients(): array
    {
        return IngredientDTO::fromArrayToDTO($this->ingredientRepository->findAll());
    }

    public function createIngredient(array $data): IngredientDTO
    {
        $ingredient = new Ingredient();
        $ingredient->setNom($data['nom']);
        $ingredient->setDebutSaison($data['debut_saison'] ?? null);
        $ingredient->setFinSaison($data['fin_saison'] ?? null);
        $ingredient->setUrlPhoto($data['url_photo'] ?? null);

        $this->ingredientRepository->save($ingredient);

        return IngredientDTO::fromIngredient($ingredient);
    }
}