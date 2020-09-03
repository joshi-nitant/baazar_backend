-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Sep 03, 2020 at 10:35 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.2.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `baazar`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `cat_id` int(11) NOT NULL,
  `category_name` varchar(45) NOT NULL,
  `category_image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`cat_id`, `category_name`, `category_image`) VALUES
(1, 'Maize', 'maize.png'),
(2, 'Castor', 'castor.png'),
(3, 'Groundnut', 'ground_nut.png'),
(4, 'Cotton', 'cotton.png');

-- --------------------------------------------------------

--
-- Table structure for table `category_breed`
--

CREATE TABLE `category_breed` (
  `breed_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `breed` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category_breed`
--

INSERT INTO `category_breed` (`breed_id`, `cat_id`, `breed`) VALUES
(1, 2, '1200'),
(2, 2, '1300'),
(3, 2, '1400'),
(4, 2, '1500');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `prod_id` int(11) NOT NULL,
  `quality_certificate` varchar(100) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price_expected` decimal(6,2) NOT NULL,
  `breed` varchar(45) NOT NULL,
  `is_accepted` tinyint(1) DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `image` varchar(500) NOT NULL,
  `remaining_qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`prod_id`, `quality_certificate`, `quantity`, `price_expected`, `breed`, `is_accepted`, `user_id`, `category_id`, `image`, `remaining_qty`) VALUES
(3, NULL, 100, '3000.00', '2100', 1, 12, 1, 'maize.png', 100),
(9, NULL, 50, '5.00', '1200', 1, 12, 2, 'd2f297b8-baac-4ea2-96c0-d682e65f101f197051470.jpg', 30),
(10, NULL, 100, '60.00', '50', 1, 13, 2, 'eca67663-ac8c-4b15-9d77-29845d612137658948382.jpg', 100),
(11, NULL, 50, '60.00', '1200', 1, 13, 4, '322c9279-d414-4820-aa87-c0ba3fee33b3782337554.jpg', 50),
(12, NULL, 50, '60.00', '1400', 1, 13, 4, '322c9279-d414-4820-aa87-c0ba3fee33b3782337554.jpg', 50),
(14, NULL, 100, '30.00', '1300', 1, 17, 2, '3c521cf1-1aef-4f70-9b91-b26fac52c9f71288376546.jpg', 90),
(21, 'Screenshot_20200807-135113.jpeg', 30, '100.00', '2300', 1, 29, 2, 'a43f4365-dd4d-49cd-820c-d71241e8504c41135346.jpg', 0),
(22, NULL, 600, '9999.99', '500', 0, 29, 3, '755fe4de-09be-4126-a818-5adc44da228f149217718.jpg', 600),
(23, NULL, 400, '9999.99', '500', 0, 29, 3, '9562ce56-85b5-4e73-9464-de72fada8ea41400405100.jpg', 400),
(24, NULL, 60, '100.00', '500', 0, 29, 2, '495b9e0a-6c2d-4dde-836f-a5aa0eb1c435558181329.jpg', 60),
(26, NULL, 50, '300.00', '2500', 0, 32, 2, '1a45c7c4-b232-4402-9991-67b2800681391031052892.jpg', 50),
(27, NULL, 50, '20.00', '200', 0, 32, 2, '41c3307c-5728-415e-a18c-b01bf0c826ae31062512.jpg', 50),
(28, NULL, 50, '100.00', '28', 0, 32, 2, '03c70453-a542-4595-8cb0-4eca275841a31698415622.jpg', 50),
(29, NULL, 50, '100.00', '50', 0, 32, 2, 'eeda187e-07e4-44af-8598-353fcbd5dc081909695736.jpg', 50),
(30, NULL, 50, '20.00', '20', 1, 37, 2, 'c970c138-d9e7-4f89-abe1-ba1dc292fd2d2127059146.jpg', 10),
(33, NULL, 50, '30.00', '500', 1, 38, 1, '9a2f7618-66eb-40ef-8ca1-567b8299c24e3839663114944302779.jpg', 0),
(34, NULL, 50, '300.00', '200', 1, 40, 2, 'e6983a2b-55c9-4138-9093-daa8c13545e6769563660.jpg', 50),
(35, NULL, 400, '500.00', '2300', 1, 45, 2, 'dafdeb87-b799-411f-bcf3-c8cdfe84da9f2437864881002466061.jpg', 0),
(36, 'TEMP-PDF-Document.pdf', 60, '90.00', '2500', 1, 46, 2, '5d303f7a-7784-4ec6-ac0f-80eb7483b71f7494125471743212959.jpg', 10),
(37, NULL, 500, '300.00', '3000', 0, 55, 2, 'e4e7b216-611e-4dfe-8133-7c63dbc2d6d4350533359.jpg', 500),
(39, NULL, 500, '300.00', '500', 0, 58, 2, 'a4dadce6-8528-4538-bfc1-960ff51f50b71695371124.jpg', 450),
(40, NULL, 886, '6.00', '3688', 0, 39, 2, '71d98d63-f029-4177-9ab2-39344f8dfa538506951202148451182.jpg', 886),
(41, 'VID-20200814-WA0014.mp4', 1200, '200.00', '1300', 1, 71, 2, '7a549acc-2666-4df8-9484-88cec4bcc0de829951780404915371.jpg', 190),
(42, NULL, 300, '300.00', '2300', 1, 71, 2, '43416f36-e895-457c-963c-67114893e07e3003625269333983174.jpg', 0),
(43, 'Screenshot_2020-08-14-23-47-43-626_com.example.baazar.png', 500, '200.00', '1400', 1, 87, 2, '79d61438-ec0a-44dc-a1e6-921bdc31bfbb48368673.jpg', 160),
(44, NULL, 25, '36.00', '55', 1, 68, 2, 'e57a9932-1f52-4412-ae09-972c09a9e49f8219951010928722466.jpg', 25),
(47, NULL, 258, '258.00', '258', 1, 77, 4, 'a14a2376-f81a-41fa-b421-a53021e570215618296729148509402.jpg', 258),
(48, NULL, 25, '100.00', '25', 1, 75, 1, '92955e71-2d70-4ad6-afe2-ed1c29165a737123791455606334257.jpg', 25),
(49, NULL, 25, '1000.00', '2550', 1, 75, 2, 'e49edfaa-df14-4c8c-85b6-771b83eeecbc7327582591703514115.jpg', 25),
(50, NULL, 500, '800.00', '1700', 0, 78, 2, '5d0bd113-26e1-4df5-89f3-0ffc00b4207d1278545385.jpg', 250),
(51, NULL, 500, '150.00', '1300', 0, 80, 2, 'c73fb7bf-8b6b-4cee-8af6-5ed681efa9c15558559902456244481.jpg', 500),
(53, NULL, 200, '5000.00', '1200', 0, 83, 1, '950c31d2-a02a-42f1-824f-191120a1b35e2691378746410880582.jpg', 200),
(54, NULL, 122, '666.00', '1500', 0, 84, 3, '5f2582ea-1d34-42dc-a449-a3ee1fcdc453991362858655547045.jpg', 122),
(55, NULL, 100, '100.00', '1200', 0, 85, 1, 'ff4ce5ab-b81f-4337-b87c-168452ae0817218226641.jpg', 100),
(56, NULL, 500, '600.00', '1400', 1, 87, 2, '6d0c4e6b-7155-430e-a394-964166d549d9230934484.jpg', 18),
(57, NULL, 500, '300.00', '1200', 1, 95, 2, '49f831f9-4ddb-433e-afa6-7549cad163402004234208.jpg', 347);

-- --------------------------------------------------------

--
-- Table structure for table `product_bid`
--

CREATE TABLE `product_bid` (
  `prod_bid_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `bid_price` decimal(6,2) NOT NULL,
  `bid_quantity` int(11) NOT NULL,
  `is_accepted` tinyint(1) NOT NULL DEFAULT 0,
  `packaging_charges` decimal(10,0) NOT NULL DEFAULT 100,
  `delivery_days` int(11) NOT NULL DEFAULT 15
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_bid`
--

INSERT INTO `product_bid` (`prod_bid_id`, `user_id`, `product_id`, `bid_price`, `bid_quantity`, `is_accepted`, `packaging_charges`, `delivery_days`) VALUES
(1, 12, 9, '30.00', 30, 0, '100', 15),
(2, 29, 21, '200.00', 10, 0, '100', 15),
(3, 29, 21, '30.00', 20, 0, '100', 15),
(4, 29, 21, '30.00', 20, 0, '100', 15),
(5, 29, 21, '30.00', 10, 1, '100', 15),
(6, 29, 21, '20.00', 10, 1, '100', 15),
(10, 30, 14, '100.00', 50, 0, '100', 15),
(11, 33, 14, '50.00', 70, 0, '100', 15),
(12, 35, 14, '20.00', 10, 0, '100', 15),
(13, 36, 10, '100.00', 50, 0, '100', 15),
(14, 37, 30, '30.00', 20, 1, '100', 15),
(15, 38, 33, '30.00', 50, 1, '100', 15),
(16, 40, 34, '300.00', 50, 0, '100', 15),
(17, 46, 36, '60.00', 50, 1, '100', 15),
(18, 41, 36, '30.00', 10, 0, '100', 15),
(19, 41, 36, '200.00', 10, 0, '100', 15),
(20, 41, 36, '200.00', 10, 0, '100', 15),
(21, 41, 36, '200.00', 10, 0, '100', 15),
(22, 41, 36, '200.00', 10, 0, '100', 15),
(23, 41, 36, '200.00', 10, 0, '100', 15),
(24, 41, 36, '200.00', 10, 0, '100', 15),
(25, 41, 36, '200.00', 10, 0, '100', 15),
(26, 41, 36, '200.00', 10, 0, '100', 15),
(27, 41, 36, '200.00', 10, 0, '100', 15),
(28, 41, 36, '200.00', 10, 0, '100', 15),
(29, 41, 36, '200.00', 10, 0, '100', 15),
(30, 41, 36, '90.00', 10, 0, '100', 15),
(31, 41, 36, '90.00', 10, 0, '100', 15),
(32, 59, 36, '50.00', 10, 0, '100', 15),
(33, 63, 14, '100.00', 20, 0, '100', 15),
(34, 63, 10, '500.00', 10, 0, '100', 15),
(35, 66, 12, '10.00', 10, 0, '100', 15),
(36, 71, 9, '500.00', 20, 0, '100', 15),
(37, 71, 41, '150.00', 150, 0, '100', 15),
(39, 71, 42, '300.00', 300, 1, '100', 15),
(41, 71, 41, '100.00', 10, 1, '100', 15),
(44, 75, 12, '2525.00', 25, 0, '100', 15),
(45, 75, 3, '9999.99', 100, 0, '100', 15),
(46, 67, 41, '210.00', 58, 0, '100', 15),
(47, 66, 14, '1.00', 90, 0, '100', 15),
(48, 63, 44, '20.00', 10, 0, '100', 15),
(49, 82, 14, '3000.00', 10, 0, '100', 15),
(50, 82, 10, '60.00', 100, 0, '100', 15),
(51, 85, 3, '100.00', 50, 0, '100', 15),
(52, 88, 56, '400.00', 50, 1, '100', 15),
(53, 88, 56, '500.00', 5, 1, '100', 15),
(57, 88, 56, '500.00', 5, 1, '100', 15),
(58, 88, 56, '500.00', 10, 1, '100', 15),
(59, 88, 56, '500.00', 5, 1, '100', 15),
(60, 88, 56, '50.00', 5, 1, '100', 15),
(61, 87, 56, '500.00', 1, 1, '100', 15),
(62, 95, 57, '200.00', 50, 1, '100', 15);

-- --------------------------------------------------------

--
-- Table structure for table `requirement`
--

CREATE TABLE `requirement` (
  `req_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price_expected` decimal(6,2) NOT NULL,
  `breed` varchar(45) NOT NULL,
  `category` int(11) NOT NULL,
  `is_accepted` tinyint(1) NOT NULL DEFAULT 0,
  `remaining_qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `requirement`
