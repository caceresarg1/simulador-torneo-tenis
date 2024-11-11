<?php

namespace tenischallenge\Repositorios;

use PDO;

use tenischallenge\Config\Database;
use tenischallenge\Entidades\Femenino;
use tenischallenge\Entidades\Masculino;

class DataJugadores {

    private  $db;

    public  function __construct() {
        $this->db = (new Database)->getConnection();
    }

    /**
     * Listar  todos los jugadores almacenados en la base de datos, separandolos por genero

     */
    function obtenerJugadores() {
        $jugadoresMasculinos = [];
        $jugadorasFemeninos = [];

        //Consulta para obtener los jugadores
        $query = "SELECT * FROM jugadores";
        $consulta =  $this->db->prepare($query);
        $consulta->execute();

        while($row = $consulta->fetch(\PDO::FETCH_ASSOC)) {
            if($row['genero'] == 'M') {
                $jugadoresMasculinos[] = new Masculino($row['nombre'], $row['habilidad'], $row['fuerza'], $row['velocidad']);
            } elseif ($row['genero'] == 'F') {
                $jugadorasFemeninos[] = new Femenino($row['nombre'], $row['habilidad'], $row['tiempo_reaccion']);
            }

        }

        return ['jugadoresMasculinos' => $jugadoresMasculinos,
                'jugadorasFemeninos' => $jugadorasFemeninos];
                

    }
}