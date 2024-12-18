<?php

namespace amap\infrastructure\service\implementations;

use amap\infrastructure\service\interfaces\RecetteServiceInterface;
use Exception;

class RecetteService implements RecetteServiceInterface
{
    private RecetteRepositoryInterface $recetteRepository;

    public function __construct(RecetteRepositoryInterface $recetteRepository)
    {
        $this->recetteRepository = $recetteRepository;
    }

    public function createRecette(array $data): array
    {
        try {
            $recette = [
                'nom' => $data['nom'],
                'temps_preparation' => $data['temps_preparation'],
                'complexite' => $data['complexite'] ?? null,
                'id_createur' => $data['id_createur'],
                'description' => $data['description'] ?? null,
                'debut_saison' => $data['debut_saison'] ?? null,
                'fin_saison' => $data['fin_saison'] ?? null,
                'url_photo' => $data['url_photo'] ?? null
            ];

            $savedRecette = $this->recetteRepository->save($recette);

            return [
                'success' => true,
                'recette' => $savedRecette
            ];
        } catch (Exception $e) {
            throw new Exception('Erreur_creation_recette: ' . $e->getMessage());
        }
    }
}