-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 30, 2018 at 04:41 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 5.6.39

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(50) NOT NULL,
  `full_name` varchar(50) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `created_date` date NOT NULL,
  `role` int(1) NOT NULL,
  `banned` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`id`, `username`, `password`, `full_name`, `email`, `address`, `phone`, `created_date`, `role`, `banned`) VALUES
(1, 'admin', '202cb962ac59075b964b07152d234b70', 'Nguyễn Đình Dũng', 'dungnd@ptit.edu.vn', 'Hà Nội', '0376682678', '2018-10-10', 1, 0),
(2, 'demo', 'c69bd0e6c1b8ff2f9f0ef362f80fc4d3', 'Demo', 'demo@ptit.edu.vn', 'Trái Đất', '123', '2018-10-10', 0, 0),
(3, 'dungnd', 'c4ca4238a0b923820dcc509a6f75849b', 'Dũng ND', 'nddungx@gmail.com', 'Earth', '0999999999', '2018-10-10', 1, 0),
(4, 'hieutn', 'c4ca4238a0b923820dcc509a6f75849b', 'Tô Ngọc Hiếu', 'hieutn@ptit.edu.vn', 'Cà Mau', '0123456789', '2018-10-10', 0, 0),
(5, 'tubv', '202cb962ac59075b964b07152d234b70', 'Bùi Văn Tụ', 'tubv@ptit.edu.vn', 'Hải Phòng', '0982361281', '2018-10-10', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `id` int(11) NOT NULL,
  `customerID` int(11) NOT NULL,
  `created_date` date NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`id`, `customerID`, `created_date`, `status`) VALUES
(1, 1, '2018-12-13', 0),
(2, 1, '2018-12-13', 1),
(3, 3, '2018-12-13', 1),
(4, 3, '2018-12-13', 0),
(5, 3, '2018-12-13', 1),
(6, 5, '2018-12-14', 1),
(7, 5, '2018-12-23', 0),
(8, 5, '2018-12-23', 0),
(9, 1, '2018-12-30', 0),
(10, 1, '2018-12-30', 1),
(11, 1, '2018-12-30', 0),
(12, 1, '2018-12-30', 0),
(13, 3, '2018-12-30', 0),
(14, 5, '2018-12-30', 0),
(15, 5, '2018-12-30', 1),
(16, 5, '2018-12-30', 0),
(17, 5, '2018-12-30', 0),
(18, 5, '2018-12-30', 0);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Giày nam'),
(2, 'Giày nữ'),
(3, 'Giày cho bé'),
(4, 'Giày thể thao'),
(5, 'Giày lười'),
(6, 'Giày Sneaker');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `id` int(11) NOT NULL,
  `orderID` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  `price` double NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`id`, `orderID`, `productID`, `price`, `quantity`) VALUES
(1, 1, 4, 408000, 1),
(2, 1, 5, 468000, 2),
(3, 2, 6, 299000, 2),
(4, 2, 2, 218000, 1),
(5, 3, 6, 299000, 1),
(6, 4, 5, 468000, 1),
(7, 4, 20, 299000, 1),
(8, 4, 8, 89000, 1),
(12, 5, 6, 299000, 8),
(13, 5, 1, 129000, 9),
(14, 6, 1, 129000, 3),
(15, 6, 5, 468000, 2),
(16, 7, 12, 115000, 2),
(17, 8, 5, 468000, 2),
(18, 8, 3, 99000, 1),
(19, 9, 5, 468000, 1),
(20, 10, 6, 299000, 1),
(21, 10, 3, 99000, 2),
(22, 11, 3, 99000, 2),
(23, 11, 6, 299000, 1),
(24, 11, 5, 468000, 1),
(25, 11, 4, 408000, 1),
(26, 11, 12, 115000, 1),
(27, 12, 3, 99000, 1),
(28, 13, 4, 408000, 1),
(29, 14, 3, 99000, 3),
(30, 15, 6, 299000, 1),
(31, 16, 1, 129000, 1),
(32, 17, 5, 468000, 2),
(33, 18, 6, 299000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `id_post` int(11) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`id`, `username`, `message`, `id_post`, `created_at`) VALUES
(1, 'Tuzoro', 'sdfsdf', 1, '2018-12-28T13:58:31+0000'),
(4, 'Tuzoro', 'sdfsdfs', 1, '2018-12-28T14:15:23+0000'),
(5, 'Tuzoro', 'fsfsdf', 6, '2018-12-28T14:38:10+0000'),
(7, 'Nguyễn Đình Dũng', 'sản phẩm đẹp quá bạn ơi', 1, '2018-12-30T13:09:03+0000'),
(9, 'Nguyễn Đình Dũng', 'có màu hồng không bạn', 1, '2018-12-30T13:10:01+0000'),
(11, 'Nguyễn Đình Dũng', 'tặng kèm gì không vậy shop?', 12, '2018-12-30T13:23:10+0000'),
(13, 'Dũng Ng', 'giày fake hay chính hãng bạn?', 2, '2018-12-30T14:26:21+0000'),
(14, 'Dũng Ng', 'sản phẩm còn hàng không shop?', 4, '2018-12-30T15:21:01+0000'),
(15, 'Dũng Ng', 'giày màu hường còn không?', 4, '2018-12-30T15:24:13+0000');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `categoryID` int(11) NOT NULL,
  `price` double NOT NULL,
  `details` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `categoryID`, `price`, `details`) VALUES
