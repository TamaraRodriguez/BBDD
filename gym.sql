-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-03-2017 a las 13:25:01
-- Versión del servidor: 10.1.21-MariaDB
-- Versión de PHP: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gym`
--
CREATE DATABASE IF NOT EXISTS `gym` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `gym`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clases`
--

DROP TABLE IF EXISTS `clases`;
CREATE TABLE `clases` (
  `Ref_Clase` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `Ref_Sala` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `Ref_Monitor` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `Fecha` date NOT NULL,
  `Horario` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `Maquinas` varchar(25) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gym`
--

DROP TABLE IF EXISTS `gym`;
CREATE TABLE `gym` (
  `Ref_gym` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `Personal` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `Salas` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `Clases` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `Maquinas` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `Vestuario` varchar(25) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal`
--

DROP TABLE IF EXISTS `personal`;
CREATE TABLE `personal` (
  `Ref_Monitor` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `Ref_Clases` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `Nombre` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `Apellido_1` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `Apellido_2` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `DNI` varchar(9) COLLATE utf8_spanish_ci NOT NULL,
  `Telefono` varchar(12) COLLATE utf8_spanish_ci NOT NULL,
  `Direccion` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `Poblacion` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `Ciudad` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `CodigoPostal` varchar(5) COLLATE utf8_spanish_ci NOT NULL,
  `Catg_Profesional` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `Horario` varchar(25) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salas`
--

DROP TABLE IF EXISTS `salas`;
CREATE TABLE `salas` (
  `Ref_Sala` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `Ref_Clase` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `Ref_Monitor` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `Maquinas` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `Fecha` date NOT NULL,
  `Horario` varchar(25) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clases`
--
ALTER TABLE `clases`
  ADD PRIMARY KEY (`Ref_Clase`),
  ADD KEY `Ref_Sala` (`Ref_Sala`),
  ADD KEY `Ref_Monitor` (`Ref_Monitor`);

--
-- Indices de la tabla `gym`
--
ALTER TABLE `gym`
  ADD PRIMARY KEY (`Ref_gym`),
  ADD UNIQUE KEY `Ref_gym` (`Ref_gym`),
  ADD KEY `Personal` (`Personal`),
  ADD KEY `Salas` (`Salas`),
  ADD KEY `Clases` (`Clases`);

--
-- Indices de la tabla `personal`
--
ALTER TABLE `personal`
  ADD PRIMARY KEY (`Ref_Monitor`),
  ADD UNIQUE KEY `Ref_Monitor` (`Ref_Monitor`),
  ADD UNIQUE KEY `DNI` (`DNI`),
  ADD KEY `Ref_Clases` (`Ref_Clases`);

--
-- Indices de la tabla `salas`
--
ALTER TABLE `salas`
  ADD PRIMARY KEY (`Ref_Sala`),
  ADD UNIQUE KEY `Ref_Sala` (`Ref_Sala`),
  ADD UNIQUE KEY `Ref_Monitor` (`Ref_Monitor`),
  ADD KEY `Ref_Clase` (`Ref_Clase`),
  ADD KEY `Ref_Monitor_2` (`Ref_Monitor`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clases`
--
ALTER TABLE `clases`
  ADD CONSTRAINT `clases_ibfk_1` FOREIGN KEY (`Ref_Clase`) REFERENCES `gym` (`Clases`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `personal`
--
ALTER TABLE `personal`
  ADD CONSTRAINT `personal_ibfk_1` FOREIGN KEY (`Ref_Monitor`) REFERENCES `gym` (`Personal`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `salas`
--
ALTER TABLE `salas`
  ADD CONSTRAINT `salas_ibfk_1` FOREIGN KEY (`Ref_Sala`) REFERENCES `gym` (`Salas`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
