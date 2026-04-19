-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 19, 2026 at 04:20 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `data_db`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_country` (IN `cname` VARCHAR(50), IN `region` VARCHAR(50), IN `ctype` VARCHAR(50))   BEGIN
    INSERT INTO country (c_name, region, c_type)
    VALUES (cname, region, ctype);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `add_data` (IN `cname` VARCHAR(50), IN `y` INT, IN `temp` DOUBLE, IN `sea` DOUBLE, IN `carbon` DOUBLE)   BEGIN
    DECLARE cid INT;

    SELECT c_id INTO cid FROM country WHERE c_name = cname;

    INSERT INTO temperature VALUES (cid, y, temp);
    INSERT INTO sea_level VALUES (cid, y, sea);
    INSERT INTO carbon VALUES (cid, y, carbon);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `createAccount` (IN `p_username` VARCHAR(15), IN `p_pass` VARCHAR(20))   BEGIN
	INSERT INTO users (u_name,pass) VALUES
    (p_username, p_pass);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_carbon_info` (IN `name` VARCHAR(15))   BEGIN
SELECT c_name , year, c_rate FROM country LEFT JOIN carbon on country.c_id = carbon.c_id WHERE c_name = name GROUP BY year DESC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_sea_info` (IN `name` VARCHAR(15))   BEGIN
SELECT c_name , year, s_level FROM country LEFT JOIN sea_level on country.c_id = sea_level.c_id WHERE c_name = name GROUP BY year DESC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_temp_info` (IN `name` VARCHAR(15))   BEGIN
SELECT c_name , year, temp_rate FROM country LEFT JOIN temperature on country.c_id = temperature.c_id WHERE c_name = name GROUP BY year DESC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `loginAdmin` (IN `p_username` VARCHAR(15), IN `p_pass` VARCHAR(20))   BEGIN
	SELECT * FROM users
    WHERE u_name = p_username
    and pass = p_pass
    and position = 'admin';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `loginUser` (IN `p_username` VARCHAR(15), IN `p_pass` VARCHAR(20))   BEGIN
	SELECT * FROM users
    WHERE u_name = p_username
    and pass = p_pass
    and position = 'user';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `over_all_data` (IN `name` VARCHAR(15))   BEGIN
	SELECT * FROM full_data
    WHERE country = name;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `remove_data` (IN `cname` VARCHAR(50), IN `y` INT)   BEGIN
    DECLARE cid INT;

    SELECT c_id INTO cid FROM country WHERE c_name = cname;

    DELETE FROM temperature WHERE c_id = cid AND year = y;
    DELETE FROM sea_level WHERE c_id = cid AND year = y;
    DELETE FROM carbon WHERE c_id = cid AND year = y;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `remove_user` (IN `uname` VARCHAR(50))   BEGIN
    DELETE FROM users WHERE u_name = uname;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_data` (IN `cname` VARCHAR(50), IN `y` INT, IN `temp` DOUBLE, IN `sea` DOUBLE, IN `carbon` DOUBLE)   BEGIN
    DECLARE cid INT;

    SELECT c_id INTO cid FROM country WHERE c_name = cname;

    UPDATE temperature SET temp_rate = temp WHERE c_id = cid AND year = y;
    UPDATE sea_level SET s_level = sea WHERE c_id = cid AND year = y;
    UPDATE carbon SET c_rate = carbon WHERE c_id = cid AND year = y;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `carbon`
--

CREATE TABLE `carbon` (
  `c_id` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `c_rate` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `carbon`
--

INSERT INTO `carbon` (`c_id`, `year`, `c_rate`) VALUES
(102, 1920, 4.2),
(102, 1940, 5.8),
(102, 1960, 15.3),
(102, 1980, 19.6),
(102, 2000, 20.1),
(103, 1920, 3.5),
(103, 1940, 4.9),
(103, 1960, 11.2),
(103, 1980, 15.8),
(103, 2000, 16.5),
(104, 1920, 2.8),
(104, 1940, 4.2),
(104, 1960, 8.5),
(104, 1980, 11.4),
(104, 2000, 9.8),
(105, 1920, 2.2),
(105, 1940, 3.1),
(105, 1960, 7.3),
(105, 1980, 8.9),
(105, 2000, 7.2),
(106, 1920, 1.1),
(106, 1940, 1.6),
(106, 1960, 3.5),
(106, 1980, 7.4),
(106, 2000, 9.1),
(107, 1920, 2.5),
(107, 1940, 3.4),
(107, 1960, 6.8),
(107, 1980, 13.1),
(107, 2000, 17.5),
(108, 1920, 0.9),
(108, 1940, 1.3),
(108, 1960, 2.4),
(108, 1980, 3.6),
(108, 2000, 4.2),
(109, 1920, 0.3),
(109, 1940, 0.5),
(109, 1960, 1.2),
(109, 1980, 9.8),
(109, 2000, 13.7),
(110, 1920, 1.8),
(110, 1940, 2.4),
(110, 1960, 4.7),
(110, 1980, 7.2),
(110, 2000, 8.5),
(111, 1920, 3.1),
(111, 1940, 4.3),
(111, 1960, 8.9),
(111, 1980, 9.6),
(111, 2000, 9.1),
(112, 1920, 1.5),
(112, 1940, 2.1),
(112, 1960, 4.8),
(112, 1980, 6.9),
(112, 2000, 7.5),
(113, 1920, 0.5),
(113, 1940, 0.9),
(113, 1960, 2.1),
(113, 1980, 4.5),
(113, 2000, 9.2),
(114, 1920, 0.7),
(114, 1940, 1.2),
(114, 1960, 2.5),
(114, 1980, 5.2),
(114, 2000, 8.7),
(115, 1920, 1.2),
(115, 1940, 1.8),
(115, 1960, 3.8),
(115, 1980, 8.3),
(115, 2000, 11.6),
(116, 1920, 1.9),
(116, 1940, 2.6),
(116, 1960, 4.5),
(116, 1980, 6.1),
(116, 2000, 7.8),
(117, 1920, 1.3),
(117, 1940, 1.9),
(117, 1960, 3.7),
(117, 1980, 5.4),
(117, 2000, 7.1),
(118, 1920, 1.6),
(118, 1940, 2.2),
(118, 1960, 4.3),
(118, 1980, 7),
(118, 2000, 8.9),
(119, 1920, 0.7),
(119, 1940, 1.1),
(119, 1960, 2.2),
(119, 1980, 3.1),
(119, 2000, 3.9),
(120, 1920, 0.4),
(120, 1940, 0.7),
(120, 1960, 1.2),
(120, 1980, 1.8),
(120, 2000, 2.3),
(121, 1920, 1.4),
(121, 1940, 2),
(121, 1960, 4.1),
(121, 1980, 7.8),
(121, 2000, 7.5),
(122, 1920, 0.2),
(122, 1940, 0.3),
(122, 1960, 1.1),
(122, 1980, 1.8),
(122, 2000, 3.2),
(123, 1920, 0.1),
(123, 1940, 0.2),
(123, 1960, 0.5),
(123, 1980, 0.8),
(123, 2000, 1.2),
(124, 1920, 0.3),
(124, 1940, 0.5),
(124, 1960, 1),
(124, 1980, 1.7),
(124, 2000, 2.1),
(125, 1920, 0.2),
(125, 1940, 0.3),
(125, 1960, 0.6),
(125, 1980, 1.2),
(125, 2000, 1.8),
(126, 1920, 0.5),
(126, 1940, 0.8),
(126, 1960, 1.5),
(126, 1980, 3.2),
(126, 2000, 4.1),
(127, 1920, 0.4),
(127, 1940, 0.7),
(127, 1960, 1.3),
(127, 1980, 2.5),
(127, 2000, 3.6),
(128, 1920, 1.1),
(128, 1940, 1.6),
(128, 1960, 2.8),
(128, 1980, 6.1),
(128, 2000, 7.4),
(129, 1920, 0.2),
(129, 1940, 0.4),
(129, 1960, 0.8),
(129, 1980, 1.5),
(129, 2000, 2.3),
(130, 1920, 0.1),
(130, 1940, 0.3),
(130, 1960, 0.6),
(130, 1980, 1.1),
(130, 2000, 2.4),
(131, 1920, 0.3),
(131, 1940, 0.5),
(131, 1960, 0.9),
(131, 1980, 1.6),
(131, 2000, 1.9),
(132, 1920, 0.1),
(132, 1940, 0.2),
(132, 1960, 0.4),
(132, 1980, 0.7),
(132, 2000, 1.4),
(133, 1920, 0.9),
(133, 1940, 1.3),
(133, 1960, 2.2),
(133, 1980, 3),
(133, 2000, 3.7),
(134, 1920, 0.2),
(134, 1940, 0.4),
(134, 1960, 0.9),
(134, 1980, 2.1),
(134, 2000, 2.8),
(135, 1920, 0.3),
(135, 1940, 0.5),
(135, 1960, 0.9),
(135, 1980, 1.4),
(135, 2000, 1.7),
(136, 1920, 0.2),
(136, 1940, 0.4),
(136, 1960, 0.8),
(136, 1980, 1.9),
(136, 2000, 3),
(137, 1920, 0.2),
(137, 1940, 0.3),
(137, 1960, 0.7),
(137, 1980, 1),
(137, 2000, 1.3),
(138, 1920, 0.2),
(138, 1940, 0.4),
(138, 1960, 0.8),
(138, 1980, 1.3),
(138, 2000, 1.8),
(139, 1920, 0.05),
(139, 1940, 0.08),
(139, 1960, 0.15),
(139, 1980, 0.22),
(139, 2000, 0.27),
(140, 1920, 0.08),
(140, 1940, 0.12),
(140, 1960, 0.25),
(140, 1980, 0.35),
(140, 2000, 0.42),
(141, 1920, 0.1),
(141, 1940, 0.15),
(141, 1960, 0.35),
(141, 1980, 0.6),
(141, 2000, 0.85),
(142, 1920, 0.15),
(142, 1940, 0.25),
(142, 1960, 0.6),
(142, 1980, 1.3),
(142, 2000, 1.9),
(143, 1920, 0.12),
(143, 1940, 0.18),
(143, 1960, 0.4),
(143, 1980, 0.7),
(143, 2000, 0.95),
(144, 1920, 0.06),
(144, 1940, 0.1),
(144, 1960, 0.22),
(144, 1980, 0.32),
(144, 2000, 0.45),
(145, 1920, 0.03),
(145, 1940, 0.05),
(145, 1960, 0.1),
(145, 1980, 0.18),
(145, 2000, 0.32),
(146, 1920, 0.2),
(146, 1940, 0.3),
(146, 1960, 0.7),
(146, 1980, 1.8),
(146, 2000, 2.4),
(147, 1920, 0.04),
(147, 1940, 0.07),
(147, 1960, 0.15),
(147, 1980, 0.28),
(147, 2000, 0.55),
(148, 1920, 0.1),
(148, 1940, 0.15),
(148, 1960, 0.35),
(148, 1980, 0.65),
(148, 2000, 0.9),
(149, 1920, 0.08),
(149, 1940, 0.12),
(149, 1960, 0.28),
(149, 1980, 0.55),
(149, 2000, 0.78),
(150, 1920, 0.02),
(150, 1940, 0.04),
(150, 1960, 0.08),
(150, 1980, 0.15),
(150, 2000, 0.25),
(151, 1920, 0.03),
(151, 1940, 0.05),
(151, 1960, 0.1),
(151, 1980, 0.22),
(151, 2000, 0.35),
(152, 1920, 0.01),
(152, 1940, 0.02),
(152, 1960, 0.05),
(152, 1980, 0.08),
(152, 2000, 0.12),
(153, 1920, 0.02),
(153, 1940, 0.03),
(153, 1960, 0.07),
(153, 1980, 0.12),
(153, 2000, 0.18),
(154, 1920, 0.02),
(154, 1940, 0.04),
(154, 1960, 0.08),
(154, 1980, 0.14),
(154, 2000, 0.2),
(155, 1920, 0.03),
(155, 1940, 0.05),
(155, 1960, 0.1),
(155, 1980, 0.16),
(155, 2000, 0.22),
(156, 1920, 0.01),
(156, 1940, 0.02),
(156, 1960, 0.04),
(156, 1980, 0.07),
(156, 2000, 0.1),
(157, 1920, 0.01),
(157, 1940, 0.02),
(157, 1960, 0.05),
(157, 1980, 0.09),
(157, 2000, 0.14),
(158, 1920, 0.02),
(158, 1940, 0.03),
(158, 1960, 0.06),
(158, 1980, 0.1),
(158, 2000, 0.15),
(159, 1920, 0.01),
(159, 1940, 0.02),
(159, 1960, 0.04),
(159, 1980, 0.08),
(159, 2000, 0.11),
(NULL, 0, 0);

--
-- Triggers `carbon`
--
DELIMITER $$
CREATE TRIGGER `carbon_check` BEFORE INSERT ON `carbon` FOR EACH ROW BEGIN
    IF NEW.c_rate > 30 OR NEW.c_rate < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Carbon rate must be between 0 and 30';
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `carbon_check_update` BEFORE UPDATE ON `carbon` FOR EACH ROW BEGIN
    IF NEW.c_rate > 20 OR NEW.c_rate < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Carbon rate must be between 0 and 20';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `c_id` int(11) NOT NULL,
  `c_name` varchar(100) NOT NULL,
  `region` enum('Asia','Africa','Europe','North America','South America','Oceania','Antarctica') NOT NULL,
  `c_type` enum('Poor','Rich','Middle') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`c_id`, `c_name`, `region`, `c_type`) VALUES
(102, 'United States', 'North America', 'Rich'),
(103, 'Canada', 'North America', 'Rich'),
(104, 'Germany', 'Europe', 'Rich'),
(105, 'France', 'Europe', 'Rich'),
(106, 'Japan', 'Asia', 'Rich'),
(107, 'Australia', 'Oceania', 'Rich'),
(108, 'Chile', 'South America', 'Rich'),
(109, 'Saudi Arabia', 'Asia', 'Rich'),
(110, 'Norway', 'Europe', 'Rich'),
(111, 'United Kingdom', 'Europe', 'Rich'),
(112, 'Italy', 'Europe', 'Rich'),
(113, 'South Korea', 'Asia', 'Rich'),
(114, 'Israel', 'Asia', 'Rich'),
(115, 'Singapore', 'Asia', 'Rich'),
(116, 'New Zealand', 'Oceania', 'Rich'),
(117, 'Spain', 'Europe', 'Rich'),
(118, 'Finland', 'Europe', 'Rich'),
(119, 'Uruguay', 'South America', 'Rich'),
(120, 'Costa Rica', 'North America', 'Rich'),
(121, 'Poland', 'Europe', 'Rich'),
(122, 'China', 'Asia', 'Middle'),
(123, 'India', 'Asia', 'Middle'),
(124, 'Brazil', 'South America', 'Middle'),
(125, 'Indonesia', 'Asia', 'Middle'),
(126, 'Mexico', 'North America', 'Middle'),
(127, 'Turkey', 'Asia', 'Middle'),
(128, 'South Africa', 'Africa', 'Middle'),
(129, 'Egypt', 'Africa', 'Middle'),
(130, 'Thailand', 'Asia', 'Middle'),
(131, 'Colombia', 'South America', 'Middle'),
(132, 'Vietnam', 'Asia', 'Middle'),
(133, 'Argentina', 'South America', 'Middle'),
(134, 'Algeria', 'Africa', 'Middle'),
(135, 'Peru', 'South America', 'Middle'),
(136, 'Iraq', 'Asia', 'Middle'),
(137, 'Philippines', 'Asia', 'Middle'),
(138, 'Morocco', 'Africa', 'Middle'),
(139, 'Bangladesh', 'Asia', 'Middle'),
(140, 'Kenya', 'Africa', 'Middle'),
(141, 'Angola', 'Africa', 'Middle'),
(142, 'Uzbekistan', 'Asia', 'Middle'),
(143, 'Guatemala', 'North America', 'Middle'),
(144, 'Ghana', 'Africa', 'Middle'),
(145, 'Nepal', 'Asia', 'Middle'),
(146, 'Jordan', 'Asia', 'Middle'),
(147, 'Cambodia', 'Asia', 'Middle'),
(148, 'Honduras', 'North America', 'Middle'),
(149, 'Papua New Guinea', 'Oceania', 'Middle'),
(150, 'Afghanistan', 'Asia', 'Poor'),
(151, 'Yemen', 'Asia', 'Poor'),
(152, 'Somalia', 'Africa', 'Poor'),
(153, 'Mozambique', 'Africa', 'Poor'),
(154, 'Madagascar', 'Africa', 'Poor'),
(155, 'Sierra Leone', 'Africa', 'Poor'),
(156, 'Chad', 'Africa', 'Poor'),
(157, 'South Sudan', 'Africa', 'Poor'),
(158, 'Malawi', 'Africa', 'Poor'),
(159, 'Niger', 'Africa', 'Poor'),
(160, 'uganda', 'Asia', 'Poor'),
(161, '', '', ''),
(162, '', '', ''),
(163, 'faaa', 'Asia', 'Poor');

--
-- Triggers `country`
--
DELIMITER $$
CREATE TRIGGER `country_duplicate_check` BEFORE INSERT ON `country` FOR EACH ROW BEGIN
    DECLARE count_val INT;

    SELECT COUNT(*) INTO count_val
    FROM country
    WHERE c_name = NEW.c_name;

    IF count_val > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Country already exists';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `full_data`
-- (See below for the actual view)
--
CREATE TABLE `full_data` (
`country` varchar(100)
,`year` int(11)
,`temperature` double
,`sea_level` double
,`carbon` double
);

-- --------------------------------------------------------

--
-- Table structure for table `sea_level`
--

CREATE TABLE `sea_level` (
  `c_id` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `s_level` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sea_level`
