<?php

namespace amap\infrastructure\entities;

use amap\infrastructure\repository\UstensileRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity (repositoryClass: UstensileRepository::class)]
#[ORM\Table(name: "ustensile")]
class Ustensile
{
    public function getId(): int
    {
        return $this->id;
    }

    public function setId(int $id): void
    {
        $this->id = $id;
    }

    public function getNom(): ?string
    {
        return $this->nom;
    }

    public function setNom(?string $nom): void
    {
        $this->nom = $nom;
    }

    public function getRecettes(): Collection
    {
        return $this->recettes;
    }

    public function setRecettes(Collection $recettes): void
    {
        $this->recettes = $recettes;
    }

    public function getUtilisateursExclus(): Collection
    {
        return $this->utilisateursExclus;
    }

    public function setUtilisateursExclus(Collection $utilisateursExclus): void
    {
        $this->utilisateursExclus = $utilisateursExclus;
    }
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
