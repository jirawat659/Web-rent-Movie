-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 24, 2025 at 08:49 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `movie_rental`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_ID` bigint(20) NOT NULL,
  `customer_fname` varchar(20) NOT NULL,
  `customer_lname` varchar(20) NOT NULL,
  `customer_password` varchar(255) NOT NULL,
  `phone_num` varchar(10) NOT NULL,
  `customer_email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_ID`, `customer_fname`, `customer_lname`, `customer_password`, `phone_num`, `customer_email`) VALUES
(1000000000001, 'สมชาย', 'ใจดี', 'password123', '0812345678', 'somchai@email.com'),
(1000000000002, 'มาลี', 'สวยงาม', 'pass456', '0898765432', 'malee@email.com'),
(1000000000003, 'อนันต์', 'โชคดี', 'secure789', '0865432109', 'anan@email.com'),
(1000000000004, 'วิชัย', 'ใจเย็น', 'v1ch@i2025', '0812345679', 'wichai@email.com'),
(1000000000005, 'พิมพ์', 'จันทร์ศรี', 'p1mP@ss', '0898765433', 'pim@email.com'),
(1000000000006, 'สมศักดิ์', 'รักเรียน', 'som$@k2025', '0865432110', 'somsak@email.com'),
(1000000000007, 'นารี', 'ดวงดี', 'n@r33pwd', '0891234567', 'naree@email.com'),
(1000000000008, 'ประสิทธิ์', 'มีชัย', 'pra$1T2025', '0872345678', 'prasit@email.com'),
(1000000000009, 'สุดา', 'แก้วใส', 'sud@2025', '0834567890', 'suda@email.com'),
(1000000000010, 'ชัยวัฒน์', 'ศรีสุข', 'ch@i2525', '0867890123', 'chaiwat@email.com'),
(1000000000011, 'รัตนา', 'หอมหวล', 'r@tana25', '0845678901', 'rattana@email.com'),
(1000000000012, 'สมหมาย', 'ยิ้มสวย', 'som2025', '0856789012', 'sommai@email.com'),
(1000000000013, 'วิมล', 'ทองคำ', 'w1m0l_gold', '0878901234', 'wimon@email.com'),
(1106507845687, 'ตัวเทส', 'โคตรเท่', '$2y$10$O1qZ9J8C0FBYgf8DV92sHudH3LnfqQYaxCtx6JQ2Idl1v1vVswzXO', '0625547894', 'Bro@gmail.com'),
(1111122223333, 'mr', 'pk', '$2y$10$HhU1iKqx6iQIKNMMyc0k.ujiXKaakMUIwWV1.A9g6eOZdQYf6WT.u', '111222222', 'pk@gmail.com'),
(1234567891234, 'ta', 'tee', '$2y$10$5T5VxqAADPFppcEjw/8sdO.bMjErVCIFgMrxd6kbxk6g2FBCuOBxq', '123456789', 'ta@gmail.com'),
(9999999999999, 'ad', 'min', '$2y$10$GWtTw4EZrc6pofxc41PMAuuwjh/pwchd6P4zGLg5BTiPH4GIb..0G', '0999999999', 'admin@gmail.com'),
(15116161616310, 'da', 'wd', '$2y$10$PZIpb3MzryaBibzAdYIWROwPRybG2uPLbh3L6KFLZSstsbmGnQtdG', '0000000000', 'we111@gmail.com'),
(15116161616311, 'weerapat', 'unkaeo', '$2y$10$QAnENi9ELADVBnZiATlut.1A5t0rgJxqGwTZT3lm.k/xQtKVBjJCe', '091070764', 'weera100@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `fine`
--

CREATE TABLE `fine` (
  `fine_ID` int(11) NOT NULL,
  `fine_type` varchar(30) NOT NULL,
  `damage_price` decimal(10,2) NOT NULL,
  `fine_date` date NOT NULL,
  `fine_status` enum('ยังไม่ได้ชำระ','ชำระแล้ว') NOT NULL DEFAULT 'ยังไม่ได้ชำระ',
  `customer_ID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fine`
--

INSERT INTO `fine` (`fine_ID`, `fine_type`, `damage_price`, `fine_date`, `fine_status`, `customer_ID`) VALUES
(1, 'คืนหนังช้า', 50.00, '2025-03-10', 'ยังไม่ได้ชำระ', 1000000000001),
(2, 'หนังเสียหาย', 120.00, '2025-03-11', 'ชำระแล้ว', 1000000000002),
(3, 'คืนหนังช้า', 30.00, '2025-03-12', 'ยังไม่ได้ชำระ', 1000000000004),
(4, 'หนังเสียหาย', 150.00, '2025-03-13', 'ชำระแล้ว', 1000000000005),
(5, 'คืนหนังช้า', 40.00, '2025-03-14', 'ยังไม่ได้ชำระ', 1000000000006),
(6, 'แผ่นหนังหาย', 200.00, '2025-03-15', 'ชำระแล้ว', 1000000000007),
(7, 'คืนหนังช้า', 60.00, '2025-03-16', 'ยังไม่ได้ชำระ', 1000000000008),
(8, 'แผ่นหนังมีรอยขีดข่วน', 80.00, '2025-03-17', 'ชำระแล้ว', 1000000000009),
(9, 'คืนหนังช้า', 50.00, '2025-03-18', 'ยังไม่ได้ชำระ', 1000000000010),
(10, 'กล่องหนังเสียหาย', 70.00, '2025-03-15', 'ชำระแล้ว', 1000000000011),
(11, 'คืนหนังช้า', 90.00, '2025-03-16', 'ยังไม่ได้ชำระ', 1000000000012),
(12, 'แผ่นหนังแตก', 180.00, '2025-03-17', 'ชำระแล้ว', 1000000000013);

-- --------------------------------------------------------

--
-- Table structure for table `movie`
--

CREATE TABLE `movie` (
  `movie_ID` int(11) NOT NULL,
  `movie_name` varchar(50) NOT NULL,
  `movie_price` decimal(10,2) NOT NULL,
  `movie_import` date NOT NULL,
  `movie_Status` tinyint(4) NOT NULL DEFAULT 1,
  `type_ID` int(11) NOT NULL,
  `movie_Path` varchar(255) DEFAULT NULL,
  `movievideo_Path` varchar(255) DEFAULT NULL,
  `movie_stock` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `movie`
--

INSERT INTO `movie` (`movie_ID`, `movie_name`, `movie_price`, `movie_import`, `movie_Status`, `type_ID`, `movie_Path`, `movievideo_Path`, `movie_stock`) VALUES
(1, 'Avengers: Endgame', 99.00, '2019-04-24', 1, 1, 'photo/Endgame.jpg', 'https://www.youtube.com/watch?v=TcMBFSGVi1c', 8),
(2, 'Joker', 79.00, '2019-10-02', 1, 3, 'photo/joker.jpg', 'https://www.youtube.com/watch?v=zAGVQLHvwOY', 10),
(3, 'Interstellar', 89.00, '2014-11-07', 1, 4, 'photo/Interstellar.jpg', 'https://www.youtube.com/watch?v=zSWdZVtXT7E', 4),
(4, 'It Chapter Two', 69.00, '2019-09-06', 1, 5, 'photo/IT_2.jpg', 'https://www.youtube.com/watch?v=xhJ5P7Up3jA', 8),
(5, 'The Hangover', 59.00, '2009-06-05', 1, 2, 'photo/hangover.jpg', 'https://www.youtube.com/watch?v=tcdUhdOlz9M', 8),
(6, 'The Dark Knight', 89.00, '2008-07-18', 1, 1, 'photo/the_dark_night.jpg', 'https://www.youtube.com/watch?v=EXeTwQWrcwY', 4),
(7, 'Parasite', 79.00, '2019-05-30', 1, 3, 'photo/parasite.jpg', 'https://www.youtube.com/watch?v=SEUXfv87Wpk', 10),
(8, 'Frozen II', 69.00, '2019-11-22', 1, 8, 'photo/frozen_2.jpg', 'https://www.youtube.com/watch?v=bwzLiQZDw2I', 5),
(9, 'The Shawshank Redemption', 59.00, '1994-10-14', 1, 3, 'photo/the_shawshank_redemption.jpg', 'https://www.youtube.com/watch?v=6hB3S9bIaco', 7),
(10, 'Spider-Man: No Way Home', 99.00, '2021-12-17', 1, 1, 'photo/spiderman_no_way_home.jpg', 'https://www.youtube.com/watch?v=JfVOs4VSpmA', 8),
(11, 'Dune', 89.00, '2021-10-22', 1, 4, 'photo/dune.jpg', 'https://www.youtube.com/watch?v=n9xhJrPXop4', 10),
(12, 'Toy Story 4', 69.00, '2019-06-21', 1, 8, 'photo/toy_story_4.jpg', 'https://www.youtube.com/watch?v=wmiIUN-7qhE', 7),
(13, 'The Godfather', 59.00, '1972-03-24', 1, 9, 'photo/godfather.jpg', 'https://www.youtube.com/watch?v=sY1S34973zA', 10),
(14, 'Inception', 79.00, '2010-07-16', 1, 4, 'photo/Inception.jpg', 'https://www.youtube.com/watch?v=8hP9D6kZseM', 4),
(15, 'Black Panther', 89.00, '2018-02-16', 1, 1, 'photo/Blackpanther.jpg', 'https://www.youtube.com/watch?v=xjDjIWPwcPU', 8),
(38, 'Minecraft', 69.00, '2025-04-24', 1, 7, 'photo/minecraft.jpg', 'https://www.youtube.com/watch?v=8B1EtVPBSMw', 3);

-- --------------------------------------------------------

--
-- Table structure for table `rent`
--

CREATE TABLE `rent` (
  `rent_ID` int(11) NOT NULL,
  `customer_ID` bigint(20) NOT NULL,
  `movie_ID` int(11) NOT NULL,
  `date_start` date NOT NULL,
  `date_return` date NOT NULL,
  `rent_status` enum('ยังไม่คืน','คืนแล้ว') NOT NULL DEFAULT 'ยังไม่คืน',
  `pickup_status` enum('รอรับ','รับแล้ว') DEFAULT 'รอรับ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rent`
