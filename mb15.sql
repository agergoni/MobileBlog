-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-03-2015 a las 11:15:57
-- Versión del servidor: 5.6.17
-- Versión de PHP: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `mb15`
--
CREATE DATABASE IF NOT EXISTS `mb15` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `mb15`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulo`
--

DROP TABLE IF EXISTS `articulo`;
CREATE TABLE IF NOT EXISTS `articulo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'fecha del artículo',
  `titulo` varchar(250) NOT NULL DEFAULT 'Sin titulo' COMMENT 'título del articulo',
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Volcado de datos para la tabla `articulo`
--

INSERT INTO `articulo` (`id`, `fecha`, `titulo`, `id_usuario`) VALUES
(8, '2015-03-16 16:15:35', 'Nuevo articulo sobre peces', 3),
(9, '2015-03-16 16:17:15', 'PHP un lenguaje anarkiko', 3),
(13, '2015-03-26 09:12:09', 'Billabong xxl ', 1),
(14, '2015-03-26 09:14:18', 'Nuevo articulo333', 1),
(17, '2015-03-26 09:32:27', 'sssseeeerrr', 1),
(18, '2015-03-26 09:33:41', 'Java mola mucho', 3),
(19, '2015-03-26 09:38:32', 'Recien creado', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(250) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `rol` int(1) NOT NULL DEFAULT '1' COMMENT '0=Administrador  1=usuario',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `email`, `password`, `nombre`, `rol`) VALUES
(1, 'auraga@ipartek.com', '123456', 'Ander', 0),
(2, 'tu@email.com', '123456', 'dummy', 1),
(3, 'agerbat@gmail.com', '123456', 'Ager12', 1);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `articulo`
--
ALTER TABLE `articulo`
  ADD CONSTRAINT `articulo_necesita_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
