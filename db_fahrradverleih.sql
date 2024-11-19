-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 18, 2024 at 09:37 PM
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
-- Database: `db_fahrradverleih`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ausleihen`
--

CREATE TABLE `tbl_ausleihen` (
  `IDAusleih` int(10) UNSIGNED NOT NULL,
  `Startzeit` datetime NOT NULL,
  `Endzeit` datetime NOT NULL,
  `GPSLongitude` double NOT NULL,
  `GPSLatitude` double NOT NULL,
  `FIDFahrrad` int(10) UNSIGNED NOT NULL,
  `FIDKarte` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_ausleihen`
--

INSERT INTO `tbl_ausleihen` (`IDAusleih`, `Startzeit`, `Endzeit`, `GPSLongitude`, `GPSLatitude`, `FIDFahrrad`, `FIDKarte`) VALUES
(1, '2024-11-18 14:34:38', '2024-11-18 14:54:38', 0.3434256174534, 0.4334256174534, 2, 2),
(2, '2024-11-18 12:54:38', '2024-11-18 13:54:38', 0.4434256174534, 0.5434256174534, 1, 1),
(3, '2024-11-18 16:16:03', '2024-11-18 17:16:03', 0.5434256174534, 0.5455256174534, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_fahrraeder`
--

CREATE TABLE `tbl_fahrraeder` (
  `IDFahrrad` int(10) UNSIGNED NOT NULL,
  `Pin` char(5) NOT NULL,
  `FIDType` int(10) UNSIGNED NOT NULL,
  `FIDHersteller` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_fahrraeder`
--

INSERT INTO `tbl_fahrraeder` (`IDFahrrad`, `Pin`, `FIDType`, `FIDHersteller`) VALUES
(1, '56782', 1, 1),
(2, '22132', 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_herstellers`
--

CREATE TABLE `tbl_herstellers` (
  `IDHersteller` int(10) UNSIGNED NOT NULL,
  `Hersteller` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_herstellers`
--

INSERT INTO `tbl_herstellers` (`IDHersteller`, `Hersteller`) VALUES
(2, 'Scott'),
(1, 'Trek');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_karten`
--

CREATE TABLE `tbl_karten` (
  `IDKarte` int(10) UNSIGNED NOT NULL,
  `Pin` char(4) NOT NULL,
  `Guthaben` double NOT NULL,
  `FIDKunde` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_karten`
--

INSERT INTO `tbl_karten` (`IDKarte`, `Pin`, `Guthaben`, `FIDKunde`) VALUES
(1, 'SQL1', 30.5, 1),
(2, 'ABC2', 25, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kunden`
--

CREATE TABLE `tbl_kunden` (
  `IDKunde` int(10) UNSIGNED NOT NULL,
  `Vorname` varchar(32) NOT NULL,
  `Nachname` varchar(32) NOT NULL,
  `Adresse` varchar(64) NOT NULL,
  `Tel` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_kunden`
--

INSERT INTO `tbl_kunden` (`IDKunde`, `Vorname`, `Nachname`, `Adresse`, `Tel`) VALUES
(1, 'Alex', 'Domanski', '5020 Salzburg, Elisabethstrasse 8c', '+4368110843188'),
(2, 'Tom', 'Schmidt', '5020 Salzburg, Getreidegasse 5', '+436641110002');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_types`
--

CREATE TABLE `tbl_types` (
  `IDType` int(10) UNSIGNED NOT NULL,
  `Type` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_types`
--

INSERT INTO `tbl_types` (`IDType`, `Type`) VALUES
(2, 'Citybike'),
(1, 'MTB');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_ausleihen`
--
ALTER TABLE `tbl_ausleihen`
  ADD PRIMARY KEY (`IDAusleih`),
  ADD KEY `FIDKarte` (`FIDKarte`),
  ADD KEY `FIDFahrrad` (`FIDFahrrad`);

--
-- Indexes for table `tbl_fahrraeder`
--
ALTER TABLE `tbl_fahrraeder`
  ADD PRIMARY KEY (`IDFahrrad`),
  ADD UNIQUE KEY `Pin` (`Pin`),
  ADD KEY `FIDType` (`FIDType`),
  ADD KEY `FIDHersteller` (`FIDHersteller`);

--
-- Indexes for table `tbl_herstellers`
--
ALTER TABLE `tbl_herstellers`
  ADD PRIMARY KEY (`IDHersteller`),
  ADD UNIQUE KEY `Hersteller` (`Hersteller`);

--
-- Indexes for table `tbl_karten`
--
ALTER TABLE `tbl_karten`
  ADD PRIMARY KEY (`IDKarte`),
  ADD UNIQUE KEY `Pin` (`Pin`),
  ADD KEY `FIDKunde` (`FIDKunde`);

--
-- Indexes for table `tbl_kunden`
--
ALTER TABLE `tbl_kunden`
  ADD PRIMARY KEY (`IDKunde`);

--
-- Indexes for table `tbl_types`
--
ALTER TABLE `tbl_types`
  ADD PRIMARY KEY (`IDType`),
  ADD UNIQUE KEY `Type` (`Type`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_ausleihen`
--
ALTER TABLE `tbl_ausleihen`
  MODIFY `IDAusleih` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_fahrraeder`
--
ALTER TABLE `tbl_fahrraeder`
  MODIFY `IDFahrrad` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_herstellers`
--
ALTER TABLE `tbl_herstellers`
  MODIFY `IDHersteller` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_karten`
--
ALTER TABLE `tbl_karten`
  MODIFY `IDKarte` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_kunden`
--
ALTER TABLE `tbl_kunden`
  MODIFY `IDKunde` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_types`
--
ALTER TABLE `tbl_types`
  MODIFY `IDType` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_ausleihen`
--
ALTER TABLE `tbl_ausleihen`
  ADD CONSTRAINT `tbl_ausleihen_ibfk_2` FOREIGN KEY (`FIDKarte`) REFERENCES `tbl_karten` (`IDKarte`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_ausleihen_ibfk_3` FOREIGN KEY (`FIDFahrrad`) REFERENCES `tbl_fahrraeder` (`IDFahrrad`) ON UPDATE CASCADE;

--
-- Constraints for table `tbl_fahrraeder`
--
ALTER TABLE `tbl_fahrraeder`
  ADD CONSTRAINT `tbl_fahrraeder_ibfk_1` FOREIGN KEY (`FIDType`) REFERENCES `tbl_types` (`IDType`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_fahrraeder_ibfk_2` FOREIGN KEY (`FIDHersteller`) REFERENCES `tbl_herstellers` (`IDHersteller`) ON UPDATE CASCADE;

--
-- Constraints for table `tbl_karten`
--
ALTER TABLE `tbl_karten`
  ADD CONSTRAINT `tbl_karten_ibfk_1` FOREIGN KEY (`FIDKunde`) REFERENCES `tbl_kunden` (`IDKunde`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
