-- phpMyAdmin SQL Dump
-- version 4.0.4.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Czas wygenerowania: 18 Cze 2021, 18:57
-- Wersja serwera: 5.6.13
-- Wersja PHP: 5.4.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Baza danych: `childreg`
--
CREATE DATABASE IF NOT EXISTS `childreg` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `childreg`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `leaders`
--

CREATE TABLE IF NOT EXISTS `leaders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `lastName` text NOT NULL,
  `degree` enum('Inzynier','Magister','Doktor','Profesor') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Zrzut danych tabeli `leaders`
--

INSERT INTO `leaders` (`id`, `name`, `lastName`, `degree`) VALUES
(1, 'Bolek', 'Lolek', 'Inzynier'),
(2, 'Klapek', 'Plapek', 'Inzynier');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `lectures`
--

CREATE TABLE IF NOT EXISTS `lectures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `leader_id` int(11) NOT NULL,
  `topic` text NOT NULL,
  `date` date NOT NULL,
  `t_start` text NOT NULL,
  `t_stop` text NOT NULL,
  `hall` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Zrzut danych tabeli `lectures`
--

INSERT INTO `lectures` (`id`, `leader_id`, `topic`, `date`, `t_start`, `t_stop`, `hall`) VALUES
(1, 1, 'Przewodzenie ciepla, gdy jest zimno', '2021-03-02', '09:00', '10:30', 211),
(2, 2, 'Prawo Newtona', '2021-04-30', '15:00', '16:30', 101),
(3, 1, 'Drug cause problems', '2021-05-05', '14:30', '16:00', 203),
(4, 2, 'Bla bla', '2021-05-06', '9:30', '11:00', 210);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `questionnaire`
--

CREATE TABLE IF NOT EXISTS `questionnaire` (
  `user_id` int(11) NOT NULL,
  `email` text NOT NULL,
  `best_lectures` text NOT NULL,
  `intention` text NOT NULL,
  `specialty` text NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `questionnaire`
--

INSERT INTO `questionnaire` (`user_id`, `email`, `best_lectures`, `intention`, `specialty`) VALUES
(2, 'pawelkopaniecki40@gmail.com', 'Bla bla,Drug cause problems', '1', 'human');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `signed`
--

CREATE TABLE IF NOT EXISTS `signed` (
  `user_id` int(11) NOT NULL,
  `lecture_id` int(11) NOT NULL,
  `mail` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `signed`
--

INSERT INTO `signed` (`user_id`, `lecture_id`, `mail`) VALUES
(2, 1, 'janek@wp.pl'),
(1, 2, 'bambus@wp.pl'),
(1, 3, 'bambus@wp.pl'),
(1, 1, 'bambus@wp.pl'),
(2, 4, 'pawelkopaniecki40@gmail.com'),
(2, 3, 'pawelkopaniecki40@gmail.com'),
(2, 2, 'pawelkopaniecki40@gmail.com'),
(2, 1, 'pawelkopaniecki40@gmail.com');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `school` text NOT NULL,
  `city` text NOT NULL,
  `profile` text NOT NULL,
  `type` text NOT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`ID`, `email`, `password`, `school`, `city`, `profile`, `type`, `verified`) VALUES
(1, 'bambus@wp.pl', 'bambus', 'hgrfghs', 'uygyug', 'yguyg', 'user', 1),
(2, 'admin@admin.com', 'admin', 'ghrs', 'ggr', 'hrts', 'admin', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `visited`
--

CREATE TABLE IF NOT EXISTS `visited` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` text NOT NULL,
  `h100` tinyint(1) DEFAULT '0',
  `h101` tinyint(1) DEFAULT '0',
  `h102` tinyint(1) DEFAULT '0',
  `h200` tinyint(1) DEFAULT '0',
  `h201` tinyint(1) DEFAULT '0',
  `h202` tinyint(1) DEFAULT '0',
  `h300` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Zrzut danych tabeli `visited`
--

INSERT INTO `visited` (`id`, `email`, `h100`, `h101`, `h102`, `h200`, `h201`, `h202`, `h300`) VALUES
(1, 'bambus@wp.pl', 1, 1, 1, 1, 1, 1, 1),
(2, 'pawelkopaniecki40@gmail.com', 1, 1, 1, 1, 1, 1, 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
