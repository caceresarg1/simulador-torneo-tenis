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
        $jugadoresMasculinos = array_filter($this->jugadores, 'jugadoresMasculinos');
        $jugadorasFemeninos = array_filter($this->jugadores, 'jugadorasFemeninos');

        // Torneo Masculino
        echo "=== Torneo Masculino ===\n";
        $challengeMasculino = new Challenge($jugadoresMasculinos);
        $ganadorMasculino = $challengeMasculino->iniciarChallenge();

        // Torneo Femenino
        echo "\n=== Torneo Femenino ===\n";
        $torneoFemenino = new Challenge($jugadorasFemeninos);
        $ganadorFemenino = $torneoFemenino->iniciarChallenge();
    }
}