<?php

namespace tenischallenge\Entidades;

class Femenino extends Jugador {
    private $reaccion;

    public function __construct($nombre, $nivelHabilidad, $reaccion) {
        parent::__construct($nombre, $nivelHabilidad);
        $this->reaccion = $reaccion;
    }

    public function calcularRendimiento() {
        return $this->nivelHabilidad + $this->reaccion;
    }

    public function obtenerNombre() {
        return $this->nombre;
    }

    public function obtenerArray() {
        return [
            'nombre' => $this->nombre,
            'nivelHabilidad' => $this->nivelHabilidad,
            'reaccion' => $this->reaccion,
        ];
    }
}
