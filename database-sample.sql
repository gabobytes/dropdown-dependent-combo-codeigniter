-- Database sample on dependent dropdown Codeigniter
-- by Gabriel Melo
-- gabrielmeloarteaga@gmail.com


SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


--
-- database: `dropdown`
--
-- CREATE DATABASE `dropdown` DEFAULT CHARACTER SET utf8 ;
-- --------------------------------------------------------

--
-- structure table `cities`
--

CREATE TABLE IF NOT EXISTS `cities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `namecity` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `idstate` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fkcitycountry_idx` (`idstate`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=38 ;

--
-- data for table `cities`
--

INSERT INTO `cities` (`id`, `namecity`, `idstate`) VALUES
(1, 'medellin', 1),
(2, 'envigado', 1),
(3, 'bello', 1),
(4, 'popayan', 2),
(5, 'silvia', 2),
(6, 'piendam', 2),
(7, 'rosas', 2),
(8, 'timbio', 2),
(9, 'new york', 5),
(10, 'bufalo', 5),
(11, 'rochester', 5),
(12, 'fremont', 6),
(13, 'irvine', 6),
(14, 'san francisco', 6),
(15, 'grand prairie', 7),
(16, 'houston', 7),
(17, 'san antonio', 7),
(18, 'palermo', 9),
(19, 'catania', 9),
(20, 'gela', 9),
(21, 'genova', 8),
(22, 'imperia', 8),
(23, 'la spezia', 8),
(24, 'celaya', 10),
(25, 'guanajuato', 10),
(26, 'irapuato', 10),
(27, 'cuidad juarez', 11),
(28, 'delicias', 11),
(29, 'pasto', 4),
(30, 'ipiales', 4),
(31, 'tuquerres', 4),
(32, 'tumaco', 4),
(33, 'cali', 3),
(34, 'palmira', 3),
(35, 'cartago', 3),
(36, 'buga', 3),
(37, 'tulua', 3);

-- --------------------------------------------------------

--
-- structure table `countries`
--

CREATE TABLE IF NOT EXISTS `countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `namecountry` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- data table for `countries`
--

INSERT INTO `countries` (`id`, `namecountry`) VALUES
(1, 'colombia'),
(2, 'italy'),
(3, 'usa'),
(4, 'mexico');

-- --------------------------------------------------------

--
-- structure table `states`
--

CREATE TABLE IF NOT EXISTS `states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `namestate` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `idcountry` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fkstatecountry_idx` (`idcountry`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=12 ;

--
-- data table for `states`
--

INSERT INTO `states` (`id`, `namestate`, `idcountry`) VALUES
(1, 'antioquia', 1),
(2, 'cauca', 1),
(3, 'valle del cauca', 1),
(4, 'nariño', 1),
(5, 'new york', 3),
(6, 'california', 3),
(7, 'texas', 3),
(8, 'liguria', 2),
(9, 'sicilia', 2),
(10, 'guanajuato', 4),
(11, 'chihuahua', 4);


--
-- Filtros para la tabla `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `fkcitystate` FOREIGN KEY (`idstate`) REFERENCES `states` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `states`
--
ALTER TABLE `states`
  ADD CONSTRAINT `fkstatecountry` FOREIGN KEY (`idcountry`) REFERENCES `countries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
