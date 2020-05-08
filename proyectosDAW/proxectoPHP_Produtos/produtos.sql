-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-04-2020 a las 17:00:37
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
-- Base de datos: `produtos`
--
CREATE DATABASE IF NOT EXISTS `produtos` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `produtos`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoriaproduto`
--

CREATE TABLE `categoriaproduto` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `descricion` varchar(200) DEFAULT NULL,
  `activado` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categoriaproduto`
--

INSERT INTO `categoriaproduto` (`id`, `nome`, `descricion`, `activado`) VALUES
(1, 'Refrescos', NULL, 1),
(2, 'Cervezas', NULL, 1),
(4, 'Licores', 'Con moito alcol', 0),
(8, 'Zumes', 'Moi azucarados', 1),
(9, 'Aperitivos mediodía', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `produto`
--

CREATE TABLE `produto` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `prezo` decimal(10,2) NOT NULL,
  `descricion` varchar(200) DEFAULT NULL,
  `activado` tinyint(1) NOT NULL DEFAULT '1',
  `idCategoriaProduto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `produto`
--

INSERT INTO `produto` (`id`, `nome`, `prezo`, `descricion`, `activado`, `idCategoriaProduto`) VALUES
(7, 'Coca cola 33cl', '1.50', NULL, 1, 2),
(10, 'Kas de limón', '1.40', NULL, 1, 2),
(13, 'San Miguel 0,0', '1.20', 'Cervexa con moita tradición no mercado', 1, 2),
(14, 'Bitter Kas', '1.75', 'Descatalogado', 0, 9);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoriaproduto`
--
ALTER TABLE `categoriaproduto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idCategoriaProduto` (`idCategoriaProduto`) USING BTREE;

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoriaproduto`
--
ALTER TABLE `categoriaproduto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `produto`
--
ALTER TABLE `produto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `produto_ibfk_1` FOREIGN KEY (`idCategoriaProduto`) REFERENCES `categoriaproduto` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
