-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-03-2017 a las 12:38:58
-- Versión del servidor: 10.1.21-MariaDB
-- Versión de PHP: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `biblio`
--
CREATE DATABASE IF NOT EXISTS `biblio` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `biblio`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libro`
--

DROP TABLE IF EXISTS `libro`;
CREATE TABLE `libro` (
  `isbn` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `titulo` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `autor` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `genero` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `n_paginas` varchar(9999) COLLATE utf8_spanish_ci NOT NULL,
  `id_usuario` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `libro`
--

INSERT INTO `libro` (`isbn`, `titulo`, `autor`, `genero`, `n_paginas`, `id_usuario`) VALUES
('9788401017421', 'Lo ultimo que veran tus ojos', 'Isabel San Sebastian', 'narrativa hispanoamericana', '400', ''),
('9788408155546', 'La viuda', 'Fiona Barton', 'Novela Negra', '528', ''),
('9788408163176', 'Todo esto te daré', 'Dolores Redondo', 'Novela Negra', '624', ''),
('9788498380798', 'El niño con el pijama de rayas', 'John Boyne', 'Drama', '224', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamo`
--

DROP TABLE IF EXISTS `prestamo`;
CREATE TABLE `prestamo` (
  `id_prestamo` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_salida` date NOT NULL,
  `fecha_devolucion` date NOT NULL,
  `sancion` tinyint(1) NOT NULL,
  `isbn` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `id_usuario` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `prestamo`
--

INSERT INTO `prestamo` (`id_prestamo`, `fecha_salida`, `fecha_devolucion`, `sancion`, `isbn`, `id_usuario`) VALUES
('123', '2017-03-01', '2017-03-14', 0, '', ''),
('459', '2017-03-08', '2017-03-22', 0, '9788498380798', '3654'),
('567', '2017-03-15', '2017-03-26', 0, '', ''),
('897', '2017-02-15', '2017-03-01', 0, '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `id_usuario` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `dni` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `apellidos` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `telefono` varchar(12) COLLATE utf8_spanish_ci NOT NULL,
  `id_prestamo` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `dni`, `nombre`, `apellidos`, `telefono`, `id_prestamo`) VALUES
('3654', '36251478N', 'Leila', 'Palma Berth', '587412369', ''),
('4587', '65987321D', 'Elisa', 'Ruiz Jimenez', '6548975315', ''),
('7985', '36925814L', 'Gerardo', 'Alba Luis', '987321456', ''),
('9514', '36548258P', 'Peyo', 'Laguna Pérez', '946587125', '');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `libro`
--
ALTER TABLE `libro`
  ADD PRIMARY KEY (`isbn`);

--
-- Indices de la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD PRIMARY KEY (`id_prestamo`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
