<?php

namespace amap\core\service;

use amap\core\service\interfaces\ServiceNoteInterface;
use amap\infrastructure\entities\Note;
use amap\infrastructure\repository\interfaces\NoteRepositoryInterface;

class ServiceNote implements ServiceNoteInterface
{
    protected NoteRepositoryInterface $noteRepository;

    public function __construct(NoteRepositoryInterface $noteRepository)
    {
        $this->noteRepository = $noteRepository;
    }

    public function createNote($note, $idRecette, $idUtilisateur) : Note
    {
        $note = $this->noteRepository->create($note, $idRecette, $idUtilisateur);
        return $note;
    }

}