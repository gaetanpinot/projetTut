<?php

namespace amap\infrastructure\entities;

use amap\infrastructure\repository\IngredientRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: IngredientRepository::class)]
#[ORM\Table(name: "ingredient")]
class Ingredient
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: "integer")]
    private int $id;

    #[ORM\Column(type: "string", unique: true, nullable: true)]
    private ?string $nom;

    #[ORM\Column(name: "debut_saison", type: "integer", nullable: true)]
    private ?int $debutSaison;

    #[ORM\Column(name: "fin_saison", type: "integer", nullable: true)]
    private ?int $finSaison;

    #[ORM\Column(name: "url_photo", type: "string", nullable: true)]
    private ?string $urlPhoto;

    #[ORM\ManyToMany(targetEntity: Allergene::class, inversedBy: "ingredients")]
    #[ORM\JoinTable(name: "allergene_ingredient")]
    #[ORM\JoinColumn(name: "id_ingredient", referencedColumnName: "id")]
    #[ORM\InverseJoinColumn(name: "id_allergene", referencedColumnName: "id")]
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

    public function getId(): int
    {
        return $this->id;
    }

    public function getNom(): ?string
    {
        return $this->nom;
    }

    public function getDebutSaison(): ?int
    {
        return $this->debutSaison;
    }

    public function getFinSaison(): ?int
    {
        return $this->finSaison;
    }

    public function getUrlPhoto(): ?string
    {
        return $this->urlPhoto;
    }
    public function setNom(?string $nom): void
    {
        $this->nom = $nom;
    }

    public function setDebutSaison(?int $debutSaison): void
    {
        $this->debutSaison = $debutSaison;
    }

    public function setFinSaison(?int $finSaison): void
    {
        $this->finSaison = $finSaison;
    }

    public function setUrlPhoto(?string $urlPhoto): void
    {
        $this->urlPhoto = $urlPhoto;
    }
    public function setId(int $id): void
    {
        $this->id = $id;
    }
}
