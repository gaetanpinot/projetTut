<?php

namespace amap\infrastructure\entities;

/**
 * Dans doctrine si une date est utilisée comme clé primaire, il faut pouvoir la transformer en string
 * On créer donc une classe personnalisée
 */
class DateIdType extends \DateTime
{
    public function __toString(): string
    {
        return $this->format('U');
    }
}
