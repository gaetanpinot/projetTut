<?php

namespace amap\infrastructure\service\interfaces;

interface RecetteServiceInterface
{
    public function createRecette(array $data): array;
}