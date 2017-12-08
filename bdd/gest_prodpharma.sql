-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Serveur: 127.0.0.1
-- Généré le : Jeu 07 Décembre 2017 à 10:19
-- Version du serveur: 5.5.8
-- Version de PHP: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `gest_prodpharma`
--

-- --------------------------------------------------------

--
-- Structure de la table `articles`
--

CREATE TABLE IF NOT EXISTS `articles` (
  `articles_id` int(11) NOT NULL,
  `label` varchar(100) NOT NULL,
  `fournisseur_id` varchar(120) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`articles_id`),
  KEY `FK_Articles_fournisseur_id` (`fournisseur_id`),
  KEY `FK_Articles_category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `articles`
--


-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `category_id` int(11) NOT NULL,
  `label` varchar(25) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `categories`
--


-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

CREATE TABLE IF NOT EXISTS `clients` (
  `client_id` varchar(100) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `telephone` varchar(100) NOT NULL,
  `adresse` varchar(100) NOT NULL,
  `sexe_client` varchar(10) DEFAULT NULL,
  `ville_provenance` varchar(100) DEFAULT NULL,
  `stock_id` varchar(100) NOT NULL,
  PRIMARY KEY (`client_id`),
  KEY `FK_Clients_stock_id` (`stock_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `clients`
--


-- --------------------------------------------------------

--
-- Structure de la table `fournisseurs`
--

CREATE TABLE IF NOT EXISTS `fournisseurs` (
  `fournisseur_id` varchar(120) NOT NULL,
  `label` varchar(100) NOT NULL,
  `adresse` varchar(100) NOT NULL,
  `telephone` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`fournisseur_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `fournisseurs`
--


-- --------------------------------------------------------

--
-- Structure de la table `stocks`
--

CREATE TABLE IF NOT EXISTS `stocks` (
  `stock_id` varchar(100) NOT NULL,
  `label` varchar(120) NOT NULL,
  `quantite` int(11) NOT NULL,
  `prix_unitaire` int(11) NOT NULL,
  `articles_id` int(11) NOT NULL,
  PRIMARY KEY (`stock_id`),
  KEY `FK_stocks_articles_id` (`articles_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `stocks`
--


--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `FK_Articles_category_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`),
  ADD CONSTRAINT `FK_Articles_fournisseur_id` FOREIGN KEY (`fournisseur_id`) REFERENCES `fournisseurs` (`fournisseur_id`);

--
-- Contraintes pour la table `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `FK_Clients_stock_id` FOREIGN KEY (`stock_id`) REFERENCES `stocks` (`stock_id`);

--
-- Contraintes pour la table `stocks`
--
ALTER TABLE `stocks`
  ADD CONSTRAINT `FK_stocks_articles_id` FOREIGN KEY (`articles_id`) REFERENCES `articles` (`articles_id`);