--

INSERT INTO `sea_level` (`c_id`, `year`, `s_level`) VALUES
(102, 1920, 0),
(102, 1940, 0.9),
(102, 1960, 2),
(102, 1980, 3.4),
(102, 2000, 5.1),
(103, 1920, 0),
(103, 1940, 0.7),
(103, 1960, 1.6),
(103, 1980, 2.8),
(103, 2000, 4.3),
(104, 1920, 0),
(104, 1940, 0.8),
(104, 1960, 1.8),
(104, 1980, 3),
(104, 2000, 4.7),
(105, 1920, 0),
(105, 1940, 0.8),
(105, 1960, 1.9),
(105, 1980, 3.1),
(105, 2000, 4.8),
(106, 1920, 0),
(106, 1940, 0.8),
(106, 1960, 1.8),
(106, 1980, 3),
(106, 2000, 4.7),
(107, 1920, 0),
(107, 1940, 0.7),
(107, 1960, 1.6),
(107, 1980, 2.7),
(107, 2000, 4.2),
(108, 1920, 0),
(108, 1940, 0.7),
(108, 1960, 1.5),
(108, 1980, 2.6),
(108, 2000, 4),
(109, 1920, 0),
(109, 1940, 0.7),
(109, 1960, 1.6),
(109, 1980, 2.8),
(109, 2000, 4.3),
(110, 1920, 0),
(110, 1940, 0.7),
(110, 1960, 1.6),
(110, 1980, 2.8),
(110, 2000, 4.4),
(111, 1920, 0),
(111, 1940, 0.8),
(111, 1960, 1.8),
(111, 1980, 3),
(111, 2000, 4.7),
(112, 1920, 0),
(112, 1940, 0.8),
(112, 1960, 1.8),
(112, 1980, 3),
(112, 2000, 4.7),
(113, 1920, 0),
(113, 1940, 0.8),
(113, 1960, 1.8),
(113, 1980, 3),
(113, 2000, 4.7),
(114, 1920, 0),
(114, 1940, 0.8),
(114, 1960, 1.7),
(114, 1980, 2.9),
(114, 2000, 4.5),
(115, 1920, 0),
(115, 1940, 0.8),
(115, 1960, 1.8),
(115, 1980, 3.1),
(115, 2000, 4.8),
(116, 1920, 0),
(116, 1940, 0.7),
(116, 1960, 1.6),
(116, 1980, 2.7),
(116, 2000, 4.2),
(117, 1920, 0),
(117, 1940, 0.8),
(117, 1960, 1.8),
(117, 1980, 3),
(117, 2000, 4.7),
(118, 1920, 0),
(118, 1940, 0.7),
(118, 1960, 1.5),
(118, 1980, 2.6),
(118, 2000, 4.1),
(119, 1920, 0),
(119, 1940, 0.7),
(119, 1960, 1.5),
(119, 1980, 2.6),
(119, 2000, 4),
(120, 1920, 0),
(120, 1940, 0.8),
(120, 1960, 1.7),
(120, 1980, 2.9),
(120, 2000, 4.5),
(121, 1920, 0),
(121, 1940, 0.7),
(121, 1960, 1.6),
(121, 1980, 2.8),
(121, 2000, 4.4),
(122, 1920, 0),
(122, 1940, 0.8),
(122, 1960, 1.9),
(122, 1980, 3.2),
(122, 2000, 4.9),
(123, 1920, 0),
(123, 1940, 0.8),
(123, 1960, 1.9),
(123, 1980, 3.2),
(123, 2000, 4.9),
(124, 1920, 0),
(124, 1940, 0.8),
(124, 1960, 1.8),
(124, 1980, 3.1),
(124, 2000, 4.8),
(125, 1920, 0),
(125, 1940, 0.8),
(125, 1960, 1.9),
(125, 1980, 3.2),
(125, 2000, 4.9),
(126, 1920, 0),
(126, 1940, 0.8),
(126, 1960, 1.8),
(126, 1980, 3.1),
(126, 2000, 4.8),
(127, 1920, 0),
(127, 1940, 0.8),
(127, 1960, 1.8),
(127, 1980, 3),
(127, 2000, 4.7),
(128, 1920, 0),
(128, 1940, 0.8),
(128, 1960, 1.8),
(128, 1980, 3),
(128, 2000, 4.7),
(129, 1920, 0),
(129, 1940, 0.8),
(129, 1960, 1.8),
(129, 1980, 3),
(129, 2000, 4.7),
(130, 1920, 0),
(130, 1940, 0.8),
(130, 1960, 1.9),
(130, 1980, 3.2),
(130, 2000, 4.9),
(131, 1920, 0),
(131, 1940, 0.8),
(131, 1960, 1.8),
(131, 1980, 3.1),
(131, 2000, 4.8),
(132, 1920, 0),
(132, 1940, 0.8),
(132, 1960, 1.9),
(132, 1980, 3.2),
(132, 2000, 4.9),
(133, 1920, 0),
(133, 1940, 0.8),
(133, 1960, 1.8),
(133, 1980, 3),
(133, 2000, 4.7),
(134, 1920, 0),
(134, 1940, 0.8),
(134, 1960, 1.8),
(134, 1980, 3),
(134, 2000, 4.7),
(135, 1920, 0),
(135, 1940, 0.8),
(135, 1960, 1.8),
(135, 1980, 3),
(135, 2000, 4.7),
(136, 1920, 0),
(136, 1940, 0.8),
(136, 1960, 1.8),
(136, 1980, 3),
(136, 2000, 4.7),
(137, 1920, 0),
(137, 1940, 0.8),
(137, 1960, 1.9),
(137, 1980, 3.2),
(137, 2000, 4.9),
(138, 1920, 0),
(138, 1940, 0.8),
(138, 1960, 1.8),
(138, 1980, 3),
(138, 2000, 4.7),
(139, 1920, 0),
(139, 1940, 0.8),
(139, 1960, 1.9),
(139, 1980, 3.2),
(139, 2000, 4.9),
(140, 1920, 0),
(140, 1940, 0.8),
(140, 1960, 1.8),
(140, 1980, 3),
(140, 2000, 4.7),
(141, 1920, 0),
(141, 1940, 0.8),
(141, 1960, 1.8),
(141, 1980, 3),
(141, 2000, 4.7),
(142, 1920, 0),
(142, 1940, 0.8),
(142, 1960, 1.8),
(142, 1980, 3),
(142, 2000, 4.7),
(143, 1920, 0),
(143, 1940, 0.8),
(143, 1960, 1.8),
(143, 1980, 3.1),
(143, 2000, 4.8),
(144, 1920, 0),
(144, 1940, 0.8),
(144, 1960, 1.9),
(144, 1980, 3.2),
(144, 2000, 4.9),
(145, 1920, 0),
(145, 1940, 0.8),
(145, 1960, 1.8),
(145, 1980, 3),
(145, 2000, 4.7),
(146, 1920, 0),
(146, 1940, 0.8),
(146, 1960, 1.8),
(146, 1980, 3),
(146, 2000, 4.7),
(147, 1920, 0),
(147, 1940, 0.8),
(147, 1960, 1.9),
(147, 1980, 3.2),
(147, 2000, 4.9),
(148, 1920, 0),
(148, 1940, 0.8),
(148, 1960, 1.8),
(148, 1980, 3.1),
(148, 2000, 4.8),
(149, 1920, 0),
(149, 1940, 0.8),
(149, 1960, 1.9),
(149, 1980, 3.2),
(149, 2000, 4.9),
(150, 1920, 0),
(150, 1940, 0.8),
(150, 1960, 1.8),
(150, 1980, 3),
(150, 2000, 4.7),
(151, 1920, 0),
(151, 1940, 0.8),
(151, 1960, 1.8),
(151, 1980, 3.1),
(151, 2000, 4.8),
(152, 1920, 0),
(152, 1940, 0.8),
(152, 1960, 1.9),
(152, 1980, 3.2),
(152, 2000, 4.9),
(153, 1920, 0),
(153, 1940, 0.8),
(153, 1960, 1.9),
(153, 1980, 3.2),
(153, 2000, 4.9),
(154, 1920, 0),
(154, 1940, 0.8),
(154, 1960, 1.9),
(154, 1980, 3.2),
(154, 2000, 4.9),
(155, 1920, 0),
(155, 1940, 0.8),
(155, 1960, 1.9),
(155, 1980, 3.2),
(155, 2000, 4.9),
(156, 1920, 0),
(156, 1940, 0.8),
(156, 1960, 1.8),
(156, 1980, 3),
(156, 2000, 4.7),
(157, 1920, 0),
(157, 1940, 0.8),
(157, 1960, 1.8),
(157, 1980, 3),
(157, 2000, 4.7),
(158, 1920, 0),
(158, 1940, 0.8),
(158, 1960, 1.8),
(158, 1980, 3),
(158, 2000, 4.7),
(159, 1920, 0),
(159, 1940, 0.8),
(159, 1960, 1.8),
(159, 1980, 3),
(159, 2000, 4.7),
(NULL, 0, 0);

