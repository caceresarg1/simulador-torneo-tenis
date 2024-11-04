<?php

namespace tenischallenge\tests;

use PhpParser\Node\Expr\FuncCall;
use PHPUnit\Framework\TestCase;
use tenischallenge\Entidades\Challenge;
use tenischallenge\Entidades\Femenino;
use tenischallenge\Entidades\Masculino;
use tenischallenge\Repositorios\DataJugadores;
use tenischallenge\Servicios\ChallengeServicios;

class ChallengeTest extends TestCase {

    public function testChallenge() {
        $dataJugadores = new DataJugadores();
        
        $torneoServicios    = new ChallengeServicios($dataJugadores);
        $ganadores          = $torneoServicios->torneoXGeneros();

        $this->assertNotNull($ganadores['masculino'], "Debe haber un ganador masculino.");
        $this->assertNotNull($ganadores['femenino'], "Debe haber un ganador femeninas.");

        $this->assertInstanceOf(Masculino::class, $ganadores['masculino']);
        $this->assertInstanceOf(Femenino::class, $ganadores['femenino']);

    }

    public function testCalcularRendimiento() {
        $jugadorMasculino   = new Masculino('test masculino', 80, 90, 85);
        $jugadorFemenino    = new Femenino('test femenino', 85, 95);

        $rendimientoMasculino   = $jugadorMasculino->calcularRendimiento();
        $rendimientoFemenino    = $jugadorFemenino->calcularRendimiento();

        $this->assertEquals(255, $rendimientoMasculino, "El calculo de rendimiento masculino no es el esperado.");
        $this->assertEquals(180, $rendimientoFemenino, "El calculo de rendimiento femenino no es el esperado.");
    }

    public function testSeleccionGanador() {
        //Crear 2 jugadores de prueba con sus respectivas caracteristicas
        $jugador1   = new Masculino('Jugador 1', 70, 60, 80);
        $jugador2   = new Masculino('Jugador 2', 75, 85, 70);

        //Crear el servicio de challenge
        $challenge  = new Challenge([$jugador1, $jugador2]);
        $ganador    =  $challenge->testSimularPartido($jugador1, $jugador2);


        //Simular un partido
        $this->assertSame($jugador2, $ganador, 'El ganador esperado no es el correcto.');

    }
}