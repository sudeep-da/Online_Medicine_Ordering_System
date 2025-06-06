-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 13, 2024 at 01:42 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `omos_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart_list`
--

CREATE TABLE `cart_list` (
  `id` int(30) NOT NULL,
  `customer_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` int(30) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `category_list`
--

CREATE TABLE `category_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category_list`
--

INSERT INTO `category_list` (`id`, `name`, `description`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, 'Tablet', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque nisl neque, tincidunt eu imperdiet eget, fringilla ut magna. Fusce in auctor nisl, a efficitur nisi. Vestibulum venenatis velit pharetra mauris dictum ultrices quis et quam. Donec sollicitudin condimentum lectus, vel convallis ipsum sodales id.', 1, 0, '2022-05-25 10:14:16', '2022-05-25 10:16:27'),
(2, 'Capsule', 'Suspendisse accumsan mollis quam. Etiam ut dolor felis. Proin maximus eros tortor, et condimentum massa mollis nec. Fusce gravida posuere purus et tempor. Phasellus commodo auctor justo, tempus pellentesque nunc condimentum id.', 1, 0, '2022-05-25 10:16:05', '2022-05-25 10:16:05'),
(3, 'Syrup', 'Sample category 101', 1, 0, '2022-05-26 10:57:14', '2022-05-26 10:57:14'),
(4, 'Test 123 - updated', 'Sample Only', 1, 1, '2022-05-26 10:57:31', '2022-05-26 10:58:45');

-- --------------------------------------------------------

--
-- Table structure for table `customer_list`
--

CREATE TABLE `customer_list` (
  `id` int(30) NOT NULL,
  `firstname` text NOT NULL,
  `middlename` text DEFAULT NULL,
  `lastname` text NOT NULL,
  `gender` varchar(100) NOT NULL,
  `contact` text NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer_list`
--

INSERT INTO `customer_list` (`id`, `firstname`, `middlename`, `lastname`, `gender`, `contact`, `email`, `password`, `avatar`, `date_created`, `date_updated`) VALUES
(1, 'Mark', 'D', 'Cooper', 'Male', '09123564789', 'mcooper@gmail.com', 'c7162ff89c647f444fcaa5c635dac8c3', 'uploads/customers/1.png?v=1653530034', '2022-05-25 13:21:28', '2022-05-26 09:53:54'),
(3, 'Samantha Jane', 'C', 'Miller', 'Female', '09456987123', 'sam23@gmail.com', 'b60367cae35de6594b1a09bf44a3a68b', 'uploads/customers/3.png?v=1653533693', '2022-05-26 10:54:53', '2022-05-26 10:55:06'),
(4, 'Savita', 'F', 'Pujer', 'Female', '7899621886', 'pujersavita9@gmail.com', '202cb962ac59075b964b07152d234b70', NULL, '2024-07-12 20:53:40', '2024-07-12 20:53:40');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` int(30) NOT NULL DEFAULT 0,
  `price` float(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_id`, `product_id`, `quantity`, `price`) VALUES
(1, 2, 4, 7.00),
(1, 4, 5, 20.00),
(1, 3, 3, 25.00),
(3, 3, 2, 25.00),
(4, 3, 3, 25.00),
(4, 1, 3, 10.00),
(5, 4, 1, 20.00),
(6, 4, 3, 20.00);

-- --------------------------------------------------------

--
-- Table structure for table `order_list`
--

CREATE TABLE `order_list` (
  `id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `customer_id` int(30) NOT NULL,
  `delivery_address` text NOT NULL,
  `total_amount` float(12,2) NOT NULL DEFAULT 0.00,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=pending,\r\n1=packed,\r\n2=out for delivery,\r\n3=paid\r\n',
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_list`
--

INSERT INTO `order_list` (`id`, `code`, `customer_id`, `delivery_address`, `total_amount`, `status`, `date_created`, `date_updated`) VALUES
(1, '20212165468', 1, 'Sample Address Only.', 203.00, 3, '2022-05-25 16:36:09', '2022-05-26 09:10:58'),
(3, '2022052600001', 1, 'test', 50.00, 0, '2022-05-26 09:22:37', '2022-05-26 09:22:37'),
(4, '2022052600002', 3, 'Sample Address to deliver', 105.00, 3, '2022-05-26 10:56:25', '2022-05-26 11:03:01'),
(5, '2024071200001', 4, 'NANDI MEDICALS STORE, DOUBLE ROAD KITTUR', 20.00, 2, '2024-07-12 20:54:02', '2024-07-12 20:54:59'),
(6, '2024071200002', 4, 'NANDI MEDICALS STORE, DOUBLE ROAD KITTUR', 60.00, 0, '2024-07-12 20:58:20', '2024-07-12 20:58:20');

-- --------------------------------------------------------

--
-- Table structure for table `product_list`
--

CREATE TABLE `product_list` (
  `id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `brand` text NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `dose` varchar(250) NOT NULL,
  `price` float(12,2) NOT NULL DEFAULT 0.00,
  `image_path` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_list`
--

INSERT INTO `product_list` (`id`, `category_id`, `brand`, `name`, `description`, `dose`, `price`, `image_path`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, 2, 'Brand 101', 'Mefenamic', 'Proin aliquam mollis erat nec sodales. Integer ipsum ipsum, vulputate a ipsum quis, auctor tincidunt quam. Curabitur ornare nisl interdum sollicitudin lobortis. Curabitur blandit lacinia est, id rutrum mi ultrices sit amet.', '500mg', 10.00, 'uploads/medicines//1_tablet.jpeg?v=1653447989', 1, 0, '2022-05-25 11:06:29', '2022-05-25 11:08:43'),
(2, 2, 'Brand 101', 'Amoxicillin', 'Aliquam porttitor diam nunc, eu imperdiet mi vulputate ut. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean congue commodo tristique. Proin congue consequat fringilla. Cras bibendum consectetur ipsum eu ultrices. Integer aliquet mauris eu pharetra venenatis.', '250', 7.00, 'uploads/medicines//capsule.jpg?v=1653448223', 1, 0, '2022-05-25 11:10:23', '2022-05-25 11:10:23'),
(3, 1, 'Brand 102', 'Drug 101', 'Ut tristique felis sit amet nisl malesuada, id rutrum ligula iaculis. Pellentesque posuere urna dapibus semper vehicula. Donec ex massa, vestibulum eu lorem ut, malesuada volutpat eros. Suspendisse efficitur dolor ut nulla aliquet, non blandit ex finibus. Nunc ac justo vitae eros dapibus mattis id ut ante.', '25mg', 25.00, 'uploads/medicines//pill.jfif?v=1653448296', 1, 0, '2022-05-25 11:11:36', '2022-05-25 11:11:36'),
(4, 1, 'Brand 103', 'Drug 102', 'Vivamus pretium lectus in enim lobortis, vel scelerisque purus pulvinar. Nam pulvinar blandit ligula sed facilisis. Phasellus venenatis lectus quis euismod vestibulum. Aliquam gravida a risus ut aliquet. Duis rhoncus neque id lectus vestibulum varius. In tristique porta viverra.', '50mg', 20.00, 'uploads/medicines//2_para.jpg?v=1720798060', 1, 0, '2022-05-25 14:18:48', '2024-07-12 20:57:40'),
(5, 3, 'Brand 103', 'Medicine #101', 'This is a sample product only- updated', '280ml', 375.00, 'uploads/medicines//syrup.jpg?v=1653533984', 1, 0, '2022-05-26 10:59:44', '2022-05-26 10:59:56');

-- --------------------------------------------------------

--
-- Table structure for table `stock_list`
--

CREATE TABLE `stock_list` (
  `id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `quantity` float(12,2) NOT NULL DEFAULT 0.00,
  `expiration` date DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stock_list`
--

INSERT INTO `stock_list` (`id`, `product_id`, `code`, `quantity`, `expiration`, `date_created`, `date_updated`) VALUES
(1, 2, '1236548', 50.00, '2022-05-27', '2022-05-25 11:48:05', '2022-05-25 11:48:05'),
(2, 2, '8754665', 15.00, '2023-05-25', '2022-05-25 11:54:40', '2022-05-25 11:58:07'),
(3, 2, '111', 35.00, '2022-05-24', '2022-05-25 11:58:24', '2022-05-25 11:58:24'),
(4, 1, '1231', 35.00, '2023-05-26', '2022-05-25 12:06:04', '2022-05-25 12:06:04'),
(5, 3, '123111', 50.00, '2023-05-26', '2022-05-25 12:06:19', '2022-05-25 12:06:19'),
(6, 4, '89756452', 30.00, '2025-06-23', '2022-05-25 14:19:25', '2022-05-25 14:19:25'),
(7, 5, '06231415', 50.00, '2023-05-27', '2022-05-26 11:01:03', '2022-05-26 11:01:03'),
(8, 5, '9875652', 15.00, '2022-05-09', '2022-05-26 11:01:21', '2022-05-26 11:01:41');

-- --------------------------------------------------------

--
-- Table structure for table `stock_out`
--

CREATE TABLE `stock_out` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `stock_id` int(30) NOT NULL,
  `quantity` int(30) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Nandi MedicalManagement System'),
(6, 'short_name', 'Nandi Medicals'),
(11, 'logo', 'uploads/logo.png?v=1653443580'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/cover.png?v=1653443581'),
(17, 'phone', '456-987-1231'),
(18, 'mobile', '09123456987 / 094563212222 '),
(19, 'email', 'info@sample.com'),
(20, 'address', '7087 Henry St. Clifton Park, NY 12065');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `middlename` text DEFAULT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='2';

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `middlename`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', '', 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/avatars/1.png?v=1649834664', NULL, 1, '2021-01-20 14:02:37', '2022-05-16 14:17:49'),
(7, 'John', 'D', 'Smith', 'jsmith', '1254737c076cf867dc53d60a0364f38e', NULL, NULL, 2, '2022-05-26 11:04:16', '2022-05-26 11:04:16');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart_list`
--
ALTER TABLE `cart_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `category_list`
--
ALTER TABLE `category_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_list`
--
ALTER TABLE `customer_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `product_list`
--
ALTER TABLE `product_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `stock_list`
--
ALTER TABLE `stock_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `stock_out`
--
ALTER TABLE `stock_out`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `stock_id` (`stock_id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart_list`
--
ALTER TABLE `cart_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `category_list`
--
ALTER TABLE `category_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `customer_list`
--
ALTER TABLE `customer_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `order_list`
--
ALTER TABLE `order_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `product_list`
--
ALTER TABLE `product_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `stock_list`
--
ALTER TABLE `stock_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `stock_out`
--
ALTER TABLE `stock_out`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart_list`
--
ALTER TABLE `cart_list`
  ADD CONSTRAINT `customer_id_fk_cl` FOREIGN KEY (`customer_id`) REFERENCES `customer_list` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `product_id_fk_cl` FOREIGN KEY (`product_id`) REFERENCES `product_list` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_id_fk_oi` FOREIGN KEY (`order_id`) REFERENCES `order_list` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `product_id_fk_oi` FOREIGN KEY (`product_id`) REFERENCES `product_list` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `order_list`
--
ALTER TABLE `order_list`
  ADD CONSTRAINT `customer_id_fk_ol` FOREIGN KEY (`customer_id`) REFERENCES `customer_list` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `product_list`
--
ALTER TABLE `product_list`
  ADD CONSTRAINT `category_id_fk_pl` FOREIGN KEY (`category_id`) REFERENCES `category_list` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `stock_list`
--
ALTER TABLE `stock_list`
  ADD CONSTRAINT `product_id_fk_sl` FOREIGN KEY (`product_id`) REFERENCES `product_list` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `stock_out`
--
ALTER TABLE `stock_out`
  ADD CONSTRAINT `order_id_fk_so` FOREIGN KEY (`order_id`) REFERENCES `order_list` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `stock_id_fk_so` FOREIGN KEY (`stock_id`) REFERENCES `stock_list` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