--

INSERT INTO `rent` (`rent_ID`, `customer_ID`, `movie_ID`, `date_start`, `date_return`, `rent_status`, `pickup_status`) VALUES
(1, 1000000000001, 1, '2025-03-01', '2025-03-07', 'ยังไม่คืน', 'รับแล้ว'),
(2, 1000000000002, 3, '2025-03-02', '2025-03-08', 'คืนแล้ว', 'รับแล้ว'),
(3, 1000000000003, 5, '2025-03-03', '2025-04-21', 'ยังไม่คืน', 'รับแล้ว'),
(4, 1000000000004, 2, '2025-03-05', '2025-04-22', 'ยังไม่คืน', 'รับแล้ว'),
(5, 1000000000005, 4, '2025-03-06', '2025-03-12', 'คืนแล้ว', 'รับแล้ว'),
(6, 1000000000006, 1, '2025-03-07', '2025-03-13', 'ยังไม่คืน', 'รับแล้ว'),
(7, 1000000000007, 3, '2025-03-08', '2025-03-14', 'คืนแล้ว', 'รับแล้ว'),
(8, 1000000000008, 5, '2025-03-09', '2025-03-15', 'ยังไม่คืน', 'รับแล้ว'),
(9, 1000000000009, 6, '2025-03-10', '2025-03-16', 'ยังไม่คืน', 'รับแล้ว'),
(10, 1000000000010, 7, '2025-03-11', '2025-03-17', 'คืนแล้ว', 'รับแล้ว'),
(11, 1000000000011, 8, '2025-03-12', '2025-03-18', 'ยังไม่คืน', 'รับแล้ว'),
(12, 1000000000012, 9, '2025-03-13', '2025-03-19', 'คืนแล้ว', 'รับแล้ว'),
(13, 1000000000013, 10, '2025-03-14', '2025-03-20', 'ยังไม่คืน', 'รับแล้ว'),
(14, 15116161616311, 1, '2025-04-19', '0000-00-00', 'ยังไม่คืน', 'รับแล้ว'),
(15, 15116161616310, 1, '2025-04-20', '2025-04-20', 'คืนแล้ว', 'รับแล้ว'),
(16, 15116161616310, 1, '2025-04-20', '2025-04-20', 'คืนแล้ว', 'รับแล้ว'),
(17, 15116161616310, 1, '2025-04-20', '2025-04-20', 'คืนแล้ว', 'รับแล้ว'),
(18, 15116161616310, 2, '2025-04-20', '2025-04-20', 'คืนแล้ว', 'รับแล้ว'),
(19, 15116161616310, 3, '2025-04-20', '2025-04-20', 'คืนแล้ว', 'รับแล้ว'),
(20, 9999999999999, 1, '2025-04-21', '2025-04-22', 'ยังไม่คืน', 'รับแล้ว'),
(52, 1111122223333, 2, '2025-04-22', '2025-04-29', 'ยังไม่คืน', 'รับแล้ว'),
(53, 1234567891234, 10, '2025-04-22', '2025-04-29', 'ยังไม่คืน', 'รับแล้ว'),
(54, 1234567891234, 8, '2025-04-22', '2025-04-29', 'ยังไม่คืน', 'รับแล้ว'),
(55, 1234567891234, 2, '2025-04-22', '2025-04-29', 'ยังไม่คืน', 'รับแล้ว'),
(56, 9999999999999, 2, '2025-04-22', '2025-04-29', 'ยังไม่คืน', 'รับแล้ว'),
(57, 9999999999999, 2, '2025-04-22', '2025-04-29', 'ยังไม่คืน', 'รับแล้ว'),
(58, 9999999999999, 1, '2025-04-22', '2025-04-29', 'ยังไม่คืน', 'รับแล้ว'),
(59, 9999999999999, 2, '2025-04-22', '2025-04-29', 'ยังไม่คืน', 'รับแล้ว'),
(60, 9999999999999, 2, '2025-04-23', '2025-04-30', 'ยังไม่คืน', 'รับแล้ว'),
(61, 1106507845687, 38, '2025-04-24', '2025-04-24', 'คืนแล้ว', 'รับแล้ว'),
(62, 1106507845687, 38, '2025-04-24', '2025-04-24', 'คืนแล้ว', 'รับแล้ว'),
(63, 1106507845687, 38, '2025-04-24', '2025-04-24', 'คืนแล้ว', 'รับแล้ว'),
(64, 1106507845687, 38, '2025-04-24', '2025-04-24', 'คืนแล้ว', 'รับแล้ว'),
(65, 1106507845687, 38, '2025-04-24', '2025-04-24', 'คืนแล้ว', 'รับแล้ว');

