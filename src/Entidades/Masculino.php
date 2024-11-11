<?php

namespace tenischallenge\Entidades;

class Masculino extends Jugador {
    private $fuerza;
    private $velocidad;

    public function __construct($nombre, $nivelHabilidad, $fuerza, $velocidad) {
        parent::__construct($nombre, $nivelHabilidad);
        $this->fuerza = $fuerza;
        $this->velocidad = $velocidad;
    }

    /**
     * Calculo de rendimiento del partidos del challenge masculino
     */
    public function calcularRendimiento() {
        return $this->nivelHabilidad + $this->fuerza + $this->velocidad;
    }

    /**
     * Obtener el apellido y nombre de los jugadores masculinos.
     */
    public function obtenerNombre() {
        return $this->nombre;
    }

    /**
     * Obtener array de  los datos de los jugadores masculinos.
     */
    public function obtenerArray() {
        return [
            'nombre' => $this->nombre,
            'nivelHabilidad' => $this->nivelHabilidad,
            'fuerza' => $this->fuerza,
            'velocidad' => $this->velocidad,
        ];
    }
}
