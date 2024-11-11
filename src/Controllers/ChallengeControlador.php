<?php 

namespace tenischallenge\Controllers;

use PDO;

use tenischallenge\Servicios\ChallengeServicios;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use tenischallenge\Config\Database;
use tenischallenge\Repositorios\DataJugadores;


class ChallengeControlador {
    private $ChallengeServicios;
    private $DataJugadores;
    private $db;

    public function __construct(ChallengeServicios $ChallengeServicios, DataJugadores $DataJugadores) {
        $this->ChallengeServicios = $ChallengeServicios;
        $this->DataJugadores = $DataJugadores;

        $this->db = (new Database)->getConnection();
    }


    /**
     * Devuelve el ganador masculino y femenino, así como el detalle de las partidas del torneo.
     */
    public function iniciarChallenge(Request $request, Response $response): Response {
        $resultado = $this->ChallengeServicios->torneoXGeneros();
        $responseData = [
            'ganador_masculino' => $resultado['masculino']->obtenerNombre(),
            'ganador_femenino' => $resultado['femenino']->obtenerNombre(),
            'detalle_torneo' => $resultado['detalle_torneo']
        ];
        $response->getBody()->write(json_encode($responseData, JSON_UNESCAPED_UNICODE));

        $this->ChallengeServicios->guardarResultadoChallenge($responseData);

        return $response->withHeader('Content-Type', 'application/json charset=UTF-8')->withStatus(200);
    }


    /**
     * Devuelve un listado de jugadores masculinos y femeninos.
     */
    public function obtenerJugadores(Request $request, Response $response): Response {
        $jugadores = $this->DataJugadores->obtenerJugadores();

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