<?php
namespace tenischallenge\Entidades;

abstract class Jugador {
    protected $nombre;
    protected $nivelHabilidad;

    public function __construct($nombre, $nivelHabilidad) {
        $this->nombre           = $nombre;
        $this->nivelHabilidad   = $nivelHabilidad;
    }

    abstract public function calcularRendimiento();

    public function obtenerNombre() {
        return $this->nombre;
    }
}