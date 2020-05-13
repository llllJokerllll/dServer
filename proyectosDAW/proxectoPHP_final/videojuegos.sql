-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-05-2020 a las 20:05:00
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `videojuegos`
--
CREATE DATABASE IF NOT EXISTS `videojuegos` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `videojuegos`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `juegos`
--

CREATE TABLE `juegos` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `plataforma` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `descricion` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ano` int(4) NOT NULL,
  `imagen` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `online` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `juegos`
--

INSERT INTO `juegos` (`id`, `nome`, `plataforma`, `descricion`, `ano`, `imagen`, `online`) VALUES
(1, 'Final Fantasy VII', 'PS4', 'Remake del mejor Final Fantasy de la historia.', 2020, 'ffvii.jpg', 0),
(2, 'Carmageddon', 'PC', 'Juego de coches, donde cuantas mas personas atropelles y coches destroces mas puntos consigues!.', 1997, 'carma.jpg', 1),
(3, 'Halo', 'Xbox', 'Juego de tiros futurista', 2001, 'halo.jpg', 1),
(5, 'Mario Bros', 'Nintendo', 'Juego de plataformas', 1983, 'mb.jpg', 0),
(10, 'League of legeds', 'PC', 'Juego de rol', 2009, 'lol.jpg', 1),
(11, 'Dota 2', 'PC', 'Juego de rol y estrategia', 2013, 'dota2.jpg', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `username` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `nomeCompleto` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `tipoUsuario` varchar(20) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `username`, `password`, `nomeCompleto`, `tipoUsuario`) VALUES
(1, 'admin', 'Ourense9', 'Jose Manuel Sabarís', 'admin'),
(2, 'invitado', 'invitado', 'invitado', 'invitado');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `juegos`
--
ALTER TABLE `juegos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `juegos`
--
ALTER TABLE `juegos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
