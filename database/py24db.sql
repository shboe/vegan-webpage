-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 18, 2024 at 08:19 AM
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
('1902150820032', 'あじの南蛮漬け', '惣菜', '魚', 'non-vegan', 'LAWSON', 'aji_nanban.png'),
('2005200165182', '低音熟成納豆', 'おにぎり', 'なし', 'vegan', 'FamilyMart', 'natto.jpg'),
('2012113965181', '野菜スティック味噌マヨ', 'サラダ', '乳', 'non-vegan', 'FamilyMart', 'yasai_stick.jpg'),
('2094205200516', 'ちょびっとぶっかけうどん', '麺類', 'えび・魚', 'non-vegan', 'seven-eleven', 'udon711.jpg'),
('2308655955330', 'ミックスサンド', 'サンドイッチ', '卵、魚、豚、乳', 'non-vegan', 'LAWSON', 'mixsandwhichLAWSON.png'),
('4517027004790', '一口きゅうりの浅漬け', '惣菜', 'なし', 'vegan', 'LAWSON', 'kyuri.jpg'),
('4549737106082', 'コーンサラダ', 'サラダ', 'なし', 'vegan', 'LAWSON', 'corn_salad.png'),
('4901130406752', 'じゃがスティックあっさりうま塩あじ', 'お菓子', 'なし', 'vegan', 'FamilyMart', 'jaga.jpg'),
('4901330806934', 'ベジップス', 'お菓子', 'なし', 'vegan', 'LAWSON', 'veggie_chips.png'),
('4901530228635', '笹かま', '惣菜', '魚、貝', 'non-vegan', 'LAWSON', 'sasakama.png'),
('490153023550', '切れてる厚焼玉子', '惣菜', '卵', 'non-vegan', 'FamilyMart', 'atsuyaki.jpg'),
('4901551372157', '甘栗　むいちゃいました', 'お菓子', 'なし', 'vegan', 'FamilyMart', 'amaguri.jpg'),
('4901940202867', 'たんぱく質たっぷりのえんどう豆スナックバター醤油味', 'お菓子', '乳', 'non-vegan', 'LAWSON', 'edamame_snack.png'),
('4902175327899', '本格熟成キムチ', '惣菜', '魚', 'non-vegan', 'LAWSON', 'kimuchi.png'),
('490238888467', 'わかめスープユッケジャン風', 'スープ', '魚、牛、豚', 'non-vegan', 'LAWSON', 'yukkejan_soup.png'),
('4902388884684', 'わかめスープねぎ塩味', 'スープ', '豚、貝、魚', 'no-vegan', 'LAWSON', 'wakame_shio_soup.png'),
('4902401510996', 'ごろっと大きめな長ネギ', '汁物', '魚', 'non-vegan', 'FamilyMart', 'negi.jpg'),
('4902415018815', 'うの花', '惣菜', '魚', 'non-vegan', 'LAWSON', 'unohana.png'),
('4902450524708', 'ひねり揚げうましお味', 'お菓子', '魚', 'non-vegan', 'FamilyMart', 'hineri.jpg'),
('4902553014281', 'ひじき煮', '惣菜', '魚', 'non-vegan', 'LAWSON', 'hijikini.png'),
('4904680963753', 'レンジで手軽に塩味枝豆', '惣菜', 'なし', 'vegan', 'FamilyMart', 'edamame_1.jpeg'),
('4941983022534', 'ひとくちカリッと割り梅', 'お菓子', 'なし', 'vegan', 'LAWSON', 'ume.png'),
('4972560103339', 'やわらかほしいも', 'お菓子', 'なし', 'vegan', 'LAWSON', 'hoshiimo.jpg'),
('4975041207168', 'うす塩味めかぶ', '惣菜', '魚', 'non-vegan', 'LAWSON', 'mekabu.png'),
('4986858243683', 'キャベツミックス', 'カット野菜（生食用）', 'なし', 'vegan', 'FamilyMart', 'kyabetsuFAMIMA.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `productsen`
--

CREATE TABLE `productsen` (
  `scode` varchar(20) NOT NULL,
  `sname` varchar(75) NOT NULL,
  `category` varchar(50) NOT NULL,
  `ingredient` varchar(100) NOT NULL,
  `vegan` varchar(20) NOT NULL,
  `store` varchar(20) NOT NULL,
  `filename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `productsen`
--

INSERT INTO `productsen` (`scode`, `sname`, `category`, `ingredient`, `vegan`, `store`, `filename`) VALUES
('1902150820032', 'Marinated Fried Horse Mackerel', 'Side Dish', 'Fish', 'non-vegan', 'LAWSON', 'aji_nanban.png'),
('2005200165182', 'Natto', 'Onigiri', 'None', 'vegan', 'FamilyMart', 'natto.jpg'),
('2012113965181', 'Carrot, Cucumber, Radish ( Miso Mayo )', 'Salad', 'Milk', 'non-vegan', 'FamilyMart', 'yasai_stick.jpg'),
('2094205200516', 'Cold Soba With Green Onions, Ginger And Bonito Broth', 'Noodles', 'Prawn・Fish', 'non-vegan', 'seven-eleven', 'udon711.jpg'),
('2308655955330', 'Assorted Sandwich', 'Sandwich', 'Egg、Fish、Pork、Milk', 'non-vegan', 'LAWSON', 'mixsandwhichLAWSON.png'),
('4549737106082', 'Corn Salad', 'Salad', 'None', 'vegan', 'LAWSON', 'corn_salad.png'),
('4901130406752', 'Potato Sticks Light Savory Salt', 'Snack', 'None', 'vegan', 'FamilyMart', 'jaga.jpg'),
('4901330806934', 'Sweet Potato, Carrot , Squash', 'Snack', 'None', 'vegan', 'LAWSON', 'veggie_chips.png'),
('4901530228635', 'Bamboo Leaf Shaped Fish cake', 'Side Dish', 'Fish, Shell-fish', 'non-vegan', 'LAWSON', 'sasakama.png'),
('490153023550', 'Japanese Omelette', 'Side Dish', 'Egg', 'non-vegan', 'FamilyMart', 'atsuyaki.jpg'),
('4901551372157', 'Roasted Tianjin Chestnuts', 'Snack', 'None', 'vegan', 'FamilyMart', 'amaguri.jpg'),
('4901940202867', 'Green Pea Snack , Butter Soy Sauce Flavor', 'Snack', 'Milk', 'non-vegan', 'LAWSON', 'edamame_snack.png'),
('4902175327899', 'Kimchi', 'Side Dish', 'Fish', 'non-vegan', 'LAWSON', 'kimuchi.png'),
('490238888467', 'Seaweed Soup With Yukgaejang Flavor', 'Soup', 'Fish、Beef、Pork', 'non-vegan', 'LAWSON', 'yukkejan_soup.png'),
('4902388884684', 'Seaweed Soup With Salt & Green Onion', 'Soup', 'Pork、Shell-Fish、Fish', 'non-vegan', 'LAWSON', 'wakame_shio_soup.png'),
('4902401510996', 'Miso Soup With Green Onion', 'Soup', 'Fish', 'non-vegan', 'FamilyMart', 'negi.jpg'),
('4902415018815', 'Soy Pulp', 'Side Dish', 'Fish', 'non-vegan', 'LAWSON', 'unohana.png'),
('4902450524708', 'Twisted Wheat Snack Original Flavor', 'Snack', 'Fish', 'non-vegan', 'FamilyMart', 'hineri.jpg'),
('4902553014281', 'Simmered Hijiki Seaweed', 'Side Dish', 'Fish', 'non-vegan', 'LAWSON', 'hijikini.png'),
('4904680963753', 'Salted Edamame Beans', 'Side Dish', 'None', 'vegan', 'FamilyMart', 'edamame_1.jpeg'),
('4941983022534', 'Pickled Plum', 'Snack', 'None', 'vegan', 'LAWSON', 'ume.png'),
('4972560103339', 'Dried Sweet Potato', 'Snack', 'None', 'vegan', 'LAWSON', 'hoshiimo.jpg'),
('4975041207168', 'Mekabu Seaweed', 'Side Dish', 'Fish', 'non-vegan', 'LAWSON', 'mekabu.png'),
('4986858243683', 'Cabbage Veggie Mix', 'Sliced Vegetables', 'None', 'vegan', 'FamilyMart', 'kyabetsuFAMIMA.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`scode`);

--
-- Indexes for table `productsen`
--
ALTER TABLE `productsen`
  ADD PRIMARY KEY (`scode`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
