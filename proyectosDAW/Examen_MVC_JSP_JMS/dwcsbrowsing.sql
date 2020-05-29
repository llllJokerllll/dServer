-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-05-2020 a las 16:19:00
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
-- Base de datos: `dwcsbrowsing`
--
CREATE DATABASE IF NOT EXISTS `dwcsbrowsing` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `dwcsbrowsing`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visitapaxina`
--

CREATE TABLE `visitapaxina` (
  `id` int(11) NOT NULL,
  `ipcliente` varchar(20) NOT NULL,
  `urlsolicitude` varchar(200) NOT NULL,
  `claseservlet` varchar(200) NOT NULL,
  `rutaservlet` varchar(200) NOT NULL,
  `jspvista` varchar(200) NOT NULL,
  `data` date NOT NULL,
  `hora` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `visitapaxina`
--

INSERT INTO `visitapaxina` (`id`, `ipcliente`, `urlsolicitude`, `claseservlet`, `rutaservlet`, `jspvista`, `data`, `hora`) VALUES
(33, '127.0.0.1', 'http://localhost:8080/exame_maio/visitaPaxinaView', 'VisitaPaxinaServlet', '/visitaPaxinaView', 'visitaPaxinaView.jsp', '2020-05-27', '13:28:25'),
(34, '127.0.0.1', 'http://localhost:8080/exame_maio/visitaPaxinaView', 'VisitaPaxinaServlet', '/visitaPaxinaView', 'visitaPaxinaView.jsp', '2020-05-27', '13:28:34'),
(35, '127.0.0.1', 'http://localhost:8080/exame_maio/sidney', 'DestinoServlet', '/sidney', 'sidney.jsp', '2020-05-27', '13:28:44'),
(36, '127.0.0.1', 'http://localhost:8080/exame_maio/coche', 'VeiculoServlet', '/coche', 'coche.jsp', '2020-05-27', '13:28:45'),
(37, '127.0.0.1', 'http://localhost:8080/exame_maio/visitaPaxinaView', 'VisitaPaxinaServlet', '/visitaPaxinaView', 'visitaPaxinaView.jsp', '2020-05-27', '13:28:46'),
(38, '127.0.0.1', 'http://localhost:8080/exame_maio/visitaPaxinaView', 'VisitaPaxinaServlet', '/visitaPaxinaView', 'visitaPaxinaView.jsp', '2020-05-27', '13:29:15'),
(39, '127.0.0.1', 'http://localhost:8080/exame_maio/visitaPaxinaView', 'VisitaPaxinaServlet', '/visitaPaxinaView', 'visitaPaxinaView.jsp', '2020-05-27', '16:03:03'),
(40, '127.0.0.1', 'http://localhost:8080/exame_maio/visitaPaxinaView', 'VisitaPaxinaServlet', '/visitaPaxinaView', 'visitaPaxinaView.jsp', '2020-05-27', '16:03:04'),
(41, '127.0.0.1', 'http://localhost:8080/exame_maio/visitaPaxinaView', 'VisitaPaxinaServlet', '/visitaPaxinaView', 'visitaPaxinaView.jsp', '2020-05-27', '16:03:05'),
(42, '127.0.0.1', 'http://localhost:8080/exame_maio/visitaPaxinaView', 'VisitaPaxinaServlet', '/visitaPaxinaView', 'visitaPaxinaView.jsp', '2020-05-27', '16:03:06'),
(43, '127.0.0.1', 'http://localhost:8080/exame_maio/visitaPaxinaView', 'VisitaPaxinaServlet', '/visitaPaxinaView', 'visitaPaxinaView.jsp', '2020-05-27', '16:03:07'),
(44, '127.0.0.1', 'http://localhost:8080/exame_maio/coche', 'VeiculoServlet', '/coche', 'coche.jsp', '2020-05-27', '16:03:09'),
(45, '127.0.0.1', 'http://localhost:8080/exame_maio/visitaPaxinaView', 'VisitaPaxinaServlet', '/visitaPaxinaView', 'visitaPaxinaView.jsp', '2020-05-27', '16:03:10'),
(46, '127.0.0.1', 'http://localhost:8080/exame_maio/coche', 'VeiculoServlet', '/coche', 'coche.jsp', '2020-05-27', '16:03:13'),
(47, '127.0.0.1', 'http://localhost:8080/exame_maio/coche', 'VeiculoServlet', '/coche', 'coche.jsp', '2020-05-27', '16:03:14'),
(48, '127.0.0.1', 'http://localhost:8080/exame_maio/coche', 'VeiculoServlet', '/coche', 'coche.jsp', '2020-05-27', '16:03:14'),
(49, '127.0.0.1', 'http://localhost:8080/exame_maio/visitaPaxinaView', 'VisitaPaxinaServlet', '/visitaPaxinaView', 'visitaPaxinaView.jsp', '2020-05-27', '16:03:15'),
(50, '127.0.0.1', 'http://localhost:8080/exame_maio/coche', 'VeiculoServlet', '/coche', 'coche.jsp', '2020-05-27', '16:03:18'),
(51, '127.0.0.1', 'http://localhost:8080/exame_maio/visitaPaxinaView', 'VisitaPaxinaServlet', '/visitaPaxinaView', 'visitaPaxinaView.jsp', '2020-05-27', '16:03:19');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `visitapaxina`
--
ALTER TABLE `visitapaxina`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `visitapaxina`
--
ALTER TABLE `visitapaxina`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
