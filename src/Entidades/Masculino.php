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

    public function calcularRendimiento() {
        return $this->nivelHabilidad + $this->fuerza + $this->velocidad;
    }

    public function obtenerNombre() {
        return $this->nombre;
    }

    public function obtenerArray() {
        // error_log("obtenerArray llamado para: " . $this->nombre);
        return [
            'nombre' => $this->nombre,
            'nivelHabilidad' => $this->nivelHabilidad,
            'fuerza' => $this->fuerza,
            'velocidad' => $this->velocidad,
        ];
    }
}
