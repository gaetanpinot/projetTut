<?php

namespace amap\infrastructure\entities;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity]
#[ORM\Table(name: "allergene")]
class Allergene
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: "integer")]
    private int $id;

    #[ORM\Column(type: "string", unique: true, nullable: true)]
    private ?string $label;

    #[ORM\ManyToMany(targetEntity: Ingredient::class, inversedBy: "allergenes")]
    #[ORM\JoinTable(name: "allergene_ingredient")]
    #[ORM\JoinColumn(name: "id_allergene", referencedColumnName: "id")]
    private Collection $ingredients;

    #[ORM\ManyToMany(targetEntity: Utilisateur::class, mappedBy: "allergies")]
    private Collection $utilisateurs;

    public function __construct()
    {
        $this->ingredients = new ArrayCollection();
        $this->utilisateurs = new ArrayCollection();
    }

    // Getters and setters omitted for brevity
}
