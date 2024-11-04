<?php

namespace tenischallenge;

use OpenApi\Annotations as OA;

/**
 * @OA\Info(
 *     title="API de Tenis Challenge",
 *     version="1.0",
 *     description="Documentación de la API para el torneo de tenis."
 * )
 *
 * @OA\Server(
 *     url="http://localhost/tenischallenge/api",
 *     description="Servidor local"
 * )
 * 
 * @OA\PathItem(path="/api/iniciarChallenge")
 * @OA\PathItem(path="/api/obtenerJugadores")
 */
class SwaggerSetup {
    // Clase de configuración para Swagger (vacía)
}