--
-- Triggers `sea_level`
--
DELIMITER $$
CREATE TRIGGER `sea_level_check` BEFORE INSERT ON `sea_level` FOR EACH ROW BEGIN
    IF NEW.s_level < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Sea level cannot be negative';
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `sea_level_check_update` BEFORE UPDATE ON `sea_level` FOR EACH ROW BEGIN
    IF NEW.s_level < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Sea level cannot be negative';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `temperature`
--

CREATE TABLE `temperature` (
  `c_id` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `temp_rate` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `temperature`
--

INSERT INTO `temperature` (`c_id`, `year`, `temp_rate`) VALUES
(102, 1920, 10.8),
(102, 1940, 10.9),
(102, 1960, 11.2),
(102, 1980, 11.5),
(102, 2000, 12),
(103, 1920, -3.2),
(103, 1940, -3),
(103, 1960, -2.7),
(103, 1980, -2.3),
(103, 2000, -1.8),
(104, 1920, 8.2),
(104, 1940, 8.4),
(104, 1960, 8.5),
(104, 1980, 8.7),
(104, 2000, 9.2),
(105, 1920, 10.5),
(105, 1940, 10.7),
(105, 1960, 10.9),
(105, 1980, 11.1),
(105, 2000, 11.6),
(106, 1920, 11.5),
(106, 1940, 11.7),
(106, 1960, 12),
(106, 1980, 12.3),
(106, 2000, 12.8),
(107, 1920, 20.5),
(107, 1940, 20.7),
(107, 1960, 20.9),
(107, 1980, 21.1),
(107, 2000, 21.6),
(108, 1920, 13.2),
(108, 1940, 13.3),
(108, 1960, 13.5),
(108, 1980, 13.7),
(108, 2000, 14),
(109, 1920, 25.8),
(109, 1940, 26),
(109, 1960, 26.2),
(109, 1980, 26.5),
(109, 2000, 27),
(110, 1920, 1.5),
(110, 1940, 1.7),
(110, 1960, 1.9),
(110, 1980, 2.2),
(110, 2000, 2.7),
(111, 1920, 8.8),
(111, 1940, 9),
(111, 1960, 9.1),
(111, 1980, 9.3),
(111, 2000, 9.8),
(112, 1920, 14.2),
(112, 1940, 14.4),
(112, 1960, 14.6),
(112, 1980, 14.8),
(112, 2000, 15.3),
(113, 1920, 10.5),
(113, 1940, 10.7),
(113, 1960, 11),
(113, 1980, 11.3),
(113, 2000, 11.9),
(114, 1920, 18),
(114, 1940, 19.2),
(114, 1960, 19.4),
(114, 1980, 19.7),
(114, 2000, 20.2),
(115, 1920, 26.5),
(115, 1940, 26.7),
(115, 1960, 26.9),
(115, 1980, 27.1),
(115, 2000, 27.5),
(116, 1920, 12),
(116, 1940, 12.2),
(116, 1960, 12.4),
(116, 1980, 12.6),
(116, 2000, 12.9),
(117, 1920, 14.5),
(117, 1940, 14.7),
(117, 1960, 14.9),
(117, 1980, 15.1),
(117, 2000, 15.6),
(118, 1920, 1.2),
(118, 1940, 1.4),
(118, 1960, 1.6),
(118, 1980, 1.9),
(118, 2000, 2.4),
(119, 1920, 17.2),
(119, 1940, 17.3),
(119, 1960, 17.5),
(119, 1980, 17.7),
(119, 2000, 18),
(120, 1920, 22.5),
(120, 1940, 22.7),
(120, 1960, 22.9),
(120, 1980, 23.1),
(120, 2000, 23.5),
(121, 1920, 7.8),
(121, 1940, 8),
(121, 1960, 8.2),
(121, 1980, 8.4),
(121, 2000, 8.9),
(122, 1920, 6.5),
(122, 1940, 6.7),
(122, 1960, 7),
(122, 1980, 7.3),
(122, 2000, 8),
(123, 1920, 25),
(123, 1940, 25.1),
(123, 1960, 25.3),
(123, 1980, 25.5),
(123, 2000, 25.9),
(124, 1920, 25.2),
(124, 1940, 25.3),
(124, 1960, 25.4),
(124, 1980, 25.6),
(124, 2000, 26),
(125, 1920, 26.5),
(125, 1940, 26.6),
(125, 1960, 26.8),
(125, 1980, 27),
(125, 2000, 27.4),
(126, 1920, 20.5),
(126, 1940, 20.6),
(126, 1960, 20.8),
(126, 1980, 21),
(126, 2000, 21.5),
(127, 1920, 12.5),
(127, 1940, 12.7),
(127, 1960, 13),
(127, 1980, 13.3),
(127, 2000, 14),
(128, 1920, 17.5),
(128, 1940, 17.7),
(128, 1960, 18),
(128, 1980, 18.3),
(128, 2000, 18.9),
(129, 1920, 22.5),
(129, 1940, 22.7),
(129, 1960, 23),
(129, 1980, 23.3),
(129, 2000, 23.9),
(130, 1920, 27),
(130, 1940, 27.1),
(130, 1960, 27.3),
(130, 1980, 27.5),
(130, 2000, 28),
(131, 1920, 23.5),
(131, 1940, 23.6),
(131, 1960, 23.8),
(131, 1980, 24),
(131, 2000, 24.5),
(132, 1920, 24.5),
(132, 1940, 24.6),
(132, 1960, 24.8),
(132, 1980, 25),
(132, 2000, 25.5),
(133, 1920, 15.2),
(133, 1940, 15.3),
(133, 1960, 15.5),
(133, 1980, 15.7),
(133, 2000, 16.1),
(134, 1920, 22.5),
(134, 1940, 22.7),
(134, 1960, 23),
(134, 1980, 23.3),
(134, 2000, 23.9),
(135, 1920, 18.5),
(135, 1940, 18.6),
(135, 1960, 18.8),
(135, 1980, 19),
(135, 2000, 19.5),
(136, 1920, 22.5),
(136, 1940, 22.7),
(136, 1960, 23),
(136, 1980, 23.3),
(136, 2000, 23.9),
(137, 1920, 26),
(137, 1940, 26.2),
(137, 1960, 26.4),
(137, 1980, 26.6),
(137, 2000, 27),
(138, 1920, 18.5),
(138, 1940, 18.7),
(138, 1960, 19),
(138, 1980, 19.3),
(138, 2000, 19.9),
(139, 1920, 25.5),
(139, 1940, 25.7),
(139, 1960, 25.9),
(139, 1980, 26.1),
(139, 2000, 26.6),
(140, 1920, 23.5),
(140, 1940, 23.6),
(140, 1960, 23.8),
(140, 1980, 24),
(140, 2000, 24.5),
(141, 1920, 22.5),
(141, 1940, 22.7),
(141, 1960, 23),
(141, 1980, 23.2),
(141, 2000, 23.7),
(142, 1920, 14.5),
(142, 1940, 14.7),
(142, 1960, 15),
(142, 1980, 15.3),
(142, 2000, 16),
(143, 1920, 20.5),
(143, 1940, 20.7),
(143, 1960, 20.9),
(143, 1980, 21.1),
(143, 2000, 21.6),
(144, 1920, 27),
(144, 1940, 27.1),
(144, 1960, 27.3),
(144, 1980, 27.5),
(144, 2000, 28),
(145, 1920, 15.5),
(145, 1940, 15.7),
(145, 1960, 16),
(145, 1980, 16.3),
(145, 2000, 16.9),
(146, 1920, 19),
(146, 1940, 19.2),
(146, 1960, 19.4),
(146, 1980, 19.7),
(146, 2000, 20.2),
(147, 1920, 27.5),
(147, 1940, 27.6),
(147, 1960, 27.8),
(147, 1980, 28),
(147, 2000, 28.5),
(148, 1920, 24.5),
(148, 1940, 24.6),
(148, 1960, 24.8),
(148, 1980, 25),
(148, 2000, 25.5),
(149, 1920, 26.5),
(149, 1940, 26.7),
(149, 1960, 26.9),
(149, 1980, 27.1),
(149, 2000, 27.6),
(150, 1920, 12.5),
(150, 1940, 12.7),
(150, 1960, 13),
(150, 1980, 13.3),
(150, 2000, 14),
(151, 1920, 25.5),
(151, 1940, 25.7),
(151, 1960, 26),
(151, 1980, 26.3),
(151, 2000, 26.9),
(152, 1920, 28),
(152, 1940, 28.1),
(152, 1960, 28.3),
(152, 1980, 28.5),
(152, 2000, 29),
(153, 1920, 24.5),
(153, 1940, 24.7),
(153, 1960, 25),
(153, 1980, 25.3),
(153, 2000, 25.9),
(154, 1920, 22.5),
(154, 1940, 22.7),
(154, 1960, 23),
(154, 1980, 23.3),
(154, 2000, 23.9),
(155, 1920, 26.5),
(155, 1940, 26.7),
(155, 1960, 27),
(155, 1980, 27.3),
(155, 2000, 27.9),
(156, 1920, 28.5),
(156, 1940, 28.6),
(156, 1960, 28.8),
(156, 1980, 29),
(156, 2000, 29.5),
(157, 1920, 28),
(157, 1940, 28.1),
(157, 1960, 28.3),
(157, 1980, 28.5),
(157, 2000, 29),
(158, 1920, 22),
(158, 1940, 22.2),
(158, 1960, 22.4),
(158, 1980, 22.7),
(158, 2000, 23.2),
(159, 1920, 28.5),
(159, 1940, 28.6),
(159, 1960, 28.8),
(159, 1980, 29),
(159, 2000, 29.5),
(NULL, 0, 0);

--
-- Triggers `temperature`
--
DELIMITER $$
CREATE TRIGGER `temp_check` BEFORE INSERT ON `temperature` FOR EACH ROW BEGIN
    IF NEW.temp_rate > 80 OR NEW.temp_rate < -80 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Temperature out of range (-80 to 80)';
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `temp_check_update` BEFORE UPDATE ON `temperature` FOR EACH ROW BEGIN
    IF NEW.temp_rate > 80 OR NEW.temp_rate < -80 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Temperature out of range (-80 to 80)';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `u_id` int(11) NOT NULL,
  `u_name` varchar(15) NOT NULL,
  `pass` varchar(10) NOT NULL,
  `position` enum('admin','user') DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`u_id`, `u_name`, `pass`, `position`) VALUES
