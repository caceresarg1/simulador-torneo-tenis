<?php

require 'vendor/autoload.php';

use Slim\Factory\AppFactory;

use tenischallenge\Controllers\ChallengeControlador;
use tenischallenge\Repositorios\DataJugadores;
use tenischallenge\Servicios\ChallengeServicios;

// Instancia de las dependencias manualmente
$DataJugadores = new DataJugadores();
$ChallengeServicios = new ChallengeServicios($DataJugadores);
$challengeControlador = new ChallengeControlador($ChallengeServicios, $DataJugadores);

$app = AppFactory::create();

// Agregar esto para manejar el subdirectorio
$app->setBasePath('/tenischallenge');

$app->post('/api/iniciarChallenge', [$challengeControlador, 'iniciarChallenge']);
$app->get('/api/obtenerJugadores', [$challengeControlador, 'obtenerJugadores']);

$app->addErrorMiddleware(true, true, true);

$app->run();