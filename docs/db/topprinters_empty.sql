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

/*CREATE TABLE IF NOT EXISTS `t_brands` (
  `idBrands` int(11) NOT NULL,
  `braName` varchar(50) NOT NULL,
  `idConstructor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Structure de la table `t_constructors`
--

CREATE TABLE IF NOT EXISTS `t_constructors` (
  `idConstructor` int(11) NOT NULL,
  `conName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Structure de la table `t_consumables`
--

CREATE TABLE IF NOT EXISTS `t_consumables` (
  `idConsumable` int(11) NOT NULL,
  `csbName` varchar(50) NOT NULL,
  `csbDescription` text,
  `csbPrice` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Structure de la table `t_prices`
--

CREATE TABLE IF NOT EXISTS `t_prices` (
  `idPrice` int(11) NOT NULL,
  `priDate` date NOT NULL,
  `priValue` int(11) NOT NULL,
  `idPrinter` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Structure de la table `t_printers`
--

CREATE TABLE IF NOT EXISTS `t_printers` (
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
-- Structure de la table `t_supplier`
--

CREATE TABLE IF NOT EXISTS `t_supplier` (
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
  ADD CONSTRAINT `t_printers_ibfk_2` FOREIGN KEY (`idConsumable`) REFERENCES `t_consumables` (`idConsumable`);*/

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
