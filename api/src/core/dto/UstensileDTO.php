<?php

namespace amap\core\dto;

use amap\core\dto\DTO;
use amap\infrastructure\entities\Tag;
use amap\infrastructure\entities\Ustensile;

class UstensileDTO extends DTO
{
    protected string $id;
    protected string $nom;

    public static function fromUstensile(Ustensile $ustensile): UstensileDTO
    {
        $ustensileDTO = new UstensileDTO();
        $ustensileDTO->id = $ustensile->getId();
        $ustensileDTO->nom = $ustensile->getNom();

        return $ustensileDTO;
    }
    public static function fromArrayToDTO($ustensiles): array
    {
        $ustensilesDTO = [];
        foreach ($ustensiles as $ustensile) {
            $ustensilesDTO[] = self::fromUstensile($ustensile);
        }

        return $ustensilesDTO;
    }

}
