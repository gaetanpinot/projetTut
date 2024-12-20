<?php

namespace amap\infrastructure\entities;

use amap\infrastructure\repository\IngredientRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity]
#[ORM\Table(name: "ingredient_recette")]
class IngredientRecette
{
    public function getIdRecette(): int
    {
        return $this->id_recette;
    }

    public function setIdRecette(int $id_recette): void
    {
        $this->id_recette = $id_recette;
    }

    public function getIdIngredient(): int
    {
        return $this->id_ingredient;
    }

    public function setIdIngredient(int $id_ingredient): void
    {
        $this->id_ingredient = $id_ingredient;
    }

    public function getRecette(): Recette
    {
        return $this->recette;
    }

    public function setRecette(Recette $recette): void
    {
        $this->recette = $recette;
    }

    public function getIngredient(): Ingredient
    {
        return $this->ingredient;
    }

    public function setIngredient(Ingredient $ingredient): void
    {
        $this->ingredient = $ingredient;
    }

    #[ORM\Id]
    #[ORM\Column(type: "integer", name: "id_recette")]
    private int $id_recette;

    #[ORM\Id]
    #[ORM\Column(type: "integer")]
    private int $id_ingredient;

    #[ORM\Column(type: "string")]
    private string $quantite;

    public function getQuantite(): string
    {
        return $this->quantite;
    }

    public function setQuantite(string $quantite): void
    {
        $this->quantite = $quantite;
    }

    #[ORM\ManyToOne(targetEntity: Recette::class, inversedBy: "ingredient_recette")]
    #[ORM\JoinColumn(name: "id_recette", referencedColumnName: "id")]
    private Recette $recette;

    #[ORM\ManyToOne(targetEntity: Ingredient::class, inversedBy: "ingredients")]
    #[ORM\JoinColumn(name: "id_ingredient", referencedColumnName: "id")]
    private Ingredient $ingredient;
}
