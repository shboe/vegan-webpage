-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Feb 19, 2024 at 05:59 AM
-- Server version: 5.7.34
-- PHP Version: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vegan_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `scode` VARCHAR(20) PRIMARY KEY,
  `sname` varchar(50) NOT NULL,
  `category` varchar(50) NOT NULL,
  `ingredient` varchar(100) NOT NULL,
  `vegan` varchar(20) NOT NULL,
  `store` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`scode`, `sname`, `category`, `ingredient`, `vegan`, `store`) VALUES
("4986858243683", 'キャベツミックス', 'カット野菜（生食用）', 'なし', 'vegan', 'FamilyMart'),
("2094205200516", 'ちょびっとぶっかけうどん', '麺類', 'えび・魚', 'non-vegan', 'seven-eleven'),
("2308655955330", 'ミックスサンド', 'サンドイッチ', '卵、魚、豚、乳', 'non-vegan', 'LAWSON');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
