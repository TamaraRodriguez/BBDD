-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-03-2017 a las 13:25:33
-- Versión del servidor: 10.1.21-MariaDB
-- Versión de PHP: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `restaurante`
--
CREATE DATABASE IF NOT EXISTS `restaurante` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `restaurante`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cajeros`
--

DROP TABLE IF EXISTS `cajeros`;
CREATE TABLE `cajeros` (
  `Ref_Cajero` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `Nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Apellido_1` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Apellido_2` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `DNI` varchar(9) COLLATE utf8_spanish_ci NOT NULL,
  `Telefono` varchar(12) COLLATE utf8_spanish_ci NOT NULL,
  `Direccion` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Poblacion` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Ciudad` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `CodigoPostal` varchar(5) COLLATE utf8_spanish_ci NOT NULL,
  `CatgProfesional` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `Uniforme` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `Horario` varchar(25) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cocina`
--

DROP TABLE IF EXISTS `cocina`;
CREATE TABLE `cocina` (
  `Ref_cocinero` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `Ref_pedido` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `Comida` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `Bebida` varchar(25) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
CREATE TABLE `pedidos` (
  `Ref_pedido` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `Ref_cajero` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `Ref_cocinero` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `Fecha_emitido` varchar(25) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `restaurante`
--

DROP TABLE IF EXISTS `restaurante`;
CREATE TABLE `restaurante` (
  `Ref_Restaurante` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `Ref_pedido` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `Personal` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `Cocina` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `Barra` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `Sala` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `Limpieza` varchar(25) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cajeros`
--
ALTER TABLE `cajeros`
  ADD PRIMARY KEY (`Ref_Cajero`),
  ADD UNIQUE KEY `DNI` (`DNI`),
  ADD UNIQUE KEY `Ref_Cajero` (`Ref_Cajero`);

--
-- Indices de la tabla `cocina`
--
ALTER TABLE `cocina`
  ADD PRIMARY KEY (`Ref_cocinero`),
  ADD UNIQUE KEY `Ref_cocinero` (`Ref_cocinero`),
  ADD UNIQUE KEY `Ref_pedido` (`Ref_pedido`),
  ADD KEY `Ref_pedido_2` (`Ref_pedido`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`Ref_pedido`),
  ADD UNIQUE KEY `Ref_pedido` (`Ref_pedido`),
  ADD KEY `Ref_cajero` (`Ref_cajero`),
  ADD KEY `Ref_cocinero` (`Ref_cocinero`);

--
-- Indices de la tabla `restaurante`
--
ALTER TABLE `restaurante`
  ADD PRIMARY KEY (`Ref_Restaurante`),
  ADD KEY `Ref_pedido` (`Ref_pedido`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cajeros`
--
ALTER TABLE `cajeros`
  ADD CONSTRAINT `cajeros_ibfk_1` FOREIGN KEY (`Ref_Cajero`) REFERENCES `pedidos` (`Ref_cajero`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`Ref_pedido`) REFERENCES `restaurante` (`Ref_pedido`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`Ref_cocinero`) REFERENCES `cocina` (`Ref_cocinero`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
