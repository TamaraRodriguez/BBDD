-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-03-2017 a las 13:20:02
-- Versión del servidor: 10.1.21-MariaDB
-- Versión de PHP: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `eventos`
--
CREATE DATABASE IF NOT EXISTS `eventos` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `eventos`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE `clientes` (
  `ref_cliente` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `ref_evento` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `fecha` date NOT NULL,
  `Nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Apellido_1` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Apellido_2` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `DNI` varchar(9) COLLATE utf8_spanish_ci NOT NULL,
  `Direccion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `Poblacion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `Ciudad` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `CodigoPostal` int(5) NOT NULL,
  `Telefono` varchar(12) COLLATE utf8_spanish_ci NOT NULL,
  `Email` varchar(25) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eventos`
--

DROP TABLE IF EXISTS `eventos`;
CREATE TABLE `eventos` (
  `ref_evento` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `clase` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `ref_clientes` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `ref_personal` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `lugar` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `fecha` date NOT NULL,
  `material` varchar(1000) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `monitores`
--

DROP TABLE IF EXISTS `monitores`;
CREATE TABLE `monitores` (
  `Ref_monitores` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `Ref_clientes` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `Fecha` date NOT NULL,
  `Nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Apellido_1` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Apellido_2` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `DNI` varchar(9) COLLATE utf8_spanish_ci NOT NULL,
  `Direccion` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Poblacion` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Ciudad` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `CodigoPostal` varchar(5) COLLATE utf8_spanish_ci NOT NULL,
  `Telefono` varchar(12) COLLATE utf8_spanish_ci NOT NULL,
  `Email` varchar(25) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal`
--

DROP TABLE IF EXISTS `personal`;
CREATE TABLE `personal` (
  `Monitores` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `Guias` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `Decoradores` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `Proveedores` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `Lipiadores` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `Cocineros` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `Otros` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`ref_cliente`),
  ADD UNIQUE KEY `DNI` (`DNI`),
  ADD KEY `ref_evento` (`ref_evento`);

--
-- Indices de la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD PRIMARY KEY (`ref_evento`),
  ADD KEY `ref_clientes` (`ref_clientes`),
  ADD KEY `ref_personal` (`ref_personal`);

--
-- Indices de la tabla `monitores`
--
ALTER TABLE `monitores`
  ADD PRIMARY KEY (`Ref_monitores`),
  ADD KEY `Ref_clientes` (`Ref_clientes`);

--
-- Indices de la tabla `personal`
--
ALTER TABLE `personal`
  ADD PRIMARY KEY (`Monitores`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`ref_cliente`) REFERENCES `eventos` (`ref_clientes`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `monitores`
--
ALTER TABLE `monitores`
  ADD CONSTRAINT `monitores_ibfk_1` FOREIGN KEY (`Ref_monitores`) REFERENCES `eventos` (`ref_personal`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `personal`
--
ALTER TABLE `personal`
  ADD CONSTRAINT `personal_ibfk_1` FOREIGN KEY (`Monitores`) REFERENCES `eventos` (`ref_personal`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
