<?php

namespace amap\core\dto;

use amap\core\dto\DTO;
use amap\infrastructure\entities\Tag;

class TagDTO extends DTO
{
    protected string $id;
    protected string $label;

    public static function fromTag(Tag $tag): TagDTO
    {
        $tagDTO = new TagDTO();
        $tagDTO->id = $tag->getId();
        $tagDTO->label = $tag->getLabel();

        return $tagDTO;
    }
    public static function fromArrayToDTO($tags): array
    {
        $tagsDTO = [];
        foreach ($tags as $tag) {
            $tagsDTO[] = self::fromTag($tag);
        }

        return $tagsDTO;
    }

}
