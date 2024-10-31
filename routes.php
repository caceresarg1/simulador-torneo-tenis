<?php

require 'vendor/autoload.php';

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\Factory\AppFactory;

use tenischallenge\Controllers\ChallengeControlador;
use tenischallenge\Repositorios\DataJugadores;
use tenischallenge\Servicios\ChallengeServicios;

// $app = AppFactory::create();

// // Instancia de las dependencias manualmente
$DataJugadores = new DataJugadores();
$ChallengeServicios = new ChallengeServicios($DataJugadores);

$challengeControlador = new ChallengeControlador($ChallengeServicios, $DataJugadores);

// // $app->post('/api/iniciarChallenge', [$challengeControlador, 'iniciarChallenge']);
// // $app->get('/api/challenge', [$challengeControlador, 'leerChallenge']);
// $app->get('/api/test', function (Request $request, Response $response) {
//     $response->getBody()->write("Hello, World!");
//     return $response;
// });

// $app->addErrorMiddleware(true, true, true);

// $app->run();

$app = AppFactory::create();

// Agregar esto para manejar el subdirectorio
$app->setBasePath('/tenischallenge');

$app->post('/api/iniciarChallenge', [$challengeControlador, 'iniciarChallenge']);

// $app->get('/test', function (Request $request, Response $response) {
//     $response->getBody()->write("Hello");
//     return $response;
// });

$app->addErrorMiddleware(true, true, true);

$app->run();