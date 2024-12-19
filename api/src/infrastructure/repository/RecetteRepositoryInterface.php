<?php

namespace amap\infrastructure\repository;

use amap\infrastructure\entities\Commentaire;
use amap\infrastructure\entities\Recette;
use amap\infrastructure\entities\Utilisateur;

interface RecetteRepositoryInterface
{
    public function getRecettes($args): array;

    public function getRecetteById($id): Recette;

    public function deleteRecette(): void;

    public function createRecette(): void;

    public function getRecetteCommentaires(): array;

    public function addRecetteCommentaires(): array;

    public function setRecetteNote(): array;
}
