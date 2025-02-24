<?php

namespace amap\infrastructure\entities;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

use Doctrine\ORM\Mapping\Column;


#[ORM\Entity]
#[ORM\Table(name: "frigo")]
class Frigo
{
    #[ORM\Id]
    #[ORM\ManyToOne(targetEntity: Utilisateur::class, inversedBy: "frigo")]
    #[ORM\JoinColumn(name: "id_utilisateur", referencedColumnName: "id")]
    private Utilisateur $utilisateur;

    #[Column(name: "id_utilisateur", type: "guid")]
    private string $id_utilisateur;

    #[ORM\Id]
    #[ORM\ManyToOne(targetEntity: Ingredient::class)]
    #[ORM\JoinColumn(name: "id_ingredient", referencedColumnName: "id")]
    private Ingredient $ingredient;

    #[ORM\Id]
    #[ORM\Column(name:"date_ajout", type: "integer")]
    private int $timestampAjout;

    #[ORM\Column(type: "string", nullable: true)]
    private ?string $quantite;

    public function getUtilisateur(): Utilisateur
    {
        return $this->utilisateur;
    }
    public function setUtilisateur(Utilisateur $utilisateur): void
    {
        $this->utilisateur = $utilisateur;
    }
    public function getIngredient(): Ingredient
    {
        return $this->ingredient;
    }
    public function setIngredient(Ingredient $ingredient): void
    {
        $this->ingredient = $ingredient;
    }
    public function getTimestampAjout(): int
    {
        return $this->timestampAjout;
    }
    public function setTimestampAjout(int $dateAjout): void
    {
        $this->timestampAjout = $dateAjout;
    }
    public function getQuantite(): ?string
    {
        return $this->quantite;
    }
    public function setQuantite(?string $quantite): void
    {
        $this->quantite = $quantite;
    }
}
