<?php

namespace tenischallenge\Entidades;

class Challenge {
    private $jugadores = [];

    public function __construct($jugadores) {
        $this->jugadores = $jugadores;
    }

    private function simularPartido(Jugador $jugador1, Jugador $jugador2) {
        $suerte1 = rand(-10, 10);
        $suerte2 = rand(-10, 10);

        $rendimiento1 = $jugador1->calcularRendimiento() + $suerte1;
        $rendimiento2 = $jugador2->calcularRendimiento() + $suerte2;

        echo $jugador1->obtenerNombre() . " (" . $rendimiento1 . ") vs " . $jugador2->obtenerNombre() . " (" . $rendimiento2 . ")\n";

        return $rendimiento1 >= $rendimiento2 ? $jugador1 : $jugador2;
    }

    public function iniciarChallenge() {
        $ronda = 1;
        while (count($this->jugadores) > 1) {
            echo "Ronda $ronda:\n ";
            echo '<br>';
            $this->jugadores = $this->iniciarRonda($this->jugadores);
            $ronda++;
            echo '<br>';
        }
        // echo "Ganador del torneo: " . $this->jugadores[0]->obtenerNombre() . "\n";
        return $this->jugadores[0];
    }

    private function iniciarRonda(array $jugadores) {
        $ganadores = [];
        for ($i = 0; $i < count($jugadores); $i += 2) {
            $ganador = $this->simularPartido($jugadores[$i], $jugadores[$i + 1]);
            $ganadores[] = $ganador;
            echo '<br>';
        }
        return $ganadores;
    }
}