-- --------------------------------------------------------

--
-- Table structure for table `type_movie`
--

CREATE TABLE `type_movie` (
  `type_ID` int(11) NOT NULL,
  `type_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `type_movie`
--

INSERT INTO `type_movie` (`type_ID`, `type_name`) VALUES
(1, 'แอคชั่น'),
(2, 'ตลก'),
(3, 'ดราม่า'),
(4, 'ไซไฟ'),
(5, 'สยองขวัญ'),
(6, 'โรแมนติก'),
(7, 'ผจญภัย'),
(8, 'แอนิเมชัน'),
(9, 'ประวัติศาสตร์'),
(10, 'แฟนตาซี'),
(11, 'เพลง'),
(12, 'ชีวิตจริง'),
(13, 'อาชญากรรม'),
(14, 'ลึกลับ'),
(15, 'สารคดี');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_ID`),
  ADD UNIQUE KEY `customer_email` (`customer_email`);

--
-- Indexes for table `fine`
--
ALTER TABLE `fine`
  ADD PRIMARY KEY (`fine_ID`),
  ADD KEY `customer_ID` (`customer_ID`);

--
-- Indexes for table `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`movie_ID`),
  ADD KEY `type_ID` (`type_ID`);

--
-- Indexes for table `rent`
--
ALTER TABLE `rent`
  ADD PRIMARY KEY (`rent_ID`),
  ADD KEY `customer_ID` (`customer_ID`),
  ADD KEY `movie_ID` (`movie_ID`);

--
-- Indexes for table `type_movie`
--
ALTER TABLE `type_movie`
  ADD PRIMARY KEY (`type_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `fine`
--
ALTER TABLE `fine`
  MODIFY `fine_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `movie`
--
ALTER TABLE `movie`
  MODIFY `movie_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `rent`
--
ALTER TABLE `rent`
  MODIFY `rent_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `type_movie`
--
ALTER TABLE `type_movie`
  MODIFY `type_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `fine`
--
ALTER TABLE `fine`
  ADD CONSTRAINT `fine_ibfk_1` FOREIGN KEY (`customer_ID`) REFERENCES `customers` (`customer_ID`);

--
-- Constraints for table `movie`
--
ALTER TABLE `movie`
  ADD CONSTRAINT `movie_ibfk_1` FOREIGN KEY (`type_ID`) REFERENCES `type_movie` (`type_ID`);

--
-- Constraints for table `rent`
--
ALTER TABLE `rent`
  ADD CONSTRAINT `rent_ibfk_1` FOREIGN KEY (`customer_ID`) REFERENCES `customers` (`customer_ID`),
  ADD CONSTRAINT `rent_ibfk_2` FOREIGN KEY (`movie_ID`) REFERENCES `movie` (`movie_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
