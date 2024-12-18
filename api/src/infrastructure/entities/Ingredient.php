<?php

namespace amap\infrastructure\entities;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity]
#[ORM\Table(name: "ingredient")]
class Ingredient
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: "integer")]
    private int $id;

    #[ORM\Column(type: "string", unique: true, nullable: true)]
    private ?string $nom;

    #[ORM\Column(type: "integer", nullable: true)]
    private ?int $debutSaison;

    #[ORM\Column(type: "integer", nullable: true)]
    private ?int $finSaison;

    #[ORM\Column(type: "string", nullable: true)]
    private ?string $urlPhoto;

    #[ORM\ManyToMany(targetEntity: Allergene::class, inversedBy: "ingredients")]
    #[ORM\JoinTable(name: "allergene_ingredient")]
    private Collection $allergenes;

    #[ORM\ManyToMany(targetEntity: Recette::class, mappedBy: "ingredients")]
    private Collection $recettes;

    #[ORM\ManyToMany(targetEntity: Utilisateur::class, mappedBy: "ingredientsExclus")]
    private Collection $utilisateursExclus;

    public function __construct()
    {
        $this->allergenes = new ArrayCollection();
        $this->recettes = new ArrayCollection();
        $this->utilisateursExclus = new ArrayCollection();
    }

    // Getters and setters omitted for brevity
}
