-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Aug 14, 2020 at 10:02 AM
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
(1, 'Maize', 'maize.jpg'),
(2, 'Castor', 'castor.jpg'),
(3, 'Groundnut', 'ground_nut.jpg'),
(4, 'Cotton', 'cotton.jpg');

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
(36, 'TEMP-PDF-Document.pdf', 60, '90.00', '2500', 1, 46, 2, '5d303f7a-7784-4ec6-ac0f-80eb7483b71f7494125471743212959.jpg', 10);

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
  `is_accepted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_bid`
--

INSERT INTO `product_bid` (`prod_bid_id`, `user_id`, `product_id`, `bid_price`, `bid_quantity`, `is_accepted`) VALUES
(1, 12, 9, '30.00', 30, 0),
(2, 29, 21, '200.00', 10, 0),
(3, 29, 21, '30.00', 20, 0),
(4, 29, 21, '30.00', 20, 0),
(5, 29, 21, '30.00', 10, 1),
(6, 29, 21, '20.00', 10, 1),
(10, 30, 14, '100.00', 50, 0),
(11, 33, 14, '50.00', 70, 0),
(12, 35, 14, '20.00', 10, 0),
(13, 36, 10, '100.00', 50, 0),
(14, 37, 30, '30.00', 20, 1),
(15, 38, 33, '30.00', 50, 1),
(16, 40, 34, '300.00', 50, 0),
(17, 46, 36, '60.00', 50, 1),
(18, 41, 36, '30.00', 10, 0),
(19, 41, 36, '200.00', 10, 0),
(20, 41, 36, '200.00', 10, 0),
(21, 41, 36, '200.00', 10, 0),
(22, 41, 36, '200.00', 10, 0),
(23, 41, 36, '200.00', 10, 0),
(24, 41, 36, '200.00', 10, 0),
(25, 41, 36, '200.00', 10, 0),
(26, 41, 36, '200.00', 10, 0),
(27, 41, 36, '200.00', 10, 0),
(28, 41, 36, '200.00', 10, 0),
(29, 41, 36, '200.00', 10, 0),
(30, 41, 36, '90.00', 10, 0),
(31, 41, 36, '90.00', 10, 0);

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
(31, 46, 100, '300.00', '2500', 2, 1, 0);

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
  `is_accepted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `requirement_bid`
--

INSERT INTO `requirement_bid` (`req_bid_id`, `user_id`, `req_id`, `bid_price`, `bid_quantity`, `bid_days`, `is_accepted`) VALUES
(1, 11, 2, '50.00', 100, 0, 0),
(2, 11, 2, '30.00', 60, 0, 1),
(4, 12, 3, '60.00', 50, 0, 0),
(5, 12, 3, '10.00', 20, 0, 0),
(6, 12, 3, '9999.99', 10000, 0, 0),
(7, 12, 3, '60.00', 20, 0, 0),
(8, 17, 4, '2.00', 10, 0, 0),
(9, 17, 12, '20.00', 10, 0, 1),
(10, 17, 12, '60.00', 10, 0, 1),
(11, 20, 14, '110.00', 2, 0, 0),
(14, 22, 16, '300.00', 10, 0, 1),
(15, 29, 12, '60.00', 20, 0, 0),
(16, 34, 23, '90.00', 50, 0, 1),
(17, 37, 26, '60.00', 20, 0, 1),
(18, 38, 27, '20.00', 50, 0, 1),
(19, 45, 30, '400.00', 400, 0, 1);

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
  `product_charge` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`transaction_id`, `buyer_id`, `seller_id`, `bid_id`, `start_date`, `is_product_bid`, `is_completed`, `end_date`, `razorpay_payment_id`, `razorpay_order_id`, `razorpay_signature`, `delivery_amount`, `transaction_amount`, `packaging_amount`, `total_amount`, `delivery_address`, `product_charge`) VALUES
(1, 22, 22, 14, '2020-07-31 13:03:09', 0, 1, '2020-08-02 00:28:01', 'pay_FLfBS9ahPdTFRH', '', '', 0, 0, 30, 3030, 'Dr Rajkumar Rd, Prakash Nagar, Rajajinagar, Bengaluru, Karnataka, India', 3000),
(2, 22, 22, 14, '2020-08-02 00:30:17', 0, 1, '2020-08-02 00:30:30', 'pay_FLfE7MWUXmXaHk', '', '', 0, 0, 30, 3030, 'Dr Rajkumar Rd, Prakash Nagar, Rajajinagar, Bengaluru, Karnataka, India', 3000),
(3, 22, 22, 14, '2020-08-02 00:31:10', 0, 1, '2020-08-02 00:31:23', 'pay_FLfF3LpkhV61Y4', '', '', 0, 0, 30, 3030, 'Dr Rajkumar Rd, Prakash Nagar, Rajajinagar, Bengaluru, Karnataka, India', 3000),
(4, 22, 22, 14, '2020-08-02 00:32:50', 0, 1, '2020-08-02 00:33:01', 'pay_FLfGmXe6fSifJk', '', '', 0, 0, 30, 3030, 'Dr Rajkumar Rd, Prakash Nagar, Rajajinagar, Bengaluru, Karnataka, India', 3000),
(5, 29, 29, 6, '2020-08-09 21:00:41', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 29, 29, 5, '2020-08-09 21:00:54', 1, 1, '2020-08-09 21:40:52', 'pay_FOmbtCrHcC5F78', '', '', 10120, 0, 30, 10450, 'GUNDALAVARI VEEDHI, Gundala Vari St, Three Lamps Area, Kaspa West, Vizianagaram, Andhra Pradesh 535002, India', 300),
(7, 34, 34, 16, '2020-08-10 00:53:03', 0, 1, '2020-08-10 01:06:48', 'pay_FOq7PoHGVV57lo', '', '', 0, 0, 30, 4530, 'Gondal Rd, Vijay Plot, Bhakti Nagar, Rajkot, Gujarat, India', 4500),
(8, 37, 37, 14, '2020-08-10 15:37:17', 1, 1, '2020-08-10 16:31:59', 'pay_FP5shzJLPnPx10', '', '', 0, 0, 30, 630, 'Gondal Rd, Vijay Plot, Bhakti Nagar, Rajkot, Gujarat, India', 600),
(9, 37, 37, 17, '2020-08-10 16:48:41', 0, 1, '2020-08-10 16:48:52', 'pay_FP6AZeW2ArPapg', '', '', 0, 0, 30, 1230, 'Gondal Rd, Vijay Plot, Bhakti Nagar, Rajkot, Gujarat, India', 1200),
(10, 38, 38, 18, '2020-08-10 17:00:15', 0, 1, '2020-08-10 17:01:22', 'pay_FP6NliIojUNgSv', '', '', 0, 0, 30, 1030, 'Rajkot Airport, Gandhigram Civil Aerodrome, Gandhigram, Rajkot, Gujarat 360006, India', 1000),
(11, 38, 38, 15, '2020-08-10 17:03:38', 1, 1, '2020-08-10 17:04:18', 'pay_FP6Qs5zb3u8HQf', '', '', 0, 0, 30, 1530, 'Rajkot Airport, Gandhigram Civil Aerodrome, Gandhigram, Rajkot, Gujarat 360006, India', 1500),
(12, 45, 45, 19, '2020-08-10 21:52:58', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 46, 46, 20, '2020-08-10 22:02:45', 0, 1, '2020-08-10 22:03:48', 'pay_FPBXCq4sOnyLKT', '', '', 54, 0, 30, 11684, 'Gondal Chowkdi, Vavdi, Rajkot, Gujarat 360004, India', 11600),
(14, 46, 46, 17, '2020-08-10 22:06:56', 1, 1, '2020-08-10 22:08:15', 'pay_FPBbvudgbXLlTK', '', '', 0, 0, 30, 3030, 'Rajkot S.T Bus Stand, Karanpara, Rajkot, Gujarat 360001, India', 3000);

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
  `longitude` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `name`, `contact`, `address`, `is_seller`, `pan_card`, `state`, `city`, `pincode`, `latitude`, `longitude`) VALUES
(1, 'Nitant	', '846068847	', '\"Maa\"\"', 1, 'TEMP-PDF-Document.pdf', '', '', '', '', ''),
(2, 'Nitant Joshi	', '123456789	', '\"123,\"xyz', 1, 'TEMP-PDF-Document.pdf', '', '', '', '', ''),
(3, 'nitant	', '8460688847	', '123, XYZ City,', 1, 'TEMP-PDF-Document.pdf', '', '', '', '', ''),
(4, 'Nitant Joshi	', '8460688847	', '\"123\",XYZ City ', 1, 'TEMP-PDF-Document.pdf', '', '', '', '', ''),
(5, 'nitant joshi	', '8460688847	', 'Maa , Gundala Road	', 1, 'TEMP-PDF-Document.pdf', '', '', '', '', ''),
(6, 'nitant joshi	', '8460688847	', '\"Make\", Gundala Road	', 1, 'TEMP-PDF-Document.pdf', '', '', '', '', ''),
(7, '1', '1', '1', 1, 'TEMP-PDF-Document.pdf', '', '', '', '', ''),
(8, '12', '1', '1', 0, 'TEMP-PDF-Document.pdf', '', '', '', '', ''),
(9, 'Nitant Joshi', '8460688847', 'Maa gundala road', 1, 'IMG-20200725-WA0013.jpg', '', '', '', '', ''),
(10, 'હોઈ', '84606', '1', 0, 'Screenshot_2020-06-23-16-11-57-505_lockscreen.png', '', '', '', '', ''),
(11, 'nitant', '846068994777', 'maaa', 1, 'IMG-20200725-WA0013.jpg', '', '', '', '', ''),
(12, 'krishna', '8460688847', '123', 1, 'IMG-20200726-WA0011.jpg', '', 'Bhavnagar', '', '88.41199280000001', '22.5123488'),
(13, 'pooja', '8460688847', 'jig', 1, 'Screenshot_20200729-171931.jpeg', '', 'Surat', '', '88.41199280000001', '22.5123488'),
(14, 'nitant', '8460688847', '', 1, 'Screenshot_20200729-234544.jpeg', 'Karnataka', 'Bangalore Urban', '', '12.9921674', '77.55707640000003'),
(15, 'nitant', '8460688847', '', 1, 'Screenshot_20200729-234544.jpeg', 'Karnataka', 'Bangalore Urban', '-1', '12.9921674', '77.55707640000003'),
(16, 'Nitant Joshi', '7359479347', '', 1, 'Screenshot_20200729-234500.jpeg', 'West Bengal', 'Kolkata', '-1', '22.5123488', '88.41199280000001'),
(17, 'Xyz', '8460688847', '', 1, 'Screenshot_20200729-205429.jpeg', 'Gujarat', 'Rajkot', '-1', '22.2865849', '70.8000922'),
(18, 'Vedant Nalo', '', 'Gundala Rd, Mani Nagar, Gundala, Gondal, Gujarat 360311, India', 1, 'Nitant Joshi - Introduce Yourself.pdf', 'Gujarat', 'Rajkot', '-1', '21.9610844', '70.786934'),
(19, 'vedant nalo 2', '8460688847', 'Gondal Rd, Vijay Plot, Bhakti Nagar, Rajkot, Gujarat, India', 1, 'IMG-20200730-WA0022.jpg', 'Gujarat', 'Rajkot', '-1', '22.2865849', '70.8000922'),
(20, 'Vedant Nalo 3', '8460688847', 'Gondal Rd, Vijay Plot, Bhakti Nagar, Rajkot, Gujarat, India', 1, 'IMG-20200730-WA0022.jpg', 'Gujarat', 'Rajkot', '-1', '22.2865849', '70.8000922'),
(21, 'Demo name', '8460688847', 'Rajkot Airport, Gandhigram Civil Aerodrome, Gandhigram, Rajkot, Gujarat 360006, India', 1, 'Screenshot_20200731-005543.jpeg', 'Gujarat', 'Rajkot', '-1', '22.3089497', '70.78226409999999'),
(22, 'demo user name', '8460688847', 'Dr Rajkumar Rd, Prakash Nagar, Rajajinagar, Bengaluru, Karnataka, India', 1, 'Screenshot_20200731-014938.jpeg', 'Karnataka', 'Bangalore Urban', '-1', '12.9921674', '77.55707640000003'),
(23, 'Nitant', '8460688847', 'Rajkot S.T Bus Stand, Karanpara, Rajkot, Gujarat 360001, India', 0, 'IMG-20200806-WA0028.jpg', 'Gujarat', 'Rajkot', '-1', '22.29147', '70.80187799999999'),
(24, 'Nitant', '8460688847', 'Rajkot S.T Bus Stand, Karanpara, Rajkot, Gujarat 360001, India', 0, 'IMG-20200806-WA0028.jpg', 'Gujarat', 'Rajkot', '-1', '22.29147', '70.80187799999999'),
(25, 'Nitant', '8460688847', 'Rajkot S.T Bus Stand, Karanpara, Rajkot, Gujarat 360001, India', 0, 'IMG-20200806-WA0028.jpg', 'Gujarat', 'Rajkot', '-1', '22.29147', '70.80187799999999'),
(26, 'Nitant', '8460688847', 'Rajkot S.T Bus Stand, Karanpara, Rajkot, Gujarat 360001, India', 0, 'IMG-20200806-WA0028.jpg', 'Gujarat', 'Rajkot', '-1', '22.29147', '70.80187799999999'),
(27, 'Nitant', '8460688847', 'Rajkot S.T Bus Stand, Karanpara, Rajkot, Gujarat 360001, India', 0, 'IMG-20200806-WA0028.jpg', 'Gujarat', 'Rajkot', '-1', '22.29147', '70.80187799999999'),
(28, 'Nitant', '8460688847', 'Rajkot S.T Bus Stand, Karanpara, Rajkot, Gujarat 360001, India', 0, 'IMG-20200806-WA0028.jpg', 'Gujarat', 'Rajkot', '-1', '22.29147', '70.80187799999999'),
(29, 'jadyo', '8460688847', 'Gonda Railway Station Marg, Semra Damman, Gonda, Uttar Pradesh 271002, India', 0, 'IMG-20200806-WA0026.jpg', 'Uttar Pradesh', 'Gonda', '-1', '27.1538758', '81.97610020000002'),
(30, 'Nitant', '8460688847', 'Rajkot Airport, Gandhigram Civil Aerodrome, Gandhigram, Rajkot, Gujarat 360006, India', 0, 'IMG-20200809-WA0013.jpg', 'Gujarat', 'Rajkot', '-1', '22.3089497', '70.78226409999999'),
(31, 'demo app', '8460688847', 'Dr Rajkumar Rd, Prakash Nagar, Rajajinagar, Bengaluru, Karnataka, India', 0, 'IMG-20200809-WA0001.jpg', 'Karnataka', 'Bangalore Urban', '-1', '12.9921674', '77.55707640000003'),
(32, 'Nitant joshi', '8460688847', 'Gonda Railway Station Marg, Semra Damman, Gonda, Uttar Pradesh 271002, India', 0, 'IMG-20200809-WA0013.jpg', 'Uttar Pradesh', 'Gonda', '-1', '27.1538758', '81.97610020000002'),
(33, 'Nitant', '8460688847', 'Gondal Rd, Vijay Plot, Bhakti Nagar, Rajkot, Gujarat, India', 0, 'IMG-20200809-WA0011.jpg', 'Gujarat', 'Rajkot', '-1', '22.2865849', '70.8000922'),
(34, 'nitant joshi', '8460688847', 'Gondal Rd, Vijay Plot, Bhakti Nagar, Rajkot, Gujarat, India', 0, 'IMG-20200809-WA0013.jpg', 'Gujarat', 'Rajkot', '-1', '22.2865849', '70.8000922'),
(35, 'Nitant', '8460688847', 'Dr Rajkumar Rd, Prakash Nagar, Rajajinagar, Bengaluru, Karnataka, India', 0, 'Nitant Joshi - Introduce Yourself.pdf', 'Karnataka', 'Bangalore Urban', '-1', '12.9921674', '77.55707640000003'),
(36, 'vedant', '8460688847', 'Gondal Rd, Vijay Plot, Bhakti Nagar, Rajkot, Gujarat, India', 0, 'IMG-20200810-WA0011.jpg', 'Gujarat', 'Rajkot', '-1', '22.2865849', '70.8000922'),
(37, 'Nitant jadyo', '9723166877', 'Gondal Rd, Vijay Plot, Bhakti Nagar, Rajkot, Gujarat, India', 0, 'CE083_Lab3.pdf', 'Gujarat', 'Rajkot', '-1', '22.2865849', '70.8000922'),
(38, 'vednat jozhi', '7359479347', 'Rajkot Airport, Gandhigram Civil Aerodrome, Gandhigram, Rajkot, Gujarat 360006, India', 0, 'IMG_20200810_200705_847.jpg', 'Gujarat', 'Rajkot', '-1', '22.3089497', '70.78226409999999'),
(39, 'gjjvb', '7359479347', 'Gondal, Gujarat 360311, India', 0, 'IMG-20200810-WA0014.jpg', 'Gujarat', 'Rajkot', '-1', '21.9611708', '70.7938777'),
(40, 'ysdjwdvj', '8460688847', 'Jasdan - Vinchhiya Rd, Anand Dham Society, Vajsurpara, Jasdan, Gujarat, India', 1, 'IMG-20200810-WA0017.jpg', 'Gujarat', 'Rajkot', '-1', '22.0507638', '71.21894019999999'),
(41, 'nitant', '8460688847', 'Rajkot S.T Bus Stand, Karanpara, Rajkot, Gujarat 360001, India', 0, 'LAB_Submission_Deadlines.pdf', 'Gujarat', 'Rajkot', '-1', '22.29147', '70.80187799999999'),
(42, 'nitant', '8460688847', 'Rajkot Airport, Gandhigram Civil Aerodrome, Gandhigram, Rajkot, Gujarat 360006, India', 0, 'TEMP-PDF-Document.pdf', 'Gujarat', 'Rajkot', '-1', '22.3089497', '70.78226409999999'),
(43, 'nihh', '8460688847', 'Rajahmundry, Andhra Pradesh, India', 0, 'TEMP-PDF-Document.pdf', 'Andhra Pradesh', 'East Godavari', '-1', '17.0005383', '81.8040345'),
(44, 'fddg', '8460688847', 'Dr Rajkumar Rd, Prakash Nagar, Rajajinagar, Bengaluru, Karnataka, India', 0, 'TEMP-PDF-Document.pdf', 'Karnataka', 'Bangalore Urban', '-1', '12.9921674', '77.55707640000003'),
(45, 'nitant', '8460688847', 'Rajkot Marketing Yard, Marketing Yard, Rajkot, Gujarat 360003, India', 0, 'TEMP-PDF-Document.pdf', 'Gujarat', 'Rajkot', '-1', '22.3004472', '70.8346048'),
(46, 'nitant', '8460688847', 'Rajkot S.T Bus Stand, Karanpara, Rajkot, Gujarat 360001, India', 0, 'TEMP-PDF-Document.pdf', 'Gujarat', 'Rajkot', '-1', '22.29147', '70.80187799999999');

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
  MODIFY `prod_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `product_bid`
--
ALTER TABLE `product_bid`
  MODIFY `prod_bid_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `requirement`
--
ALTER TABLE `requirement`
  MODIFY `req_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `requirement_bid`
--
ALTER TABLE `requirement_bid`
  MODIFY `req_bid_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

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
