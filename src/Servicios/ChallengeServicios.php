<?php

namespace tenischallenge\Servicios;

use tenischallenge\Entidades\Challenge;

class ChallengeServicios {
    private $jugadores;

    public function __construct(array $jugadores)
    {
        $this->jugadores = $jugadores;
    }

    public function torneoXGeneros() {
        $jugadoresMasculinos = $this->jugadores['jugadoresMasculinos'];
        $jugadorasFemeninos = $this->jugadores['jugadorasFemeninos'];

        // Torneo Masculino
        echo "=== Torneo Masculino ===\n";
        echo '<br>';
        $challengeMasculino = new Challenge($jugadoresMasculinos);
        $ganadorMasculino = $challengeMasculino->iniciarChallenge();

        // Torneo Femenino
        echo '<br><br>';
        echo "\n=== Torneo Femenino ===\n";
        echo '<br>';
        $torneoFemenino = new Challenge($jugadorasFemeninos);
        $ganadorFemenino = $torneoFemenino->iniciarChallenge();

        return [
            'masculino' => $ganadorMasculino,
            'femenino' => $ganadorFemenino,
        ];
    }
}