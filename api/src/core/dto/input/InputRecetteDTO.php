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
}