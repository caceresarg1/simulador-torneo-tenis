<?php

namespace tenischallenge\tests;

use PHPUnit\Framework\TestCase;
use tenischallenge\Entidades\Femenino;
use tenischallenge\Entidades\Masculino;
use tenischallenge\Servicios\ChallengeServicios;

class ChallengeTest extends TestCase {
    public function testChallenge() {

        $jugadoresMasculinos = [
            new Masculino("Guillermo Vilas", "90", "90", "85"),
            new Masculino('Juan Martin del Potro', '80', '70', '75'),
            new Masculino('David Nalbandian', '85', '80', '75'),
            new Masculino('José Luis Clerc', '76', '74', '63'),
            new Masculino('Guillermo Coria', '70', '80', '64'),
            new Masculino('Gastón Gaudio', '60', '70', '45'),
            new Masculino('Martín Jaite', '70', '68', '69'),
            new Masculino('Diego Schwartzman', '80', '70', '83'),
            new Masculino('Guillermo Cañas', '86', '76', '65'),
            new Masculino('Juan Mónaco', '87', '76', '86'),
            new Masculino('Federico Delbonis', '66', '70', '80'),
            new Masculino('Francisco Cerúndolo', '70', '75', '70'),
            new Masculino('Juan Ignacio Chela', '50', '55', '70'),
            new Masculino('Mariano Puerta', '50', '60', '45'),
            new Masculino('Agustín Calleri', '60', '45', '65'),
            new Masculino('Carlos Berlocq', '77', '70', '75'),
        ];
        
        $jugadorasFemeninos = [
            new Femenino("Gabriela Sabatini", "90", "90"),
            new Femenino('Paola Suárez', '80', '70'),
            new Femenino('Nadia Podoroska', '85', '80'),
            new Femenino('Gisela Dulko', '76', '74'),
            new Femenino('Florencia Labat', '70', '80'),
            new Femenino('Clarisa Fernández', '60', '70'),
            new Femenino('María José López', '70', '68'),
            new Femenino('Patricia Tarabini', '80', '70'),
            new Femenino('Paula Ormaechea', '86', '76'),
            new Femenino('Norma Baylon', '87', '76'),
            new Femenino('Mercedes Paz', '87', '76'),
            new Femenino('Catalina Castaño', '87', '76'),
            new Femenino('Florencia Molinero', '87', '76'),
            new Femenino('Mariana Díaz Oliva', '87', '76'),
            new Femenino('Victoria Bosio', '87', '76'),
            new Femenino('Tatiana Búa', '87', '76'),
        ];
        
        $jugadores = ['jugadoresMasculinos' => $jugadoresMasculinos,
                    'jugadorasFemeninos' => $jugadorasFemeninos];

        $torneoServicios    = new ChallengeServicios($jugadores);
        $ganadores          = $torneoServicios->torneoXGeneros();

        $this->assertNotNull($ganadores['masculino'], "Debe haber un ganador masculino.");
        $this->assertNotNull($ganadores['femenino'], "Debe haber un ganador femenino.");

        $this->assertInstanceOf(Masculino::class, $ganadores['masculino']);
        $this->assertInstanceOf(Femenino::class, $ganadores['femenino']);

    }
}