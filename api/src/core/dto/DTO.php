<?php

namespace amap\core\dto;

use DateTimeInterface;


abstract class DTO implements \JsonSerializable
{
    public function jsonSerialize(): array
    {
        $vars = get_object_vars($this);
        return $vars;
    }


    public function __get(string $name): mixed
    {
        return property_exists($this, $name) ? $this->$name : throw new \Exception(static::class . ": Property $name does not exist");
    }

    public function toJSON(): string
    {
        return json_encode($this, JSON_PRETTY_PRINT);
    }

    public function dateFormat(?DateTimeInterface $date): string
    {
        return $date!==null? $date->format('Y-m-d H:i:s'): '';
    }

}
