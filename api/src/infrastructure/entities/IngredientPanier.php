<?php

namespace amap\infrastructure\entities;

use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity]
#[ORM\Table(name: "ingredient_panier")]
class IngredientPanier
{
    public function getIdpanier(): int
    {
        return $this->id_panier;
    }

    public function setIdpanier(int $id_panier): void
    {
        $this->id_panier = $id_panier;
    }

    public function getIdIngredient(): int
    {
        return $this->id_ingredient;
    }

    public function setIdIngredient(int $id_ingredient): void
    {
        $this->id_ingredient = $id_ingredient;
    }

    public function getpanier(): Panier
    {
        return $this->panier;
    }

    public function setPanier(Panier $panier): void
    {
        $this->panier = $panier;
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
    #[ORM\Column(type: "integer", name: "id_panier")]
    private ?int $id_panier;

    #[ORM\Id]
    #[ORM\Column(type: "integer", nullable: true)]
    private ?int $id_ingredient;

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

    #[ORM\ManyToOne(targetEntity: Panier::class, inversedBy: "ingredient_panier")]
    #[ORM\JoinColumn(name: "id_panier", referencedColumnName: "id")]
    private ?Panier $panier;

    #[ORM\ManyToOne(targetEntity: Ingredient::class, inversedBy: "ingredients")]
    #[ORM\JoinColumn(name: "id_ingredient", referencedColumnName: "id", nullable:true)]
    private ?Ingredient $ingredient = null;

}
