-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-11-2024 a las 06:16:54
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tenis_challenge`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jugadores`
--

CREATE TABLE `jugadores` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `genero` enum('M','F') NOT NULL,
  `habilidad` int(11) NOT NULL CHECK (`habilidad` between 0 and 100),
  `fuerza` int(11) DEFAULT NULL CHECK (`fuerza` between 0 and 100),
  `velocidad` int(11) DEFAULT NULL CHECK (`velocidad` between 0 and 100),
  `tiempo_reaccion` int(11) DEFAULT NULL CHECK (`tiempo_reaccion` between 0 and 100),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `jugadores`
--

INSERT INTO `jugadores` (`id`, `nombre`, `genero`, `habilidad`, `fuerza`, `velocidad`, `tiempo_reaccion`, `created_at`) VALUES
(1, 'Guillermo Vilas', 'M', 82, 95, 31, NULL, '2024-11-01 00:11:49'),
(2, 'Juan Martin del Potro', 'M', 70, 54, 62, NULL, '2024-11-01 00:11:49'),
(3, 'David Nalbandian', 'M', 47, 49, 2, NULL, '2024-11-01 00:11:49'),
(4, 'José Luis Clerc', 'M', 68, 30, 48, NULL, '2024-11-01 00:11:49'),
(5, 'Guillermo Coria', 'M', 50, 6, 80, NULL, '2024-11-01 00:11:49'),
(6, 'Gastón Gaudio', 'M', 81, 65, 82, NULL, '2024-11-01 00:11:49'),
(7, 'Martín Jaite', 'M', 15, 31, 10, NULL, '2024-11-01 00:11:49'),
(8, 'Diego Schwartzman', 'M', 59, 61, 27, NULL, '2024-11-01 00:11:49'),
(9, 'Guillermo Cañas', 'M', 56, 100, 27, NULL, '2024-11-01 00:11:49'),
(10, 'Juan Mónaco', 'M', 36, 1, 97, NULL, '2024-11-01 00:11:49'),
(11, 'Federico Delbonis', 'M', 81, 15, 31, NULL, '2024-11-01 00:11:49'),
(12, 'Francisco Cerúndolo', 'M', 10, 57, 56, NULL, '2024-11-01 00:11:49'),
(13, 'Juan Ignacio Chela', 'M', 6, 65, 7, NULL, '2024-11-01 00:11:49'),
(14, 'Mariano Puerta', 'M', 41, 82, 87, NULL, '2024-11-01 00:11:49'),
(15, 'Agustín Calleri', 'M', 88, 79, 29, NULL, '2024-11-01 00:11:49'),
(16, 'Carlos Berlocq', 'M', 11, 70, 13, NULL, '2024-11-01 00:11:49'),
(17, 'Gabriela Sabatini', 'F', 69, NULL, NULL, 62, '2024-11-01 00:16:20'),
(18, 'Paola Suárez', 'F', 2, NULL, NULL, 28, '2024-11-01 00:16:20'),
(19, 'Nadia Podoroska', 'F', 35, NULL, NULL, 90, '2024-11-01 00:16:20'),
(20, 'Gisela Dulko', 'F', 44, NULL, NULL, 51, '2024-11-01 00:16:20'),
(21, 'Florencia Labat', 'F', 23, NULL, NULL, 61, '2024-11-01 00:16:20'),
(22, 'Clarisa Fernández', 'F', 35, NULL, NULL, 96, '2024-11-01 00:16:20'),
(23, 'María José López', 'F', 69, NULL, NULL, 60, '2024-11-01 00:16:20'),
(24, 'Patricia Tarabini', 'F', 94, NULL, NULL, 87, '2024-11-01 00:16:20'),
(25, 'Paula Ormaechea', 'F', 54, NULL, NULL, 7, '2024-11-01 00:16:20'),
(26, 'Norma Baylon', 'F', 76, NULL, NULL, 56, '2024-11-01 00:16:20'),
(27, 'Mercedes Paz', 'F', 53, NULL, NULL, 98, '2024-11-01 00:16:20'),
(28, 'Catalina Castaño', 'F', 30, NULL, NULL, 57, '2024-11-01 00:16:20'),
(29, 'Florencia Molinero', 'F', 93, NULL, NULL, 95, '2024-11-01 00:16:20'),
(30, 'Mariana Díaz Oliva', 'F', 96, NULL, NULL, 93, '2024-11-01 00:16:20'),
(31, 'Victoria Bosio', 'F', 75, NULL, NULL, 100, '2024-11-01 00:16:20'),
(32, 'Tatiana Búa', 'F', 70, NULL, NULL, 53, '2024-11-01 00:16:20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partidos`
--

CREATE TABLE `partidos` (
  `id` int(11) NOT NULL,
  `id_torneo` int(11) NOT NULL,
  `fase` int(11) NOT NULL,
  `id_jugador1` int(11) NOT NULL,
  `rendimiento1` int(11) NOT NULL,
  `id_jugador2` int(11) NOT NULL,
  `rendimiento2` int(11) NOT NULL,
  `id_ganador` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `torneos`
--

CREATE TABLE `torneos` (
  `id_torneo` int(11) NOT NULL,
  `tipo_torneo` enum('MASCULINO','FEMENINO') NOT NULL,
  `ganador` varchar(250) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `torneos`
--

INSERT INTO `torneos` (`id_torneo`, `tipo_torneo`, `ganador`, `fecha`) VALUES
(4, 'MASCULINO', 'Gastón Gaudio', '2024-11-05 16:21:22'),
(5, 'FEMENINO', 'Patricia Tarabini', '2024-11-05 16:21:22'),
(6, 'MASCULINO', 'Gastón Gaudio', '2024-11-06 04:42:58'),
(7, 'FEMENINO', 'Florencia Molinero', '2024-11-06 04:42:58'),
(8, 'MASCULINO', 'Gastón Gaudio', '2024-11-06 04:52:38'),
(9, 'FEMENINO', 'Patricia Tarabini', '2024-11-06 04:52:38'),
(10, 'MASCULINO', 'Gastón Gaudio', '2024-11-06 04:52:56'),
(11, 'FEMENINO', 'Patricia Tarabini', '2024-11-06 04:52:56'),
(12, 'MASCULINO', 'Gastón Gaudio', '2024-11-06 04:53:44'),
(13, 'FEMENINO', 'Patricia Tarabini', '2024-11-06 04:53:44'),
(14, 'MASCULINO', 'Gastón Gaudio', '2024-11-06 04:54:30'),
(15, 'FEMENINO', 'Florencia Molinero', '2024-11-06 04:54:30'),
(16, 'MASCULINO', 'Gastón Gaudio', '2024-11-06 04:55:05'),
(17, 'FEMENINO', 'Patricia Tarabini', '2024-11-06 04:55:05'),
(18, 'MASCULINO', 'Agustín Calleri', '2024-11-06 04:55:21'),
(19, 'FEMENINO', 'Patricia Tarabini', '2024-11-06 04:55:21'),
(20, 'MASCULINO', 'Gastón Gaudio', '2024-11-06 04:55:39'),
(21, 'FEMENINO', 'Patricia Tarabini', '2024-11-06 04:55:39'),
(22, 'MASCULINO', 'Gastón Gaudio', '2024-11-06 04:55:54'),
(23, 'FEMENINO', 'Mariana Díaz Oliva', '2024-11-06 04:55:54'),
(24, 'MASCULINO', 'Gastón Gaudio', '2024-11-06 04:56:30'),
(25, 'FEMENINO', 'Patricia Tarabini', '2024-11-06 04:56:30'),
(26, 'MASCULINO', 'Gastón Gaudio', '2024-11-06 04:56:54'),
(27, 'FEMENINO', 'Patricia Tarabini', '2024-11-06 04:56:54'),
(28, 'MASCULINO', 'Gastón Gaudio', '2024-11-06 04:57:12'),
(29, 'FEMENINO', 'Patricia Tarabini', '2024-11-06 04:57:12'),
(30, 'MASCULINO', 'Gastón Gaudio', '2024-11-06 04:57:49'),
(31, 'FEMENINO', 'Florencia Molinero', '2024-11-06 04:57:49'),
(32, 'MASCULINO', 'Gastón Gaudio', '2024-11-06 04:58:12'),
(33, 'FEMENINO', 'Patricia Tarabini', '2024-11-06 04:58:12'),
(34, 'MASCULINO', 'Guillermo Vilas', '2024-11-06 04:58:36'),
(35, 'FEMENINO', 'Mariana Díaz Oliva', '2024-11-06 04:58:36'),
(36, 'MASCULINO', 'Gastón Gaudio', '2024-11-06 04:59:32'),
(37, 'FEMENINO', 'Patricia Tarabini', '2024-11-06 04:59:32'),
(38, 'MASCULINO', 'Gastón Gaudio', '2024-11-06 05:00:22'),
(39, 'FEMENINO', 'Mariana Díaz Oliva', '2024-11-06 05:00:22'),
(40, 'MASCULINO', 'Gastón Gaudio', '2024-11-06 05:00:53'),
(41, 'FEMENINO', 'Patricia Tarabini', '2024-11-06 05:00:53'),
(42, 'MASCULINO', 'Gastón Gaudio', '2024-11-06 05:08:32'),
(43, 'FEMENINO', 'Florencia Molinero', '2024-11-06 05:08:32'),
(44, 'MASCULINO', 'Gastón Gaudio', '2024-11-06 05:08:51'),
(45, 'FEMENINO', 'Mariana Díaz Oliva', '2024-11-06 05:08:51');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `jugadores`
--
ALTER TABLE `jugadores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `partidos`
--
ALTER TABLE `partidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `torneo_id` (`id_torneo`);

--
-- Indices de la tabla `torneos`
--
ALTER TABLE `torneos`
  ADD PRIMARY KEY (`id_torneo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `jugadores`
--
ALTER TABLE `jugadores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `partidos`
--
ALTER TABLE `partidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `torneos`
--
ALTER TABLE `torneos`
  MODIFY `id_torneo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `partidos`
--
ALTER TABLE `partidos`
  ADD CONSTRAINT `partidos_ibfk_1` FOREIGN KEY (`id_torneo`) REFERENCES `torneos` (`id_torneo`),
  ADD CONSTRAINT `partidos_ibfk_2` FOREIGN KEY (`id_jugador1`) REFERENCES `jugadores` (`id`),
  ADD CONSTRAINT `partidos_ibfk_3` FOREIGN KEY (`id_jugador2`) REFERENCES `jugadores` (`id`),
  ADD CONSTRAINT `partidos_ibfk_4` FOREIGN KEY (`id_ganador`) REFERENCES `jugadores` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
