<?php

namespace amap\infrastructure\entities;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity]
#[ORM\Table(name: "commentaire")]
class Commentaire
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: "integer")]
    private int $id;

    #[ORM\ManyToOne(targetEntity: Utilisateur::class)]
    #[ORM\JoinColumn(name: "id_utilisateur", referencedColumnName: "id")]
    private Utilisateur $utilisateur;

    #[ORM\ManyToOne(targetEntity: Recette::class)]
<<<<<<< HEAD
    #[ORM\JoinColumn(name: "id_recette", referencedColumnName: "id", onDelete: "CASCADE")]
=======
    #[ORM\JoinColumn(name: "id_recette", referencedColumnName: "id")]
>>>>>>> a557e730a8cbfa6a857dba8090272a79c297e3a7
    private Recette $recette;

    #[ORM\Column(type: "text", nullable: true)]
    private ?string $contenu;

    // Getters and setters would be added here
}
