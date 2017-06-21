-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-03-2017 a las 09:44:08
-- Versión del servidor: 10.1.21-MariaDB
-- Versión de PHP: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `laerea`
--
CREATE DATABASE IF NOT EXISTS `laerea` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `laerea`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE `clientes` (
  `Ref_Cliente` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Apellido_1` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `Apellido_2` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `Edad` int(150) NOT NULL,
  `Telefono` varchar(12) COLLATE utf8_spanish_ci NOT NULL,
  `Email` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `Ref_Origen` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Ref_Destino` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compañia`
--

DROP TABLE IF EXISTS `compañia`;
CREATE TABLE `compañia` (
  `Ref_Compañia` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `Direccion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `Telefono` varchar(12) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `destino`
--

DROP TABLE IF EXISTS `destino`;
CREATE TABLE `destino` (
  `Ref_Destino` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `N_Aeropuerto` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Ciudad` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Cod_Ciudad` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `origen`
--

DROP TABLE IF EXISTS `origen`;
CREATE TABLE `origen` (
  `Ref_origen` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `N_Aeropuerto` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Ciudad` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Cod_Ciudad` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pasaje`
--

DROP TABLE IF EXISTS `pasaje`;
CREATE TABLE `pasaje` (
  `Ref_Pasaje` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Clase` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Asiento` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Valor` varchar(999) COLLATE utf8_spanish_ci NOT NULL,
  `Ref_Cliente` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Ref_Vuelo` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Cod_Origen` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Cod_Destino` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vuelo`
--

DROP TABLE IF EXISTS `vuelo`;
CREATE TABLE `vuelo` (
  `Ref_Vuelo` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Capacidad` varchar(999) COLLATE utf8_spanish_ci NOT NULL,
  `Mod_Avion` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `N_Vuelo` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Compañia` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Itinerario` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`Ref_Cliente`),
  ADD KEY `Ref_Origen` (`Ref_Origen`),
  ADD KEY `Ref_Destino` (`Ref_Destino`);

--
-- Indices de la tabla `compañia`
--
ALTER TABLE `compañia`
  ADD PRIMARY KEY (`Ref_Compañia`);

--
-- Indices de la tabla `destino`
--
ALTER TABLE `destino`
  ADD PRIMARY KEY (`Ref_Destino`);

--
-- Indices de la tabla `origen`
--
ALTER TABLE `origen`
  ADD PRIMARY KEY (`Ref_origen`);

--
-- Indices de la tabla `pasaje`
--
ALTER TABLE `pasaje`
  ADD PRIMARY KEY (`Ref_Pasaje`),
  ADD KEY `Ref_Cliente` (`Ref_Cliente`),
  ADD KEY `Ref_Vuelo` (`Ref_Vuelo`),
  ADD KEY `Cod_Origen` (`Cod_Origen`),
  ADD KEY `Cod_Destino` (`Cod_Destino`);

--
-- Indices de la tabla `vuelo`
--
ALTER TABLE `vuelo`
  ADD PRIMARY KEY (`Ref_Vuelo`),
  ADD KEY `Compañia` (`Compañia`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compañia`
--
ALTER TABLE `compañia`
  ADD CONSTRAINT `compañia_ibfk_1` FOREIGN KEY (`Ref_Compañia`) REFERENCES `vuelo` (`Compañia`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `destino`
--
ALTER TABLE `destino`
  ADD CONSTRAINT `destino_ibfk_1` FOREIGN KEY (`Ref_Destino`) REFERENCES `pasaje` (`Cod_Destino`) ON DELETE CASCADE;

--
-- Filtros para la tabla `pasaje`
--
ALTER TABLE `pasaje`
  ADD CONSTRAINT `pasaje_ibfk_1` FOREIGN KEY (`Ref_Vuelo`) REFERENCES `vuelo` (`Ref_Vuelo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pasaje_ibfk_2` FOREIGN KEY (`Cod_Origen`) REFERENCES `origen` (`Ref_origen`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pasaje_ibfk_3` FOREIGN KEY (`Ref_Cliente`) REFERENCES `clientes` (`Ref_Cliente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `vuelo`
--
ALTER TABLE `vuelo`
  ADD CONSTRAINT `vuelo_ibfk_1` FOREIGN KEY (`Compañia`) REFERENCES `compañia` (`Ref_Compañia`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
