<?php

namespace amap\infrastructure\entities;

use amap\infrastructure\repository\IngredientRepository;
use amap\infrastructure\repository\NoteRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity (repositoryClass: NoteRepository::class)]
#[ORM\Table(name: "note_recette")]
class Note
{
    #[ORM\Id]
    #[ORM\Column(type: "integer", name: "id_recette")]
    private int $id_recette;

    #[ORM\Id]
    #[ORM\Column(type: "guid")]
    private string $id_utilisateur;

    #[ORM\Column(type: "integer", nullable: true)]
    private int $note;

    public function getNote(): int
    {
        return $this->note;
    }

    #[ORM\ManyToOne(targetEntity: Recette::class, inversedBy: "ingredient_recette")]
    #[ORM\JoinColumn(name: "id_recette", referencedColumnName: "id", nullable: true)]
    private Recette $recette;

    #[ORM\ManyToOne(targetEntity: Utilisateur::class, inversedBy: "utilisateur")]
    #[ORM\JoinColumn(name: "id_utilisateur", referencedColumnName: "id", nullable:true)]
    private Utilisateur $utilisateur;

    public function setNote(int $note): void
    {
        $this->note = $note;
    }

    public function getIdRecette(): int
    {
        return $this->id_recette;
    }

    public function setIdRecette(int $id_recette): void
    {
        $this->id_recette = $id_recette;
    }

    public function getIdUtilisateur(): string
    {
        return $this->id_utilisateur;
    }

    public function setIdUtilisateur(string $id_utilisateur): void
    {
        $this->id_utilisateur = $id_utilisateur;
    }

//    public function getRecette(): Recette
//    {
//        return $this->recette;
//    }

//    public function setRecette(Recette $recette): void
//    {
//        $this->recette = $recette;
//    }


}
