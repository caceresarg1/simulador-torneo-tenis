<?php

require 'vendor/autoload.php';

use tenischallenge\Entidades\Masculino;
use tenischallenge\Entidades\Femenino;
use tenischallenge\Servicios\ChallengeServicios;

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
];

$jugadores = ['jugadoresMasculinos' => $jugadoresMasculinos,
              'jugadorasFemeninos' => $jugadorasFemeninos];

echo "=== Torneo Masculino ===\n";
echo '<br>';
$torneoServicios    = new ChallengeServicios($jugadores);
$ganadores          = $torneoServicios->torneoXGeneros();
echo "Ganador Challenge Masculino: " . $ganadorMasculino->obtenerNombre();

// echo '<br><br>';

// echo "=== Torneo Femenino ===\n";
// echo '<br>';
// $challenge = new Challenge($jugadorasFemeninos);
// $ganadorFemenino = $challenge->iniciarChallenge();
// echo "Ganador Challenge Femenino: " . $ganadorFemenino->obtenerNombre();