(1, 'Giày thể thao vải có dây Blue', 4, 129000, 'Giày thể thao vải có dây Blue rất đẹp'),
(2, 'Giày Stan Smith xanh lá đế bạc', 1, 218000, 'Giày Stan Smith xanh lá đế bạc sản xuất tại Trung Quốc'),
(3, 'Giày Nam Da Trắng Xịn - Form Đẹp C01', 1, 99000, 'Giày thể thao vải có dây Blue rất đẹp'),
(4, 'Giày Da Trắng Quảng Châu Cao Cấp', 4, 408000, 'Giày Stan Smith xanh lá đế bạc sản xuất tại Trung Quốc'),
(5, 'Giầy Nmd Trắng Full Phom Nhỏ', 6, 468000, 'Giày thể thao vải có dây Blue rất đẹp'),
(6, 'Giày Nike Jordan đang cao cổ', 3, 299000, 'Giày Stan Smith xanh lá đế bạc sản xuất tại Trung Quốc'),
(7, 'Giầy Nmd Trắng Full Phom Nhỏ', 6, 199000, 'Giày thể thao vải có dây Blue rất đẹp'),
(8, 'Giày Nike Jordan đang cao cổ', 3, 89000, 'Giày Stan Smith xanh lá đế bạc sản xuất tại Trung Quốc'),
(9, 'Giầy Nmd Trắng Full Phom Nhỏ', 6, 109000, 'Giày thể thao vải có dây Blue rất đẹp'),
(10, 'Giày Nike Jordan đang cao cổ', 3, 78000, 'Giày Stan Smith xanh lá đế bạc sản xuất tại Trung Quốc'),
(11, 'Giầy Nmd Trắng Full Phom Nhỏ', 6, 234000, 'Giày thể thao vải có dây Blue rất đẹp'),
(12, 'Giày Nike Jordan đang cao cổ', 3, 115000, 'Giày Stan Smith xanh lá đế bạc sản xuất tại Trung Quốc'),
(13, 'Giầy Nmd Trắng Full Phom Nhỏ', 6, 198000, 'Giày thể thao vải có dây Blue rất đẹp'),
(14, 'Giày Nike Jordan đang cao cổ', 3, 278000, 'Giày Stan Smith xanh lá đế bạc sản xuất tại Trung Quốc'),
(15, 'Giầy Nmd Trắng Full Phom Nhỏ', 6, 289000, 'Giày thể thao vải có dây Blue rất đẹp'),
(16, 'Giày Nike Jordan đang cao cổ', 3, 158000, 'Giày Stan Smith xanh lá đế bạc sản xuất tại Trung Quốc'),
(17, 'Giầy Nmd Trắng Full Phom Nhỏ', 6, 236000, 'Giày thể thao vải có dây Blue rất đẹp'),
(18, 'Giày Nike Jordan đang cao cổ', 3, 195000, 'Giày Stan Smith xanh lá đế bạc sản xuất tại Trung Quốc'),
(19, 'Giầy Nmd Trắng Full Phom Nhỏ', 6, 168000, 'Giày thể thao vải có dây Blue rất đẹp'),
(20, 'Giày Nike Jordan đang cao cổ', 3, 299000, 'Giày Stan Smith xanh lá đế bạc sản xuất tại Trung Quốc'),
(22, 'Sản phẩm mẫu', 4, 239000, 'Giày thể thao thời trang, cá tính mạnh mẽ'),
(23, 'Giày Sneaker thời trang xuất khẩu', 6, 1290000, 'Giày Sneaker trẻ trung, lấy tại xưởng');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `bill`
--
ALTER TABLE `bill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
