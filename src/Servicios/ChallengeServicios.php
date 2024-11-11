<?php

namespace tenischallenge\Servicios;

use tenischallenge\Config\Database;
use tenischallenge\Entidades\Challenge;
use tenischallenge\Repositorios\DataJugadores;

class ChallengeServicios {
    private $jugadores;
    private $db;

    public function __construct(DataJugadores $jugadores)
    {
        $this->jugadores = $jugadores;
        $this->db = (new Database())->getConnection();
    }


    /**
     * Servicio  para obtener los datos de torneos por genero.
     * retornando todos los resultados juntos con sus respectivos ganadores.
     */
    public function torneoXGeneros() {
        $jugadores = $this->jugadores->obtenerJugadores();
        $jugadoresMasculinos = $jugadores['jugadoresMasculinos'];
        $jugadorasFemeninos = $jugadores['jugadorasFemeninos'];

        // Torneo Masculino
        $challengeMasculino = new Challenge($jugadoresMasculinos);
        $ganadorMasculino = $challengeMasculino->iniciarChallenge();

        // Torneo Femenino
        $torneoFemenino = new Challenge($jugadorasFemeninos);
        $ganadorFemenino = $torneoFemenino->iniciarChallenge();

        return [
            'masculino' => $ganadorMasculino,
            'femenino' => $ganadorFemenino,
            'detalle_torneo' => [
                'masculino' => $challengeMasculino->obtenerDetallesPartido(),
                'femenino' => $torneoFemenino->obtenerDetallesPartido()
            ]
        ];
    }

    /**
     * Guardar los resultados  de un torneo ya simulado para almacenarlo en la base de datos.
     */
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
        $p = 0;
        foreach ($data['detalle_torneo'] as $partido) {
            $queryPartido = "INSERT INTO partidos (id_torneo, fase, jugador1, rendimiento1, jugador2, rendimiento2, ganador) 
                            VALUES (:id_torneo, :fase, :jugador1, :rendimiento1, :jugador2, :rendimiento2, :ganador)";
            $stmt = $this->db->prepare($queryPartido);

            $stmt->execute([
                ':id_torneo' => $idTorneo,
                ':fase' => $partido[$p]['fase'],
                ':jugador1' => $partido[$p]['jugador1'],
                ':rendimiento1' => $partido[$p]['rendimiento1'],
                ':jugador2' => $partido[$p]['jugador2'],
                ':rendimiento2' => $partido[$p]['rendimiento2'],
                ':ganador' => $partido[$p]['ganador']
            ]);

            $p++;
        }
    }
}