--

INSERT INTO `requirement` (`req_id`, `user_id`, `quantity`, `price_expected`, `breed`, `category`, `is_accepted`, `remaining_qty`) VALUES
(1, 12, 100, '40.00', '2000', 2, 0, 0),
(2, 12, 400, '80.00', '2100', 4, 0, 40),
(3, 11, 50, '20.00', '500', 2, 0, 50),
(4, 11, 50, '20.00', '500', 2, 0, 50),
(5, 11, 20, '30.00', '50', 3, 0, 0),
(6, 11, 20, '30.00', '50', 3, 0, 0),
(7, 11, 20, '30.00', '50', 3, 0, 0),
(8, 11, 20, '30.00', '50', 4, 0, 0),
(9, 11, 20, '30.00', '50', 4, 0, 0),
(10, 11, 20, '30.00', '50', 1, 0, 0),
(11, 11, 20, '30.00', '50', 1, 0, 0),
(12, 17, 60, '50.00', '1300', 2, 0, 30),
(14, 20, 90, '100.00', '2300', 2, 1, 105),
(16, 22, 50, '300.00', '2300', 2, 1, 950),
(17, 29, 50, '30.00', '2300', 2, 0, 30),
(18, 29, 10, '20.00', '50', 2, 0, 10),
(19, 29, 50, '50.97', '50', 2, 1, 50),
(20, 30, 120, '100.00', '2300', 3, 1, 100),
(21, 32, 30, '300.00', '2500', 3, 1, 30),
(22, 33, 200, '300.00', '2500', 2, 1, 50),
(23, 34, 500, '100.00', '2500', 2, 1, 0),
(24, 35, 25, '100.00', '2300', 2, 1, 25),
(25, 36, 300, '200.00', '2500', 2, 1, 200),
(26, 37, 20, '50.00', '500', 2, 1, 0),
(27, 38, 200, '30.00', '500', 1, 1, 100),
(28, 39, 94949, '9999.99', '911', 2, 0, 94949),
(30, 45, 500, '600.00', '2300', 2, 1, 100),
(31, 46, 100, '300.00', '2500', 2, 1, 0),
(32, 52, 30, '60.00', '500', 2, 0, 30),
(33, 52, 30, '60.00', '500', 2, 0, 30),
(34, 52, 30, '60.00', '500', 2, 0, 30),
(35, 52, 30, '60.00', '500', 2, 0, 30),
(36, 52, 30, '60.00', '500', 2, 0, 30),
(37, 52, 30, '60.00', '500', 2, 0, 30),
(38, 52, 30, '60.00', '500', 2, 0, 30),
(39, 52, 30, '60.00', '500', 2, 0, 30),
(40, 52, 300, '50.00', '100', 2, 0, 300),
(41, 52, 500, '30.00', '200', 2, 0, 500),
(42, 52, 500, '30.00', '200', 2, 0, 500),
(43, 52, 500, '30.00', '200', 2, 0, 500),
(44, 52, 50, '60.00', '200', 2, 0, 50),
(45, 52, 50, '60.00', '200', 2, 0, 50),
(46, 52, 50, '60.00', '200', 2, 0, 50),
(47, 52, 20, '60.00', '500', 2, 0, 20),
(48, 52, 50, '200.00', '30', 2, 0, 50),
(49, 53, 50, '300.00', '2300', 1, 0, 50),
(50, 53, 50, '300.00', '2300', 1, 0, 50),
(51, 53, 50, '300.00', '2300', 1, 0, 50),
(52, 53, 50, '300.00', '2300', 1, 0, 50),
(53, 53, 50, '300.00', '2300', 1, 1, 50),
(54, 53, 50, '300.00', '2300', 1, 0, 50),
(55, 53, 50, '300.00', '2300', 1, 0, 50),
(56, 53, 50, '300.00', '2300', 1, 0, 50),
(57, 53, 50, '300.00', '2300', 1, 0, 50),
(58, 55, 50, '60.00', '2300', 2, 0, 50),
(59, 55, 50, '60.00', '2300', 2, 0, 50),
(60, 55, 30, '50.00', '2500', 2, 0, 30),
(61, 58, 200, '300.00', '1300', 2, 1, 50),
(62, 59, 300, '500.00', '500', 4, 0, 250),
(63, 60, 30, '600.00', '120', 2, 1, 30),
(64, 60, 20, '600.00', '2003', 2, 0, 20),
(65, 71, 500, '300.00', '500', 2, 1, 70),
(66, 71, 500, '500.00', '1000', 2, 1, 500),
(67, 66, 1, '1.00', '5', 2, 0, 1),
(68, 67, 200, '200.00', '5580', 2, 1, 10),
(69, 69, 2000000, '9999.99', '342', 4, 1, 2000000),
(71, 67, 25, '54.00', '21', 2, 1, 25),
(72, 77, 50, '258.00', '50', 4, 1, 50),
(73, 75, 25, '100.00', '2', 1, 1, 25),
(74, 78, 500, '600.00', '1700', 2, 1, 250),
(75, 63, 70, '70.00', '1300', 2, 0, 70),
(76, 81, 50, '5000.00', '1400', 4, 0, 50),
(77, 86, 5800, '600.00', '1400', 2, 0, 5800),
(78, 87, 500, '300.00', '1400', 2, 0, 499),
(79, 87, 500, '300.00', '1400', 2, 0, 500),
(80, 87, 500, '300.00', '1400', 2, 0, 500),
(81, 87, 500, '300.00', '1400', 2, 0, 500),
(82, 87, 500, '300.00', '1400', 2, 1, 400),
(83, 88, 500, '1000.00', '1400', 2, 1, 19),
(84, 87, 500, '300.00', '1400', 2, 1, 450),
(85, 95, 200, '500.00', '1200', 2, 1, 47);

