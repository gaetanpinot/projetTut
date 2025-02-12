<?php

namespace amap\core\service;

use amap\core\dto\InputPanierDTO;
use amap\core\dto\PanierDTO;
use amap\core\entities\PanierEntity;
use amap\core\service\interfaces\ServicePanierInterface;
use amap\infrastructure\entities\IngredientPanier;
use amap\infrastructure\entities\Ingredient;
use amap\infrastructure\entities\Panier;
use amap\infrastructure\entities\Utilisateur;
use amap\infrastructure\repository\UtilisateurRepository;
use amap\infrastructure\repository\interfaces\IngredientRepositoryInterface;
use amap\infrastructure\repository\interfaces\PanierRepositoryInterface;
use amap\infrastructure\repository\interfaces\UtilisateurRepositoryInterface;

class ServicePanier implements ServicePanierInterface
{
    public function __construct(
        protected PanierRepositoryInterface $panierRepository,
        protected UtilisateurRepositoryInterface $utilisateurRepository,
        protected IngredientRepositoryInterface $ingredientRepository
    ) {
    }
    public function getPanierById(int $id): PanierDTO
    {
        $panier = $this->panierRepository->getPanierById($id);
        return PanierDTO::fromEntity($panier);
    }

    public function createPanier(InputPanierDTO $panierInput): PanierDTO
    {
        $panierInseree = $this->panierRepository->createPanier($panierInput);
        return PanierDTO::fromEntity($panierInseree);
    }
}
