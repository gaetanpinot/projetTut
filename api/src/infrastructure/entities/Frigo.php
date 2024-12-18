<?php

namespace amap\infrastructure\entities;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity]
#[ORM\Table(name: "frigo")]
class Frigo
{
    #[ORM\Id]
    #[ORM\ManyToOne(targetEntity: Utilisateur::class, inversedBy: "frigo")]
    #[ORM\JoinColumn(name: "id_utilisateur", referencedColumnName: "id")]
    private Utilisateur $utilisateur;

    #[ORM\Id]
    #[ORM\ManyToOne(targetEntity: Ingredient::class)]
    #[ORM\JoinColumn(name: "id_ingredient", referencedColumnName: "id")]
    private Ingredient $ingredient;

    #[ORM\Id]
    #[ORM\Column(type: "date")]
    private \DateTimeInterface $dateAjout;

    #[ORM\Column(type: "string", nullable: true)]
    private ?string $quantite;

    // Getters and setters would be added here
}
