<?php

namespace amap\core\dto;

use DateTimeInterface;
use amap\core\dto\DTO;

class FrigoDTO extends DTO{
    protected int $id_ingredient;
    protected string $nom;
    protected string $url_photo;
    protected string $quantite;
    protected string $date_ajout;
    public function __construct(int $id_ingredient,string $nom, string $url_photo, string $quantite, \DateTime $date_ajout){
        $this->id_ingredient = $id_ingredient;
        $this->nom = $nom;
        $this->url_photo = $url_photo;
        $this->quantite = $quantite;
        $this->date_ajout = $this->dateFormat( $date_ajout);
    }
}

