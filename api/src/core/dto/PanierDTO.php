<?php

namespace amap\core\dto;

use amap\core\dto\DTO;
use amap\infrastructure\entities\Panier;

class PanierDTO extends DTO
{
    protected int $id;
    protected string $id_producteur;
    protected ?string $date_publication;
    /**
     * @var array<IngredientDTO>
     */
    protected array $ingredients;

    public static function fromEntity(Panier $pa): PanierDTO
    {
        $panier = new PanierDTO();
        $panier->id = $pa->getId();
        $panier->id_producteur = $pa->getIdProducteur();
        $date_publi = $panier->dateFormat($pa->getDate());
        $panier->date_publication = strlen($date_publi) > 0 ?$date_publi:null;
        $panier->ingredients = IngredientPanierDTO::fromArrayToDTO($pa->getIngredients());
        return $panier;
    }
}
