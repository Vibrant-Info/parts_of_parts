-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 04, 2016 at 06:16 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `parts_of_parts`
--
CREATE DATABASE IF NOT EXISTS `parts_of_parts` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `parts_of_parts`;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_collections`
--
-- Creation: Feb 04, 2016 at 05:09 AM
--

DROP TABLE IF EXISTS `tbl_collections`;
CREATE TABLE IF NOT EXISTS `tbl_collections` (
  `coll_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coll_name` varchar(250) NOT NULL,
  `coll_status` tinyint(4) NOT NULL DEFAULT '1',
  `coll_user_id` bigint(20) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`coll_id`),
  KEY `coll_user_id` (`coll_user_id`),
  KEY `coll_user_id_2` (`coll_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_colors`
--
-- Creation: Feb 03, 2016 at 12:16 PM
--

DROP TABLE IF EXISTS `tbl_colors`;
CREATE TABLE IF NOT EXISTS `tbl_colors` (
  `colr_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `colr_name` bigint(20) NOT NULL,
  `colr_status` tinyint(4) NOT NULL DEFAULT '1',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`colr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_orders`
--
-- Creation: Feb 04, 2016 at 05:02 AM
--

DROP TABLE IF EXISTS `tbl_orders`;
CREATE TABLE IF NOT EXISTS `tbl_orders` (
  `ord_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ord_amount` varchar(250) NOT NULL,
  `ord_usr_id` bigint(20) NOT NULL,
  `ord_status` int(10) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ord_id`),
  KEY `ord_usr_id` (`ord_usr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order_details`
--
-- Creation: Feb 04, 2016 at 05:04 AM
--

DROP TABLE IF EXISTS `tbl_order_details`;
CREATE TABLE IF NOT EXISTS `tbl_order_details` (
  `ordet_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ordet_coll_id` bigint(20) NOT NULL,
  `ordet_prod_id` bigint(20) NOT NULL,
  `ordet_part_id` bigint(20) NOT NULL,
  `ordet_quantity` bigint(20) NOT NULL,
  `ordet_ord_id` bigint(20) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ordet_id`),
  KEY `ordet_coll_id` (`ordet_coll_id`),
  KEY `ordet_prod_id` (`ordet_prod_id`),
  KEY `ordet_part_id` (`ordet_part_id`),
  KEY `ordet_ord_id` (`ordet_ord_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_parts`
--
-- Creation: Feb 04, 2016 at 05:06 AM
--

DROP TABLE IF EXISTS `tbl_parts`;
CREATE TABLE IF NOT EXISTS `tbl_parts` (
  `prt_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `prt_coll_id` bigint(20) NOT NULL,
  `prt_prod_id` bigint(20) NOT NULL,
  `prt_name` varchar(250) NOT NULL,
  `prt_model` varchar(250) NOT NULL,
  `prt_dimensions` varchar(250) NOT NULL,
  `prt_price` varchar(250) NOT NULL,
  `prt_colr_id` bigint(20) NOT NULL,
  `prt_prod_type` tinyint(4) NOT NULL DEFAULT '0',
  `prt_desc` text NOT NULL,
  `prt_status` tinyint(4) NOT NULL DEFAULT '1',
  `prt_user_id` bigint(20) NOT NULL,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`prt_id`),
  KEY `prt_coll_id` (`prt_coll_id`),
  KEY `prt_prod_id` (`prt_prod_id`),
  KEY `prt_user_id` (`prt_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_products`
--
-- Creation: Feb 04, 2016 at 05:08 AM
--

DROP TABLE IF EXISTS `tbl_products`;
CREATE TABLE IF NOT EXISTS `tbl_products` (
  `prod_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `prod_coll_id` bigint(20) NOT NULL,
  `prod_name` varchar(250) NOT NULL,
  `prod_model` varchar(250) NOT NULL,
  `prod_dimensions` varchar(250) NOT NULL,
  `prod_price` varchar(250) NOT NULL,
  `prod_colr_id` bigint(20) NOT NULL,
  `prod_image` varchar(250) NOT NULL,
  `prod_desc` text NOT NULL,
  `prod_status` tinyint(4) NOT NULL DEFAULT '1',
  `prod_user_id` bigint(20) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`prod_id`),
  KEY `prod_coll_id` (`prod_coll_id`),
  KEY `prod_user_id` (`prod_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--
-- Creation: Feb 03, 2016 at 11:48 AM
--

DROP TABLE IF EXISTS `tbl_users`;
CREATE TABLE IF NOT EXISTS `tbl_users` (
  `usr_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `usr_fname` varchar(250) NOT NULL,
  `usr_mname` varchar(250) NOT NULL,
  `usr_lname` varchar(250) NOT NULL,
  `usr_gender` varchar(250) NOT NULL,
  `usr_mail` varchar(250) NOT NULL,
  `usr_name` varchar(250) NOT NULL,
  `usr_pwd` varchar(250) NOT NULL,
  `usr_addr` varchar(250) NOT NULL,
  `usr_status` tinyint(4) NOT NULL DEFAULT '1',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`usr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_collections`
--
ALTER TABLE `tbl_collections`
  ADD CONSTRAINT `fk_collection_users` FOREIGN KEY (`coll_user_id`) REFERENCES `tbl_users` (`usr_id`);

--
-- Constraints for table `tbl_orders`
--
ALTER TABLE `tbl_orders`
  ADD CONSTRAINT `fk_order_users` FOREIGN KEY (`ord_usr_id`) REFERENCES `tbl_users` (`usr_id`);

--
-- Constraints for table `tbl_order_details`
--
ALTER TABLE `tbl_order_details`
  ADD CONSTRAINT `fk_order_order` FOREIGN KEY (`ordet_ord_id`) REFERENCES `tbl_orders` (`ord_id`),
  ADD CONSTRAINT `fk_order_collections` FOREIGN KEY (`ordet_coll_id`) REFERENCES `tbl_collections` (`coll_id`),
  ADD CONSTRAINT `fk_order_parts` FOREIGN KEY (`ordet_part_id`) REFERENCES `tbl_parts` (`prt_id`),
  ADD CONSTRAINT `fk_order_product` FOREIGN KEY (`ordet_prod_id`) REFERENCES `tbl_products` (`prod_id`);

--
-- Constraints for table `tbl_parts`
--
ALTER TABLE `tbl_parts`
  ADD CONSTRAINT `fk_part_users` FOREIGN KEY (`prt_user_id`) REFERENCES `tbl_users` (`usr_id`),
  ADD CONSTRAINT `fk_part_collection` FOREIGN KEY (`prt_coll_id`) REFERENCES `tbl_collections` (`coll_id`),
  ADD CONSTRAINT `fk_part_product` FOREIGN KEY (`prt_prod_id`) REFERENCES `tbl_products` (`prod_id`);

--
-- Constraints for table `tbl_products`
--
ALTER TABLE `tbl_products`
  ADD CONSTRAINT `fk_prod_users` FOREIGN KEY (`prod_user_id`) REFERENCES `tbl_users` (`usr_id`),
  ADD CONSTRAINT `fk_prod_collections` FOREIGN KEY (`prod_coll_id`) REFERENCES `tbl_collections` (`coll_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
