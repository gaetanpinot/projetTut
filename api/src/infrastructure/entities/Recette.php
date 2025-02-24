<?php

namespace amap\infrastructure\entities;

use amap\core\dto\input\InputRecetteDTO;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use amap\infrastructure\repository\RecetteRepository;

#[ORM\Entity(repositoryClass: RecetteRepository::class)]
#[ORM\Table(name: "recette")]
class Recette
{
    public function getIngredientsRecette(): Collection
    {
        return $this->ingredients_recette;
    }

    public function setIngredientsRecette(Collection $ingredients_recette): void
    {
        $this->ingredients_recette = $ingredients_recette;
    }
    public function getIngredients(): Collection
    {
        return $this->ingredients;
    }

    /*public function setIngredients(Collection $ingredients): void*/
    /*{*/
    /*    $this->ingredients = $ingredients;*/
    /*}*/

    public function getUstensiles(): Collection
    {
        return $this->ustensiles;
    }

    public function setUstensiles(Collection $ustensiles): void
    {
        $this->ustensiles = $ustensiles;
    }
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: "integer")]
    private ?int $id = null;

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
    #[ORM\JoinColumn(name: "id_createur", referencedColumnName: "id", onDelete: "SET NULL")]
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

    #
    #[ORM\JoinTable(name: "tag_recette")]
    #[ORM\JoinColumn(name: "id_recette", referencedColumnName: "id")]
    #[ORM\InverseJoinColumn(name: "id_tag", referencedColumnName: "id")]
    #[ORM\ManyToMany(targetEntity: Tag::class, inversedBy: "recettes")]
    private Collection $tags;

    /*#[ORM\JoinTable(name: "ingredient_recette")]*/
    /*#[ORM\JoinColumn(name: "id_recette", referencedColumnName: "id")]*/
    /*#[ORM\InverseJoinColumn(name: "id_ingredient", referencedColumnName: "id")]*/
    /*#[ORM\ManyToMany(targetEntity: Ingredient::class, inversedBy: "recettes")]*/
    /*private Collection $ingredients;*/

    #[ORM\OneToMany(targetEntity: Note::class, mappedBy: "recette")]
    private Collection|null $notes;

    public function getNotes(): ?Collection
    {
        return $this->notes;
    }

    #[ORM\OneToMany(targetEntity: IngredientRecette::class, mappedBy: "recette")]
    private Collection $ingredients_recette;

    #[ORM\JoinTable(name: "ustensile_recette")]
    #[ORM\JoinColumn(name: "id_recette", referencedColumnName: "id")]
    #[ORM\InverseJoinColumn(name: "id_ustensile", referencedColumnName: "id")]
    #[ORM\ManyToMany(targetEntity: Ustensile::class, inversedBy: "recette")]
    private Collection $ustensiles;

    public function __construct()
    {
        $this->tags = new ArrayCollection();
        $this->notes = new ArrayCollection();
        /*$this->ingredients = new ArrayCollection();*/
        $this->ingredients_recette = new ArrayCollection();
        $this->ustensiles = new ArrayCollection();
    }

    public static function fromInputRecetteDTO(InputRecetteDTO $inputRecetteDTO, Utilisateur $createur): self{
        $recette = new Recette();
        $recette->setNom($inputRecetteDTO->getNom());
        $recette->setTempsPreparation($inputRecetteDTO->getTempsPreparation());
        $recette->setComplexite($inputRecetteDTO->getComplexite());
        $recette->setDescription($inputRecetteDTO->getDescription());
        $recette->setDebutSaison($inputRecetteDTO->getDebutSaison());
        $recette->setFinSaison($inputRecetteDTO->getFinSaison());
        $recette->setUrlPhoto($inputRecetteDTO->getUrlPhoto());
        $recette->setCreateur($createur);
        return $recette;
    }

    public function getTags(): Collection
    {
        return $this->tags;
    }

    public function getComplexite(): ?int
    {
        return $this->complexite;
    }

    public function getDescription(): ?string
    {
        return $this->description;
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

    public function setTempsPreparation(?int $tempsPreparation): void
    {
        $this->tempsPreparation = $tempsPreparation;
    }

    public function setComplexite(?int $complexite): void
    {
        $this->complexite = $complexite;
    }

    public function setDescription(?string $description): void
    {
        $this->description = $description;
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

    public function setCreateur(?Utilisateur $createur): void
    {
        $this->createur = $createur;
    }
}
