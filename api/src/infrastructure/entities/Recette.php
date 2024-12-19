<?php

namespace amap\infrastructure\entities;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use amap\infrastructure\repository\RecetteRepository;

#[ORM\Entity(repositoryClass: RecetteRepository::class)]
#[ORM\Table(name: "recette")]
class Recette
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: "integer")]
    private int $id;
    public function getId(): int
    {
        return $this->id;
    }
    #[ORM\Column(type: "string", nullable: true)]
    private ?string $nom;
    public function getNom(): ?string
    {
        return $this->nom;
    }
    #[ORM\Column(type: "integer", nullable: true, name: 'temps_preparation')]
    private ?int $tempsPreparation;

    public function getTempsPreparation(): ?int
    {
        return $this->tempsPreparation;
    }

    #[ORM\Column(type: "integer", nullable: true)]
    private ?int $complexite;

    #[ORM\ManyToOne(targetEntity: Utilisateur::class, inversedBy: "recettes")]
    #[ORM\JoinColumn(name: "id_createur", referencedColumnName: "id")]
    private ?Utilisateur $createur;
    public function getCreateur(): ?Utilisateur
    {
        return $this->createur;
    }

    #[ORM\Column(type: "text", nullable: true)]
    private ?string $description;

    #[ORM\Column(type: "integer", nullable: true, name: 'debut_saison')]
    private ?int $debutSaison;

    #[ORM\Column(type: "integer", nullable: true, name: 'fin_saison')]
    private ?int $finSaison;

    #[ORM\ManyToOne(targetEntity: Recette::class)]
    #[ORM\JoinColumn(name: "id_recette_parente", referencedColumnName: "id", nullable: true)]
    private ?Recette $recetteParente;
    public function getRecetteParente(): ?Recette
    {
        return $this->recetteParente;
    }

    #[ORM\Column(type: "string", nullable: true, name: 'url_photo')]
    private ?string $urlPhoto;

    #[ORM\ManyToMany(targetEntity: Tag::class, inversedBy: "recettes")]
    #[ORM\JoinTable(name: "tag_recette")]
    private Collection $tags;

    #[ORM\ManyToMany(targetEntity: Ingredient::class, inversedBy: "recettes")]
    #[ORM\JoinTable(name: "ingredient_recette")]
    private Collection $ingredients;

    #[ORM\ManyToMany(targetEntity: Ustensile::class, inversedBy: "recettes")]
    #[ORM\JoinTable(name: "ustensile_recette")]
    private Collection $ustensiles;

    public function __construct()
    {
        $this->tags = new ArrayCollection();
        $this->ingredients = new ArrayCollection();
        $this->ustensiles = new ArrayCollection();
    }

    public function getComplexite()
    {
        return $this->complexite;
    }

    public function getDescription()
    {
        return $this->description;
    }

    public function getDebutSaison()
    {
        return $this->debutSaison;
    }

    public function getFinSaison()
    {
        return $this->finSaison;
    }

    public function getUrlPhoto()
    {
        return $this->urlPhoto;
    }

}
