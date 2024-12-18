<?php

namespace amap\infrastructure\entities;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity]
#[ORM\Table(name: "panier")]
class Panier
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: "integer")]
    private int $id;

    #[ORM\ManyToOne(targetEntity: Utilisateur::class)]
    #[ORM\JoinColumn(name: "id_producteur", referencedColumnName: "id")]
    private ?Utilisateur $producteur;

    #[ORM\Column(type: "date", nullable: true)]
    private ?\DateTimeInterface $date;

    #[ORM\ManyToMany(targetEntity: Utilisateur::class, mappedBy: "paniers")]
    private Collection $utilisateurs;

    #[ORM\ManyToMany(targetEntity: Ingredient::class)]
    #[ORM\JoinTable(name: "ingredient_panier")]
    private Collection $ingredients;

    public function __construct()
    {
        $this->utilisateurs = new ArrayCollection();
        $this->ingredients = new ArrayCollection();
    }

    // Getters and setters omitted for brevity
}
