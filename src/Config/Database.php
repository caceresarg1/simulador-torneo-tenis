<?php

namespace tenischallenge\Config;

require_once __DIR__ . '\Config.php';

use PDO;
use PDOException;

class Database {
    private $pdo;

    public function __construct() {
        $host   = DB_HOST;
        $db     = DB_NAME;
        $user   = DB_USER;
        $pass   = DB_PASS;

        $dsn = "mysql:host=$host;dbname=$db;charset=utf8";

        try {
            $this->pdo = new PDO($dsn, $user, $pass);
            $this->pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        } catch (PDOException $e) {
            die("Error de conexión a la base de datos: " . $e->getMessage());
        }
    }

    public function getConnection() {
        return $this->pdo;
    }
}
