<?php 

namespace tenischallenge\Controllers;

use tenischallenge\Servicios\ChallengeServicios;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use tenischallenge\Repositorios\DataJugadores;

class ChallengeControlador {
    private $ChallengeServicios;
    private $DataJugadores;

    public function __construct(ChallengeServicios $ChallengeServicios, DataJugadores $DataJugadores) {
        $this->ChallengeServicios = $ChallengeServicios;
        $this->DataJugadores = $DataJugadores;
    }

    public function iniciarChallenge(Request $request, Response $response): Response {
        $resultado = $this->ChallengeServicios->torneoXGeneros();
        $responseData = [
            'ganador_masculino' => $resultado['masculino']->obtenerNombre(),
            'ganador_femenino' => $resultado['femenino']->obtenerNombre(),
            'detalle_torneo' => $resultado['detalle_torneo']
        ];
        return $response->withHeader('Content-Type', 'application/json')->withStatus(200);
    }
}