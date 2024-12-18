<?php

namespace amap\infrastructure\entities;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use amap\infrastructure\repository\UtilisateurRepository;

#[ORM\Entity(repositoryClass: UtilisateurRepository::class)]
#[ORM\Table(name: "utilisateur")]
class Utilisateur
{
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
        return $this->getMotDePasse();
    }

    #[ORM\OneToMany(mappedBy: "createur", targetEntity: Recette::class)]
    private Collection $recettes;

    public function getRecettes(): Collection
    {
        return $this->recettes;
    }

    #[ORM\ManyToMany(targetEntity: Panier::class, inversedBy: "utilisateurs")]
    #[ORM\JoinTable(name: "panier_utilisateur")]
    private Collection $paniers;

    #[ORM\ManyToMany(targetEntity: Allergene::class, inversedBy: "utilisateurs")]
    #[ORM\JoinTable(name: "allergie_utilisateur")]
    private Collection $allergies;

    #[ORM\ManyToMany(targetEntity: Ingredient::class, inversedBy: "utilisateursExclus")]
    #[ORM\JoinTable(name: "ingredient_exclu")]
    private Collection $ingredientsExclus;

    #[ORM\ManyToMany(targetEntity: Ustensile::class, inversedBy: "utilisateursExclus")]
    #[ORM\JoinTable(name: "ustensile_exclu")]
    private Collection $ustensilesExclus;

    #[ORM\OneToMany(mappedBy: "utilisateur", targetEntity: Frigo::class)]
    private Collection $frigo;

    #[ORM\ManyToMany(targetEntity: Recette::class, inversedBy: "utilisateurs")]
    #[ORM\JoinTable(name: "favoris")]
    private Collection $recettesFavorites;

    public function __construct()
    {
        $this->recettes = new ArrayCollection();
        $this->paniers = new ArrayCollection();
        $this->allergies = new ArrayCollection();
        $this->ingredientsExclus = new ArrayCollection();
        $this->ustensilesExclus = new ArrayCollection();
        $this->frigo = new ArrayCollection();
        $this->recettesFavorites = new ArrayCollection();
    }

    // Getters and setters omitted for brevity
}
