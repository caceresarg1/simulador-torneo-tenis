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

        $this->db = (new Database())->getConnection();
    }

    public function iniciarChallenge(Request $request, Response $response): Response {
        $resultado = $this->ChallengeServicios->torneoXGeneros();
        $responseData = [
            'ganador_masculino' => $resultado['masculino']->obtenerNombre(),
            'ganador_femenino' => $resultado['femenino']->obtenerNombre(),
            'detalle_torneo' => $resultado['detalle_torneo']
        ];
        $response->getBody()->write(json_encode($responseData, JSON_UNESCAPED_UNICODE));

        $this->guardarResultadoChallenge($responseData);

        return $response->withHeader('Content-Type', 'application/json charset=UTF-8')->withStatus(200);
    }

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

    public function guardarResultadoChallenge($data) {
        $queryTorneo = "INSERT INTO torneos (tipo_torneo, ganador) VALUES (:tipo, :ganador)";

        $stmt = $this->db->prepare($queryTorneo);

        $stmt->execute([
            ':tipo' => 'MASCULINO',
            ':ganador' =>  $data['ganador_masculino']
        ]);

        $stmt->execute([
            ':tipo' => 'FEMENINO',
            ':ganador' =>   $data['ganador_femenino']
        ]);

        $idTorneo = $this->db->lastInsertId();

        // Insertar cada partido
        foreach ($data['detalle_torneo'] as $partido) {
            $queryPartido = "INSERT INTO partidos (id_torneo, fase, jugador1, rendimiento1, jugador2, rendimiento2, ganador) 
                            VALUES (:id_torneo, :fase, :jugador1, :rendimiento1, :jugador2, :rendimiento2, :ganador)";
            $stmt = $this->db->prepare($queryPartido);

            $stmt->execute([
                ':id_torneo' => $partido['id_torneo'],
                ':fase' => $partido['fase'],
                ':jugador1' => $partido['jugador1'],
                ':rendimiento1' => $partido['rendimiento1'],
                ':jugador2' => $partido['rendimiento1'],
                ':rendimiento2' => $partido['rendimiento1'],
            ])

            $this->db->bind(':id_torneo', $idTorneo);
            $this->db->bind(':fase', $partido['fase']);
            $this->db->bind(':jugador1', $partido['jugador1']);
            $this->db->bind(':rendimiento1', $partido['rendimiento1']);
            $this->db->bind(':jugador2', $partido['jugador2']);
            $this->db->bind(':rendimiento2', $partido['rendimiento2']);
            $this->db->bind(':ganador', $partido['ganador']);
            $this->db->execute();
        }
    }
}