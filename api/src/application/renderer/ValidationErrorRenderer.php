<?php

namespace amap\application\renderer;

use Opis\JsonSchema\ValidationResult;
use Opis\JsonSchema\Errors\ErrorFormatter;
use Psr\Http\Message\ResponseInterface;
use amap\application\renderer\JsonRenderer;

class ValidationErrorRenderer
{
    /**
 * format l'erreur de validation en JSON
     * @param ResponseInterface $rs
     * @param ValidationResult $result
     * @return ResponseInterface|false false si pas d'erreur, sinon la réponse HTTP avec le message d'erreur encodé
     */
    public static function render(ResponseInterface $rs, ValidationResult $result): ResponseInterface|false
    {
        if ($result->isValid()) {
            return false;
        }
        $e = $result->error();
        $formatter = new ErrorFormatter();
        // true pour les multiples erreurs
        $message = $formatter->format($e, true);
        return JsonRenderer::render($rs, 400, ['message' => $message]);

    }
}
