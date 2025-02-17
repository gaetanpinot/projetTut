<?php

namespace amap\infrastructure\entities;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\DBAL\Exception\UniqueConstraintViolationException;
use Doctrine\ORM\Mapping as ORM;
use Doctrine\ORM\Mapping\InverseJoinColumn;
use Doctrine\ORM\Mapping\JoinColumn;
use Doctrine\ORM\Mapping\JoinTable;
use Doctrine\ORM\Mapping\ManyToMany;
use Doctrine\ORM\Mapping\OneToMany;
use Ramsey\Uuid\Rfc4122\UuidV4;
use amap\core\dto\CredentialsDTO;
use amap\core\dto\UtilisateurInputDTO;
use amap\infrastructure\repository\UtilisateurRepository;

#[ORM\Entity(repositoryClass: UtilisateurRepository::class)]
#[ORM\Table(name: "utilisateur")]
class Utilisateur
{
    public function getAbonnees(): ?Collection
    {
        return $this->abonnees;
    }

    public function setAbonnees(?Collection $abonnees): void
    {
        $this->abonnees = $abonnees;
    }

    public function getProducteurs(): ?Collection
    {
        return $this->producteurs;
    }

    public function setProducteurs(?Collection $producteurs): void
    {
        $this->producteurs = $producteurs;
    }
    public function getPaniers(): Collection
    {
        return $this->paniers;
    }

    public function setPaniers(Collection $paniers): void
    {
        $this->paniers = $paniers;
    }

    public function getAllergies(): Collection
    {
        return $this->allergies;
    }

    public function setAllergies(Collection $allergies): void
    {
        $this->allergies = $allergies;
    }

    public function getIngredientsExclus(): Collection
    {
        return $this->ingredientsExclus;
    }

    public function setIngredientsExclus(Collection $ingredientsExclus): void
    {
        $this->ingredientsExclus = $ingredientsExclus;
    }

    public function getUstensilesExclus(): Collection
    {
        return $this->ustensilesExclus;
    }

    public function setUstensilesExclus(Collection $ustensilesExclus): void
    {
        $this->ustensilesExclus = $ustensilesExclus;
    }

    public function getFrigo(): Collection
    {
        return $this->frigo;
    }

    public function addIngredientFrigo(Frigo $ingredientFrigo): void
    {
        $this->frigo->add($ingredientFrigo);
    }

    public function setFrigo(Collection $frigo): void
    {
        $this->frigo = $frigo;
    }

    public function getRecettesFavorites(): Collection
    {
        return $this->recettesFavorites;
    }

    public function setRecettesFavorites(Collection $recettesFavorites): void
    {
        $this->recettesFavorites = $recettesFavorites;
    }
    #[ORM\Id]
    #[ORM\Column(type: "guid", unique: true)]
    private string $id;

    public function getId(): string
    {
        return $this->id;
    }
    #[ORM\Column(type: "string", name: 'nom_utilisateur', unique: true, nullable: true)]
    private ?string $nomUtilisateur;
    public function getNomUtilisateur(): ?string
    {
        return $this->nomUtilisateur;
    }
    #[ORM\Column(type: "integer", nullable: true)]
    private ?int $role;
    public function getRole(): ?int
    {
        return $this->role;
    }
    #[ORM\Column(type: "string", name: 'mot_de_passe', nullable: true)]
    private ?string $motDePasse;
    public function getMotDePasse()
    {
        return $this->motDePasse;
    }

    #[ORM\OneToMany(mappedBy: "createur", targetEntity: Recette::class)]
    private Collection $recettes;

    public function getRecettes(): Collection
    {
        return $this->recettes;
    }

    #[ORM\ManyToMany(targetEntity: Panier::class, inversedBy: "utilisateurs")]
    #[ORM\JoinTable(name: "panier_utilisateur")]
    #[JoinColumn(name:"id_utilisateur", referencedColumnName: "id")]
    #[InverseJoinColumn(name:"id_panier", referencedColumnName: 'id')]
    private Collection $paniers;

    #[ManyToMany(targetEntity: Utilisateur::class, mappedBy:  "producteurs")]
    private ?Collection $abonnees;

    #[JoinTable(name: 'producteur_utilisateur')]
    #[JoinColumn(name: 'id_utilisateur', referencedColumnName: 'id')]
    #[InverseJoinColumn(name: 'id_producteur', referencedColumnName: 'id')]
    #[ManyToMany(targetEntity: Utilisateur::class, inversedBy:  "abonnees")]
    private ?Collection $producteurs;



    #[ORM\ManyToMany(targetEntity: Allergene::class, inversedBy: "utilisateurs")]
    #[ORM\JoinTable(name: "allergie_utilisateur")]
    #[ORM\JoinColumn(name: "id_utilisateur", referencedColumnName: "id")]
    #[InverseJoinColumn(name: "id_allergene", referencedColumnName: "id")]
    private Collection $allergies;

    #[ORM\ManyToMany(targetEntity: Ingredient::class, inversedBy: "utilisateursExclus")]
    #[ORM\JoinTable(name: "ingredient_exclu")]
    #[ORM\JoinColumn(name: "id_utilisateur", referencedColumnName: "id")]
    #[InverseJoinColumn(name: "id_ingredient", referencedColumnName: "id")]
    private Collection $ingredientsExclus;

    #[ORM\ManyToMany(targetEntity: Ustensile::class, inversedBy: "utilisateursExclus")]
    #[ORM\JoinTable(name: "ustensile_exclu")]
    #[ORM\JoinColumn(name: "id_utilisateur", referencedColumnName: "id")]
    #[InverseJoinColumn(name: "id_ustensile", referencedColumnName: "id")]
    private Collection $ustensilesExclus;

    #[ORM\OneToMany(mappedBy: "utilisateur", targetEntity: Frigo::class)]
    private Collection $frigo;

    #[ORM\ManyToMany(targetEntity: Recette::class, inversedBy: "utilisateurs")]
    #[ORM\JoinTable(name: "favoris")]
    private Collection $recettesFavorites;

    public function __construct()
    {
        $this->id = UuidV4::uuid4();
        $this->recettes = new ArrayCollection();
        $this->paniers = new ArrayCollection();
        $this->allergies = new ArrayCollection();
        $this->ingredientsExclus = new ArrayCollection();
        $this->ustensilesExclus = new ArrayCollection();
        $this->frigo = new ArrayCollection();
        $this->recettesFavorites = new ArrayCollection();
        $this->producteurs = new ArrayCollection();
        $this->abonnees = new ArrayCollection();
    }

    public static function fromCredentialsDTO(CredentialsDTO $utilisateur): Utilisateur
    {
        $u = new Utilisateur();
        $u->nomUtilisateur = $utilisateur->nomUtilisateur;
        $u->role = $utilisateur->role;
        $u->motDePasse = $utilisateur->password;
        return $u;
    }

    public function addAllergie(Allergene $allergie)
    {
        $this->allergies->add($allergie);
    }

    public function deleteAllergie(Allergene $allergie)
    {
        $this->allergies->removeElement($allergie);
    }
    public function setId(string $id): void
    {
        $this->id = $id;
    }
    public function addPanier(Panier $panier)
    {
        try {
            $this->paniers->add($panier);
        } catch(UniqueConstraintViolationException $e) {
        }
    }
}
