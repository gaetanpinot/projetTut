<?php

namespace amap\core\dto\input;

use amap\core\dto\DTO;

class InputRecetteDTO extends DTO
{
    protected ?int $id;
    protected ?string $nom;
    protected ?int $tempsPreparation;
    protected ?int $complexite;
    protected ?string $idCreateur;
    protected ?string $description;
    protected ?int $debutSaison;
    protected ?int $finSaison;
    protected ?string $urlPhoto;

    protected ?int $id_recette_parente;
    protected array $tags;
    protected array $ingredientsRecette;
    protected array $ustensiles;
    protected array $notes;

    public function __construct(
        ?string $nom = null,
        ?int $tempsPreparation = null,
        ?int $complexite = null,
        ?string $idCreateur = null,
        ?string $description = null,
        ?int $debutSaison = null,
        ?int $finSaison = null,
        ?string $urlPhoto = null,
        ?int $id_recette_parente = null,
        array $tags = [],
        array $ingredientsRecette = [],
        array $ustensiles = [],
        array $notes = []
    ) {
        $this->nom = $nom;
        $this->tempsPreparation = $tempsPreparation;
        $this->complexite = $complexite;
        $this->idCreateur = $idCreateur;
        $this->description = $description;
        $this->debutSaison = $debutSaison;
        $this->finSaison = $finSaison;
        $this->urlPhoto = $urlPhoto;
        $this->id_recette_parente = $id_recette_parente;
        $this->tags = $tags ?? [];
        $this->ingredientsRecette = $ingredientsRecette ?? [];
        $this->ustensiles = $ustensiles ?? [];
        $this->notes = $notes ?? [];
        $this->id = null;
    }

    public function getId(): ?string
    {
        return $this->id;
    }

    public function setId(int $id): void
    {
        $this->id = $id;
    }

    public function getNom(): ?string
    {
        return $this->nom;
    }

    public function getTempsPreparation(): ?int
    {
        return $this->tempsPreparation;
    }

    public function getComplexite(): ?int
    {
        return $this->complexite;
    }

    public function getIdCreateur(): ?string
    {
        return $this->idCreateur;
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

    public function getIdRecetteParente(): ?int
    {
        return $this->id_recette_parente;
    }

    public function getTags(): array
    {
        return $this->tags;
    }

    public function getIngredientsRecette(): array
    {
        return $this->ingredientsRecette;
    }

    public function getUstensiles(): array
    {
        return $this->ustensiles;
    }

    public function getNotes(): array
    {
        return $this->notes;
    }

}