-- --------------------------------------------------------

--
-- Table structure for table `requirement_bid`
--

CREATE TABLE `requirement_bid` (
  `req_bid_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `req_id` int(11) NOT NULL,
  `bid_price` decimal(6,2) NOT NULL,
  `bid_quantity` int(11) NOT NULL,
  `bid_days` int(11) NOT NULL,
  `is_accepted` tinyint(1) NOT NULL DEFAULT 0,
  `packaging_charges` decimal(10,0) NOT NULL DEFAULT 100,
  `delivery_days` int(11) NOT NULL DEFAULT 15
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `requirement_bid`
--

INSERT INTO `requirement_bid` (`req_bid_id`, `user_id`, `req_id`, `bid_price`, `bid_quantity`, `bid_days`, `is_accepted`, `packaging_charges`, `delivery_days`) VALUES
(1, 11, 2, '50.00', 100, 0, 0, '100', 15),
(2, 11, 2, '30.00', 60, 0, 1, '100', 15),
(4, 12, 3, '60.00', 50, 0, 0, '100', 15),
(5, 12, 3, '10.00', 20, 0, 0, '100', 15),
(6, 12, 3, '9999.99', 10000, 0, 0, '100', 15),
(7, 12, 3, '60.00', 20, 0, 0, '100', 15),
(8, 17, 4, '2.00', 10, 0, 0, '100', 15),
(9, 17, 12, '20.00', 10, 0, 1, '100', 15),
(10, 17, 12, '60.00', 10, 0, 1, '100', 15),
(11, 20, 14, '110.00', 2, 0, 0, '100', 15),
(14, 22, 16, '300.00', 10, 0, 1, '100', 15),
(15, 29, 12, '60.00', 20, 0, 0, '100', 15),
(16, 34, 23, '90.00', 50, 0, 1, '100', 15),
(17, 37, 26, '60.00', 20, 0, 1, '100', 15),
(18, 38, 27, '20.00', 50, 0, 1, '100', 15),
(19, 45, 30, '400.00', 400, 0, 1, '100', 15),
(20, 55, 24, '220.00', 20, 0, 0, '100', 15),
(21, 55, 24, '220.00', 20, 0, 0, '100', 15),
(22, 55, 24, '220.00', 20, 0, 0, '100', 15),
(23, 55, 24, '220.00', 20, 0, 0, '100', 15),
(24, 58, 61, '320.00', 50, 0, 1, '100', 15),
(25, 67, 14, '105.00', 90, 0, 0, '100', 15),
(26, 67, 68, '195.00', 190, 0, 1, '100', 15),
(27, 78, 74, '400.00', 250, 0, 1, '100', 15),
(28, 87, 82, '300.00', 100, 0, 1, '100', 15),
(29, 88, 83, '500.00', 200, 0, 1, '100', 15),
(30, 88, 83, '900.00', 10, 0, 1, '100', 15),
(31, 88, 83, '500.00', 10, 0, 1, '100', 15),
(32, 88, 83, '500.00', 120, 0, 1, '100', 15),
(33, 88, 83, '500.00', 5, 0, 1, '100', 15),
(34, 88, 83, '200.00', 5, 0, 1, '100', 15),
(35, 88, 83, '500.00', 5, 0, 1, '100', 15),
(36, 88, 83, '500.00', 5, 0, 1, '100', 15),
(37, 88, 83, '500.00', 5, 0, 1, '100', 15),
(38, 88, 83, '500.00', 5, 0, 1, '100', 15),
(39, 88, 83, '500.00', 5, 0, 1, '100', 15),
(40, 88, 83, '50.00', 3, 0, 1, '100', 15),
(41, 88, 83, '500.00', 2, 0, 1, '100', 15),
(42, 88, 83, '50.00', 1, 0, 1, '100', 15),
(43, 87, 84, '300.00', 50, 0, 1, '100', 15),
(44, 87, 84, '580.00', 5, 0, 0, '100', 15),
(45, 95, 85, '500.00', 10, 0, 1, '100', 15),
(46, 95, 85, '50.00', 20, 0, 1, '100', 15),
(47, 95, 85, '50.00', 20, 0, 1, '100', 15),
(49, 95, 85, '20.00', 1, 0, 1, '100', 15),
(50, 95, 85, '30.00', 2, 0, 1, '100', 15),
(51, 95, 85, '20.00', 50, 0, 1, '100', 15);

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `transaction_id` int(11) NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `bid_id` int(11) NOT NULL,
  `start_date` datetime NOT NULL,
  `is_product_bid` tinyint(1) DEFAULT NULL,
  `is_completed` tinyint(1) NOT NULL DEFAULT 0,
  `end_date` datetime DEFAULT NULL,
  `razorpay_payment_id` varchar(500) DEFAULT NULL,
  `razorpay_order_id` varchar(500) DEFAULT NULL,
  `razorpay_signature` varchar(500) DEFAULT NULL,
  `delivery_amount` int(11) DEFAULT NULL,
  `transaction_amount` int(11) DEFAULT NULL,
  `packaging_amount` int(11) DEFAULT NULL,
  `total_amount` int(11) DEFAULT NULL,
  `delivery_address` varchar(500) DEFAULT NULL,
  `product_charge` int(11) DEFAULT NULL,
  `complete_date` datetime DEFAULT NULL,
  `delivery_status` tinyint(4) NOT NULL DEFAULT 0,
  `delivery_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`transaction_id`, `buyer_id`, `seller_id`, `bid_id`, `start_date`, `is_product_bid`, `is_completed`, `end_date`, `razorpay_payment_id`, `razorpay_order_id`, `razorpay_signature`, `delivery_amount`, `transaction_amount`, `packaging_amount`, `total_amount`, `delivery_address`, `product_charge`, `complete_date`, `delivery_status`, `delivery_date`) VALUES
