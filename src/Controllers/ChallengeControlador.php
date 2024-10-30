<?php 

namespace tenischallenge\Controllers;

use tenischallenge\Servicios\ChallengeServicios;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use tenischallenge\Repositorios\DataJugadores;

class ChallengeControlador {
    private $challengeServicios;
    private $dataJugadores;

    public function __construct(ChallengeServicios $challengeServicios, DataJugadores $dataJugadores) {
        $this->challengeServicios = $challengeServicios;
        $this->dataJugadores = $dataJugadores;
    }

    // Inicia el torneo y devuelve el ganador
    // public function iniciarTorneo(Request $request, Response $response): Response {
        // $data = $request->getParsedBody();
        // $jugadores = $data['jugadores'] ?? [];
        // $genero = $data['genero'] ?? '';

        // $ganador = $this->challengeServicios->simularTorneo($jugadores, $genero);
        // $response->getBody()->write(json_encode(['ganador' => $ganador->getNombre()]));

        // return $response->withHeader('Content-Type', 'application/json');
    // }

    public function iniciarChallenge(Request $request, Response $response): Response {
        $jugadores = $this->dataJugadores->leerJugadores();

        $response->getBody()->write(json_encode(['jugadores' => $jugadores]));
        return $response->withStatus(200);
    }
}