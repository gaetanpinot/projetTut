<?php

namespace amap\core\dto;


class FrigoInputDTO extends DTO {

    protected  string $id_ingredient, $quantite, $timestamp_ajout;

    public function __construct(string $id_ingredient, string $quantite, string $timestamp_ajout){
        $this->id_ingredient = $id_ingredient;
        $this->quantite = $quantite;
        $this->timestamp_ajout = $timestamp_ajout;
    }
}
