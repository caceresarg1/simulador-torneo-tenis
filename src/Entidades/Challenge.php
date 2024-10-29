<?php

namespace tenischallenge\Entidades;

class Challenge {
    private $jugadores = [];

    public function __construct($jugadores) {
        $this->jugadores = $jugadores;
    }

    private function simularPartido(Jugador $jugador1, Jugador $jugador2): Jugador {
        $suerte1 = rand(0, 100);
        $suerte2 = rand(0, 100);

        $rendimiento1 = $jugador1->calcularRendimiento() + $suerte1;
        $rendimiento2 = $jugador2->calcularRendimiento() + $suerte2;

        echo $jugador1->obtenerNombre() . " (" . $rendimiento1 . ") vs " . $jugador2->obtenerNombre() . " (" . $rendimiento2 . ")\n";

        return $rendimiento1 >= $rendimiento2 ? $jugador1 : $jugador2;
    }
    
    public function iniciarChallenge(): Jugador {
        $fase           = 1;
        $rondaJugadores = $this->jugadores;

        while (count($rondaJugadores) > 1) {
            echo "<br>";
            echo "Fase $fase:\n ";
            echo "<br>";

            $rondaJugadores = $this->iniciarRonda($rondaJugadores);
            $fase++;
        }

        return $rondaJugadores[0]; // Ganador final
    }

    private function iniciarRonda(array $jugadores) : array {
        $ganadores = [];

        for ($i = 0; $i < count($jugadores); $i += 2) {
            if (!isset($jugadores[$i + 1])) {
                $ganadores[] = $jugadores[$i];
            } else {
                $ganador = $this->simularPartido($jugadores[$i], $jugadores[$i + 1]);
                $ganadores[] = $ganador;
            }
            echo '<br>';
        }
        return $ganadores;
    }
}
