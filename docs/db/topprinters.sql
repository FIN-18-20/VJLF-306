-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Mar 17 Décembre 2019 à 08:57
-- Version du serveur :  5.7.11
-- Version de PHP :  7.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `topprinters`
--
CREATE DATABASE IF NOT EXISTS `topprinters` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `topprinters`;

-- --------------------------------------------------------

--
-- Structure de la table `t_brands`
--

CREATE TABLE `t_brands` (
  `idBrands` int(11) NOT NULL,
  `braName` varchar(50) NOT NULL,
  `idConstructor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `t_brands`
--

INSERT INTO `t_brands` (`idBrands`, `braName`, `idConstructor`) VALUES
(1, 'EPSON', 1),
(2, 'CANON', 2),
(3, 'HP', 3),
(4, 'BROTHER', 4);

-- --------------------------------------------------------

--
-- Structure de la table `t_constructors`
--

CREATE TABLE `t_constructors` (
  `idConstructor` int(11) NOT NULL,
  `conName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `t_constructors`
--

INSERT INTO `t_constructors` (`idConstructor`, `conName`) VALUES
(1, 'EPSON'),
(2, 'CANON'),
(3, 'HP'),
(4, 'BROTHER');

-- --------------------------------------------------------

--
-- Structure de la table `t_consumables`
--

CREATE TABLE `t_consumables` (
  `idConsumable` int(11) NOT NULL,
  `csbName` varchar(50) NOT NULL,
  `csbDescription` text,
  `csbPrice` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `t_consumables`
--

INSERT INTO `t_consumables` (`idConsumable`, `csbName`, `csbDescription`, `csbPrice`) VALUES
(1, 'CANON CLI-581PB', 'Encre bleue', 12),
(2, 'HP 3HZ52AE', 'Encre CMYK', 98);

-- --------------------------------------------------------

--
-- Structure de la table `t_prices`
--

CREATE TABLE `t_prices` (
  `idPrice` int(11) NOT NULL,
  `priDate` date NOT NULL,
  `priValue` int(11) NOT NULL,
  `idPrinter` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `t_prices`
--

INSERT INTO `t_prices` (`idPrice`, `priDate`, `priValue`, `idPrinter`) VALUES
(1, '2019-07-01', 188, 1),
(2, '2019-08-01', 199, 1),
(3, '2019-09-01', 196, 1),
(4, '2019-10-01', 189, 1),
(5, '2019-11-01', 181, 1),
(6, '2019-07-01', 60, 2),
(7, '2019-08-01', 58, 2),
(8, '2019-09-01', 58, 2),
(9, '2019-10-01', 56, 2),
(10, '2019-11-01', 59, 2),
(11, '2019-07-01', 283, 3),
(12, '2019-08-01', 289, 3),
(13, '2019-09-01', 270, 3),
(14, '2019-10-01', 295, 3),
(15, '2019-11-01', 259, 3),
(16, '2019-07-01', 277, 4),
(17, '2019-08-01', 258, 4),
(18, '2019-09-01', 279, 4),
(19, '2019-10-01', 266, 4),
(20, '2019-11-01', 250, 4),
(21, '2019-07-01', 53, 5),
(22, '2019-08-01', 52, 5),
(23, '2019-09-01', 49, 5),
(24, '2019-10-01', 60, 5),
(25, '2019-11-01', 49, 5),
(26, '2019-07-01', 75, 6),
(27, '2019-08-01', 75, 6),
(28, '2019-09-01', 85, 6),
(29, '2019-10-01', 75, 6),
(30, '2019-11-01', 77, 6),
(31, '2019-07-01', 110, 7),
(32, '2019-08-01', 109, 7),
(33, '2019-09-01', 107, 7),
(34, '2019-10-01', 108, 7),
(35, '2019-11-01', 108, 7),
(36, '2019-07-01', 109, 8),
(37, '2019-08-01', 107, 8),
(38, '2019-09-01', 107, 8),
(39, '2019-10-01', 106, 8),
(40, '2019-11-01', 107, 8),
(41, '2019-07-01', 55, 9),
(42, '2019-08-01', 60, 9),
(43, '2019-09-01', 62, 9),
(44, '2019-10-01', 50, 9),
(45, '2019-11-01', 50, 9),
(46, '2019-07-01', 78, 10),
(47, '2019-08-01', 75, 10),
(48, '2019-09-01', 80, 10),
(49, '2019-10-01', 78, 10),
(50, '2019-11-01', 81, 10),
(51, '2019-07-01', 94, 11),
(52, '2019-08-01', 93, 11),
(53, '2019-09-01', 94, 11),
(54, '2019-10-01', 92, 11),
(55, '2019-11-01', 93, 11),
(56, '2019-07-01', 40, 12),
(57, '2019-08-01', 35, 12),
(58, '2019-09-01', 30, 12),
(59, '2019-10-01', 40, 12),
(60, '2019-11-01', 35, 12),
(61, '2019-07-01', 99, 13),
(62, '2019-08-01', 100, 13),
(63, '2019-09-01', 98, 13),
(64, '2019-10-01', 96, 13),
(65, '2019-11-01', 97, 13),
(66, '2019-07-01', 199, 14),
(67, '2019-08-01', 179, 14),
(68, '2019-09-01', 149, 14),
(69, '2019-10-01', 177, 14),
(70, '2019-11-01', 174, 14),
(71, '2019-07-01', 105, 15),
(72, '2019-08-01', 107, 15),
(73, '2019-09-01', 106, 15),
(74, '2019-10-01', 104, 15),
(75, '2019-11-01', 105, 15),
(76, '2019-07-01', 160, 16),
(77, '2019-08-01', 160, 16),
(78, '2019-09-01', 135, 16),
(79, '2019-10-01', 111, 16),
(80, '2019-11-01', 99, 16),
(81, '2019-07-01', 105, 17),
(82, '2019-08-01', 104, 17),
(83, '2019-09-01', 104, 17),
(84, '2019-10-01', 104, 17),
(85, '2019-11-01', 105, 17),
(86, '2019-07-01', 75, 18),
(87, '2019-08-01', 77, 18),
(88, '2019-09-01', 80, 18),
(89, '2019-10-01', 77, 18),
(90, '2019-11-01', 79, 18),
(91, '2019-07-01', 50, 19),
(92, '2019-08-01', 49, 19),
(93, '2019-09-01', 49, 19),
(94, '2019-10-01', 48, 19),
(95, '2019-11-01', 50, 19),
(96, '2019-07-01', 123, 20),
(97, '2019-08-01', 127, 20),
(98, '2019-09-01', 124, 20),
(99, '2019-10-01', 125, 20),
(100, '2019-11-01', 125, 20),
(101, '2019-07-01', 264, 21),
(102, '2019-08-01', 258, 21),
(103, '2019-09-01', 240, 21),
(104, '2019-10-01', 260, 21),
(105, '2019-11-01', 233, 21),
(106, '2019-07-01', 143, 22),
(107, '2019-08-01', 143, 22),
(108, '2019-09-01', 143, 22),
(109, '2019-10-01', 144, 22),
(110, '2019-11-01', 143, 22),
(111, '2019-07-01', 197, 23),
(112, '2019-08-01', 192, 23),
(113, '2019-09-01', 190, 23),
(114, '2019-10-01', 189, 23),
(115, '2019-11-01', 200, 23),
(116, '2019-07-01', 153, 24),
(117, '2019-08-01', 154, 24),
(118, '2019-09-01', 154, 24),
(119, '2019-10-01', 155, 24),
(120, '2019-11-01', 153, 24),
(121, '2019-07-01', 151, 25),
(122, '2019-08-01', 153, 25),
(123, '2019-09-01', 150, 25),
(124, '2019-10-01', 145, 25),
(125, '2019-11-01', 148, 25),
(126, '2019-07-01', 209, 26),
(127, '2019-08-01', 209, 26),
(128, '2019-09-01', 198, 26),
(129, '2019-10-01', 230, 26),
(130, '2019-11-01', 197, 26),
(131, '2019-07-01', 36, 27),
(132, '2019-08-01', 34, 27),
(133, '2019-09-01', 35, 27),
(134, '2019-10-01', 39, 27),
(135, '2019-11-01', 36, 27),
(136, '2019-07-01', 50, 28),
(137, '2019-08-01', 26, 28),
(138, '2019-09-01', 30, 28),
(139, '2019-10-01', 50, 28),
(140, '2019-11-01', 47, 28),
(141, '2019-07-01', 45, 29),
(142, '2019-08-01', 45, 29),
(143, '2019-09-01', 45, 29),
(144, '2019-10-01', 44, 29),
(145, '2019-11-01', 45, 29),
(146, '2019-07-01', 50, 30),
(147, '2019-08-01', 60, 30),
(148, '2019-09-01', 65, 30),
(149, '2019-10-01', 70, 30),
(150, '2019-11-01', 71, 30);

-- --------------------------------------------------------

--
-- Structure de la table `t_printers`
--

CREATE TABLE `t_printers` (
  `idPrinter` int(11) NOT NULL,
  `priName` varchar(50) NOT NULL,
  `priWidth` int(11) NOT NULL,
  `priHeight` int(11) NOT NULL,
  `priLength` int(11) NOT NULL,
  `priWeight` int(11) NOT NULL,
  `priPrintSpeed` int(11) NOT NULL,
  `priScanRes` int(11) NOT NULL,
  `priSales` int(11) NOT NULL,
  `idBrands` int(11) NOT NULL,
  `idSupplier` int(11) NOT NULL,
  `idConsumable` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `t_printers`
--

INSERT INTO `t_printers` (`idPrinter`, `priName`, `priWidth`, `priHeight`, `priLength`, `priWeight`, `priPrintSpeed`, `priScanRes`, `priSales`, `idBrands`, `idSupplier`, `idConsumable`) VALUES
(1, 'CANON PIXMA TS9550', 468, 366, 193, 10, 10, 2400, 253, 2, 1, 1),
(2, 'EPSON Expression Home XP-3100', 375, 300, 170, 4, 15, 2400, 2560, 1, 1, 1),
(3, 'EPSON EcoTank ET-2700', 375, 347, 187, 5, 15, 2400, 1234, 1, 1, 1),
(4, 'EPSON EcoTank ET-2750', 375, 347, 187, 6, 15, 2400, 6494, 1, 1, 1),
(5, 'CANON PIXMA TS5150', 425, 315, 147, 7, 7, 2400, 4781, 2, 1, 1),
(6, 'HP OfficeJet 5230 All-in-One', 445, 369, 190, 7, 17, 1200, 3320, 3, 1, 1),
(7, 'CANON PIXMA TR8550', 438, 351, 190, 8, 10, 2400, 1002, 2, 1, 2),
(8, 'HP LaserJet Pro MFP M28w', 360, 264, 197, 5, 8, 600, 2344, 3, 1, 1),
(9, 'CANON PIXMA TS5050', 372, 315, 126, 6, 9, 2400, 4861, 2, 1, 2),
(10, 'HP Envy Photo 6230 All-in-One', 454, 410, 161, 7, 8, 1200, 323, 3, 1, 1),
(11, 'CANON PIXMA TS5353', 403, 315, 148, 6, 7, 2400, 230, 2, 1, 1),
(12, 'CANON PIXMA TS3150 ', 435, 369, 145, 4, 4, 1200, 255, 2, 1, 2),
(13, 'HP OfficeJet Pro 6960 e-All-In-One', 464, 390, 229, 8, 4, 1200, 100, 3, 1, 1),
(14, 'EPSON EcoTank ET-2600', 445, 304, 149, 5, 15, 2400, 1982, 1, 1, 1),
(15, 'HP Envy Photo 7130 All-in-One', 454, 410, 160, 7, 9, 1200, 5903, 3, 1, 2),
(16, 'BROTHER MFC-J895DW', 400, 341, 172, 8, 27, 2400, 445, 4, 1, 2),
(17, 'BROTHER MFC-J491DW', 400, 341, 172, 8, 6, 2400, 20, 4, 1, 1),
(18, 'CANON PIXMA MG5750', 455, 369, 148, 6, 9, 2400, 88, 2, 1, 2),
(19, 'EPSON Expression Home XP-455', 390, 300, 146, 4, 5, 2400, 1249, 1, 1, 2),
(20, 'HP DeskJet 3636 All-In-One', 438, 310, 158, 4, 6, 1200, 3232, 3, 1, 2),
(21, 'HP OfficeJet 250 Mobile All-In-One', 380, 401, 269, 5, 5, 600, 17, 3, 1, 1),
(22, 'CANON PIXMA TS8351', 373, 319, 141, 7, 10, 4800, 200, 2, 1, 2),
(23, 'EPSON Expression Photo XP-960 ', 479, 148, 356, 9, 28, 4800, 4956, 1, 1, 2),
(24, 'BROTHER DCP-L2530DW', 410, 399, 319, 10, 15, 1200, 2323, 4, 1, 2),
(25, 'BROTHER MFC-J5330DW', 530, 398, 304, 17, 9, 2400, 23, 4, 1, 1),
(26, 'CANON Maxify MB5450', 463, 394, 291, 13, 24, 1200, 784, 2, 1, 1),
(27, 'HP DeskJet 2630 All-in-One', 425, 304, 149, 3, 6, 1200, 4300, 3, 1, 1),
(28, 'HP OfficeJet 3833 All-in-One', 450, 364, 224, 6, 6, 1200, 78, 3, 1, 2),
(29, 'CANON PIXMA TR4551', 435, 295, 189, 5, 4, 1200, 8922, 2, 1, 1),
(30, 'EPSON Expression Home XP-452', 390, 300, 146, 4, 5, 2400, 458, 1, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `t_supplier`
--

CREATE TABLE `t_supplier` (
  `idSupplier` int(11) NOT NULL,
  `supName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `t_supplier`
--

INSERT INTO `t_supplier` (`idSupplier`, `supName`) VALUES
(1, 'Top Preise');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `t_brands`
--
ALTER TABLE `t_brands`
  ADD PRIMARY KEY (`idBrands`),
  ADD UNIQUE KEY `ID_t_brands_IND` (`idBrands`),
  ADD KEY `FKisConstructedBy_IND` (`idConstructor`);

--
-- Index pour la table `t_constructors`
--
ALTER TABLE `t_constructors`
  ADD PRIMARY KEY (`idConstructor`),
  ADD UNIQUE KEY `ID_t_constructors_IND` (`idConstructor`);

--
-- Index pour la table `t_consumables`
--
ALTER TABLE `t_consumables`
  ADD PRIMARY KEY (`idConsumable`),
  ADD UNIQUE KEY `ID_t_consumables_IND` (`idConsumable`);

--
-- Index pour la table `t_prices`
--
ALTER TABLE `t_prices`
  ADD PRIMARY KEY (`idPrice`),
  ADD UNIQUE KEY `ID_t_prices_IND` (`idPrice`),
  ADD KEY `fk_printer` (`idPrinter`);

--
-- Index pour la table `t_printers`
--
ALTER TABLE `t_printers`
  ADD PRIMARY KEY (`idPrinter`),
  ADD UNIQUE KEY `ID_t_printers_IND` (`idPrinter`),
  ADD KEY `FKisBranded_IND` (`idBrands`),
  ADD KEY `fkSupplier` (`idSupplier`),
  ADD KEY `fkConsumable` (`idConsumable`);

--
-- Index pour la table `t_supplier`
--
ALTER TABLE `t_supplier`
  ADD PRIMARY KEY (`idSupplier`),
  ADD UNIQUE KEY `ID_t_supplier_IND` (`idSupplier`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `t_brands`
--
ALTER TABLE `t_brands`
  MODIFY `idBrands` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `t_constructors`
--
ALTER TABLE `t_constructors`
  MODIFY `idConstructor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `t_consumables`
--
ALTER TABLE `t_consumables`
  MODIFY `idConsumable` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `t_prices`
--
ALTER TABLE `t_prices`
  MODIFY `idPrice` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;
--
-- AUTO_INCREMENT pour la table `t_printers`
--
ALTER TABLE `t_printers`
  MODIFY `idPrinter` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT pour la table `t_supplier`
--
ALTER TABLE `t_supplier`
  MODIFY `idSupplier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `t_brands`
--
ALTER TABLE `t_brands`
  ADD CONSTRAINT `FKisConstructedBy_FK` FOREIGN KEY (`idConstructor`) REFERENCES `t_constructors` (`idConstructor`);

--
-- Contraintes pour la table `t_prices`
--
ALTER TABLE `t_prices`
  ADD CONSTRAINT `t_prices_ibfk_1` FOREIGN KEY (`idPrinter`) REFERENCES `t_printers` (`idPrinter`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `t_printers`
--
ALTER TABLE `t_printers`
  ADD CONSTRAINT `FKisBranded_FK` FOREIGN KEY (`idBrands`) REFERENCES `t_brands` (`idBrands`),
  ADD CONSTRAINT `t_printers_ibfk_1` FOREIGN KEY (`idSupplier`) REFERENCES `t_supplier` (`idSupplier`),
  ADD CONSTRAINT `t_printers_ibfk_2` FOREIGN KEY (`idConsumable`) REFERENCES `t_consumables` (`idConsumable`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
