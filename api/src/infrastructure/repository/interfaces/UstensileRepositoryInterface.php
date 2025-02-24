<?php

namespace amap\infrastructure\repository\interfaces;

interface UstensileRepositoryInterface
{
    public function getUstensilesByIds($usts_id):array;
}