(1, 'Maruf', '1234', 'user'),
(3, 'admin1', '12345', 'admin'),
(5, 'admin2', '12345', 'user');

--
-- Triggers `users`
--
DELIMITER $$
CREATE TRIGGER `before_create_account` BEFORE INSERT ON `users` FOR EACH ROW BEGIN
	DECLARE u_count INT;
    
    SELECT COUNT(*) INTO u_count
    FROM users WHERE lower(u_name)=LOWER(new.u_name);
    
    if u_count > 0 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT ='User name already exist...!';
    END if;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure for view `full_data`
--
DROP TABLE IF EXISTS `full_data`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `full_data`  AS SELECT `c`.`c_name` AS `country`, `t`.`year` AS `year`, `t`.`temp_rate` AS `temperature`, `s`.`s_level` AS `sea_level`, `ca`.`c_rate` AS `carbon` FROM (((`country` `c` join `temperature` `t` on(`c`.`c_id` = `t`.`c_id`)) join `sea_level` `s` on(`c`.`c_id` = `s`.`c_id` and `t`.`year` = `s`.`year`)) join `carbon` `ca` on(`c`.`c_id` = `ca`.`c_id` and `t`.`year` = `ca`.`year`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carbon`
--
ALTER TABLE `carbon`
  ADD KEY `c_id` (`c_id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`c_id`);

--
-- Indexes for table `sea_level`
--
ALTER TABLE `sea_level`
  ADD KEY `c_id` (`c_id`);

--
-- Indexes for table `temperature`
--
ALTER TABLE `temperature`
  ADD KEY `c_id` (`c_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`u_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `u_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carbon`
--
ALTER TABLE `carbon`
  ADD CONSTRAINT `carbon_ibfk_1` FOREIGN KEY (`c_id`) REFERENCES `country` (`c_id`);

--
-- Constraints for table `sea_level`
--
ALTER TABLE `sea_level`
  ADD CONSTRAINT `sea_level_ibfk_1` FOREIGN KEY (`c_id`) REFERENCES `country` (`c_id`);

--
-- Constraints for table `temperature`
--
ALTER TABLE `temperature`
  ADD CONSTRAINT `temperature_ibfk_1` FOREIGN KEY (`c_id`) REFERENCES `country` (`c_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
