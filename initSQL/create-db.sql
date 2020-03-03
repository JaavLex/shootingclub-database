-- Adminer 4.7.6 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `T_Armes`;
CREATE TABLE `T_Armes` (
  `id_arme` int NOT NULL AUTO_INCREMENT,
  `nom_arme` tinytext NOT NULL,
  `type_arme` int NOT NULL,
  `fk_munition` int NOT NULL,
  PRIMARY KEY (`id_arme`),
  KEY `fk_munition` (`fk_munition`),
  CONSTRAINT `T_Armes_ibfk_1` FOREIGN KEY (`fk_munition`) REFERENCES `T_Munition` (`id_munition`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `T_Concours`;
CREATE TABLE `T_Concours` (
  `id_concours` int NOT NULL AUTO_INCREMENT,
  `type_concours` text NOT NULL,
  `date_concours` date NOT NULL,
  `fk_stand_de_tir` int NOT NULL,
  PRIMARY KEY (`id_concours`),
  KEY `fk_stand_de_tir` (`fk_stand_de_tir`),
  CONSTRAINT `T_Concours_ibfk_1` FOREIGN KEY (`fk_stand_de_tir`) REFERENCES `T_Stand_de_tir` (`id_stand_de_tir`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `T_Concours_a_munitions_tirees`;
CREATE TABLE `T_Concours_a_munitions_tirees` (
  `id_concours_a_munitions_tirees` int NOT NULL AUTO_INCREMENT,
  `fk_concours` int NOT NULL,
  `fk_munition` int NOT NULL,
  `fk_personne` int NOT NULL,
  `fk_stand_de_tir` int NOT NULL,
  `date_munitions` date NOT NULL,
  PRIMARY KEY (`id_concours_a_munitions_tirees`),
  KEY `fk_concours` (`fk_concours`),
  KEY `fk_munition` (`fk_munition`),
  KEY `fk_personne` (`fk_personne`),
  KEY `fk_stand_de_tir` (`fk_stand_de_tir`),
  CONSTRAINT `T_Concours_a_munitions_tirees_ibfk_1` FOREIGN KEY (`fk_concours`) REFERENCES `T_Concours` (`id_concours`),
  CONSTRAINT `T_Concours_a_munitions_tirees_ibfk_2` FOREIGN KEY (`fk_munition`) REFERENCES `T_Munition` (`id_munition`),
  CONSTRAINT `T_Concours_a_munitions_tirees_ibfk_3` FOREIGN KEY (`fk_personne`) REFERENCES `T_Personne` (`id_personne`),
  CONSTRAINT `T_Concours_a_munitions_tirees_ibfk_4` FOREIGN KEY (`fk_stand_de_tir`) REFERENCES `T_Stand_de_tir` (`id_stand_de_tir`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `T_Concours_a_presence`;
CREATE TABLE `T_Concours_a_presence` (
  `id_concours_a_presence` int NOT NULL AUTO_INCREMENT,
  `date_presence` date NOT NULL,
  `fk_personne` int NOT NULL,
  `fk_concours` int NOT NULL,
  PRIMARY KEY (`id_concours_a_presence`),
  KEY `fk_personne` (`fk_personne`),
  KEY `fk_concours` (`fk_concours`),
  CONSTRAINT `T_Concours_a_presence_ibfk_2` FOREIGN KEY (`fk_personne`) REFERENCES `T_Personne` (`id_personne`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `T_Concours_a_presence_ibfk_3` FOREIGN KEY (`fk_concours`) REFERENCES `T_Concours` (`id_concours`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `T_Concours_location_arme`;
CREATE TABLE `T_Concours_location_arme` (
  `id_concours_location_arme` int NOT NULL AUTO_INCREMENT,
  `fk_concours` int NOT NULL,
  `fk_arme` int NOT NULL,
  `fk_stand_de_tir` int NOT NULL,
  `prix_location` int NOT NULL,
  `date_location` date NOT NULL,
  PRIMARY KEY (`id_concours_location_arme`),
  KEY `fk_concours` (`fk_concours`),
  KEY `fk_stand_de_tir` (`fk_stand_de_tir`),
  KEY `fk_arme` (`fk_arme`),
  CONSTRAINT `T_Concours_location_arme_ibfk_2` FOREIGN KEY (`fk_concours`) REFERENCES `T_Concours` (`id_concours`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `T_Concours_location_arme_ibfk_3` FOREIGN KEY (`fk_stand_de_tir`) REFERENCES `T_Stand_de_tir` (`id_stand_de_tir`),
  CONSTRAINT `T_Concours_location_arme_ibfk_4` FOREIGN KEY (`fk_arme`) REFERENCES `T_Armes` (`id_arme`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `T_Munition`;
CREATE TABLE `T_Munition` (
  `id_munition` int NOT NULL AUTO_INCREMENT,
  `calibre` text NOT NULL,
  `prix_p_50` int NOT NULL,
  PRIMARY KEY (`id_munition`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `T_Personne`;
CREATE TABLE `T_Personne` (
  `id_personne` int NOT NULL AUTO_INCREMENT,
  `nom_pers` tinytext NOT NULL,
  `prenom_pers` tinytext NOT NULL,
  `date_de_naissance` date NOT NULL,
  `possession_arme` binary(1) NOT NULL,
  PRIMARY KEY (`id_personne`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `T_Personne_a_scores`;
CREATE TABLE `T_Personne_a_scores` (
  `id_personne_a_score` int NOT NULL AUTO_INCREMENT,
  `fk_personne` int NOT NULL,
  `fk_scores` int NOT NULL,
  `fk_concours` int NOT NULL,
  PRIMARY KEY (`id_personne_a_score`),
  KEY `fk_personne` (`fk_personne`),
  KEY `fk_concours` (`fk_concours`),
  KEY `fk_scores` (`fk_scores`),
  CONSTRAINT `T_Personne_a_scores_ibfk_3` FOREIGN KEY (`fk_personne`) REFERENCES `T_Personne` (`id_personne`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `T_Personne_a_scores_ibfk_4` FOREIGN KEY (`fk_concours`) REFERENCES `T_Concours` (`id_concours`),
  CONSTRAINT `T_Personne_a_scores_ibfk_5` FOREIGN KEY (`fk_scores`) REFERENCES `T_Scores` (`id_scores`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `T_Scores`;
CREATE TABLE `T_Scores` (
  `id_scores` int NOT NULL AUTO_INCREMENT,
  `score_cible1` int NOT NULL,
  `score_cible2` int NOT NULL,
  `score_cible3` int NOT NULL,
  `score_cible4` int NOT NULL,
  `score_total` int NOT NULL,
  PRIMARY KEY (`id_scores`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `T_Stand_de_tir`;
CREATE TABLE `T_Stand_de_tir` (
  `id_stand_de_tir` int NOT NULL AUTO_INCREMENT,
  `nom_stand_de_tir` tinytext NOT NULL,
  `adresse_stand_de_tir` text NOT NULL,
  `tel_stand_de_tir` text NOT NULL,
  PRIMARY KEY (`id_stand_de_tir`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- 2020-03-02 12:34:08
