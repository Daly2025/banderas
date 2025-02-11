-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-02-2025 a las 16:23:18
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `biblioteca`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autores`
--

CREATE TABLE `autores` (
  `ID_Autor` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `copias`
--

CREATE TABLE `copias` (
  `ID_Copia` int(11) NOT NULL,
  `ISBN` varchar(13) DEFAULT NULL,
  `seccion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `ISBN` varchar(13) NOT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `anio_publicacion` year(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libro_autor`
--

CREATE TABLE `libro_autor` (
  `ISBN` varchar(13) NOT NULL,
  `ID_Autor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `miembros`
--

CREATE TABLE `miembros` (
  `numero_miembro` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamos`
--

CREATE TABLE `prestamos` (
  `ID_Prestamo` int(11) NOT NULL,
  `numero_miembro` int(11) DEFAULT NULL,
  `ID_Copia` int(11) DEFAULT NULL,
  `fecha_prestamo` date DEFAULT NULL,
  `fecha_devolucion_previa` date DEFAULT NULL,
  `fecha_devolucion_real` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `autores`
--
ALTER TABLE `autores`
  ADD PRIMARY KEY (`ID_Autor`);

--
-- Indices de la tabla `copias`
--
ALTER TABLE `copias`
  ADD PRIMARY KEY (`ID_Copia`),
  ADD KEY `ISBN` (`ISBN`);

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`ISBN`);

--
-- Indices de la tabla `libro_autor`
--
ALTER TABLE `libro_autor`
  ADD PRIMARY KEY (`ISBN`,`ID_Autor`),
  ADD KEY `ID_Autor` (`ID_Autor`);

--
-- Indices de la tabla `miembros`
--
ALTER TABLE `miembros`
  ADD PRIMARY KEY (`numero_miembro`);

--
-- Indices de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD PRIMARY KEY (`ID_Prestamo`),
  ADD KEY `numero_miembro` (`numero_miembro`),
  ADD KEY `ID_Copia` (`ID_Copia`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `autores`
--
ALTER TABLE `autores`
  MODIFY `ID_Autor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `copias`
--
ALTER TABLE `copias`
  MODIFY `ID_Copia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `miembros`
--
ALTER TABLE `miembros`
  MODIFY `numero_miembro` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  MODIFY `ID_Prestamo` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `copias`
--
ALTER TABLE `copias`
  ADD CONSTRAINT `copias_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `libros` (`ISBN`) ON DELETE CASCADE;

--
-- Filtros para la tabla `libro_autor`
--
ALTER TABLE `libro_autor`
  ADD CONSTRAINT `libro_autor_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `libros` (`ISBN`) ON DELETE CASCADE,
  ADD CONSTRAINT `libro_autor_ibfk_2` FOREIGN KEY (`ID_Autor`) REFERENCES `autores` (`ID_Autor`) ON DELETE CASCADE;

--
-- Filtros para la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD CONSTRAINT `prestamos_ibfk_1` FOREIGN KEY (`numero_miembro`) REFERENCES `miembros` (`numero_miembro`) ON DELETE CASCADE,
  ADD CONSTRAINT `prestamos_ibfk_2` FOREIGN KEY (`ID_Copia`) REFERENCES `copias` (`ID_Copia`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
