<?php

namespace tenischallenge\Entidades;

class Challenge {
    private $jugadores = [];
    private $detallePartidos = [];
    private $fase = 1;

    public function __construct($jugadores) {
        $this->jugadores = $jugadores;
    }

    /**
     * Iniciar el challenge generando las fases de cada instancia del torneo de acuerdo a la cantidad de jugadores.
     */
    public function iniciarChallenge(): Jugador {
        $rondaJugadores = $this->jugadores;

        while (count($rondaJugadores) > 1) {
            $rondaJugadores = $this->iniciarFase($rondaJugadores);
            $this->fase++;
        }

        return $rondaJugadores[0]; // Ganador final
    }

    /**
     * IniciarFase : Genera los partidos de la fase actual y los simula para obtener el ganador de  la fase.
     * @param array $jugadores
     * @return $ganadores
     */
    private function iniciarFase(array $jugadores) : array {
        $ganadores = [];

        for ($i = 0; $i < count($jugadores); $i += 2) {
            if (!isset($jugadores[$i + 1])) {
                $ganadores[] = $jugadores[$i];
            } else {
                $ganador = $this->simularPartido($jugadores[$i], $jugadores[$i + 1]);
                $ganadores[] = $ganador;
            }
        }
        return $ganadores;
    }

    /**
     * Simulacion de partido entre 2 jugadores (de cualquier sexo) en base a su rendimiento y a la suerte que obtenga de  la funcion rand().
     * @param $jugador1 
     * @param  $jugador2 
     * @return $ganador
     */
    private function simularPartido(Jugador $jugador1, Jugador $jugador2): Jugador {
        $suerte1 = rand(0, 50);
        $suerte2 = rand(0, 50);

        $rendimiento1 = $jugador1->calcularRendimiento() + $suerte1;
        $rendimiento2 = $jugador2->calcularRendimiento() + $suerte2;

        $ganador = $rendimiento1 >= $rendimiento2 ? $jugador1 : $jugador2;

        $this->registrarPartido($jugador1, $jugador2, $rendimiento1, $rendimiento2, $ganador);

        return  $ganador;

    }

    
    /**
     * registra los partidos jugados en las base de datos, mencionando la base, los jugadores , el rendimiento de cada uno y el ganador.
     * @param $jugador1
     * @param $jugador2
     * @param $rendimiento1
     * @param $rendimiento2
     * @param $ganador
     */
    public function  registrarPartido(Jugador $jugador1, Jugador $jugador2, int $rendimiento1, int $rendimiento2, Jugador $ganador) {
        $this->detallePartidos[] = [
            'fase' => $this->fase,
            'jugador1' => $jugador1->obtenerNombre(),
            'rendimiento1' => $rendimiento1,
            'jugador2' => $jugador2->obtenerNombre(),
            'rendimiento2' => $rendimiento2,
            'ganador' => $ganador->obtenerNombre()
        ];
    }

    /**
     * metodo para obtener los detalles de los partidos partidos.
     * @return array $detallePartidos
     */
    public function obtenerDetallesPartido(): array {
        return $this->detallePartidos;
    }


    /**
     * Testeo de simulacion de partido para pruebas unitarias
     * @param $jugador1
     * @param $jugador2
     */
    public function testSimularPartido(Jugador $jugador1, Jugador $jugador2) {
        return $this->simularPartido($jugador1, $jugador2);
    }
}
