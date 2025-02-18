<?php

namespace amap\core\dto;

use amap\core\dto\DTO;
use amap\core\dto\UtilisateurDTO;

class ProfileDTO extends DTO
{
    protected UtilisateurDTO $utilisateur;
    protected array $ustensiles_exclus;
    protected array $allergies;
    protected array $ingredients_exclus;
    /**
     * @var FrigoDTO[]
     */
    protected array $frigo;

    /**
     * @param array<int,mixed> $ustensiles_exclus
     * @param array<int,mixed> $allergies
     * @param array<int,mixed> $ingredients_exclus
     * @param FrigoDTO[] $frigo
     */
    public function __construct(
        UtilisateurDTO $utilisateur,
        array $ustensiles_exclus,
        array $allergies,
        array $ingredients_exclus,
        array $frigo,
    ) {
        $this->utilisateur = $utilisateur;
        $this->ustensiles_exclus = $ustensiles_exclus;
        $this->allergies = $allergies;
        $this->ingredients_exclus = $ingredients_exclus;
        $this->frigo = $frigo;
    }

}
