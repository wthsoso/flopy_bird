-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 10, 2024 at 09:03 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `flappy_bird`
--

-- --------------------------------------------------------

--
-- Table structure for table `scores`
--

CREATE TABLE `scores` (
  `user_id` int(8) NOT NULL,
  `score` int(11) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `scores`
--

INSERT INTO `scores` (`user_id`, `score`, `id`) VALUES
(6, 1, 183),
(6, 2, 184),
(6, 3, 185),
(6, 4, 186),
(6, 1, 187),
(6, 1, 188),
(6, 1, 189),
(6, 1, 190),
(6, 1, 191),
(6, 1, 192),
(6, 1, 193),
(6, 1, 194),
(6, 1, 195),
(6, 3, 196),
(6, 1, 197),
(6, 5, 198),
(10, 6, 199),
(13, 2, 200);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `Email` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `Email`) VALUES
(5, 'qweqwe', 'asdasd', '123@gmail.com'),
(6, 'sacava', '1', 'ok@gmail.com'),
(8, '123', '12312312dfwedwqerw', 'sosso.chkhaidze@gmail.com'),
(9, 'soso123', '123', 'we@gmail.com'),
(10, 'iosebi', '123', 'iosebi@gmail.com'),
(12, 'gio', '123', 'ok@gmail.com'),
(13, 'giorgi', '123', 'gio@gmail.com'),
(14, '123', '123', '123@gmail.com'),
(15, '1', '1', '123@gmail.com'),
(16, '1', '1', '123@gmail.com'),
(17, 'ooooo', '123', 'ooo@gmail.com'),
(18, 'ooooo', '123', 'ooo@gmail.com'),
(19, 'ooooo1', '121231', 'ooo@gmail.com'),
(20, 'ooooo1', '121231', 'ooo@gmail.com'),
(21, 'ooooo12', '1', 'ooo@gmail.com'),
(22, 'ooooo12', '1', 'ooo@gmail.com'),
(23, 'ooooo122', '1', 'ooo@gmail.com'),
(24, 'ooooo122', '1', 'ooo@gmail.com'),
(25, 'ooooo1224', '12312312312312', 'ooo@gmail.com'),
(26, 'mamam', '123123123sf', '123123@gmail.com'),
(27, 'mamam', '123123123sf', '123123@gmail.com'),
(28, 'mamam', '123123123sf', '123123@gmail.com'),
(29, 'mamam', '123123123sf', '123123@gmail.com'),
(30, 'mamam', '123123123sf', '123123@gmail.com'),
(31, 'mamam', '123123123sf', '123123@gmail.com'),
(32, 'mamam', '123123123sf', '123123@gmail.com'),
(33, 'mamam', '123123123sf', '123123@gmail.com'),
(34, 'mamam', '123123123sf', '123123@gmail.com'),
(35, 'mamam', '123123123sf', '123123@gmail.com'),
(36, 'mamam', '123123123sf', '123123@gmail.com'),
(37, 'mamam', '123123123sf', '123123@gmail.com'),
(38, 'mamam', '123123123sf', '123123@gmail.com'),
(39, 'mamam', '123123123sf', '123123@gmail.com'),
(40, 'mamam', '123123123sf', '123123@gmail.com'),
(41, 'mamam', '123123123sf', '123123@gmail.com'),
(42, 'mamam', '123123123sf', '123123@gmail.com'),
(43, 'mamam', '123123123sf', '123123@gmail.com'),
(44, 'mamam', '123123123sf', '123123@gmail.com'),
(45, 'mamam', '123123123sf', '123123@gmail.com'),
(46, 'mamam', '123123123sf', '123123@gmail.com'),
(47, 'mamam', '123123123sf', '123123@gmail.com'),
(48, 'mamam', '123123123sf', '123123@gmail.com'),
(49, 'mamam', '123123123sf', '123123@gmail.com'),
(50, 'amamamama', '1', '1213@gmail.com'),
(51, 'iudhfswhiufhds', 'adad', 'g@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `scores`
--
ALTER TABLE `scores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`) USING BTREE;

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `scores`
--
ALTER TABLE `scores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `scores`
--
ALTER TABLE `scores`
  ADD CONSTRAINT `scores_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
