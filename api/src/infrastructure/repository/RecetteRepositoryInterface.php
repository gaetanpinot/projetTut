<?php

namespace amap\infrastructure\repository;

use amap\core\dto\RecetteDTO;
use amap\infrastructure\entities\Commentaire;
use amap\infrastructure\entities\Recette;
use amap\infrastructure\entities\Utilisateur;

interface RecetteRepositoryInterface
{
    public function getRecettes($args): array;

    public function getRecetteById($id): Recette;

    public function deleteRecette(int $id): void;

    public function createRecette(Recette $r): Recette;

    public function getRecetteCommentaires(): array;

    public function addRecetteCommentaires(): array;

    public function setRecetteNote(): array;
}
