-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 15, 2026 at 12:11 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bookstore`
--

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `ISBN` int(10) NOT NULL,
  `title` varchar(50) NOT NULL,
  `author` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `category` varchar(50) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`ISBN`, `title`, `author`, `description`, `price`, `category`, `image`) VALUES
(100001, 'The Silent Patient', 'Alex Michaelides', 'A shocking psychological thriller of a woman\'s act of violence against her husband and of the therapist obsessed with uncovering her motive.', 1299.00, 'Thriller', 'assets/images/silent-patient.jpg'),
(100002, 'The Floating World', 'Axie Oh', 'A Korean-inspired romantic fantasy following an amnesiac ex-soldier and a spirited acrobat whose destinies intertwine in a world of silver light and shadowy demons.', 1399.00, 'Fantasy', 'assets/images/the-floating-world-v3.jpg'),
(100003, 'The Demon and the Light', 'Axie Oh', 'The thrilling conclusion to the Floating World duology, where Ren must navigate political pressure to save Sunho from the monstrous power consuming him.', 1499.00, 'Fantasy', 'assets/images/the-demon-and-the-light.jpg'),
(100004, 'White Nights', 'Fyodor Dostoevsky', 'A poignant short story exploring themes of loneliness, unrequited love, and the fleeting nature of happiness in the ethereal twilight of St. Petersburg.', 999.00, 'Classic Fiction', 'assets/images/white-nights-v3.jpg'),
(100005, 'Incidents Around the House', 'Josh Malerman', 'A terrifying new horror novel told through the eyes of an eight-year-old girl whose family is haunted by an insidious entity called Other Mommy.', 1399.00, 'Horror', 'assets/images/incidents-around-the-house.jpg'),
(100006, 'When the Wolf Comes Home', 'Nat Cassidy', 'A thrilling horror novel about Jess Bailey, a struggling actress who discovers a runaway boy capable of turning fears into reality, leading them to flee from his monstrous father.', 1499.00, 'Horror', 'assets/images/when-the-wolf-comes-home.jpg'),
(100007, 'Fairy Tale', 'Stephen King', 'A dark fantasy adventure about a teenage boy who inherits the keys to a parallel world where good and evil are at war.', 1499.00, 'Fantasy', 'assets/images/fairy-tale.jpg'),
(100008, 'The Maidens', 'Alex Michaelides', 'A psychological suspense novel about a brilliant but troubled therapist obsessed with a secret society and a series of murders at Cambridge University.', 1299.00, 'Thriller', 'assets/images/the-maidens.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ISBN` int(11) NOT NULL,
  `order_date` datetime NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `status` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `ISBN`, `order_date`, `total_price`, `status`) VALUES
(1, 1, 100006, '2026-10-08 21:36:15', 1499.00, 'Completed'),
(2, 2, 100006, '2026-10-09 08:00:51', 1499.00, 'Completed'),
(3, 2, 100001, '2026-10-09 08:31:49', 1299.00, 'Completed'),
(4, 2, 100001, '2026-10-09 08:39:23', 1299.00, 'Completed'),
(5, 2, 100001, '2026-10-15 10:41:03', 1299.00, 'Completed'),
(6, 2, 100005, '2026-10-15 10:41:24', 1399.00, 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `name`, `email`, `password`) VALUES
(1, 'Irfan', 'irfan123@gmail.com', 'f17adc40ccd5766432d0da07a673083bae4e9d55'),
(2, 'Aditya', 'adi123@gmail.com', '4a04f8da508d9357092388f5609dcc82ba2d1826');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`ISBN`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `ISBN` (`ISBN`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
