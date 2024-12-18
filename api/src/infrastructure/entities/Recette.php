<?php

namespace amap\infrastructure\entities;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping\Column;
use Doctrine\ORM\Mapping\Entity;
use Doctrine\ORM\Mapping\JoinTable;
use Doctrine\ORM\Mapping\ManyToMany;
use Doctrine\ORM\Mapping\JoinColumn;
use Doctrine\ORM\Mapping\ManyToOne;
use Doctrine\ORM\Mapping\GeneratedValue;
use Doctrine\ORM\Mapping\Id;
use Doctrine\ORM\Mapping\Table;
use amap\infrastructure\entities\Ingredient;
use amap\infrastructure\entities\Ustensile;
use amap\infrastructure\entities\Tag;
use amap\infrastructure\entities\Utilisateur;

#[Entity]
#[Table(name: "recette")]
class Recette
{
    #[Id]
    #[GeneratedValue]
    #[Column(type: "integer")]
    private int $id;
    public function getId(): int
    {
        return $this->id;
    }
    #[Column(type: "string", nullable: true)]
    private ?string $nom;
    public function getNom(): ?string
    {
        return $this->nom;
    }
    #[Column(type: "integer", nullable: true, name: 'temps_preparation')]
    private ?int $tempsPreparation;

    public function getTempsPreparation(): ?int
    {
        return $this->tempsPreparation;
    }

    #[Column(type: "integer", nullable: true)]
    private ?int $complexite;

    #[ManyToOne(targetEntity: Utilisateur::class, inversedBy: "recettes")]
    #[JoinColumn(name: "id_createur", referencedColumnName: "id")]
    private ?Utilisateur $createur;
    public function getCreateur(): ?Utilisateur
    {
        return $this->createur;
    }

    #[Column(type: "text", nullable: true)]
    private ?string $description;

    #[Column(type: "integer", nullable: true, name: 'debut_saison')]
    private ?int $debutSaison;

    #[Column(type: "integer", nullable: true, name: 'fin_saison')]
    private ?int $finSaison;

    #[ManyToOne(targetEntity: Recette::class)]
    #[JoinColumn(name: "id_recette_parente", referencedColumnName: "id", nullable: true)]
    private ?Recette $recetteParente;
    public function getRecetteParente(): ?Recette
    {
        return $this->recetteParente;
    }

    #[Column(type: "string", nullable: true, name: 'url_photo')]
    private ?string $urlPhoto;

    #[ManyToMany(targetEntity: Tag::class, inversedBy: "recettes")]
    #[JoinTable(name: "tag_recette")]
    private Collection $tags;

    #[ManyToMany(targetEntity: Ingredient::class, inversedBy: "recettes")]
    #[JoinTable(name: "ingredient_recette")]
    private Collection $ingredients;

    #[ManyToMany(targetEntity: Ustensile::class, inversedBy: "recettes")]
    #[JoinTable(name: "ustensile_recette")]
    private Collection $ustensiles;

    public function __construct()
    {
        $this->tags = new ArrayCollection();
        $this->ingredients = new ArrayCollection();
        $this->ustensiles = new ArrayCollection();
    }

    // Getters and setters omitted for brevity
}
