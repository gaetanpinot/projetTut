<?php

namespace amap\core\dto;

use DateTimeInterface;
use amap\core\dto\DTO;

class FrigoDTO extends DTO{
    protected string $nom;
    protected string $url_photo;
    protected string $quantite;
    protected string $date_ajout;
    public function __construct(string $nom, string $url_photo, string $quantite, \DateTime $date_ajout){
        $this->nom = $nom;
        $this->url_photo = $url_photo;
        $this->quantite = $quantite;
        $this->date_ajout = $this->dateFormat( $date_ajout);
    }
}

