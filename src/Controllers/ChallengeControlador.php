<?php 

namespace tenischallenge\Controllers;

use tenischallenge\Servicios\ChallengeServicios;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use tenischallenge\Repositorios\DataJugadores;
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

class ChallengeControlador {
    private $ChallengeServicios;
    private $DataJugadores;

    public function __construct(ChallengeServicios $ChallengeServicios, DataJugadores $DataJugadores) {
        $this->ChallengeServicios = $ChallengeServicios;
        $this->DataJugadores = $DataJugadores;
    }

    /**
     * @OA\Post(
     *     path="/api/iniciarChallenge",
     *     summary="Inicia el challenge de tenis",
     *     description="Simula el torneo de tenis y devuelve el resultado.",
     *     tags={"Torneo"},
     *     @OA\Response(
     *         response=200,
     *         description="Resultado del torneo",
     *         @OA\JsonContent(
     *             type="object",
     *             @OA\Property(property="masculino", type="string", description="Ganador del torneo masculino"),
     *             @OA\Property(property="femenino", type="string", description="Ganador del torneo femenino")
     *         )
     *     ),
     *     @OA\Response(
     *         response=400,
     *         description="Error en la solicitud"
     *     )
     * )
     */
    public function iniciarChallenge(Request $request, Response $response): Response {
        $resultado = $this->ChallengeServicios->torneoXGeneros();
        $responseData = [
            'ganador_masculino' => $resultado['masculino']->obtenerNombre(),
            'ganador_femenino' => $resultado['femenino']->obtenerNombre(),
            'detalle_torneo' => $resultado['detalle_torneo']
        ];
        $response->getBody()->write(json_encode($responseData, JSON_UNESCAPED_UNICODE));
        return $response->withHeader('Content-Type', 'application/json charset=UTF-8')->withStatus(200);
    }

    /**
     * @OA\Get(
     *     path="/api/obtenerJugadores",
     *     summary="Obtiene la lista de jugadores",
     *     description="Devuelve un listado de jugadores masculinos y femeninos.",
     *     tags={"Jugadores"},
     *     @OA\Response(
     *         response=200,
     *         description="Listado de jugadores",
     *         @OA\JsonContent(
     *             type="object",
     *             @OA\Property(
     *                 property="jugadoresMasculinos",
     *                 type="array",
     *                 @OA\Items(type="string")
     *             ),
     *             @OA\Property(
     *                 property="jugadorasFemeninos",
     *                 type="array",
     *                 @OA\Items(type="string")
     *             )
     *         )
     *     )
     * )
     */

    public function obtenerJugadores(Request $request, Response $response): Response {
        $jugadores = $this->DataJugadores->leerJugadores();

        // Transformar jugadores a arreglos
        $jugadoresMasculinos = array_map(function($jugador) {
            return $jugador->obtenerArray();
        }, $jugadores['jugadoresMasculinos']);

        $jugadorasFemeninos = array_map(function($jugadora) {
            return $jugadora->obtenerArray();
        }, $jugadores['jugadorasFemeninos']);

        $data = [
            'jugadoresMasculinos' => $jugadoresMasculinos,
            'jugadorasFemeninos' => $jugadorasFemeninos
        ];

        $response->getBody()->write(json_encode($data));
        return $response->withHeader('Content-Type', 'application/json; charset=UTF-8')->withStatus(200);
    }
}