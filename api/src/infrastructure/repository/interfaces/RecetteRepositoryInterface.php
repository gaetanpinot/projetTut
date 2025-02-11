<?php

namespace amap\infrastructure\repository\interfaces;

use amap\infrastructure\entities\Recette;

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
