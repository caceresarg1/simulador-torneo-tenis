-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-11-2024 a las 05:25:45
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
-- Base de datos: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Volcado de datos para la tabla `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"tenis_challenge\",\"table\":\"partidos\"},{\"db\":\"tenis_challenge\",\"table\":\"jugadores\"},{\"db\":\"tenis_challenge\",\"table\":\"torneos\"}]');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Volcado de datos para la tabla `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2024-11-07 04:25:39', '{\"Console\\/Mode\":\"collapse\",\"lang\":\"es\"}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indices de la tabla `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indices de la tabla `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indices de la tabla `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indices de la tabla `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indices de la tabla `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indices de la tabla `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indices de la tabla `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indices de la tabla `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indices de la tabla `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indices de la tabla `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indices de la tabla `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indices de la tabla `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indices de la tabla `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Base de datos: `tenis_challenge`
--
CREATE DATABASE IF NOT EXISTS `tenis_challenge` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `tenis_challenge`;

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
  `jugador1` varchar(250) NOT NULL,
  `rendimiento1` int(11) NOT NULL,
  `jugador2` varchar(250) NOT NULL,
  `rendimiento2` int(11) NOT NULL,
  `ganador` varchar(250) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `partidos`
--

INSERT INTO `partidos` (`id`, `id_torneo`, `fase`, `jugador1`, `rendimiento1`, `jugador2`, `rendimiento2`, `ganador`, `fecha`) VALUES
(3, 51, 1, 'Guillermo Vilas', 241, 'Juan Martin del Potro', 187, 'Guillermo Vilas', '2024-11-07 00:43:34'),
(4, 51, 1, 'Nadia Podoroska', 137, 'Gisela Dulko', 113, 'Nadia Podoroska', '2024-11-07 00:43:34');

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
(45, 'FEMENINO', 'Mariana Díaz Oliva', '2024-11-06 05:08:51'),
(46, 'MASCULINO', 'Mariano Puerta', '2024-11-06 20:54:58'),
(47, 'FEMENINO', 'Patricia Tarabini', '2024-11-06 20:54:58'),
(48, 'MASCULINO', 'Gastón Gaudio', '2024-11-07 00:28:55'),
(49, 'FEMENINO', 'Mariana Díaz Oliva', '2024-11-07 00:28:55'),
(50, 'MASCULINO', 'Mariano Puerta', '2024-11-07 00:43:34'),
(51, 'FEMENINO', 'Patricia Tarabini', '2024-11-07 00:43:34');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `torneos`
--
ALTER TABLE `torneos`
  MODIFY `id_torneo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
--
-- Base de datos: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
