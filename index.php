<?php

require 'vendor/autoload.php';

use tenischallenge\Entidades\Masculino;
use tenischallenge\Entidades\Femenino;
use tenischallenge\Entidades\Challenge;


$femenino1 = new Femenino("Gabriela Sabatini", "90", "85");
$femenino2 = new Femenino("Gisela Dulko", "80", "70");

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

echo "=== Torneo Masculino ===\n";
$challenge = new Challenge($jugadoresMasculinos);
$ganadorMasculino = $challenge->iniciarChallenge();
echo "Ganador Challenge Masculino: " . $ganadorMasculino->obtenerNombre();
