<?php

namespace amap\infrastructure\repository\interfaces;

use amap\core\dto\input\InputRecetteDTO;
use amap\infrastructure\entities\Recette;

interface RecetteRepositoryInterface
{
    public function setPagination(int $nb): void;

    public function getRecettes($args): array;

    public function getRecetteById($id): Recette;

    public function deleteRecette(int $id): void;

    public function createRecette(Recette $r): Recette;

    public function getRecetteCommentaires(): array;

    public function addRecetteCommentaires(): array;

    public function setRecetteNote(): array;

    public function getRandomRecettes(int $count);
}
