<?php

namespace amap\core\dto;

use amap\infrastructure\entities\Allergene;

class AllergenesDTO extends DTO
{
    protected string $label;
    protected string $id;

    public static function fromAllergene(Allergene $a): AllergenesDTO
    {
        $allergene = new AllergenesDTO();
        $allergene->label = $a->getLabel();
        $allergene->id = $a->getId();
        return $allergene;
    }

    public static function fromArrayToDTO($allergenes): array
    {
        $retour = [];
        foreach ($allergenes as $allergene) {
            $retour[] = self::fromAllergene($allergene);
        }
        return $retour;
    }
}