(1, 22, 22, 14, '2020-07-31 13:03:09', 0, 1, '2020-08-02 00:28:01', 'pay_FLfBS9ahPdTFRH', '', '', 0, 0, 30, 3030, 'Dr Rajkumar Rd, Prakash Nagar, Rajajinagar, Bengaluru, Karnataka, India', 3000, NULL, 0, NULL),
(2, 22, 22, 14, '2020-08-02 00:30:17', 0, 1, '2020-08-02 00:30:30', 'pay_FLfE7MWUXmXaHk', '', '', 0, 0, 30, 3030, 'Dr Rajkumar Rd, Prakash Nagar, Rajajinagar, Bengaluru, Karnataka, India', 3000, NULL, 0, NULL),
(3, 22, 22, 14, '2020-08-02 00:31:10', 0, 1, '2020-08-02 00:31:23', 'pay_FLfF3LpkhV61Y4', '', '', 0, 0, 30, 3030, 'Dr Rajkumar Rd, Prakash Nagar, Rajajinagar, Bengaluru, Karnataka, India', 3000, NULL, 0, NULL),
(4, 22, 22, 14, '2020-08-02 00:32:50', 0, 1, '2020-08-02 00:33:01', 'pay_FLfGmXe6fSifJk', '', '', 0, 0, 30, 3030, 'Dr Rajkumar Rd, Prakash Nagar, Rajajinagar, Bengaluru, Karnataka, India', 3000, NULL, 0, NULL),
(6, 29, 29, 5, '2020-08-09 21:00:54', 1, 1, '2020-08-09 21:40:52', 'pay_FOmbtCrHcC5F78', '', '', 10120, 0, 30, 10450, 'GUNDALAVARI VEEDHI, Gundala Vari St, Three Lamps Area, Kaspa West, Vizianagaram, Andhra Pradesh 535002, India', 300, NULL, 0, NULL),
(7, 34, 34, 16, '2020-08-10 00:53:03', 0, 1, '2020-08-10 01:06:48', 'pay_FOq7PoHGVV57lo', '', '', 0, 0, 30, 4530, 'Gondal Rd, Vijay Plot, Bhakti Nagar, Rajkot, Gujarat, India', 4500, NULL, 0, NULL),
(8, 37, 37, 14, '2020-08-10 15:37:17', 1, 1, '2020-08-10 16:31:59', 'pay_FP5shzJLPnPx10', '', '', 0, 0, 30, 630, 'Gondal Rd, Vijay Plot, Bhakti Nagar, Rajkot, Gujarat, India', 600, NULL, 0, NULL),
(9, 37, 37, 17, '2020-08-10 16:48:41', 0, 1, '2020-08-10 16:48:52', 'pay_FP6AZeW2ArPapg', '', '', 0, 0, 30, 1230, 'Gondal Rd, Vijay Plot, Bhakti Nagar, Rajkot, Gujarat, India', 1200, NULL, 0, NULL),
(10, 38, 38, 18, '2020-08-10 17:00:15', 0, 1, '2020-08-10 17:01:22', 'pay_FP6NliIojUNgSv', '', '', 0, 0, 30, 1030, 'Rajkot Airport, Gandhigram Civil Aerodrome, Gandhigram, Rajkot, Gujarat 360006, India', 1000, NULL, 0, NULL),
(11, 38, 38, 15, '2020-08-10 17:03:38', 1, 1, '2020-08-10 17:04:18', 'pay_FP6Qs5zb3u8HQf', '', '', 0, 0, 30, 1530, 'Rajkot Airport, Gandhigram Civil Aerodrome, Gandhigram, Rajkot, Gujarat 360006, India', 1500, NULL, 0, NULL),
(13, 46, 46, 20, '2020-08-10 22:02:45', 0, 1, '2020-08-10 22:03:48', 'pay_FPBXCq4sOnyLKT', '', '', 54, 0, 30, 11684, 'Gondal Chowkdi, Vavdi, Rajkot, Gujarat 360004, India', 11600, NULL, 0, NULL),
(14, 46, 46, 17, '2020-08-10 22:06:56', 1, 1, '2020-08-10 22:08:15', 'pay_FPBbvudgbXLlTK', '', '', 0, 0, 30, 3030, 'Rajkot S.T Bus Stand, Karanpara, Rajkot, Gujarat 360001, India', 3000, NULL, 0, NULL),
(15, 58, 58, 24, '2020-08-14 14:12:46', 0, 1, '2020-08-14 14:13:30', 'pay_FQdeuG2oGsP75B', '', '', 0, 0, 30, 16030, 'Gondal Rd, Vijay Plot, Bhakti Nagar, Rajkot, Gujarat, India', 16000, NULL, 0, NULL),
(26, 88, 88, 38, '2020-09-02 13:14:21', 0, 0, '1970-01-02 01:33:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(27, 88, 88, 36, '2020-09-02 13:20:00', 0, 0, '1970-01-01 01:00:00', 'pay_FYG4j6oxZUl9Wc', '', '', 0, 26, 100, 2626, 'Gondal Chokdi, Samrat Industrial Area, Rajkot, Gujarat 360004, India', 2500, '2020-09-02 20:21:19', 1, NULL),
(28, 88, 88, 36, '2020-09-02 13:20:46', 0, 0, '1970-01-01 01:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(29, 88, 88, 39, '2020-09-02 13:09:21', 0, 0, '1970-01-01 01:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(30, 88, 88, 39, '2020-09-02 13:09:52', 0, 0, '1970-01-01 01:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(31, 88, 88, 40, '2020-09-02 13:09:30', 0, 0, '1970-01-01 01:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(32, 88, 88, 60, '2020-09-02 17:22:45', 1, 0, '1970-01-01 01:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(33, 88, 88, 60, '2020-09-02 17:23:27', 1, 0, '1970-01-01 01:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(34, 88, 88, 59, '2020-09-02 17:23:58', 1, 0, '1970-01-01 01:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(35, 88, 88, 59, '2020-09-02 17:24:29', 1, 0, '1970-01-01 01:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(36, 88, 88, 58, '2020-09-02 17:25:29', 1, 0, '2020-09-03 17:25:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(37, 88, 88, 41, '2020-09-02 17:26:49', 0, 0, '2020-09-03 17:26:49', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(38, 88, 88, 42, '2020-09-02 18:01:34', 0, 0, '2020-09-03 18:01:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(39, 87, 87, 43, '2020-09-02 20:47:13', 0, 0, '2020-09-03 20:47:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(40, 87, 87, 61, '2020-09-02 21:01:02', 1, 0, '2020-09-03 21:01:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(41, 95, 95, 45, '2020-09-02 22:28:41', 0, 1, '2020-09-03 22:28:41', 'pay_FYIHRxgkhKRhBU', '', '', 0, 51, 100, 5151, 'Sakar Bazzar, Kalupur, Ahmedabad, Gujarat 380002, India', 5000, '2020-09-02 22:30:45', 1, NULL),
(42, 95, 95, 62, '2020-09-03 19:30:33', 1, 1, '2020-09-04 19:30:34', 'pay_FYdzCedl9W2xzT', '', '', 0, 101, 100, 10201, 'Sakar Bazzar, Kalupur, Ahmedabad, Gujarat 380002, India', 10000, '2020-09-03 19:44:43', 3, '2020-09-09 00:00:00'),
(43, 95, 95, 46, '2020-09-03 19:59:32', 0, 0, '2020-09-04 19:59:32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(44, 95, 95, 47, '2020-09-03 20:06:40', 0, 0, '2020-09-04 20:06:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(45, 95, 95, 50, '2020-09-03 20:09:17', 0, 0, '2020-09-04 20:09:18', 'pay_FYf5fzEh4EUsOQ', '', '', 10499, 1, 100, 10660, 'Gonda Railway Station Marg, Semra Damman, Gonda, Uttar Pradesh 271002, India', 60, '2020-09-03 20:49:33', 1, NULL),
(46, 95, 95, 49, '2020-09-03 20:09:32', 0, 0, '2020-09-04 20:09:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(47, 95, 95, 51, '2020-09-03 20:12:03', 0, 0, '2020-09-04 20:12:04', 'pay_FYeSUsRlLdcpqU', '', '', 0, 11, 100, 1111, 'Sakar Bazzar, Kalupur, Ahmedabad, Gujarat 380002, India', 1000, '2020-09-03 20:12:27', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `address` varchar(255) NOT NULL,
  `is_seller` tinyint(1) NOT NULL,
  `pan_card` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `pincode` varchar(100) NOT NULL,
  `latitude` varchar(100) NOT NULL,
  `longitude` varchar(100) NOT NULL,
  `pan_card_status` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `name`, `contact`, `address`, `is_seller`, `pan_card`, `state`, `city`, `pincode`, `latitude`, `longitude`, `pan_card_status`) VALUES
(1, 'Nitant	', '846068847	', '\"Maa\"\"', 1, 'TEMP-PDF-Document.pdf', '', '', '', '', '', 0),
(2, 'Nitant Joshi	', '123456789	', '\"123,\"xyz', 1, 'TEMP-PDF-Document.pdf', '', '', '', '', '', 0),
(3, 'nitant	', '8460688847	', '123, XYZ City,', 1, 'TEMP-PDF-Document.pdf', '', '', '', '', '', 0),
(4, 'Nitant Joshi	', '8460688847	', '\"123\",XYZ City ', 1, 'TEMP-PDF-Document.pdf', '', '', '', '', '', 0),
(5, 'nitant joshi	', '8460688847	', 'Maa , Gundala Road	', 1, 'TEMP-PDF-Document.pdf', '', '', '', '', '', 0),
(6, 'nitant joshi	', '8460688847	', '\"Make\", Gundala Road	', 1, 'TEMP-PDF-Document.pdf', '', '', '', '', '', 0),
(7, '1', '1', '1', 1, 'TEMP-PDF-Document.pdf', '', '', '', '', '', 0),
(8, '12', '1', '1', 0, 'TEMP-PDF-Document.pdf', '', '', '', '', '', 0),
(9, 'Nitant Joshi', '8460688847', 'Maa gundala road', 1, 'IMG-20200725-WA0013.jpg', '', '', '', '', '', 0),
(10, 'હોઈ', '84606', '1', 0, 'Screenshot_2020-06-23-16-11-57-505_lockscreen.png', '', '', '', '', '', 0),
(11, 'nitant', '846068994777', 'maaa', 1, 'IMG-20200725-WA0013.jpg', '', '', '', '', '', 0),
(12, 'krishna', '8460688847', '123', 1, 'IMG-20200726-WA0011.jpg', '', 'Bhavnagar', '', '88.41199280000001', '22.5123488', 0),
(13, 'pooja', '8460688847', 'jig', 1, 'Screenshot_20200729-171931.jpeg', '', 'Surat', '', '88.41199280000001', '22.5123488', 0),
(14, 'nitant', '8460688847', '', 1, 'Screenshot_20200729-234544.jpeg', 'Karnataka', 'Bangalore Urban', '', '12.9921674', '77.55707640000003', 0),
(15, 'nitant', '8460688847', '', 1, 'Screenshot_20200729-234544.jpeg', 'Karnataka', 'Bangalore Urban', '-1', '12.9921674', '77.55707640000003', 0),
(16, 'Nitant Joshi', '7359479347', '', 1, 'Screenshot_20200729-234500.jpeg', 'West Bengal', 'Kolkata', '-1', '22.5123488', '88.41199280000001', 0),
(17, 'Xyz', '8460688847', '', 1, 'Screenshot_20200729-205429.jpeg', 'Gujarat', 'Rajkot', '-1', '22.2865849', '70.8000922', 0),
(18, 'Vedant Nalo', '', 'Gundala Rd, Mani Nagar, Gundala, Gondal, Gujarat 360311, India', 1, 'Nitant Joshi - Introduce Yourself.pdf', 'Gujarat', 'Rajkot', '-1', '21.9610844', '70.786934', 0),
(19, 'vedant nalo 2', '8460688847', 'Gondal Rd, Vijay Plot, Bhakti Nagar, Rajkot, Gujarat, India', 1, 'IMG-20200730-WA0022.jpg', 'Gujarat', 'Rajkot', '-1', '22.2865849', '70.8000922', 0),
(20, 'Vedant Nalo 3', '8460688847', 'Gondal Rd, Vijay Plot, Bhakti Nagar, Rajkot, Gujarat, India', 1, 'IMG-20200730-WA0022.jpg', 'Gujarat', 'Rajkot', '-1', '22.2865849', '70.8000922', 0),
(21, 'Demo name', '8460688847', 'Rajkot Airport, Gandhigram Civil Aerodrome, Gandhigram, Rajkot, Gujarat 360006, India', 1, 'Screenshot_20200731-005543.jpeg', 'Gujarat', 'Rajkot', '-1', '22.3089497', '70.78226409999999', 0),
(22, 'demo user name', '8460688847', 'Dr Rajkumar Rd, Prakash Nagar, Rajajinagar, Bengaluru, Karnataka, India', 1, 'Screenshot_20200731-014938.jpeg', 'Karnataka', 'Bangalore Urban', '-1', '12.9921674', '77.55707640000003', 0),
(23, 'Nitant', '8460688847', 'Rajkot S.T Bus Stand, Karanpara, Rajkot, Gujarat 360001, India', 0, 'IMG-20200806-WA0028.jpg', 'Gujarat', 'Rajkot', '-1', '22.29147', '70.80187799999999', 0),
(24, 'Nitant', '8460688847', 'Rajkot S.T Bus Stand, Karanpara, Rajkot, Gujarat 360001, India', 0, 'IMG-20200806-WA0028.jpg', 'Gujarat', 'Rajkot', '-1', '22.29147', '70.80187799999999', 0),
(25, 'Nitant', '8460688847', 'Rajkot S.T Bus Stand, Karanpara, Rajkot, Gujarat 360001, India', 0, 'IMG-20200806-WA0028.jpg', 'Gujarat', 'Rajkot', '-1', '22.29147', '70.80187799999999', 0),
(26, 'Nitant', '8460688847', 'Rajkot S.T Bus Stand, Karanpara, Rajkot, Gujarat 360001, India', 0, 'IMG-20200806-WA0028.jpg', 'Gujarat', 'Rajkot', '-1', '22.29147', '70.80187799999999', 0),
(27, 'Nitant', '8460688847', 'Rajkot S.T Bus Stand, Karanpara, Rajkot, Gujarat 360001, India', 0, 'IMG-20200806-WA0028.jpg', 'Gujarat', 'Rajkot', '-1', '22.29147', '70.80187799999999', 0),
(28, 'Nitant', '8460688847', 'Rajkot S.T Bus Stand, Karanpara, Rajkot, Gujarat 360001, India', 0, 'IMG-20200806-WA0028.jpg', 'Gujarat', 'Rajkot', '-1', '22.29147', '70.80187799999999', 0),
(29, 'jadyo', '8460688847', 'Gonda Railway Station Marg, Semra Damman, Gonda, Uttar Pradesh 271002, India', 0, 'IMG-20200806-WA0026.jpg', 'Uttar Pradesh', 'Gonda', '-1', '27.1538758', '81.97610020000002', 0),
(30, 'Nitant', '8460688847', 'Rajkot Airport, Gandhigram Civil Aerodrome, Gandhigram, Rajkot, Gujarat 360006, India', 0, 'IMG-20200809-WA0013.jpg', 'Gujarat', 'Rajkot', '-1', '22.3089497', '70.78226409999999', 0),
(31, 'demo app', '8460688847', 'Dr Rajkumar Rd, Prakash Nagar, Rajajinagar, Bengaluru, Karnataka, India', 0, 'IMG-20200809-WA0001.jpg', 'Karnataka', 'Bangalore Urban', '-1', '12.9921674', '77.55707640000003', 0),
(32, 'Nitant joshi', '8460688847', 'Gonda Railway Station Marg, Semra Damman, Gonda, Uttar Pradesh 271002, India', 0, 'IMG-20200809-WA0013.jpg', 'Uttar Pradesh', 'Gonda', '-1', '27.1538758', '81.97610020000002', 0),
(33, 'Nitant', '8460688847', 'Gondal Rd, Vijay Plot, Bhakti Nagar, Rajkot, Gujarat, India', 0, 'IMG-20200809-WA0011.jpg', 'Gujarat', 'Rajkot', '-1', '22.2865849', '70.8000922', 0),
(34, 'nitant joshi', '8460688847', 'Gondal Rd, Vijay Plot, Bhakti Nagar, Rajkot, Gujarat, India', 0, 'IMG-20200809-WA0013.jpg', 'Gujarat', 'Rajkot', '-1', '22.2865849', '70.8000922', 0),
(35, 'Nitant', '8460688847', 'Dr Rajkumar Rd, Prakash Nagar, Rajajinagar, Bengaluru, Karnataka, India', 0, 'Nitant Joshi - Introduce Yourself.pdf', 'Karnataka', 'Bangalore Urban', '-1', '12.9921674', '77.55707640000003', 0),
(36, 'vedant', '8460688847', 'Gondal Rd, Vijay Plot, Bhakti Nagar, Rajkot, Gujarat, India', 0, 'IMG-20200810-WA0011.jpg', 'Gujarat', 'Rajkot', '-1', '22.2865849', '70.8000922', 0),
(37, 'Nitant jadyo', '9723166877', 'Gondal Rd, Vijay Plot, Bhakti Nagar, Rajkot, Gujarat, India', 0, 'CE083_Lab3.pdf', 'Gujarat', 'Rajkot', '-1', '22.2865849', '70.8000922', 0),
(38, 'vednat jozhi', '7359479347', 'Rajkot Airport, Gandhigram Civil Aerodrome, Gandhigram, Rajkot, Gujarat 360006, India', 0, 'IMG_20200810_200705_847.jpg', 'Gujarat', 'Rajkot', '-1', '22.3089497', '70.78226409999999', 0),
(39, 'gjjvb', '7359479347', 'Gondal, Gujarat 360311, India', 0, 'IMG-20200810-WA0014.jpg', 'Gujarat', 'Rajkot', '-1', '21.9611708', '70.7938777', 0),
(40, 'ysdjwdvj', '8460688847', 'Jasdan - Vinchhiya Rd, Anand Dham Society, Vajsurpara, Jasdan, Gujarat, India', 1, 'IMG-20200810-WA0017.jpg', 'Gujarat', 'Rajkot', '-1', '22.0507638', '71.21894019999999', 0),
(41, 'nitant', '8460688847', 'Rajkot S.T Bus Stand, Karanpara, Rajkot, Gujarat 360001, India', 0, 'LAB_Submission_Deadlines.pdf', 'Gujarat', 'Rajkot', '-1', '22.29147', '70.80187799999999', 0),
(42, 'nitant', '8460688847', 'Rajkot Airport, Gandhigram Civil Aerodrome, Gandhigram, Rajkot, Gujarat 360006, India', 0, 'TEMP-PDF-Document.pdf', 'Gujarat', 'Rajkot', '-1', '22.3089497', '70.78226409999999', 0),
(43, 'nihh', '8460688847', 'Rajahmundry, Andhra Pradesh, India', 0, 'TEMP-PDF-Document.pdf', 'Andhra Pradesh', 'East Godavari', '-1', '17.0005383', '81.8040345', 0),
(44, 'fddg', '8460688847', 'Dr Rajkumar Rd, Prakash Nagar, Rajajinagar, Bengaluru, Karnataka, India', 0, 'TEMP-PDF-Document.pdf', 'Karnataka', 'Bangalore Urban', '-1', '12.9921674', '77.55707640000003', 0),
(45, 'nitant', '8460688847', 'Rajkot Marketing Yard, Marketing Yard, Rajkot, Gujarat 360003, India', 0, 'TEMP-PDF-Document.pdf', 'Gujarat', 'Rajkot', '-1', '22.3004472', '70.8346048', 0),
(46, 'nitant', '8460688847', 'Rajkot S.T Bus Stand, Karanpara, Rajkot, Gujarat 360001, India', 0, 'TEMP-PDF-Document.pdf', 'Gujarat', 'Rajkot', '-1', '22.29147', '70.80187799999999', 0),
(47, 'krishna', '1122334455', 'Rajkot, Gujarat, India', 0, 'Screenshot_20200814-150907.png', 'Gujarat', 'Rajkot', '-1', '22.3038945', '70.80215989999999', 0),
(48, 'krishna', '7203013803', 'Rajkot, Gujarat, India', 0, 'Screenshot_20200814-150907.png', 'Gujarat', 'Rajkot', '-1', '22.3038945', '70.80215989999999', 0),
(49, 'krishna', '7203013803', 'Rajkot, Gujarat, India', 0, 'Screenshot_20200814-150907.png', 'Gujarat', 'Rajkot', '-1', '22.3038945', '70.80215989999999', 0),
(50, 'krishna', '7203013803', 'Rajkot, Gujarat, India', 0, 'Screenshot_20200814-150907.png', 'Gujarat', 'Rajkot', '-1', '22.3038945', '70.80215989999999', 0),
(51, 'Nitant', '8460688847', 'Gondal Chokdi, Samrat Industrial Area, Rajkot, Gujarat 360004, India', 0, 'IMG-20200814-WA0006.jpg', 'Gujarat', 'Rajkot', '-1', '22.2432367', '70.7999567', 0),
(52, 'Nitant', '8460688847', 'Rajkot Airport, Gandhigram Civil Aerodrome, Gandhigram, Rajkot, Gujarat 360006, India', 0, 'IMG-20200814-WA0006.jpg', 'Gujarat', 'Rajkot', '-1', '22.3089497', '70.78226409999999', 0),
(53, 'Krishna', '8460688847', 'Gondal Chokdi, Samrat Industrial Area, Rajkot, Gujarat 360004, India', 0, 'IMG-20200814-WA0005.jpg', 'Gujarat', 'Rajkot', '-1', '22.2432367', '70.7999567', 0),
(54, 'Krishna', '8460688847', 'Gondal Chokdi, Samrat Industrial Area, Rajkot, Gujarat 360004, India', 0, 'IMG-20200814-WA0005.jpg', 'Gujarat', 'Rajkot', '-1', '22.2432367', '70.7999567', 0),
(55, 'Krishna', '8460688847', 'Gondal Chokdi, Samrat Industrial Area, Rajkot, Gujarat 360004, India', 0, 'IMG-20200814-WA0005.jpg', 'Gujarat', 'Rajkot', '-1', '22.2432367', '70.7999567', 0),
(56, 'Parth', '8460688847', 'Gondal Rd, Vijay Plot, Bhakti Nagar, Rajkot, Gujarat, India', 0, 'IMG-20200814-WA0007.jpg', 'Gujarat', 'Rajkot', '-1', '22.2865849', '70.8000922', 0),
(57, 'Arth', '8460688847', 'Gondal Rd, Vijay Plot, Bhakti Nagar, Rajkot, Gujarat, India', 0, 'IMG-20200814-WA0008.jpg', 'Gujarat', 'Rajkot', '-1', '22.2865849', '70.8000922', 0),
(58, 'Arth', '9723166877', 'Gondal Rd, Vijay Plot, Bhakti Nagar, Rajkot, Gujarat, India', 0, 'Submission_Status.pdf', 'Gujarat', 'Rajkot', '-1', '22.2865849', '70.8000922', 0),
(59, 'true nitant', '8460688847', 'Gondal Rd, Vijay Plot, Bhakti Nagar, Rajkot, Gujarat, India', 0, 'IMG-20200814-WA0020.jpg', 'Gujarat', 'Rajkot', '-1', '22.2865849', '70.8000922', 0),
(60, 'Harsh', '7567562586', 'Gondal, Gujarat 360311, India', 0, 'IMG-20200814-WA0001.jpg', 'Gujarat', 'Rajkot', '-1', '21.9611708', '70.7938777', 0),
(61, 'Niraj gohel', '7016174611', 'India', 0, 'Submission_Status.pdf', '', '', '-1', '20.593684', '78.96287999999998', 0),
(62, 'Niraj gohel', '7016174611', 'India', 0, 'Submission_Status.pdf', '', '', '-1', '20.593684', '78.96287999999998', 0),
(63, 'Krishna', '7203013803', 'Rajkot, Gujarat, India', 0, 'IMG-20200814-WA0032.jpg', 'Gujarat', 'Rajkot', '-1', '22.3038945', '70.80215989999999', 0),
(64, 'Niraj gohel', '7016174611', 'India', 1, 'IMG-20200814-WA0014.jpg', '', '', '-1', '20.593684', '78.96287999999998', 0),
(65, 'Niraj gohel', '7016174611', 'India', 1, 'IMG-20200814-WA0014.jpg', '', '', '-1', '20.593684', '78.96287999999998', 0),
(66, 'Niraj gohel', '7016174611', 'Rajkot, Gujarat, India', 1, 'IMG-20200814-WA0014.jpg', 'Gujarat', 'Rajkot', '-1', '22.3038945', '70.80215989999999', 0),
(67, 'jeet', '9429476270', 'Himatnagar, Gujarat, India', 1, 'hqdefault.jpg', 'Gujarat', 'Sabarkatha', '-1', '23.5968857', '72.9630378', 0),
(68, 'parth', '8780853473', 'Gondal, Gujarat 360311, India', 1, 'IMG-20200814-WA0051.jpg', 'Gujarat', 'Rajkot', '-1', '21.9611708', '70.7938777', 0),
(69, 'Adishwar', '9104755525', 'Ahmedabad, Gujarat, India', 0, '20200814_014945.jpg', 'Gujarat', 'Ahmedabad', '-1', '23.022505', '72.57136209999999', 0),
(70, 'utsuu', '9714476861', 'Rajkot, Gujarat, India', 1, 'Screenshot_2020-08-13-17-48-41-32.png', 'Gujarat', 'Rajkot', '-1', '22.3038945', '70.80215989999999', 0),
(71, 'vedant 234', '8460688847', 'Chotto Chandpur, Bishnupur, Kalikapur, West Bengal 700135, India', 0, 'IMG-20200814-WA0039.jpg', 'West Bengal', 'North 24 Parganas', '-1', '22.5921041', '88.50879270000001', 0),
(72, 'jsksks', '8460688847', 'Dr Rajkumar Rd, Prakash Nagar, Rajajinagar, Bengaluru, Karnataka, India', 1, 'IMG-20200815-WA0012.jpg', 'Karnataka', 'Bangalore Urban', '-1', '12.9921674', '77.55707640000003', 0),
(73, 'jjdjs', '8460688847', 'Rajkot Airport, Gandhigram Civil Aerodrome, Gandhigram, Rajkot, Gujarat 360006, India', 0, 'IMG-20200815-WA0012.jpg', 'Gujarat', 'Rajkot', '-1', '22.3089497', '70.78226409999999', 0),
(74, 'test', '8460688847', 'Rajkot S.T Bus Stand, Karanpara, Rajkot, Gujarat 360001, India', 0, 'IMG-20200815-WA0009.jpg', 'Gujarat', 'Rajkot', '-1', '22.29147', '70.80187799999999', 0),
(75, '*\"*', '9727089755', 'Ahmedabad, Gujarat, India', 1, 'IMG-20200815-WA0004.jpg', 'Gujarat', 'Ahmedabad', '-1', '23.022505', '72.57136209999999', 0),
(76, 'Abhishek', '8306859897', 'Ahmedabad, Gujarat, India', 1, 'logo_whitesmall-1.png', 'Gujarat', 'Ahmedabad', '-1', '23.022505', '72.57136209999999', 0),
(77, 'ruts', '7016189551', 'Ahmedabad, Gujarat, India', 0, 'Screenshot_2020-08-16-13-03-26-948_com.google.android.youtube.jpg', 'Gujarat', 'Ahmedabad', '-1', '23.022505', '72.57136209999999', 0),
(78, 'vedantjoshi', '8460688847', 'Gondal Chowkdi, Vavdi, Rajkot, Gujarat 360004, India', 0, 'Screenshot_20200819-204759.jpeg', 'Gujarat', 'Rajkot', '-1', '22.2424733', '70.8001227', 0),
(79, 'fgjj', '8460688847', 'Ved Rd, Sahyog Society, Vishal Nagar, Surat, Gujarat, India', 0, 'IMG-20200822-WA0008.jpeg', 'Gujarat', 'Surat', '-1', '21.2395149', '72.8201152', 0),
(80, 'harsh patel', '9913030121', 'Himatnagar, Gujarat, India', 1, 'Screenshot_2020-08-23-11-29-51-288_com.example.baazar.jpg', 'Gujarat', 'Sabarkatha', '-1', '23.5968857', '72.9630378', 0),
(81, 'rutvik', '7016189551', 'Himatnagar, Gujarat, India', 0, 'IMG-20200823-WA0000.jpg', 'Gujarat', 'Sabarkatha', '-1', '23.5968857', '72.9630378', 0),
(82, 'Abhishek', '8306859897', 'Shahibaug Rd, Ahmedabad, Gujarat, India', 1, 'Ethereum_logo_gold.png', 'Gujarat', 'Ahmedabad', '-1', '23.0563869', '72.5979352', 0),
(83, 'sakina Tajani', '7285091852', 'Rajkot, Gujarat, India', 1, 'Screenshot_20200826-090859.jpg', 'Gujarat', 'Rajkot', '-1', '22.3038945', '70.80215989999999', 0),
(84, 'Sakina Tajani', '7285091852', 'Rajkot, Gujarat, India', 1, 'Screenshot_20200826-092050.jpg', 'Gujarat', 'Rajkot', '-1', '22.3038945', '70.80215989999999', 0),
(85, 'shah', '9119228549', 'Ahmedabad, Gujarat, India', 1, 'IMG-20200829-WA0001.jpg', 'Gujarat', 'Ahmedabad', '-1', '23.022505', '72.57136209999999', 0),
(86, 'ggjj', '8460688847', 'Rajkot, Gujarat, India', 0, 'Screenshot_2020-08-29-10-25-51-612_lockscreen.png', 'Gujarat', 'Rajkot', '-1', '22.3038945', '70.80215989999999', 1),
(87, 'naru', '8460688847', 'Rajkot S.T Bus Stand, Karanpara, Rajkot, Gujarat 360001, India', 0, 'Screenshot_2020-08-29-10-25-51-612_lockscreen.png', 'Gujarat', 'Rajkot', '360001', '22.29147', '70.80187799999999', 1),
(88, 'saske', '8460688847', 'Gondal Chokdi, Samrat Industrial Area, Rajkot, Gujarat 360004, India', 0, 'IMG-20200901-WA0009.jpeg', 'Gujarat', 'Rajkot', '360004', '22.2432367', '70.7999567', 1),
(89, 'nitant naru', '8460688847', 'Gondal Rd, Vijay Plot, Bhakti Nagar, Rajkot, Gujarat, India', 0, 'Screenshot_20200903-000233.jpeg', 'Gujarat', 'Rajkot', '-1', '22.2865849', '70.8000922', 0),
(90, 'nitant jdjeje', '8460688847', 'Gondal Chokdi, Samrat Industrial Area, Rajkot, Gujarat 360004, India', 0, 'Screenshot_20200903-000233.jpeg', 'Gujarat', 'Rajkot', '360004', '22.2432367', '70.7999567', 0),
(91, 'hejsje', '8460688847', 'Dhebar Rd, Karanpara, Rajkot, Gujarat 360001, India', 0, 'Screenshot_20200902-220642.jpeg', 'Gujarat', 'Rajkot', '360001', '22.2909047', '70.80213459999999', 0),
(92, 'hiii', '8460688847', 'Gondal Chowkdi, Vavdi, Rajkot, Gujarat 360004, India', 0, 'Screenshot_20200902-223107.jpeg', 'Gujarat', 'Rajkot', '360004', '22.2425809', '70.79996899999998', 0),
(93, 'ydjg', '8460688847', 'Gondal Rd, Vijay Plot, Bhakti Nagar, Rajkot, Gujarat, India', 0, 'Screenshot_20200903-000233.jpeg', 'Gujarat', 'Rajkot', '-1', '22.2865849', '70.8000922', 0),
(94, 'nskksek', '8460688847', 'Gondal Chokdi, Samrat Industrial Area, Rajkot, Gujarat 360004, India', 0, 'Screenshot_20200902-223107.jpeg', 'Gujarat', 'Rajkot', '360004', '22.2432367', '70.7999567', 0),
(95, 'dummy', '8460688847', 'Sakar Bazzar, Kalupur, Ahmedabad, Gujarat 380002, India', 0, 'Screenshot_20200903-000233.jpeg', 'Gujarat', 'Ahmedabad', '380002', '23.0267556', '72.6008286', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `category_breed`
--
ALTER TABLE `category_breed`
  ADD PRIMARY KEY (`breed_id`),
  ADD KEY `category_breed_constraint` (`cat_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`prod_id`),
  ADD KEY `user_product_idx` (`user_id`),
  ADD KEY `product_category_idx` (`category_id`);

--
-- Indexes for table `product_bid`
--
ALTER TABLE `product_bid`
  ADD PRIMARY KEY (`prod_bid_id`),
  ADD KEY `user_bid_idx` (`user_id`),
  ADD KEY `product_bid_idx` (`product_id`);

--
-- Indexes for table `requirement`
--
ALTER TABLE `requirement`
  ADD PRIMARY KEY (`req_id`),
  ADD KEY `user_requirement_idx` (`user_id`),
  ADD KEY `requirement_category_idx` (`category`);

--
-- Indexes for table `requirement_bid`
--
ALTER TABLE `requirement_bid`
  ADD PRIMARY KEY (`req_bid_id`),
  ADD KEY `user_requirement_bid_idx` (`user_id`),
  ADD KEY `requirement_bid_idx` (`req_id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `transaction_buyer_idx` (`buyer_id`),
  ADD KEY `transaction_seller_idx` (`seller_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `category_breed`
--
ALTER TABLE `category_breed`
  MODIFY `breed_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `prod_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `product_bid`
--
ALTER TABLE `product_bid`
  MODIFY `prod_bid_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `requirement`
--
ALTER TABLE `requirement`
  MODIFY `req_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `requirement_bid`
--
ALTER TABLE `requirement_bid`
  MODIFY `req_bid_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `category_breed`
--
ALTER TABLE `category_breed`
  ADD CONSTRAINT `category_breed_constraint` FOREIGN KEY (`cat_id`) REFERENCES `category` (`cat_id`) ON DELETE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`cat_id`),
  ADD CONSTRAINT `user_product` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `product_bid`
--
ALTER TABLE `product_bid`
  ADD CONSTRAINT `product_bid` FOREIGN KEY (`product_id`) REFERENCES `product` (`prod_id`),
  ADD CONSTRAINT `user_product_bid` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `requirement`
--
ALTER TABLE `requirement`
  ADD CONSTRAINT `requirement_category` FOREIGN KEY (`category`) REFERENCES `category` (`cat_id`),
  ADD CONSTRAINT `user_requirement` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `requirement_bid`
--
ALTER TABLE `requirement_bid`
  ADD CONSTRAINT `requirement_bid` FOREIGN KEY (`req_id`) REFERENCES `requirement` (`req_id`),
  ADD CONSTRAINT `user_requirement_bid` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `transaction_buyer` FOREIGN KEY (`buyer_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `transaction_seller` FOREIGN KEY (`seller_id`) REFERENCES `user` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
