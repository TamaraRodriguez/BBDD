-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-03-2017 a las 13:25:45
-- Versión del servidor: 10.1.21-MariaDB
-- Versión de PHP: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tienda`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `N_Cliente` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Ref_Pedido` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Apellido_1` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Apellido_2` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `DNI` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `Señal` varchar(99) COLLATE utf8_spanish_ci NOT NULL,
  `Telefono` varchar(12) COLLATE utf8_spanish_ci NOT NULL,
  `Email` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Direccion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `Poblacion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `Ciudad` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `CodigoPostal` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `diseño`
--

CREATE TABLE `diseño` (
  `Ref_Diseño` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Ref_Producto` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Tipo_Diseño` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Lugar_Fabricacion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `Año_Fabricacion` date NOT NULL,
  `DNI` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `Otros_Datos` varchar(1500) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modelo`
--

CREATE TABLE `modelo` (
  `Ref_Modelo` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Ref_Diseño` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Ref_Producto` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Especificaciones` varchar(1500) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `muebles`
--

CREATE TABLE `muebles` (
  `Ref_Producto` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `N_Vendedor` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `N_Cliente` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Modelo` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Color` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `N_Cajones` int(100) NOT NULL,
  `N_Puertas` int(100) NOT NULL,
  `Peso` varchar(999) COLLATE utf8_spanish_ci NOT NULL,
  `Precio` int(99) NOT NULL,
  `Embalaje` tinyint(1) NOT NULL,
  `Restaurado` tinyint(1) NOT NULL,
  `Diseño` varchar(25) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vendedor`
--

CREATE TABLE `vendedor` (
  `N_Vendedor` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Clientes` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Total_Ventas` mediumtext COLLATE utf8_spanish_ci NOT NULL,
  `Ref_Pedido` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `Apellido_1` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `Apellido_2` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `DNI` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `Telefono` varchar(12) COLLATE utf8_spanish_ci NOT NULL,
  `Email` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Direccion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `Poblacion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `Ciudad` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `CodigoPostal` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`N_Cliente`),
  ADD KEY `DNI` (`DNI`);

--
-- Indices de la tabla `diseño`
--
ALTER TABLE `diseño`
  ADD PRIMARY KEY (`Ref_Diseño`),
  ADD KEY `Ref_Producto` (`Ref_Producto`),
  ADD KEY `DNI` (`DNI`);

--
-- Indices de la tabla `modelo`
--
ALTER TABLE `modelo`
  ADD PRIMARY KEY (`Ref_Modelo`),
  ADD KEY `Ref_Producto` (`Ref_Producto`),
  ADD KEY `Ref_Diseño` (`Ref_Diseño`);

--
-- Indices de la tabla `muebles`
--
ALTER TABLE `muebles`
  ADD PRIMARY KEY (`Ref_Producto`),
  ADD KEY `Diseño` (`Diseño`),
  ADD KEY `N_Vendedor` (`N_Vendedor`),
  ADD KEY `N_Cliente` (`N_Cliente`),
  ADD KEY `Modelo` (`Modelo`);

--
-- Indices de la tabla `vendedor`
--
ALTER TABLE `vendedor`
  ADD PRIMARY KEY (`N_Vendedor`),
  ADD KEY `Clientes` (`Clientes`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `diseño`
--
ALTER TABLE `diseño`
  ADD CONSTRAINT `diseño_ibfk_1` FOREIGN KEY (`Ref_Producto`) REFERENCES `muebles` (`Ref_Producto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `diseño_ibfk_2` FOREIGN KEY (`Ref_Diseño`) REFERENCES `muebles` (`Ref_Producto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `modelo`
--
ALTER TABLE `modelo`
  ADD CONSTRAINT `modelo_ibfk_1` FOREIGN KEY (`Ref_Diseño`) REFERENCES `diseño` (`Ref_Diseño`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `muebles`
--
ALTER TABLE `muebles`
  ADD CONSTRAINT `muebles_ibfk_1` FOREIGN KEY (`Diseño`) REFERENCES `diseño` (`Ref_Diseño`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `muebles_ibfk_2` FOREIGN KEY (`Modelo`) REFERENCES `modelo` (`Ref_Modelo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `muebles_ibfk_3` FOREIGN KEY (`N_Cliente`) REFERENCES `clientes` (`N_Cliente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `vendedor`
--
ALTER TABLE `vendedor`
  ADD CONSTRAINT `vendedor_ibfk_1` FOREIGN KEY (`N_Vendedor`) REFERENCES `muebles` (`N_Vendedor`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
