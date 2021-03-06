-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 16, 2022 at 08:50 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `superstore`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `ANAME` varchar(20) NOT NULL,
  `APASS` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`ANAME`, `APASS`) VALUES
('555', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `clearance`
--

CREATE TABLE `clearance` (
  `TRY` varchar(20) NOT NULL,
  `SICRY` varchar(20) NOT NULL,
  `QUANT` int(11) NOT NULL,
  `ACTUALPRICE` varchar(11) NOT NULL,
  `DISCOUNTEDPRICE` varchar(11) NOT NULL,
  `SID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `clearance`
--

INSERT INTO `clearance` (`TRY`, `SICRY`, `QUANT`, `ACTUALPRICE`, `DISCOUNTEDPRICE`, `SID`) VALUES
('Accessories', 'Bags', 9, 'RS.449', 'RS.199', 102),
('Beverages', 'Sports Drink', 20, 'RS.99', 'RS.89', 103),
('Electronics', 'Sports Watches', 14, 'RS.999', 'RS.849', 103),
('Clothing', 'Mens Sweathshirt ', 6, 'RS.700', 'RS.499', 102);

-- --------------------------------------------------------

--
-- Table structure for table `dstbr`
--

CREATE TABLE `dstbr` (
  `DID` int(11) NOT NULL,
  `DNAME` varchar(20) NOT NULL,
  `DPASS` varchar(20) NOT NULL DEFAULT 'admin',
  `DTYPE` varchar(20) NOT NULL,
  `DLOC` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dstbr`
--

INSERT INTO `dstbr` (`DID`, `DNAME`, `DPASS`, `DTYPE`, `DLOC`) VALUES
(1000, 'Newfeel', 'admin', 'Bags', 'Delhi'),
(1001, 'Quechua', 'admin', 'Camping/hiking Appar', 'Hyderbad'),
(1002, 'Kalenji', 'admin', 'watches', 'Mumbai'),
(1003, 'BTWN', 'admin', 'Cycles', 'Bangalore'),
(1015, 'DOMYOS ', 'admin', 'Whey protein', 'Chennai'),
(1016, 'Nike', 'admin', 'Shoes', 'Mangalore');

--
-- Triggers `dstbr`
--
DELIMITER $$
CREATE TRIGGER `insertlogs` AFTER INSERT ON `dstbr` FOR EACH ROW INSERT INTO logs VALUES(NEW.DID,'Inserted',NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `action` varchar(20) NOT NULL,
  `cdate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`id`, `action`, `cdate`) VALUES
(1015, 'Inserted', '2022-01-16 13:08:36'),
(1016, 'Inserted', '2022-01-16 13:19:21');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `SALESID` int(11) NOT NULL,
  `SDATE` varchar(20) NOT NULL,
  `SCOST` int(11) NOT NULL,
  `SID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`SALESID`, `SDATE`, `SCOST`, `SID`) VALUES
(222, '22/11/2018', 40079, 100),
(227, '11/11/2018', 59879, 100),
(228, '27/11/2018', 60000, 100),
(229, '25/11/2018', 70000, 100);

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE `stock` (
  `CRY` varchar(20) NOT NULL,
  `SCRY` varchar(20) NOT NULL,
  `QUANT` int(11) NOT NULL,
  `SID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` (`CRY`, `SCRY`, `QUANT`, `SID`) VALUES
('Electronics', 'Mobiles', 30, 100),
('Clothing', 'Woolen', 20, 101);

-- --------------------------------------------------------

--
-- Table structure for table `store`
--

CREATE TABLE `store` (
  `SID` int(11) NOT NULL,
  `SPASS` varchar(20) NOT NULL DEFAULT 'admin',
  `SBRANCHNAME` varchar(20) NOT NULL,
  `SCITY` varchar(20) NOT NULL,
  `SREGION` varchar(20) NOT NULL,
  `SSTATE` varchar(20) NOT NULL,
  `SPCODE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `store`
--

INSERT INTO `store` (`SID`, `SPASS`, `SBRANCHNAME`, `SCITY`, `SREGION`, `SSTATE`, `SPCODE`) VALUES
(100, 'admin', 'DEACTHLON ETA', 'Bangalore', 'South', 'KARNATAKA', 560020),
(101, 'admin', ' DECATHLON Mysore R', 'Bangalore', 'South ', 'Karnataka', 560060),
(102, 'admin', 'DEACTHLON INDIRANAGA', 'Bangalore', 'North', 'KARNATAKA', 560038),
(103, 'admin', 'DEACTHLON WHITEFIELD', 'Bangalore', 'South', 'KARNATAKA', 560048);

-- --------------------------------------------------------

--
-- Table structure for table `strorders`
--

CREATE TABLE `strorders` (
  `SID` int(11) NOT NULL,
  `ORDID` int(11) NOT NULL,
  `DID` int(11) NOT NULL,
  `ORDDATE` timestamp NOT NULL DEFAULT current_timestamp(),
  `PMYSTAT` varchar(20) NOT NULL DEFAULT 'PENDING',
  `SHPMODE` varchar(20) NOT NULL DEFAULT 'Normal',
  `SHPSTAT` varchar(20) NOT NULL DEFAULT 'PENDING'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `strorders`
--

INSERT INTO `strorders` (`SID`, `ORDID`, `DID`, `ORDDATE`, `PMYSTAT`, `SHPMODE`, `SHPSTAT`) VALUES
(100, 500, 1000, '2018-11-20 20:52:59', '', 'Premium', 'Delivered'),
(0, 501, 1000, '2018-11-20 21:14:45', 'PAID', 'Normal', 'PENDING'),
(100, 502, 1000, '2018-11-20 21:15:45', 'PAID', 'Premium', 'Delivered'),
(100, 503, 1000, '2018-11-20 21:20:11', 'PAID', 'Normal', 'PENDING'),
(100, 504, 1000, '2018-11-20 21:37:23', '', 'Normal', 'PENDING'),
(100, 505, 1000, '2018-11-20 21:39:46', '', 'Normal', 'PENDING'),
(100, 506, 1000, '2018-11-21 13:46:39', '', 'Normal', 'PENDING'),
(100, 507, 1000, '2018-11-22 09:47:29', '', 'Normal', 'PENDING'),
(100, 508, 1000, '2019-11-30 15:11:59', '', 'Normal', 'PENDING'),
(100, 509, 1002, '2021-12-11 05:55:40', 'PENDING', 'Normal', 'PENDING'),
(102, 510, 1000, '2022-01-16 06:11:51', 'PAID', 'Normal', 'Delivered'),
(102, 1006, 1003, '2022-01-16 07:36:21', 'PENDING', 'Normal', 'PENDING'),
(102, 1007, 1002, '2022-01-16 07:36:31', 'PENDING', 'Normal', 'PENDING'),
(100, 1008, 1015, '2022-01-16 07:41:29', 'PENDING', 'Normal', 'PENDING'),
(100, 1009, 1000, '2022-01-16 07:41:45', 'PENDING', 'Normal', 'PENDING'),
(100, 1010, 1003, '2022-01-16 07:42:39', 'PENDING', 'Normal', 'PENDING'),
(100, 1011, 1003, '2022-01-16 07:43:07', 'PENDING', 'Normal', 'PENDING'),
(102, 1012, 1015, '2022-01-16 07:44:43', 'PENDING', 'Normal', 'PENDING'),
(102, 1013, 1003, '2022-01-16 07:44:52', 'PENDING', 'Normal', 'PENDING'),
(102, 1014, 1002, '2022-01-16 07:46:50', 'PENDING', 'Normal', 'PENDING');

-- --------------------------------------------------------

--
-- Table structure for table `t`
--

CREATE TABLE `t` (
  `temp` varchar(20) NOT NULL,
  `tee` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t`
--

INSERT INTO `t` (`temp`, `tee`) VALUES
('', '2018-11-30 19:21:11'),
('', '2018-11-30 19:21:32'),
('501', '2018-11-30 19:22:00'),
('503', '2018-11-30 19:25:07'),
('501', '2018-11-30 19:25:20'),
('502', '2018-11-30 19:25:47'),
('501', '2018-11-30 19:31:55'),
('501', '2018-11-30 19:34:22'),
('501', '2018-11-30 19:34:27'),
('505', '2018-11-30 19:34:30'),
('502', '2018-11-30 19:35:50'),
('506', '2018-11-30 19:35:54'),
('503', '2018-11-30 19:36:36'),
('501', '2018-11-30 19:37:40'),
('501', '2018-11-30 19:38:26'),
('501', '2018-11-30 19:38:41'),
('501', '2018-11-30 19:39:42'),
('502', '2018-11-30 19:47:54'),
('503', '2018-11-30 19:47:56'),
('503', '2018-11-30 19:49:10'),
('505', '2018-11-30 19:49:13'),
('505', '2018-11-30 19:49:15'),
('501', '2018-11-30 19:49:17'),
('503', '2018-11-30 19:50:47'),
('501', '2018-11-30 19:50:53'),
('502', '2018-11-30 19:52:55'),
('502', '2018-11-30 19:53:10'),
('502', '2018-11-30 19:53:32'),
('SCITY', '2018-11-30 19:56:55'),
('SREGION', '2018-11-30 19:58:50'),
('SBRANCHNAME', '2018-11-30 19:59:08'),
('SBRANCHNAME', '2018-12-01 04:09:12'),
('501', '2018-12-01 04:15:09'),
('SBRANCHNAME', '2022-01-16 06:07:03'),
('510', '2022-01-16 06:13:43'),
('SCITY', '2022-01-16 07:23:17'),
('SCITY', '2022-01-16 07:25:48'),
('SCITY', '2022-01-16 07:29:12'),
('SCITY', '2022-01-16 07:29:16');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clearance`
--
ALTER TABLE `clearance`
  ADD KEY `SID` (`SID`);

--
-- Indexes for table `dstbr`
--
ALTER TABLE `dstbr`
  ADD PRIMARY KEY (`DID`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`SALESID`);

--
-- Indexes for table `stock`
--
ALTER TABLE `stock`
  ADD KEY `SID` (`SID`);

--
-- Indexes for table `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`SID`);

--
-- Indexes for table `strorders`
--
ALTER TABLE `strorders`
  ADD PRIMARY KEY (`ORDID`),
  ADD KEY `DID` (`DID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dstbr`
--
ALTER TABLE `dstbr`
  MODIFY `DID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1017;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1017;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `SALESID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=230;

--
-- AUTO_INCREMENT for table `store`
--
ALTER TABLE `store`
  MODIFY `SID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `strorders`
--
ALTER TABLE `strorders`
  MODIFY `ORDID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1015;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `clearance`
--
ALTER TABLE `clearance`
  ADD CONSTRAINT `clearance_ibfk_1` FOREIGN KEY (`SID`) REFERENCES `store` (`SID`) ON DELETE CASCADE;

--
-- Constraints for table `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`SID`) REFERENCES `store` (`SID`) ON DELETE CASCADE;

--
-- Constraints for table `strorders`
--
ALTER TABLE `strorders`
  ADD CONSTRAINT `strorders_ibfk_1` FOREIGN KEY (`DID`) REFERENCES `dstbr` (`DID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
