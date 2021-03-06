-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-09-2016 a las 02:16:46
-- Versión del servidor: 5.6.21
-- Versión de PHP: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `inventario`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_del_producto`(
p_id_producto int
)
begin
delete from
tbl_producto
where
id_producto=p_id_producto;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_ins_producto`(
id_unidad_medida int
,nombre varchar(100)
,descripcion varchar(500)
)
begin
insert into tbl_producto
(id_unidad_medida,nombre,descripcion)
values
(id_unidad_medida,nombre,descripcion);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_sel_productos`()
begin
select
*
from
nombre_vistas;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_upd_producto`(
p_id_producto int
,p_id_unidad_medida int
,p_nombre varchar(100)
,p_descripcion varchar(500)
)
begin
update tbl_producto
set
id_unidad_medida = p_id_unidad_medida
,nombre=p_nombre
,descripcion=p_descripcion
where
id_producto=p_id_producto;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `P_PERSONAS_P`(
personas_id int
,nombres varchar(500)
,apellidos varchar(500)
,accion int
)
begin
if accion =0  then  select * from personas_tbl;
end if;
end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `nombre_vistas`
--
CREATE TABLE IF NOT EXISTS `nombre_vistas` (
`id_producto` int(11)
,`nombre` varchar(100)
,`descripcion` varchar(500)
,`unidad_medida` varchar(50)
);
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas_tbl`
--

CREATE TABLE IF NOT EXISTS `personas_tbl` (
`personas_id` int(11) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `personas_tbl`
--

INSERT INTO `personas_tbl` (`personas_id`, `nombres`, `apellidos`) VALUES
(1, 'edwin', 'paredes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_producto`
--

CREATE TABLE IF NOT EXISTS `tbl_producto` (
`id_producto` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `id_unidad_medida` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_unidad_medida`
--

CREATE TABLE IF NOT EXISTS `tbl_unidad_medida` (
`id_unidad_medida` int(11) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `abreviado` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura para la vista `nombre_vistas`
--
DROP TABLE IF EXISTS `nombre_vistas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `nombre_vistas` AS select `a`.`id_producto` AS `id_producto`,`a`.`nombre` AS `nombre`,`a`.`descripcion` AS `descripcion`,`b`.`descripcion` AS `unidad_medida` from (`tbl_producto` `a` left join `tbl_unidad_medida` `b` on((`a`.`id_unidad_medida` = `b`.`id_unidad_medida`)));

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `personas_tbl`
--
ALTER TABLE `personas_tbl`
 ADD PRIMARY KEY (`personas_id`);

--
-- Indices de la tabla `tbl_producto`
--
ALTER TABLE `tbl_producto`
 ADD PRIMARY KEY (`id_producto`), ADD KEY `fk_tbl_producto_tbl_unidad_medida_idx` (`id_unidad_medida`);

--
-- Indices de la tabla `tbl_unidad_medida`
--
ALTER TABLE `tbl_unidad_medida`
 ADD PRIMARY KEY (`id_unidad_medida`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `personas_tbl`
--
ALTER TABLE `personas_tbl`
MODIFY `personas_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `tbl_producto`
--
ALTER TABLE `tbl_producto`
MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tbl_unidad_medida`
--
ALTER TABLE `tbl_unidad_medida`
MODIFY `id_unidad_medida` int(11) NOT NULL AUTO_INCREMENT;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_producto`
--
ALTER TABLE `tbl_producto`
ADD CONSTRAINT `fk_tbl_producto_tbl_unidad_medida` FOREIGN KEY (`id_unidad_medida`) REFERENCES `tbl_unidad_medida` (`id_unidad_medida`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
