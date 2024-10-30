<?php

use Slim\Factory\AppFactory;
use tenischallenge\controllers\ChallengeControlador;

require 'vendor/autoload.php';

$app = AppFactory::create();

$app->post('/api/iniciarChallenge', [ChallengeControlador::class, 'iniciarChallenge']);

$app->get('/api/challenge', [ChallengeControlador::class, 'leerChallenge']);

$app->run();