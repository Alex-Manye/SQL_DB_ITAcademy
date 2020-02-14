-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 14-02-2020 a las 19:32:22
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `CuldAmpolla`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Clients`
--

CREATE TABLE `Clients` (
  `name` varchar(20) NOT NULL,
  `lastName` varchar(30) NOT NULL,
  `postal_code` int(10) NOT NULL,
  `phone` int(15) NOT NULL,
  `email` varchar(30) NOT NULL,
  `registrationDate` date NOT NULL,
  `id_code_glasses` int(15) NOT NULL,
  `id_client` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Employee`
--

CREATE TABLE `Employee` (
  `name` varchar(20) NOT NULL,
  `lastName` varchar(20) NOT NULL,
  `nif` varchar(15) NOT NULL,
  `Id_code_glasses_sold` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Glasses`
--

CREATE TABLE `Glasses` (
  `id_code` int(15) NOT NULL,
  `model` varchar(20) NOT NULL,
  `supplier` varchar(30) NOT NULL,
  `frame` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `Glasses`
--

INSERT INTO `Glasses` (`id_code`, `model`, `supplier`, `frame`) VALUES
(1515, 'Max27', 'Onix', 'Oval');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Referal_by`
--

CREATE TABLE `Referal_by` (
  `id_client` int(15) NOT NULL,
  `referedBy` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Supplier`
--

CREATE TABLE `Supplier` (
  `name` varchar(30) NOT NULL,
  `cif` varchar(10) NOT NULL,
  `street` text NOT NULL,
  `number` int(7) NOT NULL,
  `floor` varchar(10) NOT NULL,
  `door` varchar(5) NOT NULL,
  `city` varchar(30) NOT NULL,
  `postalCode` int(10) NOT NULL,
  `country` text NOT NULL,
  `phone` varchar(15) NOT NULL,
  `fax` varchar(15) NOT NULL,
  `id_code_glasses` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `Supplier`
--

INSERT INTO `Supplier` (`name`, `cif`, `street`, `number`, `floor`, `door`, `city`, `postalCode`, `country`, `phone`, `fax`, `id_code_glasses`) VALUES
('Onix', 'B-6789675', 'Av.Magallanes -27', 27, '2', 'A', 'Madrid', 28036, 'Spain', '935556670', '935556673', 1515);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Clients`
--
ALTER TABLE `Clients`
  ADD PRIMARY KEY (`id_client`),
  ADD KEY `id_code_glasses` (`id_code_glasses`);

--
-- Indices de la tabla `Employee`
--
ALTER TABLE `Employee`
  ADD KEY `Id_code_glasses_sold` (`Id_code_glasses_sold`);

--
-- Indices de la tabla `Glasses`
--
ALTER TABLE `Glasses`
  ADD PRIMARY KEY (`id_code`),
  ADD UNIQUE KEY `supplier` (`supplier`);

--
-- Indices de la tabla `Referal_by`
--
ALTER TABLE `Referal_by`
  ADD UNIQUE KEY `id_client` (`id_client`),
  ADD KEY `referedBy` (`referedBy`);

--
-- Indices de la tabla `Supplier`
--
ALTER TABLE `Supplier`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `id_code_glasses` (`id_code_glasses`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Glasses`
--
ALTER TABLE `Glasses`
  MODIFY `id_code` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1516;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Clients`
--
ALTER TABLE `Clients`
  ADD CONSTRAINT `clients_ibfk_1` FOREIGN KEY (`id_code_glasses`) REFERENCES `Glasses` (`id_code`);

--
-- Filtros para la tabla `Employee`
--
ALTER TABLE `Employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`Id_code_glasses_sold`) REFERENCES `Glasses` (`id_code`);

--
-- Filtros para la tabla `Referal_by`
--
ALTER TABLE `Referal_by`
  ADD CONSTRAINT `referal_by_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `Clients` (`id_client`);

--
-- Filtros para la tabla `Supplier`
--
ALTER TABLE `Supplier`
  ADD CONSTRAINT `supplier_ibfk_1` FOREIGN KEY (`id_code_glasses`) REFERENCES `Glasses` (`id_code`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
