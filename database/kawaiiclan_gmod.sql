-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 20, 2022 at 03:36 AM
-- Server version: 10.4.16-MariaDB
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kawaiiclan_gmod`
--

-- --------------------------------------------------------

--
-- Table structure for table `game_bots`
--

CREATE TABLE `game_bots` (
  `szMap` text NOT NULL,
  `szPlayer` text DEFAULT NULL,
  `nTime` int(11) NOT NULL,
  `nStyle` int(11) NOT NULL,
  `szSteam` text NOT NULL,
  `szDate` int(11) DEFAULT NULL,
  `nFrame` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `game_map`
--

CREATE TABLE `game_map` (
  `szMap` text NOT NULL,
  `nMultiplier` int(11) NOT NULL DEFAULT 1,
  `nBonusMultiplier` int(11) DEFAULT NULL,
  `nPlays` int(11) NOT NULL DEFAULT 0,
  `nOptions` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `game_times`
--

CREATE TABLE `game_times` (
  `szUID` text NOT NULL,
  `szPlayer` text DEFAULT NULL,
  `szMap` text NOT NULL,
  `nStyle` int(11) NOT NULL,
  `nTime` double NOT NULL,
  `nPoints` float NOT NULL,
  `vData` text DEFAULT NULL,
  `szDate` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `game_zones`
--

CREATE TABLE `game_zones` (
  `szMap` text NOT NULL,
  `nType` int(11) NOT NULL,
  `vPos1` text DEFAULT NULL,
  `vPos2` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `gmod_admins`
--

CREATE TABLE `gmod_admins` (
  `nID` int(11) NOT NULL,
  `szSteam` varchar(255) NOT NULL,
  `nLevel` int(11) NOT NULL DEFAULT 0,
  `nType` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gmod_bans`
--

CREATE TABLE `gmod_bans` (
  `nID` int(11) NOT NULL,
  `szUserSteam` varchar(255) NOT NULL,
  `szUserName` varchar(255) DEFAULT NULL,
  `nStart` bigint(20) NOT NULL,
  `nLength` int(11) NOT NULL,
  `szReason` varchar(255) DEFAULT NULL,
  `szAdminSteam` varchar(255) NOT NULL,
  `szAdminName` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gmod_donations`
--

CREATE TABLE `gmod_donations` (
  `nID` int(11) NOT NULL,
  `szEmail` varchar(255) NOT NULL,
  `szName` varchar(255) DEFAULT NULL,
  `szCountry` varchar(255) DEFAULT NULL,
  `nAmount` int(11) NOT NULL,
  `szSteam` varchar(255) DEFAULT NULL,
  `szDate` varchar(255) NOT NULL,
  `szStatus` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gmod_logging`
--

CREATE TABLE `gmod_logging` (
  `nID` int(11) NOT NULL,
  `nType` int(11) NOT NULL DEFAULT 0,
  `szData` text DEFAULT NULL,
  `szDate` varchar(255) DEFAULT NULL,
  `szAdminSteam` varchar(255) NOT NULL,
  `szAdminName` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gmod_notifications`
--

CREATE TABLE `gmod_notifications` (
  `nID` int(11) NOT NULL,
  `nType` int(11) NOT NULL DEFAULT 0,
  `nTimeout` int(11) NOT NULL DEFAULT 60,
  `szText` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gmod_radio`
--

CREATE TABLE `gmod_radio` (
  `nID` int(11) NOT NULL,
  `szUnique` varchar(255) NOT NULL,
  `nService` int(11) DEFAULT 0,
  `nTicket` int(11) DEFAULT 0,
  `szDate` varchar(255) NOT NULL,
  `nDuration` int(11) DEFAULT 0,
  `szTagTitle` varchar(255) NOT NULL DEFAULT '',
  `szTagArtist` varchar(255) NOT NULL DEFAULT '',
  `szRequester` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gmod_radio_queue`
--

CREATE TABLE `gmod_radio_queue` (
  `nID` int(11) NOT NULL,
  `nTicket` int(11) NOT NULL,
  `nType` int(11) NOT NULL,
  `szDate` varchar(255) DEFAULT NULL,
  `szStatus` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gmod_vips`
--

CREATE TABLE `gmod_vips` (
  `nID` int(11) NOT NULL,
  `szSteam` varchar(255) NOT NULL,
  `nType` int(11) NOT NULL,
  `szTag` varchar(255) NOT NULL DEFAULT '',
  `szName` varchar(255) NOT NULL DEFAULT '',
  `szChat` varchar(255) NOT NULL DEFAULT '',
  `nStart` bigint(20) DEFAULT NULL,
  `nLength` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jac_log`
--

CREATE TABLE `jac_log` (
  `id` int(11) NOT NULL,
  `steamid` varchar(255) DEFAULT NULL,
  `name` text DEFAULT NULL,
  `ip` text DEFAULT NULL,
  `detectionid` text DEFAULT NULL,
  `data` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `game_map`
--
ALTER TABLE `game_map`
  ADD UNIQUE KEY `szMap` (`szMap`) USING HASH;

--
-- Indexes for table `gmod_admins`
--
ALTER TABLE `gmod_admins`
  ADD PRIMARY KEY (`nID`);

--
-- Indexes for table `gmod_bans`
--
ALTER TABLE `gmod_bans`
  ADD PRIMARY KEY (`nID`);

--
-- Indexes for table `gmod_donations`
--
ALTER TABLE `gmod_donations`
  ADD PRIMARY KEY (`nID`);

--
-- Indexes for table `gmod_logging`
--
ALTER TABLE `gmod_logging`
  ADD PRIMARY KEY (`nID`);

--
-- Indexes for table `gmod_notifications`
--
ALTER TABLE `gmod_notifications`
  ADD PRIMARY KEY (`nID`);

--
-- Indexes for table `gmod_radio`
--
ALTER TABLE `gmod_radio`
  ADD PRIMARY KEY (`nID`);

--
-- Indexes for table `gmod_radio_queue`
--
ALTER TABLE `gmod_radio_queue`
  ADD PRIMARY KEY (`nID`);

--
-- Indexes for table `gmod_vips`
--
ALTER TABLE `gmod_vips`
  ADD PRIMARY KEY (`nID`);

--
-- Indexes for table `jac_log`
--
ALTER TABLE `jac_log`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `gmod_admins`
--
ALTER TABLE `gmod_admins`
  MODIFY `nID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gmod_bans`
--
ALTER TABLE `gmod_bans`
  MODIFY `nID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gmod_donations`
--
ALTER TABLE `gmod_donations`
  MODIFY `nID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gmod_logging`
--
ALTER TABLE `gmod_logging`
  MODIFY `nID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gmod_notifications`
--
ALTER TABLE `gmod_notifications`
  MODIFY `nID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gmod_radio`
--
ALTER TABLE `gmod_radio`
  MODIFY `nID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gmod_radio_queue`
--
ALTER TABLE `gmod_radio_queue`
  MODIFY `nID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gmod_vips`
--
ALTER TABLE `gmod_vips`
  MODIFY `nID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jac_log`
--
ALTER TABLE `jac_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
