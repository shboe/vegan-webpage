-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 26, 2024 at 07:32 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `py24db`
--

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `scode` varchar(20) NOT NULL,
  `sname` varchar(50) NOT NULL,
  `category` varchar(50) NOT NULL,
  `ingredient` varchar(100) NOT NULL,
  `vegan` varchar(20) NOT NULL,
  `store` varchar(20) NOT NULL,
  `filename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`scode`, `sname`, `category`, `ingredient`, `vegan`, `store`, `filename`) VALUES
('', 'ramen', '', '', '', 'LAWSON', 'ramenLAWSON.jpg'),
('2094205200516', 'ちょびっとぶっかけうどん', '麺類', 'えび・魚', 'non-vegan', 'seven-eleven', 'udon711.jpg'),
('2308655955330', 'ミックスサンド', 'サンドイッチ', '卵、魚、豚、乳', 'non-vegan', 'LAWSON', 'mixsandwhichLAWSON.png'),
('4986858243683', 'キャベツミックス', 'カット野菜（生食用）', 'なし', 'vegan', 'FamilyMart', 'kyabetsuFAMIMA.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`scode`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
