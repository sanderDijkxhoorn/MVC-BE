-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Dec 01, 2022 at 10:03 AM
-- Server version: 5.7.34
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Mvc-2109a`
--

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(300) NOT NULL,
  `capitalCity` varchar(300) NOT NULL,
  `continent` enum('Afrika','Antarctica','Azië','Australië/Oceanië','Europa','Noord-Amerika','Zuid-Amerika') NOT NULL,
  `population` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `name`, `capitalCity`, `continent`, `population`) VALUES
(1, 'Nederland', 'Amsterdam', 'Zuid-Amerika', 17134873),
(2, 'Rwandass', 'Kigaliess', 'Europa', 129522193),
(3, 'Chili', 'Santiago', 'Zuid-Amerika', 19116201),
(4, 'Canada', 'Ottawa', 'Noord-Amerika', 37742154),
(5, 'Australië', 'Canberra', 'Australië/Oceanië', 25499884);

-- --------------------------------------------------------

--
-- Table structure for table `Instructeur`
--

CREATE TABLE `Instructeur` (
  `Id` tinyint(11) UNSIGNED NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Naam` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Instructeur`
--

INSERT INTO `Instructeur` (`Id`, `Email`, `Naam`) VALUES
(1, 'groen@mail.nl', 'Groen'),
(2, 'konijn@google.com', 'Konijn'),
(3, 'frasi@google.spail.nl', 'Frasi');

-- --------------------------------------------------------

--
-- Table structure for table `Leerling`
--

CREATE TABLE `Leerling` (
  `Id` mediumint(8) UNSIGNED NOT NULL,
  `Naam` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Leerling`
--

INSERT INTO `Leerling` (`Id`, `Naam`) VALUES
(3, 'Konijn'),
(4, 'Slavink'),
(6, 'Otto');

-- --------------------------------------------------------

--
-- Table structure for table `Les`
--

CREATE TABLE `Les` (
  `Id` mediumint(8) UNSIGNED NOT NULL,
  `DatumTijd` datetime NOT NULL,
  `LeerlingId` mediumint(8) UNSIGNED NOT NULL,
  `InstructeurId` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Les`
--

INSERT INTO `Les` (`Id`, `DatumTijd`, `LeerlingId`, `InstructeurId`) VALUES
(45, '2022-05-20 14:00:00', 3, 1),
(46, '2022-05-20 10:00:00', 6, 3),
(47, '2022-05-21 13:00:00', 4, 2),
(48, '2022-05-21 17:00:00', 6, 3),
(49, '2022-05-22 11:00:00', 3, 1),
(50, '2022-05-28 19:00:00', 4, 2),
(51, '2022-06-01 20:00:00', 3, 2),
(52, '2022-06-12 08:00:00', 3, 1),
(53, '2022-06-22 12:00:00', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Onderwerp`
--

CREATE TABLE `Onderwerp` (
  `Id` mediumint(8) UNSIGNED NOT NULL,
  `LesId` mediumint(8) UNSIGNED NOT NULL,
  `Onderwerp` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Onderwerp`
--

INSERT INTO `Onderwerp` (`Id`, `LesId`, `Onderwerp`) VALUES
(2343, 45, 'File parkeren'),
(2344, 46, 'Achteruit rijden'),
(2345, 49, 'File parkeren'),
(2346, 49, 'Invoegen snelweg'),
(2347, 50, 'Achteruit rijden'),
(2348, 52, 'Achteruit rijden'),
(2349, 52, 'Invoegen snelweg'),
(2350, 52, 'File parkeren');

-- --------------------------------------------------------

--
-- Table structure for table `Opmerking`
--

CREATE TABLE `Opmerking` (
  `Id` mediumint(8) UNSIGNED NOT NULL,
  `LesId` mediumint(8) UNSIGNED NOT NULL,
  `Opmerking` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Opmerking`
--

INSERT INTO `Opmerking` (`Id`, `LesId`, `Opmerking`) VALUES
(1123, 45, 'File parkeren kan beter'),
(1124, 46, 'Beter in spiegel kijken'),
(1125, 49, 'Opletten op aankomend verkeer'),
(1126, 49, 'Langer doorrijden bij invoegen'),
(1127, 50, 'Langzaam aan'),
(1128, 52, 'Beter in spiegels kijken'),
(1129, 52, 'richtingaanwijzer aan');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Instructeur`
--
ALTER TABLE `Instructeur`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `Leerling`
--
ALTER TABLE `Leerling`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `Les`
--
ALTER TABLE `Les`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FK_Les_LeerlingId_Leerling_Id` (`LeerlingId`),
  ADD KEY `FK_Les_InstructeurId_Instructeur_Id` (`InstructeurId`);

--
-- Indexes for table `Onderwerp`
--
ALTER TABLE `Onderwerp`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FK_Onderwerp_LesId_Les_Id` (`LesId`);

--
-- Indexes for table `Opmerking`
--
ALTER TABLE `Opmerking`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FK_Opmerking_LesId_Les_Id` (`LesId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Instructeur`
--
ALTER TABLE `Instructeur`
  MODIFY `Id` tinyint(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Leerling`
--
ALTER TABLE `Leerling`
  MODIFY `Id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `Les`
--
ALTER TABLE `Les`
  MODIFY `Id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `Onderwerp`
--
ALTER TABLE `Onderwerp`
  MODIFY `Id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2351;

--
-- AUTO_INCREMENT for table `Opmerking`
--
ALTER TABLE `Opmerking`
  MODIFY `Id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1130;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Les`
--
ALTER TABLE `Les`
  ADD CONSTRAINT `FK_Les_InstructeurId_Instructeur_Id` FOREIGN KEY (`InstructeurId`) REFERENCES `Instructeur` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Les_LeerlingId_Leerling_Id` FOREIGN KEY (`LeerlingId`) REFERENCES `Leerling` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Onderwerp`
--
ALTER TABLE `Onderwerp`
  ADD CONSTRAINT `FK_Onderwerp_LesId_Les_Id` FOREIGN KEY (`LesId`) REFERENCES `Les` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Opmerking`
--
ALTER TABLE `Opmerking`
  ADD CONSTRAINT `FK_Opmerking_LesId_Les_Id` FOREIGN KEY (`LesId`) REFERENCES `Les` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
