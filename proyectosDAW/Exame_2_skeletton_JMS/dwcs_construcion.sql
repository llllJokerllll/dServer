-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-04-2020 a las 13:33:05
-- Versión del servidor: 10.1.35-MariaDB
-- Versión de PHP: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dwcs_construcion`
--
CREATE DATABASE IF NOT EXISTS `dwcs_construcion` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `dwcs_construcion`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lotetroncos`
--

CREATE TABLE `lotetroncos` (
  `id` int(11) NOT NULL,
  `nome` varchar(20) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `nomeCompleto` varchar(50) NOT NULL,
  `tipo` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `valoraciontroncos`
--

CREATE TABLE `valoraciontroncos` (
  `id` int(11) NOT NULL,
  `madeira` varchar(50) NOT NULL,
  `cantidade` int(11) NOT NULL,
  `altura` decimal(10,2) NOT NULL,
  `radio` decimal(10,2) NOT NULL,
  `desconto` int(11) NOT NULL,
  `volume` int(11) NOT NULL,
  `idLote` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `lotetroncos`
--
ALTER TABLE `lotetroncos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `valoraciontroncos`
--
ALTER TABLE `valoraciontroncos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idLote` (`idLote`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `lotetroncos`
--
ALTER TABLE `lotetroncos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `valoraciontroncos`
--
ALTER TABLE `valoraciontroncos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `valoraciontroncos`
--
ALTER TABLE `valoraciontroncos`
  ADD CONSTRAINT `valoraciontroncos_ibfk_1` FOREIGN KEY (`idLote`) REFERENCES `lotetroncos` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
