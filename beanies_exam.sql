-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : Dim 31 jan. 2021 à 21:34
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `beanies_exam`
--
CREATE DATABASE IF NOT EXISTS `beanies_exam` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `beanies_exam`;

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Bonnets'),
(2, 'Casquettes');

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `description` text,
  `updated_at` datetime DEFAULT NULL,
  `price` float NOT NULL,
  `stock` tinyint(1) NOT NULL COMMENT 'boolean. 0 = false, 1 = true',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`id`, `name`, `description`, `updated_at`, `price`, `stock`) VALUES
(1, 'The Ray heather navy', '\r\n\r\nComplétez vos tenues d\'un accessoire fonctionnel, avec ce bonnet bleu marine à visière que nous propose la marque américaine spécialisée Coal. Sa maille à fines côtes le maintient bien en place et il est relevé d\'une petite étiquette sur le bord.\r\nMatière:\r\n\r\n100% Acrylique\r\n\r\n    Reference : COA01628\r\n    Genre : homme\r\n    Forme : visiere\r\n    Couleur : bleu marine', '2021-01-31 20:47:31', 23.9, 1),
(2, 'Zoom Visor navy', 'En bleu marine, ce bonnet sera idéal assorti à un manteau vert foncé par exemple. Sa forme à visière discrète lui donne un côté très street, parfait si vous êtes un snowboardeur, ou si vous aimez avoir une allure différente.\r\nMatière: 100 % Acrylique\r\n\r\n    Reference : BAR02456\r\n    Genre : homme\r\n    Forme : visiere\r\n    Couleur : bleu marine\r\n    Taille : 60', '2021-01-31 20:48:30', 19.9, 0),
(3, 'Check Block 950 LA khaki', 'Avec un style unique grâce à sa composition dans des tons verts faite d’un assemblage de toiles à carreaux sur l’avant, cette superbe snapback brodée devant des initiales LA en relief nous vient de la collection coréenne de la marque spécialisée New Era.\r\n\r\n    Reference : ERA06574\r\n    Genre : homme\r\n    Equipe : la\r\n    Forme : snapback\r\n    Couleur : vert', '2021-01-31 20:52:06', 38.9, 1),
(4, 'Hatteras EF Wool olive brown check', '\r\nÉquipez-vous très efficacement contre le froid et l’humidité, grâce à ce béret à carreaux doté d’une protection pour la nuque et les oreilles. Sa matière bien chaude en pure laine Shetland est relevée d’un motif à carreaux avec des détails chaleureux et doublée de coton doux.\r\nMatière: 100 % Laine, Doublure 100 % Coton\r\n\r\n    Reference : STE6840328-256\r\n    Genre : homme\r\n    Forme : gavroche\r\n    Couleur : marron\r\n\r\n', '2021-01-31 20:52:06', 89, 1);

-- --------------------------------------------------------

--
-- Structure de la table `product_has_category`
--

DROP TABLE IF EXISTS `product_has_category`;
CREATE TABLE IF NOT EXISTS `product_has_category` (
  `id_category` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  PRIMARY KEY (`id_category`,`id_product`),
  KEY `id_category` (`id_category`),
  KEY `id_product` (`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `product_has_category`
--

INSERT INTO `product_has_category` (`id_category`, `id_product`) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `product_has_category`
--
ALTER TABLE `product_has_category`
  ADD CONSTRAINT `product_has_category_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_has_category_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
