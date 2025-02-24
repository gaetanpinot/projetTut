<?php

namespace amap\infrastructure\entities;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

use amap\infrastructure\repository\PanierRepository;

#[ORM\Entity(repositoryClass: PanierRepository::class)]
#[ORM\Table(name: "panier")]
class Panier
{
    public function getId(): int
    {
        return $this->id;
    }

    public function setId(int $id): void
    {
        $this->id = $id;
    }

    public function getProducteur(): ?Utilisateur
    {
        return $this->producteur;
    }

    public function setProducteur(?Utilisateur $producteur): void
    {
        $this->producteur = $producteur;
    }

    public function getDate(): ?\DateTimeInterface
    {
        return $this->date;
    }

    public function setDate(?\DateTimeInterface $date): void
    {
        $this->date = $date;
    }

    public function getUtilisateurs(): Collection
    {
        return $this->utilisateurs;
    }

    public function setUtilisateurs(Collection $utilisateurs): void
    {
        $this->utilisateurs = $utilisateurs;
    }

    public function getIngredients(): Collection
    {
        return $this->ingredients_panier;
    }

    public function setIngredients(Collection $ingredients): void
    {
        $this->ingredients_panier = $ingredients;
    }

    public function getIdProducteur(): ?string
    {
        return $this->id_producteur;
    }
    public function setIdProducteur(string $id): void
    {
        $this->id_producteur = $id;
    }

    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: "integer")]
    private int $id;

    #[ORM\Column(type: "guid", name: "id_producteur")]
    private ?string $id_producteur;

    #[ORM\ManyToOne(targetEntity: Utilisateur::class)]
    #[ORM\JoinColumn(name: "id_producteur", referencedColumnName: "id")]
    private ?Utilisateur $producteur;

    #[ORM\Column(type: "datetime", nullable: true)]
    private ?\DateTimeInterface $date = null;

    #[ORM\ManyToMany(targetEntity: Utilisateur::class, mappedBy: "panier")]
    private Collection $utilisateurs;

    #[ORM\OneToMany(targetEntity: IngredientPanier::class, mappedBy: "panier")]
    private Collection $ingredients_panier;

    public function __construct()
    {
        $this->utilisateurs = new ArrayCollection();
        $this->ingredients_panier = new ArrayCollection();
    }

    public function addIngredient(IngredientPanier $ingredient): void
    {
        $this->ingredients_panier->add($ingredient);
    }
}
