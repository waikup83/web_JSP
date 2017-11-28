-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Sam 07 Octobre 2017 à 22:33
-- Version du serveur :  10.1.9-MariaDB
-- Version de PHP :  5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `davidd`
--

-- --------------------------------------------------------

--
-- Structure de la table `tp1`
--

CREATE TABLE `tp1` (
  `ID` int(11) NOT NULL,
  `Image` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Titre` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `Date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `tp1`
--

INSERT INTO `tp1` (`ID`, `Image`, `Titre`, `Description`, `Date`) VALUES
(2, '1.jpg', 'Img1', 'Image #1', '2017-09-15 20:34:11'),
(3, '2.jpg', 'Img2', 'Image #2', '2017-09-15 20:38:11'),
(4, '3.jpg', 'Img3', 'Image #3', '2017-09-15 20:59:11'),
(5, '4.jpg', 'Img4', 'Image #4', '2017-09-16 20:59:11');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `tp1`
--
ALTER TABLE `tp1`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `tp1`
--
ALTER TABLE `tp1`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
