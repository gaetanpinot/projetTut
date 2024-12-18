<?php

namespace amap\infrastructure\entities;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity]
#[ORM\Table(name: "ustensile")]
class Ustensile
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: "integer")]
    private int $id;

    #[ORM\Column(type: "string", unique: true, nullable: true)]
    private ?string $nom;

    #[ORM\ManyToMany(targetEntity: Recette::class, mappedBy: "ustensiles")]
    private Collection $recettes;

    #[ORM\ManyToMany(targetEntity: Utilisateur::class, mappedBy: "ustensilesExclus")]
    private Collection $utilisateursExclus;

    public function __construct()
    {
        $this->recettes = new ArrayCollection();
        $this->utilisateursExclus = new ArrayCollection();
    }

    // Getters and setters omitted for brevity
}
