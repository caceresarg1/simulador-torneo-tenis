<?php

namespace tenischallenge\Servicios;

use tenischallenge\Entidades\Challenge;
use tenischallenge\Repositorios\DataJugadores;

class ChallengeServicios {
    private $jugadores;

    public function __construct(DataJugadores $jugadores)
    {
        $this->jugadores = $jugadores;
    }

    // public function torneoXGeneros() {
    //     $jugadores = $this->jugadores->leerJugadores();
    //     $jugadoresMasculinos = $jugadores['jugadoresMasculinos'];
    //     $jugadorasFemeninos = $jugadores['jugadorasFemeninos'];

    //     // Torneo Masculino
    //     echo "=== Torneo Masculino ===\n";
    //     echo '<br>';
    //     $challengeMasculino = new Challenge($jugadoresMasculinos);
    //     $ganadorMasculino = $challengeMasculino->iniciarChallenge();

    //     // Torneo Femenino
    //     echo '<br><br>';
    //     echo "\n=== Torneo Femenino ===\n";
    //     echo '<br>';
    //     $torneoFemenino = new Challenge($jugadorasFemeninos);
    //     $ganadorFemenino = $torneoFemenino->iniciarChallenge();

    //     return [
    //         'masculino' => $ganadorMasculino,
    //         'femenino' => $ganadorFemenino,
    //     ];
    // }

    public function torneoXGeneros() {
        $jugadores = $this->jugadores->leerJugadores();
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
}