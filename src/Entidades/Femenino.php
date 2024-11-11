<?php

namespace tenischallenge\Entidades;

class Femenino extends Jugador {
    private $reaccion;

    public function __construct($nombre, $nivelHabilidad, $reaccion) {
        parent::__construct($nombre, $nivelHabilidad);
        $this->reaccion = $reaccion;
    }

    /**
     * Calculo de rendimiento del partidos del challenge femenino
     */
    public function calcularRendimiento() {
        return $this->nivelHabilidad + $this->reaccion;
    }

    /**
     * Obtener el apellido y nombre de los jugadores femeninos.
     */
    public function obtenerNombre() {
        return $this->nombre;
    }

    /**
     * Obtener array de  los datos de los jugadores femeninos.
     */
    public function obtenerArray() {
        return [
            'nombre' => $this->nombre,
            'nivelHabilidad' => $this->nivelHabilidad,
            'reaccion' => $this->reaccion,
        ];
    }
}
