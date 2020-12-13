-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 31, 2020 at 02:59 AM
-- Server version: 10.3.24-MariaDB-log-cll-lve
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kristyni_zianzup`
--

-- --------------------------------------------------------

--
-- Table structure for table `addons`
--

CREATE TABLE `addons` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf32_unicode_ci DEFAULT NULL,
  `unique_identifier` varchar(255) COLLATE utf32_unicode_ci DEFAULT NULL,
  `version` varchar(255) COLLATE utf32_unicode_ci DEFAULT NULL,
  `activated` int(1) NOT NULL DEFAULT 1,
  `image` varchar(1000) COLLATE utf32_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Dumping data for table `addons`
--

INSERT INTO `addons` (`id`, `name`, `unique_identifier`, `version`, `activated`, `image`, `created_at`, `updated_at`) VALUES
(1, 'affiliate', 'affiliate_system', '1.2', 1, 'affiliate_banner.jpg', '2020-09-01 16:32:33', '2020-09-01 16:32:33'),
(2, 'club_point', 'club_point', '1.0', 1, 'club_points.png', '2020-09-01 16:32:42', '2020-09-01 16:32:42'),
(3, 'Offline Payment', 'offline_payment', '1.1', 1, 'offline_banner.jpg', '2020-09-01 16:32:50', '2020-09-01 16:32:50'),
(4, 'Point of Sale', 'pos_system', '1.1', 1, 'pos_banner.jpg', '2020-09-01 16:35:05', '2020-09-01 16:35:05'),
(5, 'Paytm', 'paytm', '1.0', 1, 'paytm.png', '2020-09-01 16:35:40', '2020-09-01 16:35:40'),
(6, 'refund', 'refund_request', '1.0', 1, 'refund_request.png', '2020-09-01 16:35:55', '2020-09-01 16:35:55'),
(7, 'Seller Subscription System', 'seller_subscription', '1.0', 1, 'seller_subscription.jpg', '2020-09-01 16:36:03', '2020-09-01 16:36:03'),
(8, 'OTP', 'otp_system', '1.2', 1, 'otp_system.jpg', '2020-09-01 16:37:03', '2020-09-01 16:37:03');

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postal_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `set_default` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `user_id`, `address`, `country`, `city`, `postal_code`, `phone`, `set_default`, `created_at`, `updated_at`) VALUES
(1, 12, '334/2, West Shewrapara, Mirpur', 'Bangladesh', 'Dhaka', '1216', '01771166522', 0, '2020-09-06 17:05:23', '2020-09-06 17:05:23');

-- --------------------------------------------------------

--
-- Table structure for table `affiliate_configs`
--

CREATE TABLE `affiliate_configs` (
  `id` int(11) NOT NULL,
  `type` varchar(1000) COLLATE utf32_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf32_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Dumping data for table `affiliate_configs`
--

INSERT INTO `affiliate_configs` (`id`, `type`, `value`, `created_at`, `updated_at`) VALUES
(1, 'verification_form', '[{\"type\":\"text\",\"label\":\"Your name\"},{\"type\":\"text\",\"label\":\"Email\"},{\"type\":\"text\",\"label\":\"Full Address\"},{\"type\":\"text\",\"label\":\"Phone Number\"},{\"type\":\"text\",\"label\":\"How will you affiliate?\"}]', '2020-03-09 09:56:21', '2020-03-09 04:30:59');

-- --------------------------------------------------------

--
-- Table structure for table `affiliate_options`
--

CREATE TABLE `affiliate_options` (
  `id` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf32_unicode_ci DEFAULT NULL,
  `details` longtext COLLATE utf32_unicode_ci DEFAULT NULL,
  `percentage` double NOT NULL DEFAULT 0,
  `status` int(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Dumping data for table `affiliate_options`
--

INSERT INTO `affiliate_options` (`id`, `type`, `details`, `percentage`, `status`, `created_at`, `updated_at`) VALUES
(2, 'user_registration_first_purchase', NULL, 20, 1, '2020-03-03 05:08:37', '2020-03-05 03:56:30'),
(3, 'product_sharing', NULL, 20, 0, '2020-03-08 01:55:03', '2020-03-10 02:12:32'),
(4, 'category_wise_affiliate', NULL, 0, 0, '2020-03-08 01:55:03', '2020-03-10 02:12:32');

-- --------------------------------------------------------

--
-- Table structure for table `affiliate_payments`
--

CREATE TABLE `affiliate_payments` (
  `id` int(11) NOT NULL,
  `affiliate_user_id` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `payment_method` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payment_details` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `affiliate_payments`
--

INSERT INTO `affiliate_payments` (`id`, `affiliate_user_id`, `amount`, `payment_method`, `payment_details`, `created_at`, `updated_at`) VALUES
(2, 1, 20.00, 'Paypal', NULL, '2020-03-10 02:04:30', '2020-03-10 02:04:30');

-- --------------------------------------------------------

--
-- Table structure for table `affiliate_users`
--

CREATE TABLE `affiliate_users` (
  `id` int(11) NOT NULL,
  `paypal_email` varchar(255) COLLATE utf32_unicode_ci DEFAULT NULL,
  `bank_information` text COLLATE utf32_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `informations` text COLLATE utf32_unicode_ci DEFAULT NULL,
  `balance` double(10,2) NOT NULL DEFAULT 0.00,
  `status` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Dumping data for table `affiliate_users`
--

INSERT INTO `affiliate_users` (`id`, `paypal_email`, `bank_information`, `user_id`, `informations`, `balance`, `status`, `created_at`, `updated_at`) VALUES
(1, 'demo@gmail.com', '123456', 8, '[{\"type\":\"text\",\"label\":\"Your name\",\"value\":\"Nostrum dicta sint l\"},{\"type\":\"text\",\"label\":\"Email\",\"value\":\"Aut perferendis null\"},{\"type\":\"text\",\"label\":\"Full Address\",\"value\":\"Voluptatem Sit dolo\"},{\"type\":\"text\",\"label\":\"Phone Number\",\"value\":\"Ut ad beatae occaeca\"},{\"type\":\"text\",\"label\":\"How will you affiliate?\",\"value\":\"Porro sint soluta u\"}]', 30.00, 1, '2020-03-09 05:35:07', '2020-03-10 02:04:30');

-- --------------------------------------------------------

--
-- Table structure for table `app_settings`
--

CREATE TABLE `app_settings` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `currency_format` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instagram` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `youtube` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `google_plus` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `app_settings`
--

INSERT INTO `app_settings` (`id`, `name`, `logo`, `currency_id`, `currency_format`, `facebook`, `twitter`, `instagram`, `youtube`, `google_plus`, `created_at`, `updated_at`) VALUES
(1, 'Active eCommerce', 'uploads/logo/matggar.png', 1, 'symbol', 'https://facebook.com', 'https://twitter.com', 'https://instagram.com', 'https://youtube.com', 'https://google.com', '2019-08-04 16:39:15', '2019-08-04 16:39:18');

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf32_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Size', '2020-02-24 05:55:07', '2020-02-24 05:55:07'),
(2, 'Fabric', '2020-02-24 05:55:13', '2020-02-24 05:55:13');

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` int(11) NOT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 1,
  `published` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `photo`, `url`, `position`, `published`, `created_at`, `updated_at`) VALUES
(4, 'uploads/banners/banner.jpg', '#', 1, 1, '2019-03-12 05:58:23', '2019-06-11 04:56:50'),
(5, 'uploads/banners/banner.jpg', '#', 1, 1, '2019-03-12 05:58:41', '2019-03-12 05:58:57'),
(6, 'uploads/banners/banner.jpg', '#', 2, 1, '2019-03-12 05:58:52', '2019-03-12 05:58:57'),
(7, 'uploads/banners/banner.jpg', '#', 2, 1, '2019-05-26 05:16:38', '2019-05-26 05:17:34'),
(8, 'uploads/banners/banner.jpg', '#', 2, 1, '2019-06-11 05:00:06', '2019-06-11 05:00:27'),
(9, 'uploads/banners/banner.jpg', '#', 1, 1, '2019-06-11 05:00:15', '2019-06-11 05:00:29'),
(10, 'uploads/banners/banner.jpg', '#', 1, 0, '2019-06-11 05:00:24', '2019-06-11 05:01:56');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `logo` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `top` int(1) NOT NULL DEFAULT 0,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `logo`, `top`, `slug`, `meta_title`, `meta_description`, `created_at`, `updated_at`) VALUES
(5, 'Shwapno', 'uploads/brands/RHT1yl0vvubO5pSrvOQu5Vi7tppUkfmRf8O1FhC4.webp', 1, 'Shwapno-JmTIL', 'Shwapno', 'Shwapno', '2020-06-06 04:07:48', '2020-06-09 19:02:39'),
(6, 'Nokia', 'uploads/brands/hofdqIIB6NEPlmOsTzvw78ZaMcqhAWf15nX1G9mD.png', 1, 'Nokia-1hexO', 'Nokia', 'Nokia', '2020-06-12 05:06:26', '2020-06-12 05:07:53'),
(7, 'Symphone', 'uploads/brands/PYbWCCbM5JdL90GFJPr3NeWFCzjuLLrioDX0cCrq.png', 1, 'Symphone-voTkO', 'Symphone', 'Symphone', '2020-06-12 05:09:58', '2020-06-12 05:13:32'),
(8, 'Samgsung', 'uploads/brands/EpAnt6c5S4VTJoDh2n4MszWioTpxebCnYsOlrivL.png', 1, 'Samgsung-1ozO5', 'Samgsung', 'Samgsung', '2020-06-12 05:11:41', '2020-06-12 05:13:32'),
(9, 'Walton', 'uploads/brands/syQoQGwFEVzL4TF3mDHRSF1NospFTid0YrKLr226.png', 1, 'Walton-8aNzx', 'Walton', 'Walton', '2020-06-12 05:13:15', '2020-06-12 05:13:32'),
(10, 'Canon', 'uploads/brands/5lK4Anf2lwyXfBx24q6u2wPX1B50GiC8RtB8ZpEe.png', 1, 'Canon-pz4Mf', 'Canon', 'Canon', '2020-06-12 06:21:23', '2020-06-12 06:45:24'),
(11, 'Apple', 'uploads/brands/HUWOpPPGSthXhOQfoQDKdZgBHyaJ3fWU07ahVaWV.jpeg', 1, 'Apple-BCEWC', 'Apple', 'Apple', '2020-06-12 06:45:03', '2020-06-12 06:45:24'),
(12, 'Asus', 'uploads/brands/P90Bfkxx9UNOmWAZWPExqRESNZJQ051iPV3zA3uo.jpeg', 1, 'Asus-sHLRE', 'Asus', 'Asus', '2020-06-12 06:59:31', '2020-06-12 07:03:54'),
(13, 'Toyota', 'uploads/brands/nuNiNeemFoSNr7KP3STa08WTUntYLNq0vsxKwmi5.png', 1, 'Toyota-ayoVR', 'Toyota', 'Toyota', '2020-06-19 04:22:45', '2020-06-19 04:23:07'),
(14, 'Xiaomi', 'uploads/brands/ktEaeWVEmkskyi46slGgog1hc7e0BZLoG0Y2P3Rq.png', 1, 'Xiaomi-ZBzD0', 'Xiaomi', 'Xiaomi', '2020-06-19 04:25:01', '2020-06-19 04:25:21'),
(15, 'Incepta', 'uploads/brands/Ag7ef1yIaoX2Rr4yJuKZ69oPCclFNPxb81l3Phpm.jpeg', 0, 'Incepta-YzmlE', 'Incepta', 'Incepta', '2020-07-02 08:26:51', '2020-07-02 08:26:51');

-- --------------------------------------------------------

--
-- Table structure for table `business_settings`
--

CREATE TABLE `business_settings` (
  `id` int(11) NOT NULL,
  `type` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `business_settings`
--

INSERT INTO `business_settings` (`id`, `type`, `value`, `created_at`, `updated_at`) VALUES
(1, 'home_default_currency', '27', '2018-10-16 01:35:52', '2020-09-01 15:44:28'),
(2, 'system_default_currency', '27', '2018-10-16 01:36:58', '2020-09-01 15:44:28'),
(3, 'currency_format', '1', '2018-10-17 03:01:59', '2018-10-17 03:01:59'),
(4, 'symbol_format', '1', '2018-10-17 03:01:59', '2019-01-20 02:10:55'),
(5, 'no_of_decimals', '3', '2018-10-17 03:01:59', '2020-03-04 00:57:16'),
(6, 'product_activation', '1', '2018-10-28 01:38:37', '2019-02-04 01:11:41'),
(7, 'vendor_system_activation', '1', '2018-10-28 07:44:16', '2019-02-04 01:11:38'),
(8, 'show_vendors', '1', '2018-10-28 07:44:47', '2019-02-04 01:11:13'),
(9, 'paypal_payment', '0', '2018-10-28 07:45:16', '2019-01-31 05:09:10'),
(10, 'stripe_payment', '0', '2018-10-28 07:45:47', '2018-11-14 01:51:51'),
(11, 'cash_payment', '1', '2018-10-28 07:46:05', '2019-01-24 03:40:18'),
(12, 'payumoney_payment', '0', '2018-10-28 07:46:27', '2019-03-05 05:41:36'),
(13, 'best_selling', '1', '2018-12-24 08:13:44', '2019-02-14 05:29:13'),
(14, 'paypal_sandbox', '0', '2019-01-16 12:44:18', '2019-01-16 12:44:18'),
(15, 'sslcommerz_sandbox', '1', '2019-01-16 12:44:18', '2019-03-14 00:07:26'),
(16, 'sslcommerz_payment', '0', '2019-01-24 09:39:07', '2019-01-29 06:13:46'),
(17, 'vendor_commission', '20', '2019-01-31 06:18:04', '2019-04-13 06:49:26'),
(18, 'verification_form', '[{\"type\":\"text\",\"label\":\"Your name\"},{\"type\":\"text\",\"label\":\"Shop name\"},{\"type\":\"text\",\"label\":\"Email\"},{\"type\":\"text\",\"label\":\"License No\"},{\"type\":\"text\",\"label\":\"Full Address\"},{\"type\":\"text\",\"label\":\"Phone Number\"},{\"type\":\"file\",\"label\":\"Tax Papers\"}]', '2019-02-03 11:36:58', '2019-02-16 06:14:42'),
(19, 'google_analytics', '0', '2019-02-06 12:22:35', '2019-02-06 12:22:35'),
(20, 'facebook_login', '1', '2019-02-07 12:51:59', '2020-09-02 03:24:51'),
(21, 'google_login', '1', '2019-02-07 12:52:10', '2020-09-02 03:24:51'),
(22, 'twitter_login', '1', '2019-02-07 12:52:20', '2020-09-02 03:24:55'),
(23, 'payumoney_payment', '1', '2019-03-05 11:38:17', '2019-03-05 11:38:17'),
(24, 'payumoney_sandbox', '1', '2019-03-05 11:38:17', '2019-03-05 05:39:18'),
(36, 'facebook_chat', '1', '2019-04-15 11:45:04', '2020-09-05 09:21:54'),
(37, 'email_verification', '1', '2019-04-30 07:30:07', '2020-09-02 03:24:42'),
(38, 'wallet_system', '1', '2019-05-19 08:05:44', '2020-09-02 03:24:32'),
(39, 'coupon_system', '1', '2019-06-11 09:46:18', '2020-09-02 03:24:37'),
(40, 'current_version', '3.2', '2019-06-11 09:46:18', '2019-06-11 09:46:18'),
(41, 'instamojo_payment', '0', '2019-07-06 09:58:03', '2019-07-06 09:58:03'),
(42, 'instamojo_sandbox', '1', '2019-07-06 09:58:43', '2019-07-06 09:58:43'),
(43, 'razorpay', '0', '2019-07-06 09:58:43', '2019-07-06 09:58:43'),
(44, 'paystack', '0', '2019-07-21 13:00:38', '2019-07-21 13:00:38'),
(45, 'pickup_point', '1', '2019-10-17 11:50:39', '2020-09-02 03:24:39'),
(46, 'maintenance_mode', '0', '2019-10-17 11:51:04', '2019-10-17 11:51:04'),
(47, 'voguepay', '0', '2019-10-17 11:51:24', '2019-10-17 11:51:24'),
(48, 'voguepay_sandbox', '0', '2019-10-17 11:51:38', '2019-10-17 11:51:38'),
(50, 'category_wise_commission', '1', '2020-01-21 07:22:47', '2020-09-02 03:24:41'),
(51, 'conversation_system', '1', '2020-01-21 07:23:21', '2020-01-21 07:23:21'),
(52, 'guest_checkout_active', '1', '2020-01-22 07:36:38', '2020-01-22 07:36:38'),
(53, 'facebook_pixel', '1', '2020-01-22 11:43:58', '2020-09-05 09:24:28'),
(55, 'classified_product', '0', '2020-05-13 13:01:05', '2020-05-13 13:01:05'),
(56, 'pos_activation_for_seller', '1', '2020-06-11 09:45:02', '2020-06-11 09:45:02'),
(57, 'shipping_type', 'product_wise_shipping', '2020-07-01 13:49:56', '2020-07-01 13:49:56'),
(58, 'flat_rate_shipping_cost', '0', '2020-07-01 13:49:56', '2020-07-01 13:49:56'),
(59, 'shipping_cost_admin', '0', '2020-07-01 13:49:56', '2020-07-01 13:49:56'),
(60, 'payhere_sandbox', '0', '2020-07-30 18:23:53', '2020-07-30 18:23:53'),
(61, 'payhere', '0', '2020-07-30 18:23:53', '2020-07-30 18:23:53'),
(62, 'google_recaptcha', '0', '2020-08-17 07:13:37', '2020-08-17 07:13:37'),
(64, 'club_point_convert_rate', '10', '2019-03-12 05:58:23', '2019-03-12 05:58:23'),
(65, 'refund_request_time', '3', '2019-03-11 23:58:23', '2019-03-11 23:58:23');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `variation` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` double(8,2) DEFAULT NULL,
  `tax` double(8,2) DEFAULT NULL,
  `shipping_cost` double(8,2) DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `commision_rate` double(8,2) NOT NULL DEFAULT 0.00,
  `banner` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `featured` int(1) NOT NULL DEFAULT 0,
  `top` int(1) NOT NULL DEFAULT 0,
  `digital` int(1) NOT NULL DEFAULT 0,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `commision_rate`, `banner`, `icon`, `featured`, `top`, `digital`, `slug`, `meta_title`, `meta_description`, `created_at`, `updated_at`) VALUES
(3, 'Demo category 3', 0.00, 'uploads/categories/banner/category-banner.jpg', 'uploads/categories/icon/rKAPw5rNlS84JtD9ZQqn366jwE11qyJqbzAe5yaA.png', 1, 1, 0, 'Demo-category-3', 'Demo category 3', NULL, '2019-08-06 12:06:58', '2019-08-06 06:06:58'),
(5, 'Electric & parts', 0.00, 'uploads/categories/banner/zL7J22P0jmtCgKz1wo4f8mIBY2rENWI7YMb27Grf.png', 'uploads/categories/icon/mHb7pzqNiwsdiZDpMLxsgP026Vaj0otNehsb6lSj.png', 1, 1, 0, 'Electric--parts-TVA66', 'Electric parts', 'Electric & parts', '2020-06-12 01:07:53', '2020-06-12 05:07:53'),
(6, 'Glasses', 0.00, 'uploads/categories/banner/nZWgGpFYigGvAt5TqoPFHkRWSgSY9QqNMXj6vvoH.png', 'uploads/categories/icon/7KBxceC0Um765qiV1mYnWecgdKacrIt6tmDKjF9W.png', 1, 1, 0, 'Glasses-jNjKq', 'Glasses', 'Glasses', '2020-06-12 01:07:53', '2020-06-12 05:07:53'),
(7, 'Vehicles & Accessories', 0.00, 'uploads/categories/banner/pUku3IeJXw9FFkeZDKuUN6jjslFOs0ToHRY9qmvU.png', 'uploads/categories/icon/8oXrOooYXLrwAx6ccJlkW9oOdJlax1sV1rTbOwPs.png', 1, 1, 0, 'Vehicles-Accessories-GD6h6', 'Vehicles Accessories', 'Vehicles Accessories', '2020-07-05 11:14:48', '2020-07-05 15:14:48'),
(8, 'Sports And Entertainment', 0.00, 'uploads/categories/banner/M2wVdjMxOnyvFjrahTv8aeUbod8OhcDelemzzQrA.png', 'uploads/categories/icon/GO8qGQX48zFYgcy8bgSR1GArKknfZRbfJUplWl3V.png', 1, 1, 0, 'Sports-And-Entertainment-9y0za', 'Sports-Entertainment', 'Sports-Entertainment', '2020-06-12 01:07:53', '2020-06-12 05:07:53'),
(9, 'Machinery', 0.00, 'uploads/categories/banner/I79EE9Xvb4XYXIKNeLUMQ7xeuYXEueK9m5ZPBlXO.png', 'uploads/categories/icon/r9QWXbLWgB1cGpteTBh2HtsUoHfXbF65EQYzkjXd.png', 1, 1, 0, 'Machinery-QYxzz', 'Machinery', 'Machinery', '2020-06-12 01:07:53', '2020-06-12 05:07:53'),
(10, 'Home And Garden', 0.00, 'uploads/categories/banner/RW4YOGDwIeuXsitoV7ChvG071QLVHGgP5nNxfXEN.png', 'uploads/categories/icon/9UvcFy7NgbuwkNPu70FE05xfrjf3MjAwPcForsn0.png', 1, 1, 0, 'Home-And-Garden-30q7l', 'Home-Garden', 'Home-Garden', '2020-06-12 01:07:53', '2020-06-12 05:07:53'),
(11, 'Beauty And Bodycare', 0.00, 'uploads/categories/banner/UotRnPj0dpvyMlqXbWsaoUvFn4opdGOzOOPWb1b9.png', 'uploads/categories/icon/BstSyMincq6LyNIWmtZ8dS0jwyMhtqfC9qTRQMLB.png', 1, 1, 0, 'Beauty-And-Personal-Care-8IlZn', 'Beauty-Personal-Care', 'Beauty-Personal-Care', '2020-06-12 00:55:25', '2020-06-12 04:55:25'),
(12, 'Bag and luggage', 0.00, 'uploads/categories/banner/E0J7UsaUjlRSZV16jNbV3d0x73cn9teLNfByO4av.jpeg', 'uploads/categories/icon/0dtLeGO3TDQM0WQ6LRLNfuahXWu56sjnzzfbfsKH.png', 1, 0, 0, 'Bag-and-luggage-X4uRH', 'Bag and luggage', 'Bag and luggage', '2020-06-12 01:07:53', '2020-06-12 05:07:53'),
(16, 'Decoration Material', 0.00, 'uploads/categories/banner/JZFEvuLJjz2gGylDsFd1WbLeZFnZkiETNWixl4Ce.jpeg', 'uploads/categories/icon/HGFcPYmCBfXXIlhVGzaQF6wlezLpr86YebsP8nOM.png', 0, 0, 0, 'Decoration-Material-Gm7vJ', NULL, 'Decoration Material', '2020-06-12 01:08:30', '2020-06-12 05:08:30'),
(17, 'Digital Goods', 0.00, 'uploads/categories/banner/fZugYVemRWLw3svsQf1KWLrlJlMmEnJVnrCSLAdU.jpeg', 'uploads/categories/icon/45rg8L81bDZ5oCK5ZQYDHYJEEZO9sHB8zuVaZ4Dm.png', 0, 0, 0, 'Digital-Goods-4X5yU', NULL, 'Digital Goods', '2020-06-12 01:02:28', '2020-06-12 05:02:28'),
(18, 'Mobile, Computer Electronics and accessories', 0.00, 'uploads/categories/banner/rhZld4tMRepdpnPlTJpQ0FuXPI5UfaJG9l3a0D2k.png', 'uploads/categories/icon/zvO3UdKv7z7EY1w2kU3i2SIkzbnrJ1R0VhAwXpBi.png', 0, 0, 0, 'Electronics-and-accessories-dlfYc', NULL, 'Electronics and accessories', '2020-06-12 01:02:47', '2020-06-12 05:02:47'),
(19, 'Events & Media', 0.00, 'uploads/categories/banner/SE06va04KB84iSwNxIJ3s6ahduXzY0tbd6Eh4exM.png', NULL, 0, 0, 0, 'Events--Media-nkZFL', NULL, 'Events & Media', '2020-06-08 20:37:54', '2020-06-08 20:37:54'),
(20, 'Furniture', 0.00, 'uploads/categories/banner/VnQIlEmbVMoUKsTZBPIwiwP3Mc4RnV5IylNrgavt.png', NULL, 0, 0, 0, 'Furniture-8Esct', NULL, 'Furniture', '2020-06-08 20:39:13', '2020-06-08 20:39:13'),
(21, 'Apparel, Fashion & Accessories for Kids', 0.00, 'uploads/categories/banner/RG6LTJ1zPM1sNYV9MUGcts9Fi7EjW1cOqWPLQL5F.png', NULL, 0, 0, 0, 'Apparel-Fashion--Accessories-E3Cv4', NULL, 'Apparel, Fashion & Accessories for Kids', '2020-06-12 04:01:54', '2020-06-12 08:01:54'),
(22, 'Grocery', 0.00, 'uploads/categories/banner/9ip8hyIdz0pt0Jgy24tg7R4U0S86yQEJoStkhyER.png', NULL, 0, 0, 0, 'Grocery-na64d', NULL, 'Grocery', '2020-06-09 09:46:27', '2020-06-09 09:46:27'),
(23, 'Handmade Products', 0.00, 'uploads/categories/banner/kJM2kih0EH8DdAkmIYmMzsul0HqcxWwLWsa7hkgr.png', NULL, 0, 0, 0, 'Handmade-Products-7fk1D', NULL, 'Handmade Products', '2020-06-09 09:46:58', '2020-06-09 09:46:58'),
(24, 'Agriculture & Instruments', 0.00, 'uploads/categories/banner/0oOIm4DgcqqbHVrXYA1U9Cx3HvpV3Kyjb3ikDcbS.png', NULL, 0, 1, 0, 'Agriculture--Instruments-Jv0nd', NULL, 'Agriculture & Instruments', '2020-06-18 23:28:06', '2020-06-19 03:28:06'),
(25, 'Health Care & Pharmacy', 0.00, 'uploads/categories/banner/ZMZm3xnGu9lWgsCzwUjEZwBQjmi5DGPw7WduxpBC.png', NULL, 0, 0, 0, 'Health-Care--Pharmacy-Yseuf', NULL, 'Health Care & Pharmacy', '2020-06-09 09:48:23', '2020-06-09 09:48:23'),
(26, 'Home & Appliance', 0.00, 'uploads/categories/banner/odg29fq82GlcGLdR1CMf9t8m0WKy3Z9txV9IAaYX.png', NULL, 0, 0, 0, 'Home--Appliance-3q4DT', NULL, 'Home & Appliance', '2020-06-09 09:49:21', '2020-06-09 09:49:21'),
(28, 'Jewellery', 0.00, 'uploads/categories/banner/QoVCzPWFBl4UHFJWQ1LKoWKZPqZfhdhSX0yOXbwF.png', NULL, 0, 1, 0, 'Jewellery-rp7pn', NULL, 'Jewellery', '2020-06-18 23:28:06', '2020-06-19 03:28:06'),
(29, 'Kitchen & Dining', 0.00, 'uploads/categories/banner/NVQ2moFsdvgTiHRGKbU2bTjDEEc8W9fndFsOwHa4.png', NULL, 0, 0, 0, 'Kitchen--Dining-pDqhY', NULL, 'Kitchen & Dining', '2020-06-09 09:57:43', '2020-06-09 09:57:43'),
(30, 'Leather products', 0.00, 'uploads/categories/banner/RqqkYTh8dzUWx6IvrRo3xA1OhzMq8gjEBp9r2vV9.png', NULL, 0, 1, 0, 'Leather-products-abuBn', NULL, 'Leather products', '2020-06-18 23:28:06', '2020-06-19 03:28:06'),
(31, 'LP Gas', 0.00, 'uploads/categories/banner/2KHGSzMg7Tc6HYVAdS0hMukFfkAgMc2uxggeyG3N.png', NULL, 0, 0, 0, 'LP-Gas-zMZET', NULL, 'LP Gas', '2020-06-09 10:00:34', '2020-06-09 10:00:34'),
(32, 'Machineries', 0.00, 'uploads/categories/banner/BWCF3QyfDeUAH3k52x8jsJh56U9G7fIcPkEPL6l5.png', NULL, 0, 0, 0, 'Machineries-kgdmj', NULL, 'Machineries', '2020-06-09 10:02:26', '2020-06-09 10:02:26'),
(33, 'Kids & Mom', 0.00, 'uploads/categories/banner/MJTtuajx0lPfvhnNxsdUogrTelJjxSu3LtGFgLt1.png', NULL, 0, 0, 0, 'Kids--Mom-48cPx', NULL, 'Kids & Mom', '2020-06-09 10:03:27', '2020-06-09 10:03:27'),
(34, 'Paints', 0.00, 'uploads/categories/banner/KkrHCPhOBKF8h83UpJ65GCR7dDL1ggA4SDHL4JMa.png', NULL, 0, 0, 0, 'Paints-CiEm7', NULL, 'Paints', '2020-06-09 10:04:10', '2020-06-09 10:04:10'),
(35, 'Dyes & Chemicals', 0.00, 'uploads/categories/banner/PAOjArBjSyZgWAOqSOLP3E8YAjAoF4q4QNREzo3R.png', NULL, 0, 0, 0, 'Dyes--Chemicals-oOqxm', NULL, 'Dyes & Chemicals', '2020-06-09 10:05:50', '2020-06-09 10:05:50'),
(36, 'Pet & Poultry', 0.00, 'uploads/categories/banner/Aub51gmQ7fhxI2ex5qIT62nC6zCaGxNryqMEMZUe.png', NULL, 0, 0, 0, 'Pet--Poultry-4KVB2', NULL, 'Pet & Poultry', '2020-06-09 10:06:26', '2020-06-09 10:06:26'),
(37, 'Plastic products', 0.00, 'uploads/categories/banner/VlUw3Bx5fn9YJuZULE0iwG9d4OZRq9XSmOVvPE4M.png', NULL, 0, 0, 0, 'Plastic-products-s1WjK', NULL, 'Plastic products', '2020-06-09 10:10:05', '2020-06-09 10:10:05'),
(38, 'Land & Property', 0.00, 'uploads/categories/banner/6dE7Jgo9CxmbZSDn9nyxd0vzKy7u279iXQSwDSkj.png', NULL, 0, 0, 0, 'Land--Property-qXalW', NULL, 'Land & Property', '2020-06-09 10:10:46', '2020-06-09 10:10:46'),
(39, 'Service', 0.00, 'uploads/categories/banner/cJKHSTAY3xG25WGJaEQQDjDAj5bpzN1Z96vTyUDP.png', NULL, 0, 0, 0, 'Service-rGoCg', NULL, 'Service', '2020-06-09 10:12:22', '2020-06-09 10:12:22'),
(40, 'Footwear', 0.00, 'uploads/categories/banner/Q0w7AFtNJpkPl55vFtRko1pbzMrC6ZQoOsRkWHTM.png', NULL, 0, 0, 0, 'Footwear-zh3JL', NULL, 'Footwear', '2020-06-09 10:13:06', '2020-06-09 10:13:06'),
(41, 'Watches', 0.00, 'uploads/categories/banner/ug5goCUhvk71t7cZKsm45tT1NtIGx1nIFJgKtde4.png', NULL, 0, 0, 0, 'Watches-g814Y', NULL, 'Watches', '2020-06-09 06:19:04', '2020-06-09 10:19:04'),
(42, 'Medical & Health Care Instruments', 0.00, 'uploads/categories/banner/BXhuYlCObgeWISPYInZbF0mLL9vhOw0DsYCWp65t.png', NULL, 0, 0, 0, 'Medical--Health-Care-Instruments-z6Crd', NULL, 'Medical & Health Care Instruments', '2020-06-09 08:21:35', '2020-06-09 12:21:35'),
(43, 'Books & Stationery', 0.00, 'uploads/categories/banner/s28ZdpTDTZflT6XlS0UQs5dUjTnatbx9qgEXgjf1.png', NULL, 0, 0, 0, 'Books--Stationery-lATaz', NULL, 'Books & Stationery', '2020-06-10 03:14:31', '2020-06-10 03:14:31'),
(44, 'Construction Materials', 0.00, 'uploads/categories/banner/eyR7xveUHn5DlPXHQWrLWWCvzeFkjTD7hj9eVDUL.png', NULL, 0, 0, 0, 'Construction-Materials-1HcRD', NULL, 'Construction Materials', '2020-06-11 07:15:27', '2020-06-11 07:15:27'),
(45, 'Apparel, Fashion & Accessories for Women', 0.00, 'uploads/categories/banner/aj5LtaUTMcZgle9TIbMVKhtZYC183xB0TD6liHBk.png', NULL, 0, 0, 0, 'Apparel-Fashion--Accessories-Women-ZjiLR', NULL, 'Apparel, Fashion & Accessories Women', '2020-06-12 04:03:14', '2020-06-12 08:03:14'),
(46, 'Apparel, Fashion & Accessories for Men', 0.00, 'uploads/categories/banner/1WArIvCL6EfZNbp8gFzERUmNgvPgKTUDCEeesfmY.png', NULL, 0, 0, 0, 'Apparel-Fashion--Accessories-for-Men-fLzEx', NULL, 'Apparel, Fashion & Accessories for Men', '2020-06-12 08:02:52', '2020-06-12 08:02:52'),
(47, 'Fish, Meat & Sea Items', 0.00, 'uploads/categories/banner/UqGrjuwJxtzBU6kUfOtEHKCLVpu8q63Mg5PvmX31.jpeg', 'uploads/categories/icon/tvkAYjcM0PcgFrekcYlG0IoLe1J0ONLXSRzg3ZT9.jpeg', 1, 0, 0, 'Fish-Meat--Sea-Items-ChmRW', 'Fish, Meat & Sea Items', 'Fish, Meat & Sea Items', '2020-07-05 11:15:14', '2020-07-05 15:15:14'),
(48, 'Hotel Booking', 0.00, 'uploads/categories/banner/SLWN3MvU8inPuFrl30nL6lFXWhe2Z36CzQCSelqh.jpeg', 'uploads/categories/icon/Ptf43XTuP7Bv3YDyTy4ffy26JW04G4kTbr9kJscu.jpeg', 1, 0, 0, 'Hotel-Booking-83ULe', 'Hotel Booking', 'Hotel Booking', '2020-07-05 11:15:11', '2020-07-05 15:15:11');

-- --------------------------------------------------------

--
-- Table structure for table `club_points`
--

CREATE TABLE `club_points` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `points` double(18,2) NOT NULL,
  `convert_status` int(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `club_point_details`
--

CREATE TABLE `club_point_details` (
  `id` int(11) NOT NULL,
  `club_point_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_qty` int(11) NOT NULL,
  `point` double(8,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`id`, `name`, `code`, `created_at`, `updated_at`) VALUES
(1, 'IndianRed', '#CD5C5C', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(2, 'LightCoral', '#F08080', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(3, 'Salmon', '#FA8072', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(4, 'DarkSalmon', '#E9967A', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(5, 'LightSalmon', '#FFA07A', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(6, 'Crimson', '#DC143C', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(7, 'Red', '#FF0000', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(8, 'FireBrick', '#B22222', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(9, 'DarkRed', '#8B0000', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(10, 'Pink', '#FFC0CB', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(11, 'LightPink', '#FFB6C1', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(12, 'HotPink', '#FF69B4', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(13, 'DeepPink', '#FF1493', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(14, 'MediumVioletRed', '#C71585', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(15, 'PaleVioletRed', '#DB7093', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(16, 'LightSalmon', '#FFA07A', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(17, 'Coral', '#FF7F50', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(18, 'Tomato', '#FF6347', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(19, 'OrangeRed', '#FF4500', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(20, 'DarkOrange', '#FF8C00', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(21, 'Orange', '#FFA500', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(22, 'Gold', '#FFD700', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(23, 'Yellow', '#FFFF00', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(24, 'LightYellow', '#FFFFE0', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(25, 'LemonChiffon', '#FFFACD', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(26, 'LightGoldenrodYellow', '#FAFAD2', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(27, 'PapayaWhip', '#FFEFD5', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(28, 'Moccasin', '#FFE4B5', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(29, 'PeachPuff', '#FFDAB9', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(30, 'PaleGoldenrod', '#EEE8AA', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(31, 'Khaki', '#F0E68C', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(32, 'DarkKhaki', '#BDB76B', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(33, 'Lavender', '#E6E6FA', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(34, 'Thistle', '#D8BFD8', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(35, 'Plum', '#DDA0DD', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(36, 'Violet', '#EE82EE', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(37, 'Orchid', '#DA70D6', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(38, 'Fuchsia', '#FF00FF', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(39, 'Magenta', '#FF00FF', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(40, 'MediumOrchid', '#BA55D3', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(41, 'MediumPurple', '#9370DB', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(42, 'Amethyst', '#9966CC', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(43, 'BlueViolet', '#8A2BE2', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(44, 'DarkViolet', '#9400D3', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(45, 'DarkOrchid', '#9932CC', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(46, 'DarkMagenta', '#8B008B', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(47, 'Purple', '#800080', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(48, 'Indigo', '#4B0082', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(49, 'SlateBlue', '#6A5ACD', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(50, 'DarkSlateBlue', '#483D8B', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(51, 'MediumSlateBlue', '#7B68EE', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(52, 'GreenYellow', '#ADFF2F', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(53, 'Chartreuse', '#7FFF00', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(54, 'LawnGreen', '#7CFC00', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(55, 'Lime', '#00FF00', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(56, 'LimeGreen', '#32CD32', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(57, 'PaleGreen', '#98FB98', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(58, 'LightGreen', '#90EE90', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(59, 'MediumSpringGreen', '#00FA9A', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(60, 'SpringGreen', '#00FF7F', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(61, 'MediumSeaGreen', '#3CB371', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(62, 'SeaGreen', '#2E8B57', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(63, 'ForestGreen', '#228B22', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(64, 'Green', '#008000', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(65, 'DarkGreen', '#006400', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(66, 'YellowGreen', '#9ACD32', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(67, 'OliveDrab', '#6B8E23', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(68, 'Olive', '#808000', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(69, 'DarkOliveGreen', '#556B2F', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(70, 'MediumAquamarine', '#66CDAA', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(71, 'DarkSeaGreen', '#8FBC8F', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(72, 'LightSeaGreen', '#20B2AA', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(73, 'DarkCyan', '#008B8B', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(74, 'Teal', '#008080', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(75, 'Aqua', '#00FFFF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(76, 'Cyan', '#00FFFF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(77, 'LightCyan', '#E0FFFF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(78, 'PaleTurquoise', '#AFEEEE', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(79, 'Aquamarine', '#7FFFD4', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(80, 'Turquoise', '#40E0D0', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(81, 'MediumTurquoise', '#48D1CC', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(82, 'DarkTurquoise', '#00CED1', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(83, 'CadetBlue', '#5F9EA0', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(84, 'SteelBlue', '#4682B4', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(85, 'LightSteelBlue', '#B0C4DE', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(86, 'PowderBlue', '#B0E0E6', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(87, 'LightBlue', '#ADD8E6', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(88, 'SkyBlue', '#87CEEB', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(89, 'LightSkyBlue', '#87CEFA', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(90, 'DeepSkyBlue', '#00BFFF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(91, 'DodgerBlue', '#1E90FF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(92, 'CornflowerBlue', '#6495ED', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(93, 'MediumSlateBlue', '#7B68EE', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(94, 'RoyalBlue', '#4169E1', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(95, 'Blue', '#0000FF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(96, 'MediumBlue', '#0000CD', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(97, 'DarkBlue', '#00008B', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(98, 'Navy', '#000080', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(99, 'MidnightBlue', '#191970', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(100, 'Cornsilk', '#FFF8DC', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(101, 'BlanchedAlmond', '#FFEBCD', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(102, 'Bisque', '#FFE4C4', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(103, 'NavajoWhite', '#FFDEAD', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(104, 'Wheat', '#F5DEB3', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(105, 'BurlyWood', '#DEB887', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(106, 'Tan', '#D2B48C', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(107, 'RosyBrown', '#BC8F8F', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(108, 'SandyBrown', '#F4A460', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(109, 'Goldenrod', '#DAA520', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(110, 'DarkGoldenrod', '#B8860B', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(111, 'Peru', '#CD853F', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(112, 'Chocolate', '#D2691E', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(113, 'SaddleBrown', '#8B4513', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(114, 'Sienna', '#A0522D', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(115, 'Brown', '#A52A2A', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(116, 'Maroon', '#800000', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(117, 'White', '#FFFFFF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(118, 'Snow', '#FFFAFA', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(119, 'Honeydew', '#F0FFF0', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(120, 'MintCream', '#F5FFFA', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(121, 'Azure', '#F0FFFF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(122, 'AliceBlue', '#F0F8FF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(123, 'GhostWhite', '#F8F8FF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(124, 'WhiteSmoke', '#F5F5F5', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(125, 'Seashell', '#FFF5EE', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(126, 'Beige', '#F5F5DC', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(127, 'OldLace', '#FDF5E6', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(128, 'FloralWhite', '#FFFAF0', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(129, 'Ivory', '#FFFFF0', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(130, 'AntiqueWhite', '#FAEBD7', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(131, 'Linen', '#FAF0E6', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(132, 'LavenderBlush', '#FFF0F5', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(133, 'MistyRose', '#FFE4E1', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(134, 'Gainsboro', '#DCDCDC', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(135, 'LightGrey', '#D3D3D3', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(136, 'Silver', '#C0C0C0', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(137, 'DarkGray', '#A9A9A9', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(138, 'Gray', '#808080', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(139, 'DimGray', '#696969', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(140, 'LightSlateGray', '#778899', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(141, 'SlateGray', '#708090', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(142, 'DarkSlateGray', '#2F4F4F', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(143, 'Black', '#000000', '2018-11-05 02:12:30', '2018-11-05 02:12:30');

-- --------------------------------------------------------

--
-- Table structure for table `conversations`
--

CREATE TABLE `conversations` (
  `id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `title` varchar(1000) COLLATE utf32_unicode_ci DEFAULT NULL,
  `sender_viewed` int(1) NOT NULL DEFAULT 1,
  `receiver_viewed` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `code` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `status` int(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `code`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'AF', 'Afghanistan', 1, NULL, NULL),
(2, 'AL', 'Albania', 1, NULL, NULL),
(3, 'DZ', 'Algeria', 1, NULL, NULL),
(4, 'DS', 'American Samoa', 1, NULL, NULL),
(5, 'AD', 'Andorra', 1, NULL, NULL),
(6, 'AO', 'Angola', 1, NULL, NULL),
(7, 'AI', 'Anguilla', 1, NULL, NULL),
(8, 'AQ', 'Antarctica', 1, NULL, NULL),
(9, 'AG', 'Antigua and Barbuda', 1, NULL, NULL),
(10, 'AR', 'Argentina', 1, NULL, NULL),
(11, 'AM', 'Armenia', 1, NULL, NULL),
(12, 'AW', 'Aruba', 1, NULL, NULL),
(13, 'AU', 'Australia', 1, NULL, NULL),
(14, 'AT', 'Austria', 1, NULL, NULL),
(15, 'AZ', 'Azerbaijan', 1, NULL, NULL),
(16, 'BS', 'Bahamas', 1, NULL, NULL),
(17, 'BH', 'Bahrain', 1, NULL, NULL),
(18, 'BD', 'Bangladesh', 1, NULL, NULL),
(19, 'BB', 'Barbados', 1, NULL, NULL),
(20, 'BY', 'Belarus', 1, NULL, NULL),
(21, 'BE', 'Belgium', 1, NULL, NULL),
(22, 'BZ', 'Belize', 1, NULL, NULL),
(23, 'BJ', 'Benin', 1, NULL, NULL),
(24, 'BM', 'Bermuda', 1, NULL, NULL),
(25, 'BT', 'Bhutan', 1, NULL, NULL),
(26, 'BO', 'Bolivia', 1, NULL, NULL),
(27, 'BA', 'Bosnia and Herzegovina', 1, NULL, NULL),
(28, 'BW', 'Botswana', 1, NULL, NULL),
(29, 'BV', 'Bouvet Island', 1, NULL, NULL),
(30, 'BR', 'Brazil', 1, NULL, NULL),
(31, 'IO', 'British Indian Ocean Territory', 1, NULL, NULL),
(32, 'BN', 'Brunei Darussalam', 1, NULL, NULL),
(33, 'BG', 'Bulgaria', 1, NULL, NULL),
(34, 'BF', 'Burkina Faso', 1, NULL, NULL),
(35, 'BI', 'Burundi', 1, NULL, NULL),
(36, 'KH', 'Cambodia', 1, NULL, NULL),
(37, 'CM', 'Cameroon', 1, NULL, NULL),
(38, 'CA', 'Canada', 1, NULL, NULL),
(39, 'CV', 'Cape Verde', 1, NULL, NULL),
(40, 'KY', 'Cayman Islands', 1, NULL, NULL),
(41, 'CF', 'Central African Republic', 1, NULL, NULL),
(42, 'TD', 'Chad', 1, NULL, NULL),
(43, 'CL', 'Chile', 1, NULL, NULL),
(44, 'CN', 'China', 1, NULL, NULL),
(45, 'CX', 'Christmas Island', 1, NULL, NULL),
(46, 'CC', 'Cocos (Keeling) Islands', 1, NULL, NULL),
(47, 'CO', 'Colombia', 1, NULL, NULL),
(48, 'KM', 'Comoros', 1, NULL, NULL),
(49, 'CG', 'Congo', 1, NULL, NULL),
(50, 'CK', 'Cook Islands', 1, NULL, NULL),
(51, 'CR', 'Costa Rica', 1, NULL, NULL),
(52, 'HR', 'Croatia (Hrvatska)', 1, NULL, NULL),
(53, 'CU', 'Cuba', 1, NULL, NULL),
(54, 'CY', 'Cyprus', 1, NULL, NULL),
(55, 'CZ', 'Czech Republic', 1, NULL, NULL),
(56, 'DK', 'Denmark', 1, NULL, NULL),
(57, 'DJ', 'Djibouti', 1, NULL, NULL),
(58, 'DM', 'Dominica', 1, NULL, NULL),
(59, 'DO', 'Dominican Republic', 1, NULL, NULL),
(60, 'TP', 'East Timor', 1, NULL, NULL),
(61, 'EC', 'Ecuador', 1, NULL, NULL),
(62, 'EG', 'Egypt', 1, NULL, NULL),
(63, 'SV', 'El Salvador', 1, NULL, NULL),
(64, 'GQ', 'Equatorial Guinea', 1, NULL, NULL),
(65, 'ER', 'Eritrea', 1, NULL, NULL),
(66, 'EE', 'Estonia', 1, NULL, NULL),
(67, 'ET', 'Ethiopia', 1, NULL, NULL),
(68, 'FK', 'Falkland Islands (Malvinas)', 1, NULL, NULL),
(69, 'FO', 'Faroe Islands', 1, NULL, NULL),
(70, 'FJ', 'Fiji', 1, NULL, NULL),
(71, 'FI', 'Finland', 1, NULL, NULL),
(72, 'FR', 'France', 1, NULL, NULL),
(73, 'FX', 'France, Metropolitan', 1, NULL, NULL),
(74, 'GF', 'French Guiana', 1, NULL, NULL),
(75, 'PF', 'French Polynesia', 1, NULL, NULL),
(76, 'TF', 'French Southern Territories', 1, NULL, NULL),
(77, 'GA', 'Gabon', 1, NULL, NULL),
(78, 'GM', 'Gambia', 1, NULL, NULL),
(79, 'GE', 'Georgia', 1, NULL, NULL),
(80, 'DE', 'Germany', 1, NULL, NULL),
(81, 'GH', 'Ghana', 1, NULL, NULL),
(82, 'GI', 'Gibraltar', 1, NULL, NULL),
(83, 'GK', 'Guernsey', 1, NULL, NULL),
(84, 'GR', 'Greece', 1, NULL, NULL),
(85, 'GL', 'Greenland', 1, NULL, NULL),
(86, 'GD', 'Grenada', 1, NULL, NULL),
(87, 'GP', 'Guadeloupe', 1, NULL, NULL),
(88, 'GU', 'Guam', 1, NULL, NULL),
(89, 'GT', 'Guatemala', 1, NULL, NULL),
(90, 'GN', 'Guinea', 1, NULL, NULL),
(91, 'GW', 'Guinea-Bissau', 1, NULL, NULL),
(92, 'GY', 'Guyana', 1, NULL, NULL),
(93, 'HT', 'Haiti', 1, NULL, NULL),
(94, 'HM', 'Heard and Mc Donald Islands', 1, NULL, NULL),
(95, 'HN', 'Honduras', 1, NULL, NULL),
(96, 'HK', 'Hong Kong', 1, NULL, NULL),
(97, 'HU', 'Hungary', 1, NULL, NULL),
(98, 'IS', 'Iceland', 1, NULL, NULL),
(99, 'IN', 'India', 1, NULL, NULL),
(100, 'IM', 'Isle of Man', 1, NULL, NULL),
(101, 'ID', 'Indonesia', 1, NULL, NULL),
(102, 'IR', 'Iran (Islamic Republic of)', 1, NULL, NULL),
(103, 'IQ', 'Iraq', 1, NULL, NULL),
(104, 'IE', 'Ireland', 1, NULL, NULL),
(105, 'IL', 'Israel', 1, NULL, NULL),
(106, 'IT', 'Italy', 1, NULL, NULL),
(107, 'CI', 'Ivory Coast', 1, NULL, NULL),
(108, 'JE', 'Jersey', 1, NULL, NULL),
(109, 'JM', 'Jamaica', 1, NULL, NULL),
(110, 'JP', 'Japan', 1, NULL, NULL),
(111, 'JO', 'Jordan', 1, NULL, NULL),
(112, 'KZ', 'Kazakhstan', 1, NULL, NULL),
(113, 'KE', 'Kenya', 1, NULL, NULL),
(114, 'KI', 'Kiribati', 1, NULL, NULL),
(115, 'KP', 'Korea, Democratic People\'s Republic of', 1, NULL, NULL),
(116, 'KR', 'Korea, Republic of', 1, NULL, NULL),
(117, 'XK', 'Kosovo', 1, NULL, NULL),
(118, 'KW', 'Kuwait', 1, NULL, NULL),
(119, 'KG', 'Kyrgyzstan', 1, NULL, NULL),
(120, 'LA', 'Lao People\'s Democratic Republic', 1, NULL, NULL),
(121, 'LV', 'Latvia', 1, NULL, NULL),
(122, 'LB', 'Lebanon', 1, NULL, NULL),
(123, 'LS', 'Lesotho', 1, NULL, NULL),
(124, 'LR', 'Liberia', 1, NULL, NULL),
(125, 'LY', 'Libyan Arab Jamahiriya', 1, NULL, NULL),
(126, 'LI', 'Liechtenstein', 1, NULL, NULL),
(127, 'LT', 'Lithuania', 1, NULL, NULL),
(128, 'LU', 'Luxembourg', 1, NULL, NULL),
(129, 'MO', 'Macau', 1, NULL, NULL),
(130, 'MK', 'Macedonia', 1, NULL, NULL),
(131, 'MG', 'Madagascar', 1, NULL, NULL),
(132, 'MW', 'Malawi', 1, NULL, NULL),
(133, 'MY', 'Malaysia', 1, NULL, NULL),
(134, 'MV', 'Maldives', 1, NULL, NULL),
(135, 'ML', 'Mali', 1, NULL, NULL),
(136, 'MT', 'Malta', 1, NULL, NULL),
(137, 'MH', 'Marshall Islands', 1, NULL, NULL),
(138, 'MQ', 'Martinique', 1, NULL, NULL),
(139, 'MR', 'Mauritania', 1, NULL, NULL),
(140, 'MU', 'Mauritius', 1, NULL, NULL),
(141, 'TY', 'Mayotte', 1, NULL, NULL),
(142, 'MX', 'Mexico', 1, NULL, NULL),
(143, 'FM', 'Micronesia, Federated States of', 1, NULL, NULL),
(144, 'MD', 'Moldova, Republic of', 1, NULL, NULL),
(145, 'MC', 'Monaco', 1, NULL, NULL),
(146, 'MN', 'Mongolia', 1, NULL, NULL),
(147, 'ME', 'Montenegro', 1, NULL, NULL),
(148, 'MS', 'Montserrat', 1, NULL, NULL),
(149, 'MA', 'Morocco', 1, NULL, NULL),
(150, 'MZ', 'Mozambique', 1, NULL, NULL),
(151, 'MM', 'Myanmar', 1, NULL, NULL),
(152, 'NA', 'Namibia', 1, NULL, NULL),
(153, 'NR', 'Nauru', 1, NULL, NULL),
(154, 'NP', 'Nepal', 1, NULL, NULL),
(155, 'NL', 'Netherlands', 1, NULL, NULL),
(156, 'AN', 'Netherlands Antilles', 1, NULL, NULL),
(157, 'NC', 'New Caledonia', 1, NULL, NULL),
(158, 'NZ', 'New Zealand', 1, NULL, NULL),
(159, 'NI', 'Nicaragua', 1, NULL, NULL),
(160, 'NE', 'Niger', 1, NULL, NULL),
(161, 'NG', 'Nigeria', 1, NULL, NULL),
(162, 'NU', 'Niue', 1, NULL, NULL),
(163, 'NF', 'Norfolk Island', 1, NULL, NULL),
(164, 'MP', 'Northern Mariana Islands', 1, NULL, NULL),
(165, 'NO', 'Norway', 1, NULL, NULL),
(166, 'OM', 'Oman', 1, NULL, NULL),
(167, 'PK', 'Pakistan', 1, NULL, NULL),
(168, 'PW', 'Palau', 1, NULL, NULL),
(169, 'PS', 'Palestine', 1, NULL, NULL),
(170, 'PA', 'Panama', 1, NULL, NULL),
(171, 'PG', 'Papua New Guinea', 1, NULL, NULL),
(172, 'PY', 'Paraguay', 1, NULL, NULL),
(173, 'PE', 'Peru', 1, NULL, NULL),
(174, 'PH', 'Philippines', 1, NULL, NULL),
(175, 'PN', 'Pitcairn', 1, NULL, NULL),
(176, 'PL', 'Poland', 1, NULL, NULL),
(177, 'PT', 'Portugal', 1, NULL, NULL),
(178, 'PR', 'Puerto Rico', 1, NULL, NULL),
(179, 'QA', 'Qatar', 1, NULL, NULL),
(180, 'RE', 'Reunion', 1, NULL, NULL),
(181, 'RO', 'Romania', 1, NULL, NULL),
(182, 'RU', 'Russian Federation', 1, NULL, NULL),
(183, 'RW', 'Rwanda', 1, NULL, NULL),
(184, 'KN', 'Saint Kitts and Nevis', 1, NULL, NULL),
(185, 'LC', 'Saint Lucia', 1, NULL, NULL),
(186, 'VC', 'Saint Vincent and the Grenadines', 1, NULL, NULL),
(187, 'WS', 'Samoa', 1, NULL, NULL),
(188, 'SM', 'San Marino', 1, NULL, NULL),
(189, 'ST', 'Sao Tome and Principe', 1, NULL, NULL),
(190, 'SA', 'Saudi Arabia', 1, NULL, NULL),
(191, 'SN', 'Senegal', 1, NULL, NULL),
(192, 'RS', 'Serbia', 1, NULL, NULL),
(193, 'SC', 'Seychelles', 1, NULL, NULL),
(194, 'SL', 'Sierra Leone', 1, NULL, NULL),
(195, 'SG', 'Singapore', 1, NULL, NULL),
(196, 'SK', 'Slovakia', 1, NULL, NULL),
(197, 'SI', 'Slovenia', 1, NULL, NULL),
(198, 'SB', 'Solomon Islands', 1, NULL, NULL),
(199, 'SO', 'Somalia', 1, NULL, NULL),
(200, 'ZA', 'South Africa', 1, NULL, NULL),
(201, 'GS', 'South Georgia South Sandwich Islands', 1, NULL, NULL),
(202, 'SS', 'South Sudan', 1, NULL, NULL),
(203, 'ES', 'Spain', 1, NULL, NULL),
(204, 'LK', 'Sri Lanka', 1, NULL, NULL),
(205, 'SH', 'St. Helena', 1, NULL, NULL),
(206, 'PM', 'St. Pierre and Miquelon', 1, NULL, NULL),
(207, 'SD', 'Sudan', 1, NULL, NULL),
(208, 'SR', 'Suriname', 1, NULL, NULL),
(209, 'SJ', 'Svalbard and Jan Mayen Islands', 1, NULL, NULL),
(210, 'SZ', 'Swaziland', 1, NULL, NULL),
(211, 'SE', 'Sweden', 1, NULL, NULL),
(212, 'CH', 'Switzerland', 1, NULL, NULL),
(213, 'SY', 'Syrian Arab Republic', 1, NULL, NULL),
(214, 'TW', 'Taiwan', 1, NULL, NULL),
(215, 'TJ', 'Tajikistan', 1, NULL, NULL),
(216, 'TZ', 'Tanzania, United Republic of', 1, NULL, NULL),
(217, 'TH', 'Thailand', 1, NULL, NULL),
(218, 'TG', 'Togo', 1, NULL, NULL),
(219, 'TK', 'Tokelau', 1, NULL, NULL),
(220, 'TO', 'Tonga', 1, NULL, NULL),
(221, 'TT', 'Trinidad and Tobago', 1, NULL, NULL),
(222, 'TN', 'Tunisia', 1, NULL, NULL),
(223, 'TR', 'Turkey', 1, NULL, NULL),
(224, 'TM', 'Turkmenistan', 1, NULL, NULL),
(225, 'TC', 'Turks and Caicos Islands', 1, NULL, NULL),
(226, 'TV', 'Tuvalu', 1, NULL, NULL),
(227, 'UG', 'Uganda', 1, NULL, NULL),
(228, 'UA', 'Ukraine', 1, NULL, NULL),
(229, 'AE', 'United Arab Emirates', 1, NULL, NULL),
(230, 'GB', 'United Kingdom', 1, NULL, NULL),
(231, 'US', 'United States', 1, NULL, NULL),
(232, 'UM', 'United States minor outlying islands', 1, NULL, NULL),
(233, 'UY', 'Uruguay', 1, NULL, NULL),
(234, 'UZ', 'Uzbekistan', 1, NULL, NULL),
(235, 'VU', 'Vanuatu', 1, NULL, NULL),
(236, 'VA', 'Vatican City State', 1, NULL, NULL),
(237, 'VE', 'Venezuela', 1, NULL, NULL),
(238, 'VN', 'Vietnam', 1, NULL, NULL),
(239, 'VG', 'Virgin Islands (British)', 1, NULL, NULL),
(240, 'VI', 'Virgin Islands (U.S.)', 1, NULL, NULL),
(241, 'WF', 'Wallis and Futuna Islands', 1, NULL, NULL),
(242, 'EH', 'Western Sahara', 1, NULL, NULL),
(243, 'YE', 'Yemen', 1, NULL, NULL),
(244, 'ZR', 'Zaire', 1, NULL, NULL),
(245, 'ZM', 'Zambia', 1, NULL, NULL),
(246, 'ZW', 'Zimbabwe', 1, NULL, NULL),
(247, 'AF', 'Afghanistan', 1, NULL, NULL),
(248, 'AL', 'Albania', 1, NULL, NULL),
(249, 'DZ', 'Algeria', 1, NULL, NULL),
(250, 'DS', 'American Samoa', 1, NULL, NULL),
(251, 'AD', 'Andorra', 1, NULL, NULL),
(252, 'AO', 'Angola', 1, NULL, NULL),
(253, 'AI', 'Anguilla', 1, NULL, NULL),
(254, 'AQ', 'Antarctica', 1, NULL, NULL),
(255, 'AG', 'Antigua and Barbuda', 1, NULL, NULL),
(256, 'AR', 'Argentina', 1, NULL, NULL),
(257, 'AM', 'Armenia', 1, NULL, NULL),
(258, 'AW', 'Aruba', 1, NULL, NULL),
(259, 'AU', 'Australia', 1, NULL, NULL),
(260, 'AT', 'Austria', 1, NULL, NULL),
(261, 'AZ', 'Azerbaijan', 1, NULL, NULL),
(262, 'BS', 'Bahamas', 1, NULL, NULL),
(263, 'BH', 'Bahrain', 1, NULL, NULL),
(264, 'BD', 'Bangladesh', 1, NULL, NULL),
(265, 'BB', 'Barbados', 1, NULL, NULL),
(266, 'BY', 'Belarus', 1, NULL, NULL),
(267, 'BE', 'Belgium', 1, NULL, NULL),
(268, 'BZ', 'Belize', 1, NULL, NULL),
(269, 'BJ', 'Benin', 1, NULL, NULL),
(270, 'BM', 'Bermuda', 1, NULL, NULL),
(271, 'BT', 'Bhutan', 1, NULL, NULL),
(272, 'BO', 'Bolivia', 1, NULL, NULL),
(273, 'BA', 'Bosnia and Herzegovina', 1, NULL, NULL),
(274, 'BW', 'Botswana', 1, NULL, NULL),
(275, 'BV', 'Bouvet Island', 1, NULL, NULL),
(276, 'BR', 'Brazil', 1, NULL, NULL),
(277, 'IO', 'British Indian Ocean Territory', 1, NULL, NULL),
(278, 'BN', 'Brunei Darussalam', 1, NULL, NULL),
(279, 'BG', 'Bulgaria', 1, NULL, NULL),
(280, 'BF', 'Burkina Faso', 1, NULL, NULL),
(281, 'BI', 'Burundi', 1, NULL, NULL),
(282, 'KH', 'Cambodia', 1, NULL, NULL),
(283, 'CM', 'Cameroon', 1, NULL, NULL),
(284, 'CA', 'Canada', 1, NULL, NULL),
(285, 'CV', 'Cape Verde', 1, NULL, NULL),
(286, 'KY', 'Cayman Islands', 1, NULL, NULL),
(287, 'CF', 'Central African Republic', 1, NULL, NULL),
(288, 'TD', 'Chad', 1, NULL, NULL),
(289, 'CL', 'Chile', 1, NULL, NULL),
(290, 'CN', 'China', 1, NULL, NULL),
(291, 'CX', 'Christmas Island', 1, NULL, NULL),
(292, 'CC', 'Cocos (Keeling) Islands', 1, NULL, NULL),
(293, 'CO', 'Colombia', 1, NULL, NULL),
(294, 'KM', 'Comoros', 1, NULL, NULL),
(295, 'CG', 'Congo', 1, NULL, NULL),
(296, 'CK', 'Cook Islands', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `details` longtext COLLATE utf8_unicode_ci NOT NULL,
  `discount` double(8,2) NOT NULL,
  `discount_type` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `start_date` int(15) NOT NULL,
  `end_date` int(15) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupon_usages`
--

CREATE TABLE `coupon_usages` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `symbol` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `exchange_rate` double(10,5) NOT NULL,
  `status` int(10) NOT NULL DEFAULT 0,
  `code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `symbol`, `exchange_rate`, `status`, `code`, `created_at`, `updated_at`) VALUES
(1, 'U.S. Dollar', '$', 1.00000, 1, 'USD', '2018-10-09 11:35:08', '2018-10-17 05:50:52'),
(2, 'Australian Dollar', '$', 1.28000, 1, 'AUD', '2018-10-09 11:35:08', '2019-02-04 05:51:55'),
(5, 'Brazilian Real', 'R$', 3.25000, 1, 'BRL', '2018-10-09 11:35:08', '2018-10-17 05:51:00'),
(6, 'Canadian Dollar', '$', 1.27000, 1, 'CAD', '2018-10-09 11:35:08', '2018-10-09 11:35:08'),
(7, 'Czech Koruna', 'Kč', 20.65000, 1, 'CZK', '2018-10-09 11:35:08', '2018-10-09 11:35:08'),
(8, 'Danish Krone', 'kr', 6.05000, 1, 'DKK', '2018-10-09 11:35:08', '2018-10-09 11:35:08'),
(9, 'Euro', '€', 0.85000, 1, 'EUR', '2018-10-09 11:35:08', '2018-10-09 11:35:08'),
(10, 'Hong Kong Dollar', '$', 7.83000, 1, 'HKD', '2018-10-09 11:35:08', '2018-10-09 11:35:08'),
(11, 'Hungarian Forint', 'Ft', 255.24000, 1, 'HUF', '2018-10-09 11:35:08', '2018-10-09 11:35:08'),
(12, 'Israeli New Sheqel', '₪', 3.48000, 1, 'ILS', '2018-10-09 11:35:08', '2018-10-09 11:35:08'),
(13, 'Japanese Yen', '¥', 107.12000, 1, 'JPY', '2018-10-09 11:35:08', '2018-10-09 11:35:08'),
(14, 'Malaysian Ringgit', 'RM', 3.91000, 1, 'MYR', '2018-10-09 11:35:08', '2018-10-09 11:35:08'),
(15, 'Mexican Peso', '$', 18.72000, 1, 'MXN', '2018-10-09 11:35:08', '2018-10-09 11:35:08'),
(16, 'Norwegian Krone', 'kr', 7.83000, 1, 'NOK', '2018-10-09 11:35:08', '2018-10-09 11:35:08'),
(17, 'New Zealand Dollar', '$', 1.38000, 1, 'NZD', '2018-10-09 11:35:08', '2018-10-09 11:35:08'),
(18, 'Philippine Peso', '₱', 52.26000, 1, 'PHP', '2018-10-09 11:35:08', '2018-10-09 11:35:08'),
(19, 'Polish Zloty', 'zł', 3.39000, 1, 'PLN', '2018-10-09 11:35:08', '2018-10-09 11:35:08'),
(20, 'Pound Sterling', '£', 0.72000, 1, 'GBP', '2018-10-09 11:35:08', '2018-10-09 11:35:08'),
(21, 'Russian Ruble', 'руб', 55.93000, 1, 'RUB', '2018-10-09 11:35:08', '2018-10-09 11:35:08'),
(22, 'Singapore Dollar', '$', 1.32000, 1, 'SGD', '2018-10-09 11:35:08', '2018-10-09 11:35:08'),
(23, 'Swedish Krona', 'kr', 8.19000, 1, 'SEK', '2018-10-09 11:35:08', '2018-10-09 11:35:08'),
(24, 'Swiss Franc', 'CHF', 0.94000, 1, 'CHF', '2018-10-09 11:35:08', '2018-10-09 11:35:08'),
(26, 'Thai Baht', '฿', 31.39000, 1, 'THB', '2018-10-09 11:35:08', '2018-10-09 11:35:08'),
(27, 'Taka', '৳', 84.00000, 1, 'BDT', '2018-10-09 11:35:08', '2018-12-02 05:16:13'),
(28, 'Indian Rupee', 'Rs', 68.45000, 1, 'Rupee', '2019-07-07 10:33:46', '2019-07-07 10:33:46');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `user_id`, `created_at`, `updated_at`) VALUES
(4, 8, '2019-08-01 10:35:09', '2019-08-01 10:35:09'),
(7, 18, '2020-06-14 02:51:17', '2020-06-14 02:51:17'),
(9, 21, '2020-06-20 18:10:59', '2020-06-20 18:10:59'),
(11, 30, '2020-06-22 22:21:17', '2020-06-22 22:21:17'),
(12, 31, '2020-06-23 02:34:23', '2020-06-23 02:34:23'),
(13, 32, '2020-06-23 10:28:36', '2020-06-23 10:28:36'),
(14, 33, '2020-06-23 14:02:06', '2020-06-23 14:02:06'),
(16, 35, '2020-06-24 06:06:28', '2020-06-24 06:06:28'),
(19, 43, '2020-07-08 22:31:05', '2020-07-08 22:31:05'),
(20, 44, '2020-07-11 19:31:46', '2020-07-11 19:31:46'),
(21, 48, '2020-07-17 14:02:34', '2020-07-17 14:02:34'),
(22, 49, '2020-07-17 19:22:44', '2020-07-17 19:22:44'),
(23, 50, '2020-07-18 14:25:55', '2020-07-18 14:25:55'),
(24, 51, '2020-07-18 19:06:28', '2020-07-18 19:06:28'),
(25, 52, '2020-07-20 11:09:45', '2020-07-20 11:09:45'),
(26, 55, '2020-09-28 16:58:51', '2020-09-28 16:58:51');

-- --------------------------------------------------------

--
-- Table structure for table `customer_packages`
--

CREATE TABLE `customer_packages` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` double(28,2) DEFAULT NULL,
  `product_upload` int(11) DEFAULT NULL,
  `logo` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `customer_packages`
--

INSERT INTO `customer_packages` (`id`, `name`, `amount`, `product_upload`, `logo`, `created_at`, `updated_at`) VALUES
(4, 'Basic Package', 300.00, 15, 'uploads/customer_package/dGemweT2oPPiP2lmBHrQwDJdhrIPE8JrLZrSKCnb.png', '2020-06-22 23:39:08', '2020-06-22 23:39:08'),
(5, 'Plus', 600.00, 30, 'uploads/customer_package/logCbJ4O9isnN5gGIJgcp7gOMJk3eVz2rQiiWsME.png', '2020-06-22 23:40:08', '2020-06-22 23:40:08'),
(6, 'Pro', 900.00, 60, 'uploads/customer_package/OUO90qKUNtWnN4sbjavZs5LVEodQl7un68swAJn5.png', '2020-06-22 23:40:55', '2020-06-22 23:40:55');

-- --------------------------------------------------------

--
-- Table structure for table `customer_products`
--

CREATE TABLE `customer_products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `published` int(1) NOT NULL DEFAULT 0,
  `status` int(1) NOT NULL DEFAULT 0,
  `added_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `subcategory_id` int(11) DEFAULT NULL,
  `subsubcategory_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `photos` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thumbnail_img` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `conditon` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `video_provider` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `video_link` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tags` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit_price` double(28,2) DEFAULT 0.00,
  `meta_title` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_img` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pdf` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flash_deals`
--

CREATE TABLE `flash_deals` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_date` int(20) DEFAULT NULL,
  `end_date` int(20) DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT 0,
  `featured` int(1) NOT NULL DEFAULT 0,
  `background_color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text_color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `banner` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flash_deal_products`
--

CREATE TABLE `flash_deal_products` (
  `id` int(11) NOT NULL,
  `flash_deal_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `discount` double(8,2) DEFAULT 0.00,
  `discount_type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `general_settings`
--

CREATE TABLE `general_settings` (
  `id` int(11) NOT NULL,
  `frontend_color` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default',
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_login_background` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_login_sidebar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `favicon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `site_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instagram` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `youtube` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `google_plus` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `general_settings`
--

INSERT INTO `general_settings` (`id`, `frontend_color`, `logo`, `admin_logo`, `admin_login_background`, `admin_login_sidebar`, `favicon`, `site_name`, `address`, `description`, `phone`, `email`, `facebook`, `instagram`, `twitter`, `youtube`, `google_plus`, `created_at`, `updated_at`) VALUES
(1, '7', 'uploads/logo/Ve0ZKnm7JRELnr4fwXhQqe56lPzGs2JQ5zteIiBz.png', 'uploads/admin_logo/8B3pj5HeiIqe2nQyc1bF51kXxjWxCAmsqZmIQldw.png', 'uploads/admin_login_background/cY9StTtJj9X5bupfA6mKgNk2743PpQn8X341C2KK.jpeg', 'uploads/admin_login_sidebar/noWgCoENo0o9O5uREIIaSFTcaSalqQOcMsed14mj.jpeg', 'uploads/favicon/DUJDnaYd9gDisjtBbcXRl5EXV8kaGioRmonJa9YL.png', 'Zianz E-Tail Market', '334/2, West Shewrapara, Mirpur', 'Zianz is an e-commerce site which will be capable of providing every kind of goods and products from every sector to all consumers located in Bangladesh.', '8801629107087', 'info@zianz.com', 'https://www.facebook.com/zianzetailmarket/', 'https://www.instagram.com', 'https://www.twitter.com', 'https://www.youtube.com', 'https://www.googleplus.com', '2020-09-01 20:09:34', '2020-09-02 06:09:34');

-- --------------------------------------------------------

--
-- Table structure for table `home_categories`
--

CREATE TABLE `home_categories` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `subsubcategories` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `home_categories`
--

INSERT INTO `home_categories` (`id`, `category_id`, `subsubcategories`, `status`, `created_at`, `updated_at`) VALUES
(3, 33, '[\"840\"]', 1, '2020-08-19 19:24:43', '2020-08-19 19:24:43'),
(4, 9, '[\"373\"]', 1, '2020-08-19 19:28:06', '2020-08-19 19:28:06'),
(5, 42, '[\"367\",\"40\"]', 1, '2020-08-19 19:29:34', '2020-08-19 19:29:34');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `rtl` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `code`, `rtl`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', 0, '2019-01-20 12:13:20', '2019-01-20 12:13:20'),
(3, 'Bangla', 'bd', 0, '2019-02-17 06:35:37', '2019-02-18 06:49:51'),
(4, 'Arabic', 'sa', 1, '2019-04-28 18:34:12', '2019-04-28 18:34:12');

-- --------------------------------------------------------

--
-- Table structure for table `links`
--

CREATE TABLE `links` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `links`
--

INSERT INTO `links` (`id`, `name`, `url`, `created_at`, `updated_at`) VALUES
(2, 'Be an affiliate partner', 'https://zianz.com/affiliate', '2020-09-11 05:45:25', '2020-09-11 05:45:25');

-- --------------------------------------------------------

--
-- Table structure for table `manual_payment_methods`
--

CREATE TABLE `manual_payment_methods` (
  `id` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `heading` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_info` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `conversation_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text COLLATE utf32_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
(6, '2016_06_01_000004_create_oauth_clients_table', 2),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('125ce8289850f80d9fea100325bf892fbd0deba1f87dbfc2ab81fb43d57377ec24ed65f7dc560e46', 1, 1, 'Personal Access Token', '[]', 0, '2019-07-30 04:51:13', '2019-07-30 04:51:13', '2020-07-30 10:51:13'),
('293d2bb534220c070c4e90d25b5509965d23d3ddbc05b1e29fb4899ae09420ff112dbccab1c6f504', 1, 1, 'Personal Access Token', '[]', 1, '2019-08-04 06:00:04', '2019-08-04 06:00:04', '2020-08-04 12:00:04'),
('5363e91c7892acdd6417aa9c7d4987d83568e229befbd75be64282dbe8a88147c6c705e06c1fb2bf', 1, 1, 'Personal Access Token', '[]', 0, '2019-07-13 06:44:28', '2019-07-13 06:44:28', '2020-07-13 12:44:28'),
('681b4a4099fac5e12517307b4027b54df94cbaf0cbf6b4bf496534c94f0ccd8a79dd6af9742d076b', 1, 1, 'Personal Access Token', '[]', 1, '2019-08-04 07:23:06', '2019-08-04 07:23:06', '2020-08-04 13:23:06'),
('6d229e3559e568df086c706a1056f760abc1370abe74033c773490581a042442154afa1260c4b6f0', 1, 1, 'Personal Access Token', '[]', 1, '2019-08-04 07:32:12', '2019-08-04 07:32:12', '2020-08-04 13:32:12'),
('6efc0f1fc3843027ea1ea7cd35acf9c74282f0271c31d45a164e7b27025a315d31022efe7bb94aaa', 1, 1, 'Personal Access Token', '[]', 0, '2019-08-08 02:35:26', '2019-08-08 02:35:26', '2020-08-08 08:35:26'),
('7745b763da15a06eaded371330072361b0524c41651cf48bf76fc1b521a475ece78703646e06d3b0', 1, 1, 'Personal Access Token', '[]', 1, '2019-08-04 07:29:44', '2019-08-04 07:29:44', '2020-08-04 13:29:44'),
('815b625e239934be293cd34479b0f766bbc1da7cc10d464a2944ddce3a0142e943ae48be018ccbd0', 1, 1, 'Personal Access Token', '[]', 1, '2019-07-22 02:07:47', '2019-07-22 02:07:47', '2020-07-22 08:07:47'),
('8921a4c96a6d674ac002e216f98855c69de2568003f9b4136f6e66f4cb9545442fb3e37e91a27cad', 1, 1, 'Personal Access Token', '[]', 1, '2019-08-04 06:05:05', '2019-08-04 06:05:05', '2020-08-04 12:05:05'),
('8d8b85720304e2f161a66564cec0ecd50d70e611cc0efbf04e409330086e6009f72a39ce2191f33a', 1, 1, 'Personal Access Token', '[]', 1, '2019-08-04 06:44:35', '2019-08-04 06:44:35', '2020-08-04 12:44:35'),
('bcaaebdead4c0ef15f3ea6d196fd80749d309e6db8603b235e818cb626a5cea034ff2a55b66e3e1a', 1, 1, 'Personal Access Token', '[]', 1, '2019-08-04 07:14:32', '2019-08-04 07:14:32', '2020-08-04 13:14:32'),
('c25417a5c728073ca8ba57058ded43d496a9d2619b434d2a004dd490a64478c08bc3e06ffc1be65d', 1, 1, 'Personal Access Token', '[]', 1, '2019-07-30 01:45:31', '2019-07-30 01:45:31', '2020-07-30 07:45:31'),
('c7423d85b2b5bdc5027cb283be57fa22f5943cae43f60b0ed27e6dd198e46f25e3501b3081ed0777', 1, 1, 'Personal Access Token', '[]', 1, '2019-08-05 05:02:59', '2019-08-05 05:02:59', '2020-08-05 11:02:59'),
('e76f19dbd5c2c4060719fb1006ac56116fd86f7838b4bf74e2c0a0ac9696e724df1e517dbdb357f4', 1, 1, 'Personal Access Token', '[]', 1, '2019-07-15 02:53:40', '2019-07-15 02:53:40', '2020-07-15 08:53:40'),
('ed7c269dd6f9a97750a982f62e0de54749be6950e323cdfef892a1ec93f8ddbacf9fe26e6a42180e', 1, 1, 'Personal Access Token', '[]', 1, '2019-07-13 06:36:45', '2019-07-13 06:36:45', '2020-07-13 12:36:45'),
('f6d1475bc17a27e389000d3df4da5c5004ce7610158b0dd414226700c0f6db48914637b4c76e1948', 1, 1, 'Personal Access Token', '[]', 1, '2019-08-04 07:22:01', '2019-08-04 07:22:01', '2020-08-04 13:22:01'),
('f85e4e444fc954430170c41779a4238f84cd6fed905f682795cd4d7b6a291ec5204a10ac0480eb30', 1, 1, 'Personal Access Token', '[]', 1, '2019-07-30 06:38:49', '2019-07-30 06:38:49', '2020-07-30 12:38:49'),
('f8bf983a42c543b99128296e4bc7c2d17a52b5b9ef69670c629b93a653c6a4af27be452e0c331f79', 1, 1, 'Personal Access Token', '[]', 1, '2019-08-04 07:28:55', '2019-08-04 07:28:55', '2020-08-04 13:28:55');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'eR2y7WUuem28ugHKppFpmss7jPyOHZsMkQwBo1Jj', 'http://localhost', 1, 0, 0, '2019-07-13 06:17:34', '2019-07-13 06:17:34'),
(2, NULL, 'Laravel Password Grant Client', 'WLW2Ol0GozbaXEnx1NtXoweYPuKEbjWdviaUgw77', 'http://localhost', 0, 1, 0, '2019-07-13 06:17:34', '2019-07-13 06:17:34');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2019-07-13 06:17:34', '2019-07-13 06:17:34');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `guest_id` int(11) DEFAULT NULL,
  `shipping_address` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipinout` double(8,2) DEFAULT NULL,
  `trn_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bksh_num` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `manual_payment` int(1) NOT NULL DEFAULT 0,
  `manual_payment_data` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_status` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'unpaid',
  `payment_details` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `grand_total` double(8,2) DEFAULT NULL,
  `coupon_discount` double(8,2) NOT NULL DEFAULT 0.00,
  `code` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` int(20) NOT NULL,
  `viewed` int(1) NOT NULL DEFAULT 0,
  `delivery_viewed` int(1) NOT NULL DEFAULT 1,
  `payment_status_viewed` int(1) DEFAULT 1,
  `commission_calculated` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `guest_id`, `shipping_address`, `payment_type`, `shipinout`, `trn_id`, `bksh_num`, `manual_payment`, `manual_payment_data`, `payment_status`, `payment_details`, `grand_total`, `coupon_discount`, `code`, `date`, `viewed`, `delivery_viewed`, `payment_status_viewed`, `commission_calculated`, `created_at`, `updated_at`) VALUES
(67, NULL, 685807, '{\"name\":\"MD Salauddin\",\"email\":\"uddin.salamd@gmail.com\",\"address\":\"334\\/2 West Shewrapara\",\"country\":\"Bangladesh\",\"city\":\"Dhaka\",\"postal_code\":\"1216\",\"phone\":\"01629107087\",\"checkout_type\":\"guest\"}', 'cash_on_delivery', 100.00, '6764ujfkfkcj', '01629107087', 0, NULL, 'unpaid', NULL, 400.00, 0.00, '20200810-07314156', 1597044701, 1, 0, 0, 0, '2020-08-10 15:31:41', '2020-08-13 16:17:24'),
(68, 12, NULL, '{\"name\":\"w asfdgts\",\"email\":\"uddin.salamd@gmail.com\",\"address\":\"dfhgh\",\"country\":\"Afghanistan\",\"city\":\"asfdgf\",\"postal_code\":\"564564\",\"phone\":\"4564564\",\"checkout_type\":\"logged\"}', 'cash_on_delivery', 70.00, 'tx465464', '01626954454', 0, NULL, 'unpaid', NULL, 400.00, 0.00, '20200828-18074337', 1598638063, 1, 0, 0, 0, '2020-08-29 02:07:43', '2020-08-29 02:09:09'),
(69, 12, NULL, '{\"name\":\"w asfdgts\",\"email\":\"uddin.salamd@gmail.com\",\"address\":\"dfhgh\",\"country\":\"Bangladesh\",\"city\":\"asfdgf\",\"postal_code\":\"564564\",\"phone\":\"4564564\",\"checkout_type\":\"logged\"}', 'cash_on_delivery', 70.00, 'tx465464', '01626954454', 0, NULL, 'unpaid', NULL, 400.00, 0.00, '20200829-00181119', 1598638691, 1, 0, 0, 0, '2020-08-29 08:18:11', '2020-08-29 08:18:41'),
(70, 12, NULL, '{\"name\":\"w asfdgts\",\"email\":\"uddin.salamd@gmail.com\",\"address\":\"dfhgh\",\"country\":\"Bangladesh\",\"city\":\"asfdgf\",\"postal_code\":\"564564\",\"phone\":\"4564564\",\"checkout_type\":\"logged\"}', 'cash_on_delivery', NULL, NULL, NULL, 0, NULL, 'unpaid', NULL, 1200.00, 0.00, '20200828-23195525', 1598656795, 1, 0, 0, 0, '2020-08-29 07:19:55', '2020-08-29 07:37:21'),
(71, 12, NULL, '{\"name\":\"w asfdgts\",\"email\":\"uddin.salamd@gmail.com\",\"address\":\"dfhgh\",\"country\":\"Bangladesh\",\"city\":\"asfdgf\",\"postal_code\":\"564564\",\"phone\":\"01456456456\",\"checkout_type\":\"logged\"}', 'cash_on_delivery', NULL, NULL, NULL, 0, NULL, 'unpaid', NULL, 3360.00, 0.00, '20200828-23232979', 1598657009, 1, 0, 0, 0, '2020-08-29 07:23:29', '2020-08-29 07:28:26'),
(72, 12, NULL, '{\"name\":\"w asfdgts\",\"email\":\"uddin.salamd@gmail.com\",\"address\":\"dfhgh\",\"country\":\"Bangladesh\",\"city\":\"asfdgf\",\"postal_code\":\"564564\",\"phone\":\"01456456456\",\"checkout_type\":\"logged\"}', 'cash_on_delivery', 70.00, 'sfagddsfh', '01626954454', 0, NULL, 'unpaid', NULL, 400.00, 0.00, '20200828-23345595', 1598657695, 1, 0, 0, 0, '2020-08-29 07:34:55', '2020-08-29 14:02:04'),
(73, 12, NULL, '{\"name\":\"w asfdgts\",\"email\":\"uddin.salamd@gmail.com\",\"address\":\"dfhgh\",\"country\":\"Bangladesh\",\"city\":\"asfdgf\",\"postal_code\":\"564564\",\"phone\":\"01456456456\",\"checkout_type\":\"logged\"}', 'cash_on_delivery', 100.00, 'tx465464', '01926954454', 0, NULL, 'unpaid', NULL, 1200.00, 0.00, '20200829-05424175', 1598658161, 1, 0, 0, 0, '2020-08-29 13:42:41', '2020-08-29 13:43:17'),
(74, 28, NULL, '{\"name\":\"Zianz Fish & Meat Shop\",\"email\":\"zarif.imtiaz@gmail.com\",\"address\":\"171\\/2\\/C West Kafrul, Sher-E-Bangla Nagar\",\"country\":\"Bangladesh\",\"city\":\"Dhaka\",\"postal_code\":\"1207\",\"phone\":\"8801629107087\",\"checkout_type\":\"logged\"}', 'cash_on_delivery', 70.00, '546587', '6546546', 0, NULL, 'paid', NULL, 400.00, 0.00, '20200829-05512246', 1598658682, 1, 0, 0, 1, '2020-08-29 13:51:22', '2020-08-29 13:53:01'),
(75, NULL, 285431, '{\"name\":\"Md Sala Uddin\",\"email\":\"sumaakterakon@gmail.com\",\"address\":\"334\\/2 West Shewrapara, Mirpur, Dhaka-1216\",\"country\":\"Bangladesh\",\"city\":\"DHAKA\",\"postal_code\":\"1216\",\"phone\":\"8801707485240\",\"checkout_type\":\"guest\"}', 'cash_on_delivery', 70.00, 'KJKJLK', '54698', 0, NULL, 'paid', NULL, 496.00, 0.00, '20200829-06010528', 1598659265, 1, 0, 0, 1, '2020-08-29 14:01:05', '2020-08-29 14:38:20'),
(76, 53, NULL, '{\"name\":\"Md Sala Uddin\",\"email\":\"sumaakterakon@gmail.com\",\"address\":\"334\\/2 West Shewrapara, Mirpur, Dhaka-1216\",\"country\":\"Bangladesh\",\"city\":\"DHAKA\",\"postal_code\":\"1216\",\"phone\":\"8801707485240\",\"checkout_type\":\"logged\"}', 'cash_on_delivery', 70.00, 'KJKJLK', '54698', 0, NULL, 'paid', NULL, 1200.00, 0.00, '20200829-06032876', 1598659408, 1, 1, 1, 1, '2020-08-29 14:03:28', '2020-09-02 04:34:32'),
(77, 53, NULL, '{\"name\":\"Md Sala Uddin\",\"email\":\"sumaakterakon@gmail.com\",\"address\":\"334\\/2 West Shewrapara, Mirpur, Dhaka-1216\",\"country\":\"Bangladesh\",\"city\":\"DHAKA\",\"postal_code\":\"1216\",\"phone\":\"8801707485240\",\"checkout_type\":\"logged\"}', 'cash_on_delivery', 100.00, 'KJKJLK', '54698', 0, NULL, 'paid', NULL, 12350.00, 0.00, '20200829-06070695', 1598659626, 1, 1, 1, 1, '2020-08-29 14:07:06', '2020-09-02 03:58:46'),
(78, NULL, 992142, '{\"name\":\"Suma Akter\",\"email\":\"sumaakterakon@gmail.com\",\"address\":\"334\\/2, West Shewrapara, Mirpur\",\"country\":\"Bangladesh\",\"city\":\"Dhaka\",\"postal_code\":\"1216\",\"phone\":\"8801771166522\",\"checkout_type\":\"guest\"}', 'cash_on_delivery', 70.00, 'tx465464', '01626954454', 0, NULL, 'paid', NULL, 400.00, 0.00, '20200901-18474488', 1598964464, 1, 0, 0, 1, '2020-09-02 02:47:44', '2020-09-02 02:50:09'),
(82, NULL, 473311, '{\"name\":\"Suma Akter\",\"email\":\"sumaakterakon@gmail.com\",\"address\":\"334\\/2, West Shewrapara, Mirpur\",\"country\":\"Bangladesh\",\"city\":\"Dhaka\",\"postal_code\":\"1216\",\"phone\":\"01771166522\",\"checkout_type\":\"guest\"}', 'cash_on_delivery', NULL, NULL, NULL, 0, NULL, 'unpaid', NULL, 400.00, 0.00, '20200905-19415880', 1599313318, 0, 0, 0, 0, '2020-09-05 23:41:58', '2020-09-05 23:41:58'),
(85, NULL, 841339, '{\"name\":\"w asfdgts\",\"email\":\"uddin.salamd@gmail.com\",\"address\":\"dfhgh\",\"country\":\"Bangladesh\",\"city\":\"asfdgf\",\"postal_code\":\"564564\",\"phone\":\"01456456456\",\"checkout_type\":\"guest\"}', 'cash_on_delivery', NULL, NULL, NULL, 0, NULL, 'unpaid', NULL, 0.00, 0.00, '20200905-20034452', 1599314624, 0, 0, 0, 0, '2020-09-06 00:03:44', '2020-09-06 00:03:44'),
(86, NULL, 207358, '{\"name\":\"w asfdgts\",\"email\":\"uddin.salamd@gmail.com\",\"address\":\"dfhgh\",\"country\":\"Bangladesh\",\"city\":\"asfdgf\",\"postal_code\":\"564564\",\"phone\":\"01456456456\",\"checkout_type\":\"guest\"}', 'cash_on_delivery', NULL, NULL, NULL, 0, NULL, 'unpaid', NULL, 0.00, 0.00, '20200905-20081516', 1599314895, 0, 0, 0, 0, '2020-09-06 00:08:15', '2020-09-06 00:08:15'),
(90, NULL, 428990, '{\"name\":\"w asfdgts\",\"email\":\"uddin.salamd@gmail.com\",\"address\":\"dfhgh\",\"country\":\"Bangladesh\",\"city\":\"asfdgf\",\"postal_code\":\"564564\",\"phone\":\"01456456456\",\"checkout_type\":\"guest\"}', 'cash_on_delivery', NULL, NULL, NULL, 0, NULL, 'unpaid', NULL, 0.00, 0.00, '20200905-21253097', 1599319530, 0, 0, 0, 0, '2020-09-06 01:25:30', '2020-09-06 01:25:30'),
(91, NULL, 838307, '{\"name\":\"w asfdgts\",\"email\":\"uddin.salamd@gmail.com\",\"address\":\"dfhgh\",\"country\":\"Bangladesh\",\"city\":\"asfdgf\",\"postal_code\":\"564564\",\"phone\":\"01456456456\",\"checkout_type\":\"guest\"}', 'cash_on_delivery', NULL, NULL, NULL, 0, NULL, 'unpaid', NULL, 0.00, 0.00, '20200905-21263129', 1599319591, 0, 0, 0, 0, '2020-09-06 01:26:31', '2020-09-06 01:26:31'),
(92, NULL, 896596, '{\"name\":\"w asfdgts\",\"email\":\"uddin.salamd@gmail.com\",\"address\":\"dfhgh\",\"country\":\"Bangladesh\",\"city\":\"asfdgf\",\"postal_code\":\"564564\",\"phone\":\"01456456456\",\"checkout_type\":\"guest\"}', 'cash_on_delivery', NULL, NULL, NULL, 0, NULL, 'unpaid', NULL, 0.00, 0.00, '20200905-21423278', 1599320552, 0, 0, 0, 0, '2020-09-06 01:42:32', '2020-09-06 01:42:32'),
(94, NULL, 507498, '{\"name\":\"Suma Akter\",\"email\":\"sumaakterakon@gmail.com\",\"address\":\"334\\/2, West Shewrapara, Mirpur\",\"country\":\"Bangladesh\",\"city\":\"Dhaka\",\"postal_code\":\"1216\",\"phone\":\"01771166522\",\"checkout_type\":\"guest\"}', 'cash_on_delivery', NULL, NULL, NULL, 0, NULL, 'unpaid', NULL, 0.00, 0.00, '20200905-21515175', 1599321111, 0, 0, 0, 0, '2020-09-06 01:51:51', '2020-09-06 01:51:51'),
(95, NULL, 999627, '{\"name\":\"Suma Akter\",\"email\":\"sumaakterakon@gmail.com\",\"address\":\"334\\/2, West Shewrapara, Mirpur\",\"country\":\"Bangladesh\",\"city\":\"Dhaka\",\"postal_code\":\"1216\",\"phone\":\"01771166522\",\"checkout_type\":\"guest\"}', 'cash_on_delivery', NULL, NULL, NULL, 0, NULL, 'unpaid', NULL, 0.00, 0.00, '20200905-21520171', 1599321121, 0, 0, 0, 0, '2020-09-06 01:52:01', '2020-09-06 01:52:01'),
(96, NULL, 363251, '{\"name\":\"Suma Akter\",\"email\":\"sumaakterakon@gmail.com\",\"address\":\"334\\/2, West Shewrapara, Mirpur\",\"country\":\"Bangladesh\",\"city\":\"Dhaka\",\"postal_code\":\"1216\",\"phone\":\"01771166522\",\"checkout_type\":\"guest\"}', 'cash_on_delivery', NULL, NULL, NULL, 0, NULL, 'unpaid', NULL, 0.00, 0.00, '20200905-21562221', 1599321382, 0, 0, 0, 0, '2020-09-06 01:56:22', '2020-09-06 01:56:22'),
(98, 12, NULL, '{\"name\":\"Zianz E-Tail Market\",\"email\":\"ziauddin@zianz.com\",\"address\":\"334\\/2, West Shewrapara, Mirpur\",\"country\":\"Bangladesh\",\"city\":\"Dhaka\",\"postal_code\":\"1216\",\"phone\":\"01771166522\",\"checkout_type\":\"logged\"}', 'cash_on_delivery', 70.00, 'tx465464', '01626954454', 0, NULL, 'unpaid', NULL, 0.00, 0.00, '20200906-13154839', 1599376548, 0, 0, 0, 0, '2020-09-06 17:15:48', '2020-09-06 17:15:48'),
(103, 12, NULL, '{\"name\":\"Zianz E-Tail Market\",\"email\":\"ziauddin@zianz.com\",\"address\":\"334\\/2, West Shewrapara, Mirpur\",\"country\":\"Bangladesh\",\"city\":\"Dhaka\",\"postal_code\":\"1216\",\"phone\":\"01771166522\",\"checkout_type\":\"logged\"}', 'cash_on_delivery', 70.00, NULL, NULL, 0, NULL, 'unpaid', NULL, 0.00, 0.00, '20200906-20281267', 1599402492, 0, 0, 0, 0, '2020-09-07 00:28:12', '2020-09-07 00:28:12'),
(104, 12, NULL, '{\"name\":\"Zianz E-Tail Market\",\"email\":\"ziauddin@zianz.com\",\"address\":\"334\\/2, West Shewrapara, Mirpur\",\"country\":\"Bangladesh\",\"city\":\"Dhaka\",\"postal_code\":\"1216\",\"phone\":\"01771166522\",\"checkout_type\":\"logged\"}', 'cash_on_delivery', 70.00, 'tx46546411', '1625875887', 0, NULL, 'unpaid', NULL, 1200.00, 0.00, '20200906-20512757', 1599403887, 1, 0, 0, 0, '2020-09-07 00:51:27', '2020-09-07 00:52:09');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `variation` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` double(8,2) DEFAULT NULL,
  `tax` double(8,2) NOT NULL DEFAULT 0.00,
  `shipping_cost` double(8,2) NOT NULL DEFAULT 0.00,
  `quantity` int(11) DEFAULT NULL,
  `payment_status` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unpaid',
  `delivery_status` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'pending',
  `shipping_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pickup_point_id` int(11) DEFAULT NULL,
  `product_referral_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `seller_id`, `product_id`, `variation`, `price`, `tax`, `shipping_cost`, `quantity`, `payment_status`, `delivery_status`, `shipping_type`, `pickup_point_id`, `product_referral_code`, `created_at`, `updated_at`) VALUES
(33, 33, 12, 26, '', 170.20, 0.00, 0.00, 1, 'paid', 'delivered', 'home_delivery', NULL, NULL, '2020-06-21 02:19:24', '2020-06-21 02:21:41'),
(63, 67, 12, 53, 'DarkBlue', 400.00, 0.00, 0.00, 5, 'unpaid', 'pending', 'home_delivery', NULL, NULL, '2020-08-10 15:31:41', '2020-08-10 15:31:41'),
(64, 68, 12, 53, 'DarkBlue', 400.00, 0.00, 0.00, 5, 'unpaid', 'pending', 'home_delivery', NULL, NULL, '2020-08-29 02:07:43', '2020-08-29 02:07:43'),
(65, 69, 12, 53, 'DarkBlue', 400.00, 0.00, 0.00, 5, 'unpaid', 'pending', 'home_delivery', NULL, NULL, '2020-08-29 08:18:11', '2020-08-29 08:18:11'),
(66, 70, 12, 40, '', 1200.00, 0.00, 0.00, 2, 'unpaid', 'pending', 'home_delivery', NULL, NULL, '2020-08-29 07:19:55', '2020-08-29 07:19:55'),
(67, 71, 12, 32, 'Black', 3360.00, 0.00, 0.00, 1, 'unpaid', 'pending', 'home_delivery', NULL, NULL, '2020-08-29 07:23:29', '2020-08-29 07:23:29'),
(68, 72, 53, 73, '', 400.00, 0.00, 0.00, 1, 'unpaid', 'pending', 'home_delivery', NULL, NULL, '2020-08-29 07:34:55', '2020-08-29 07:34:55'),
(69, 73, 12, 40, '', 1200.00, 0.00, 0.00, 2, 'unpaid', 'pending', 'home_delivery', NULL, NULL, '2020-08-29 13:42:41', '2020-08-29 13:42:41'),
(70, 74, 12, 53, 'DarkBlue', 400.00, 0.00, 0.00, 5, 'paid', 'delivered', 'home_delivery', NULL, NULL, '2020-08-29 13:51:22', '2020-08-29 13:53:23'),
(71, 75, 12, 39, '', 396.00, 0.00, 100.00, 1, 'paid', 'pending', 'home_delivery', NULL, NULL, '2020-08-29 14:01:06', '2020-08-29 14:38:20'),
(72, 76, 12, 37, '', 1200.00, 0.00, 0.00, 2, 'paid', 'pending', 'home_delivery', NULL, NULL, '2020-08-29 14:03:28', '2020-08-29 14:38:59'),
(73, 77, 12, 42, '', 12350.00, 0.00, 0.00, 1, 'paid', 'on_delivery', 'home_delivery', NULL, NULL, '2020-08-29 14:07:06', '2020-08-30 05:52:45'),
(74, 78, 53, 73, '', 400.00, 0.00, 0.00, 1, 'paid', 'pending', 'home_delivery', NULL, NULL, '2020-09-02 02:47:44', '2020-09-02 02:50:09'),
(78, 82, 53, 73, '', 400.00, 0.00, 0.00, 1, 'unpaid', 'pending', 'home_delivery', NULL, NULL, '2020-09-05 23:41:58', '2020-09-05 23:41:58'),
(90, 104, 12, 40, '', 1200.00, 0.00, 0.00, 2, 'unpaid', 'pending', 'home_delivery', NULL, NULL, '2020-09-07 00:51:27', '2020-09-07 00:51:27');

-- --------------------------------------------------------

--
-- Table structure for table `otp_configurations`
--

CREATE TABLE `otp_configurations` (
  `id` int(11) NOT NULL,
  `type` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `otp_configurations`
--

INSERT INTO `otp_configurations` (`id`, `type`, `value`, `created_at`, `updated_at`) VALUES
(1, 'nexmo', '1', '2020-03-22 09:19:07', '2020-03-22 09:19:07'),
(2, 'otp_for_order', '1', '2020-03-22 09:19:07', '2020-03-22 09:19:07'),
(3, 'otp_for_delivery_status', '1', '2020-03-22 09:19:37', '2020-03-22 09:19:37'),
(4, 'otp_for_paid_status', '0', '2020-03-22 09:19:37', '2020-03-22 09:19:37'),
(5, 'twillo', '0', '2020-03-22 09:54:03', '2020-03-22 03:54:20'),
(6, 'ssl_wireless', '0', '2020-03-22 09:54:03', '2020-03-22 03:54:20'),
(7, 'fast2sms', '0', '2020-03-22 09:54:03', '2020-03-22 03:54:20');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_title` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `keywords` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL DEFAULT 0.00,
  `payment_details` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_method` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `txn_code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `seller_id`, `amount`, `payment_details`, `payment_method`, `txn_code`, `created_at`, `updated_at`) VALUES
(2, 2, 25.48, NULL, 'cash', NULL, '2020-06-06 04:29:05', '2020-06-06 04:29:05'),
(3, 5, 50.00, NULL, 'cash', NULL, '2020-06-22 05:06:18', '2020-06-22 05:06:18');

-- --------------------------------------------------------

--
-- Table structure for table `pickup_points`
--

CREATE TABLE `pickup_points` (
  `id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `phone` varchar(15) NOT NULL,
  `pick_up_status` int(1) DEFAULT NULL,
  `cash_on_pickup_status` int(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `policies`
--

CREATE TABLE `policies` (
  `id` int(11) NOT NULL,
  `name` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `policies`
--

INSERT INTO `policies` (`id`, `name`, `content`, `created_at`, `updated_at`) VALUES
(1, 'support_policy', NULL, '2019-10-29 12:54:45', '2019-01-22 05:13:15'),
(2, 'return_policy', NULL, '2019-10-29 12:54:47', '2019-01-24 05:40:11'),
(4, 'seller_policy', NULL, '2019-10-29 12:54:49', '2019-02-04 17:50:15'),
(5, 'terms', NULL, '2019-10-29 12:54:51', '2019-10-28 18:00:00'),
(6, 'privacy_policy', NULL, '2019-10-29 12:54:54', '2019-10-28 18:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `added_by` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'admin',
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) NOT NULL,
  `subsubcategory_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `photos` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thumbnail_img` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `featured_img` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `flash_deal_img` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `video_provider` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `video_link` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tags` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit_price` double(8,2) NOT NULL,
  `purchase_price` double(8,2) NOT NULL,
  `variant_product` int(1) NOT NULL DEFAULT 0,
  `attributes` varchar(1000) COLLATE utf8_unicode_ci NOT NULL DEFAULT '[]',
  `choice_options` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `colors` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `variations` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `todays_deal` int(11) NOT NULL DEFAULT 0,
  `published` int(11) NOT NULL DEFAULT 1,
  `featured` int(11) NOT NULL DEFAULT 0,
  `current_stock` int(10) NOT NULL DEFAULT 0,
  `min_stock` int(11) DEFAULT NULL,
  `max_stock` int(11) DEFAULT NULL,
  `unit` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `min_qty` int(11) NOT NULL DEFAULT 1,
  `discount` double(8,2) DEFAULT NULL,
  `discount_type` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tax` double(8,2) DEFAULT NULL,
  `tax_type` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_type` varchar(20) CHARACTER SET latin1 DEFAULT 'flat_rate',
  `shipping_cost` double(8,2) DEFAULT 0.00,
  `outside_shipping_cost` double(8,2) DEFAULT NULL,
  `num_of_sale` int(11) NOT NULL DEFAULT 0,
  `meta_title` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_img` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pdf` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `refundable` int(1) NOT NULL DEFAULT 0,
  `earn_point` double(8,2) NOT NULL DEFAULT 0.00,
  `rating` double(8,2) NOT NULL DEFAULT 0.00,
  `barcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `digital` int(1) NOT NULL DEFAULT 0,
  `file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `added_by`, `user_id`, `category_id`, `subcategory_id`, `subsubcategory_id`, `brand_id`, `photos`, `thumbnail_img`, `featured_img`, `flash_deal_img`, `video_provider`, `video_link`, `tags`, `description`, `unit_price`, `purchase_price`, `variant_product`, `attributes`, `choice_options`, `colors`, `variations`, `todays_deal`, `published`, `featured`, `current_stock`, `min_stock`, `max_stock`, `unit`, `min_qty`, `discount`, `discount_type`, `tax`, `tax_type`, `shipping_type`, `shipping_cost`, `outside_shipping_cost`, `num_of_sale`, `meta_title`, `meta_description`, `meta_img`, `pdf`, `slug`, `refundable`, `earn_point`, `rating`, `barcode`, `digital`, `file_name`, `file_path`, `created_at`, `updated_at`) VALUES
(27, 'IMDK C101A2 Finger Pulse Oximeter', 'admin', 12, 42, 48, 40, NULL, '[\"uploads\\/products\\/photos\\/PEnltOtfDzZOIJjCJ1QIuoYqo3nG7w6Tm4v6NhqL.jpeg\",\"uploads\\/products\\/photos\\/m6guasMY6i0qUWfU5AVqdll820mlK2MPhypJLWPf.jpeg\",\"uploads\\/products\\/photos\\/KoOdG9uH53TuRraqHxzbkwJuX1WwBccWMAeB5Gy6.jpeg\",\"uploads\\/products\\/photos\\/vpvHa9eKGR2GFqwsP8NQI5Kex5HcYbDFv4qUd0j8.jpeg\",\"uploads\\/products\\/photos\\/1rcDAVI4EtRCCIEsgnm3doiOFtfPRzXu5rpJIpsh.jpeg\",\"uploads\\/products\\/photos\\/ECi5y9PmFbyYtxUr6qaKWzEAVnIZ1eVWg2lYtrfx.jpeg\"]', 'uploads/products/thumbnail/fjXbjsJJLZeVTUHnM9euvaVbKJyFpunfQS59v2oz.jpeg', 'uploads/products/featured/Ij5j3DrgwGctRm9211sjno8PEqIWC1h4rK7COYGg.jpeg', 'uploads/products/flash_deal/BBkPJRQOrl5aaNJYhcF1okXoq27dqzHL5w00Zm9f.jpeg', 'youtube', NULL, 'Finger Pulse Oximeter', '<p><span style=\"color: rgb(86, 91, 100);\">Quick Details:</span></p><ul><li><span style=\"color: rgb(86, 91, 100);\">Display type: OLED LCD </span></li><li><span style=\"color: rgb(86, 91, 100);\">SpO2 measurement range: 70%&nbsp;- 99% </span></li><li><span style=\"color: rgb(86, 91, 100);\">Accuracy: ±2% </span></li><li><span style=\"color: rgb(86, 91, 100);\">Resolution: ±1% </span></li><li><span style=\"color: rgb(86, 91, 100);\">PR measurement range: 30BPM~240 BPM </span></li><li><span style=\"color: rgb(86, 91, 100);\">Accuracy: ±1 BPM or ±1% </span></li><li><span style=\"color: rgb(86, 91, 100);\">Power: 2 AAA 1.5 V </span></li><li><span style=\"color: rgb(86, 91, 100);\">alkaline battery Operation temperature: 5°C - 40°C </span></li><li><span style=\"color: rgb(86, 91, 100);\">Storage temperature: -10°C~40°C </span></li><li><span style=\"color: rgb(86, 91, 100);\">Air Pressure: 70kPa - 106kPa </span></li><li><span style=\"color: rgb(86, 91, 100);\">Perfusion index: ≥0.2%, ±0.1% </span></li><li><span style=\"color: rgb(86, 91, 100);\">Power consumption: ≥30mAh </span></li><li><span style=\"color: rgb(86, 91, 100);\">Auto power off: 8 seconds automatic shutdown </span></li><li><span style=\"color: rgb(86, 91, 100);\">Sleep monitoring time: 8 hours </span></li><li><span style=\"color: rgb(86, 91, 100);\">Weight: 62gr </span></li><li><span style=\"color: rgb(86, 91, 100);\">Fits in every finger (thumbs, toes etc) and provides 6,000 spot checks Option to attach a lanyard during activities and quickly clipped to finger</span></li></ul><p><br></p>', 2600.00, 2600.00, 0, '[]', '[]', '[]', NULL, 1, 1, 1, 1000, 1, 1000, 'Piece', 1, 25.00, 'percent', 0.00, 'amount', 'free', 0.00, 0.00, 2, 'C101A2 Finger Pulse Oximeter', 'C101A2 finger pulse oximeter uses the latest oxygen sensor technology to accurately determine the level of oxygen in blood (SpO2) in 8 seconds. The measurement range is 70% - 99% with ±2% accuracy. C101A2 finger pulse oximeter fits in every finger and operates with one button. An alarm beeps to indicate low or high oxygen level and fast or slow heart rate. Automatically powers off after 8s.', 'uploads/products/meta/tDamYW1CR98pH2U52t8ubgJWPSoW79dkeiBpnhs1.jpeg', NULL, 'IMDK-C101A2-Finger-Pulse-Oximeter-EkjIE', 0, 0.00, 0.00, NULL, 0, NULL, NULL, '2020-06-16 22:42:44', '2020-07-14 19:53:05'),
(28, 'Jumper Finger Pulse Oximeter JPD-500E', 'admin', 12, 42, 48, 40, NULL, '[\"uploads\\/products\\/photos\\/puOmDE63Us6UCwn156xYjkus63qxwEepddcbpskA.jpeg\",\"uploads\\/products\\/photos\\/V59tMsTZBRNOpDGA2NgbXqvLHNY2nPimwgQDpmeT.jpeg\",\"uploads\\/products\\/photos\\/URPJyUWtaTDk6SvalUuOezEcglY1LiDJra4Y9E01.png\"]', 'uploads/products/thumbnail/GcCeglWW1bXeTqF2VJwsz6zEhd293LqFRLPCpFN1.jpeg', 'uploads/products/featured/8qHpxRmiVSzSh4jJJXELx2MZTu27iZCsrT6LTkBh.jpeg', 'uploads/products/flash_deal/rFZATcUIB6xGqCOzoAjfSyzOzoiKUsfU4sQXhLTE.jpeg', 'youtube', NULL, 'Jumper Finger Pulse Oximeter JPD-500E', '<p><span style=\"color: rgb(102, 102, 102); font-family: &quot;work sans&quot;, Arial, sans-serif; font-weight: 600;\">Jumper Pulse Oximeter JPD-500E Integrated with SPO2 probe and processing display module. Small in volume、light in weight and convenient in carrying. Operation of the product is simple ,low power consumption. SPO2 , PR and Ridisplay,. Pulse rate value display, bar graph display. Low-voltage indication: low-voltage indicator appears before working abnormally which is due to low-voltage. Automatically power off function: when the device is under the state of measuring interface . it will automatically power off within 5 seconds if the finger falls out of probe.</span></p><p><u><strong>Quick Details:</strong></u></p><p><br></p><ul style=\"box-sizing: border-box; list-style-type: square; padding-left: 20px; color: rgb(102, 102, 102); font-family: &quot;work sans&quot;, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 600; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><li style=\"box-sizing: border-box; margin-bottom: 7px;\">Integrated with SPO2 probe and processing display module.</li><li style=\"box-sizing: border-box; margin-bottom: 7px;\">Small in volume, light in weight and convenient in carrying.</li><li style=\"box-sizing: border-box; margin-bottom: 7px;\">Operation of the product is simple, lower power consumption.</li><li style=\"box-sizing: border-box; margin-bottom: 7px;\">SPO2 and PR and Perfusion Index display.</li><li style=\"box-sizing: border-box; margin-bottom: 7px;\">Pulse rate display, bar graph display.</li><li style=\"box-sizing: border-box; margin-bottom: 7px;\">Lower battery indication.</li><li style=\"box-sizing: border-box; margin-bottom: 7px;\">Various color of cover can be selected.</li><li style=\"box-sizing: border-box; margin-bottom: 7px;\">Auto shut off when no signal after 10s.</li><li style=\"box-sizing: border-box; margin-bottom: 7px;\">LED display, Adjustable brightness.</li><li style=\"box-sizing: border-box; margin-bottom: 7px;\">SPO2: 35-100%</li><li style=\"box-sizing: border-box; margin-bottom: 7px;\">Pulse Ratio: 25-250BPM</li><li style=\"box-sizing: border-box; margin-bottom: 7px;\">Resolution: 1% for SPO2, 1BPM for pulse ratio</li><li style=\"box-sizing: border-box; margin-bottom: 7px;\">Accuracy:±1%(70%-100%), unspecified(&lt;70%) for SPO2,±1BPM or ±1(select larger) for pulse ratio</li><li style=\"box-sizing: border-box; margin-bottom: 7px;\">Power: 1.5V(AAA size) alkaline batteries×2</li><li style=\"box-sizing: border-box; margin-bottom: 7px;\">Size: 62.0×37×32mm</li></ul><p></p>', 2999.00, 2999.00, 0, '[]', '[]', '[]', NULL, 0, 0, 0, 1000, 1, 8, 'Piece', 1, 10.00, 'percent', 0.00, 'amount', 'flat_rate', 100.00, 0.00, 0, 'Jumper Finger Pulse Oximeter JPD-500E', 'Jumper Pulse Oximeter JPD-500E Integrated with SPO2 probe and processing display module. Small in volume、light in weight and convenient in carrying. Operation of the product is simple ,low power consumption. SPO2 , PR and Ridisplay,. Pulse rate value display, bar graph display. Low-voltage indication: low-voltage indicator appears before working abnormally which is due to low-voltage. Automatically power off function: when the device is under the state of measuring interface . it will automatically power off within 5 seconds if the finger falls out of probe.', 'uploads/products/meta/rghyRw5XBpYdnVKYvbMAGy1KEIrgYNtUENqqY8iH.png', NULL, 'Jumper-Finger-Pulse-Oximeter-JPD-500E-4qk9y', 0, 0.00, 0.00, NULL, 0, NULL, NULL, '2020-06-17 00:56:13', '2020-07-06 20:34:00'),
(29, 'KSL KN95 face MaskCE Certified', 'admin', 12, 42, 43, 367, NULL, '[\"uploads\\/products\\/photos\\/NrMHMqRlMXhKbafXpPYAd2CiCO31WFO2GrOhi8iD.jpeg\",\"uploads\\/products\\/photos\\/gX35dHOpZUYriYI3ZKDty7YCtxsi4pU6bAOobisc.jpeg\"]', 'uploads/products/thumbnail/9rYnVFtgydjALDiyDO4sSRdmbsv4hJ5Aa0gTjR1N.jpeg', 'uploads/products/featured/9pUeGQ6feyYgrIZ1M9NotHIf4J7k4EvQI9dJRHfc.jpeg', 'uploads/products/flash_deal/5A1EKtkoXpJXe9nXYA2m7VMqzfjGsYM9mryaXUaL.jpeg', 'youtube', NULL, 'KSL KN95 face MaskCE Certified', '<p style=\"box-sizing: content-box; margin: 0px; padding: 8px 0px; border: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: 700; font-stretch: inherit; font-size: 14px; line-height: 14px; font-family: Roboto, Helvetica, Tahoma, Arial, &quot;Microsoft YaHei&quot;; vertical-align: baseline; color: rgb(51, 51, 51); letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><br></p><div class=\"col-xs-6 col-sm-6 col-md-6 product-del-speed-text\" id=\"FixedProductChargeInsideDhk\" style=\"box-sizing: border-box; float: left; position: relative; min-height: 1px; padding-right: 0px; padding-left: 0px; width: 371.656px; font-size: 18px; font-family: SolaimanLipi, Helvetica, Verdana, sans-serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;\"><font color=\"#333333\"><span style=\"border-style: initial; border-color: initial; border-image: initial;\"><img src=\"https://static.ajkerdeal.com/images/arrow/inside-dhaka-product-charge.png\" style=\"box-sizing: border-box; border: 0px; vertical-align: middle; width: 40px;\"></span></font><span style=\"color: rgb(51, 51, 51);\">&nbsp;</span><font color=\"#333333\">Delivery charge inside dhaka&nbsp;</font><font color=\"#f05a28\">100</font><span style=\"color: rgb(51, 51, 51);\">&nbsp;</span><font color=\"#333333\">Taka</font></div><div class=\"col-xs-6 col-sm-6 col-md-6 product-del-speed-text\" id=\"FixedProductChargeOutsideDhk\" style=\"box-sizing: border-box; float: left; position: relative; min-height: 1px; padding-right: 0px; padding-left: 0px; width: 371.656px; font-size: 18px; font-family: SolaimanLipi, Helvetica, Verdana, sans-serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;\"><font color=\"#333333\"><span style=\"border-style: initial; border-color: initial; border-image: initial;\"><img src=\"https://static.ajkerdeal.com/images/arrow/outside-dhaka-product-charge.png\" style=\"box-sizing: border-box; border: 0px; vertical-align: middle; width: 40px;\"></span></font><span style=\"color: rgb(51, 51, 51);\">&nbsp;</span><font color=\"#333333\">Delivery charge outside dhaka&nbsp;</font><font color=\"#f05a28\">150</font><span style=\"color: rgb(51, 51, 51);\">&nbsp;</span><font color=\"#333333\">Taka</font></div><br><p><br></p><p style=\"box-sizing: content-box; margin: 0px; padding: 8px 0px; border: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: 700; font-stretch: inherit; font-size: 14px; line-height: 14px; font-family: Roboto, Helvetica, Tahoma, Arial, &quot;Microsoft YaHei&quot;; vertical-align: baseline; color: rgb(51, 51, 51); letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><br></p><p style=\"box-sizing: content-box; margin: 0px; padding: 8px 0px; border: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: 700; font-stretch: inherit; font-size: 14px; line-height: 14px; font-family: Roboto, Helvetica, Tahoma, Arial, &quot;Microsoft YaHei&quot;; vertical-align: baseline; color: rgb(51, 51, 51); letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><br></p><table align=\"center\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"box-sizing: border-box; border-spacing: 0px; border-collapse: collapse; background-color: rgb(255, 255, 255); color: rgb(40, 40, 40); font-family: Raleway, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;\"><tbody style=\"box-sizing: border-box;\"><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">Product</td><td style=\"box-sizing: border-box; padding: 0px;\">Antivirus mask KN95 mask</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">Material</td><td style=\"box-sizing: border-box; padding: 0px;\">PP nonwoven, activated carbon layer, melt blown filter, soft cotton, PP nonwoven</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">Size</td><td style=\"box-sizing: border-box; padding: 0px;\">10.5x15.5cm or customized</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">Colour</td><td style=\"box-sizing: border-box; padding: 0px;\">white/gray / black /</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">Certificate</td><td style=\"box-sizing: border-box; padding: 0px;\">CE, FDA, ISO</td></tr><tr style=\"box-sizing: border-box;\"><td rowspan=\"3\" style=\"box-sizing: border-box; padding: 0px;\">Standard</td><td style=\"box-sizing: border-box; padding: 0px;\">GB2626-2006</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">EN149:2001</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">ISO 9001:2015 International Quality</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">MOQ</td><td style=\"box-sizing: border-box; padding: 0px;\">10pcs</td></tr></tbody></table><p><br></p><div class=\"do-entry-title\" data-spm-anchor-id=\"a2700.wholesale.prilinga1e.i1.125d5a5ckdUhj0\" style=\"box-sizing: content-box; margin: 0px; padding: 8px 0px; border: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: 700; font-stretch: inherit; font-size: 14px; line-height: 14px; font-family: Roboto, Helvetica, Tahoma, Arial, &quot;Microsoft YaHei&quot;; vertical-align: baseline; color: rgb(51, 51, 51); letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\">Quick Details</div><div class=\"do-entry-list\" style=\"box-sizing: border-box; margin: 0px -20px; padding: 0px; border: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: 400; font-stretch: inherit; font-size: 12px; line-height: inherit; font-family: Roboto, Helvetica, Tahoma, Arial, &quot;Microsoft YaHei&quot;; vertical-align: baseline; color: rgb(51, 51, 51); letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><dl class=\"do-entry-item\" id=\"1\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Place of Origin\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Place of Origin:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"Zhejiang, China\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; overflow-wrap: normal; white-space: nowrap; text-overflow: ellipsis; width: 330px;\">Zhejiang, China</div></dd></dl><dl class=\"do-entry-item\" id=\"2\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Brand Name\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Brand Name:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"oem\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; overflow-wrap: normal; white-space: nowrap; text-overflow: ellipsis; width: 330px;\">KSL</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Color\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\"><span style=\"font-family: inherit; font-size: inherit; font-style: inherit; font-variant-ligatures: inherit; font-variant-caps: inherit; font-weight: inherit;\">Quality:</span>Color:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"white, blue\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; overflow-wrap: normal; white-space: nowrap; text-overflow: ellipsis; width: 330px;\">white, Black</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"Top high,Green,Eco-friendly\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; overflow-wrap: normal; white-space: nowrap; text-overflow: ellipsis; width: 330px;\">Top high,Green,Eco-friendly</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Material\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Material:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"3 ply non woven\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; overflow-wrap: normal; white-space: nowrap; text-overflow: ellipsis; width: 330px;\">5 ply non woven</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Usage\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Usage:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"AGANIST VIRUS\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; overflow-wrap: normal; white-space: nowrap; text-overflow: ellipsis; width: 330px;\">AGANIST VIRUS</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"feature\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">feature:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"AGANIST VIRUS\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; overflow-wrap: normal; white-space: nowrap; text-overflow: ellipsis; width: 330px;\">AGANIST VIRUS</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"package\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">package:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"Custom Designs Unique Logo\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; overflow-wrap: normal; white-space: nowrap; text-overflow: ellipsis; width: 330px;\">Custom Designs Unique Logo</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"advantage\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">advantage:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"3 layer\" data-spm-anchor-id=\"a2700.wholesale.prilinga1e.i0.125d5a5ckdUhj0\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; overflow-wrap: normal; white-space: nowrap; text-overflow: ellipsis; width: 330px;\">5 layer</div><p style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; overflow-wrap: normal; white-space: nowrap; text-overflow: ellipsis; width: 330px;\"><br></p><p style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; overflow-wrap: normal; white-space: nowrap; text-overflow: ellipsis; width: 330px;\">\r\n</p><p><br></p></dd></dl></div>', 1300.00, 1300.00, 0, '[]', '[]', '[]', NULL, 0, 0, 0, 998, 2, 25, 'Box', 1, 20.00, 'percent', 0.00, 'amount', 'flat_rate', 100.00, 0.00, 5, 'KSL KN95 face MaskCE Certified', 'KN95 Mask Delivery charge inside dhaka 100 Taka Delivery charge outside dhaka 150 TakaProductAntivirus mask KN95 maskMaterialPP nonwoven, activated carbon layer, melt blown filter, soft cotton, PP nonwovenSize10.5x15.5cm or customizedColourwhite/gray / black /CertificateCE, FDA, ISOStandardGB2626-2006EN149:2001ISO 9001:2015 International QualityMOQ10pcs﻿﻿Quick DetailsPlace of Origin:Zhejiang, ChinaBrand Name:CFQuality:Color:white, BlackTop high,Green,Eco-friendlyMaterial:3 ply non wovenUsage:AGANIST VIRUSfeature:AGANIST VIRUSpackage:Custom Designs Unique Logoadvantage:3 layer﻿', 'uploads/products/meta/qtDPyXCFFCLj4ZS8pBGt8EOYFEBC6ASdjTjcGXal.jpeg', NULL, 'KSL-KN95-face-MaskCE-Certified-vNuFe', 0, 0.00, 0.00, NULL, 0, NULL, NULL, '2020-06-17 11:43:19', '2020-07-06 20:35:48');
INSERT INTO `products` (`id`, `name`, `added_by`, `user_id`, `category_id`, `subcategory_id`, `subsubcategory_id`, `brand_id`, `photos`, `thumbnail_img`, `featured_img`, `flash_deal_img`, `video_provider`, `video_link`, `tags`, `description`, `unit_price`, `purchase_price`, `variant_product`, `attributes`, `choice_options`, `colors`, `variations`, `todays_deal`, `published`, `featured`, `current_stock`, `min_stock`, `max_stock`, `unit`, `min_qty`, `discount`, `discount_type`, `tax`, `tax_type`, `shipping_type`, `shipping_cost`, `outside_shipping_cost`, `num_of_sale`, `meta_title`, `meta_description`, `meta_img`, `pdf`, `slug`, `refundable`, `earn_point`, `rating`, `barcode`, `digital`, `file_name`, `file_path`, `created_at`, `updated_at`) VALUES
(30, 'Maccon KN95 face Mask CE Certified', 'admin', 12, 42, 43, 367, NULL, '[\"uploads\\/products\\/photos\\/ZysG55mqWIul1m6eWiPDgVEU8bdr6qfacWAu8mFq.jpeg\",\"uploads\\/products\\/photos\\/oSyiDRQcRxaqOoHpF6SC5vce2hYTvqzu7mPY4Ulj.jpeg\",\"uploads\\/products\\/photos\\/tUTRGCgH3B3itGsdtIwsPe4l4i7E0a57qVwd07nC.jpeg\"]', 'uploads/products/thumbnail/Txvk8n1EKdrdhQxlOUxRM2wULjeEIdEbEnLt8Y6v.jpeg', 'uploads/products/featured/TeKsK57dgNQM6U3qc7g6InkOHaNMHFDtzeuChhmF.jpeg', 'uploads/products/flash_deal/wL4jZopLWCLuZNVNOcmKTZfEQpfkUW2Gc8ZNt4QL.jpeg', 'youtube', NULL, 'Maccon KN95 face MaskCE Certified', '<p style=\"box-sizing: content-box; margin: 0px; padding: 8px 0px; border: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: 700; font-stretch: inherit; font-size: 14px; line-height: 14px; font-family: Roboto, Helvetica, Tahoma, Arial, &quot;Microsoft YaHei&quot;; vertical-align: baseline; color: rgb(51, 51, 51); letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><br></p><div class=\"col-xs-6 col-sm-6 col-md-6 product-del-speed-text\" id=\"FixedProductChargeInsideDhk\" style=\"box-sizing: border-box; float: left; position: relative; min-height: 1px; padding-right: 0px; padding-left: 0px; width: 371.656px; font-size: 18px; font-family: SolaimanLipi, Helvetica, Verdana, sans-serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;\"><font color=\"#333333\"><span style=\"border-style: initial; border-color: initial; border-image: initial;\"><img src=\"https://static.ajkerdeal.com/images/arrow/inside-dhaka-product-charge.png\" style=\"box-sizing: border-box; border: 0px; vertical-align: middle; width: 40px;\"></span></font><span style=\"color: rgb(51, 51, 51);\">&nbsp;</span><font color=\"#333333\">Delivery charge inside dhaka&nbsp;</font><font color=\"#f05a28\">100</font><span style=\"color: rgb(51, 51, 51);\">&nbsp;</span><font color=\"#333333\">Taka</font></div><div class=\"col-xs-6 col-sm-6 col-md-6 product-del-speed-text\" id=\"FixedProductChargeOutsideDhk\" style=\"box-sizing: border-box; float: left; position: relative; min-height: 1px; padding-right: 0px; padding-left: 0px; width: 371.656px; font-size: 18px; font-family: SolaimanLipi, Helvetica, Verdana, sans-serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;\"><font color=\"#333333\"><span style=\"border-style: initial; border-color: initial; border-image: initial;\"><img src=\"https://static.ajkerdeal.com/images/arrow/outside-dhaka-product-charge.png\" style=\"box-sizing: border-box; border: 0px; vertical-align: middle; width: 40px;\"></span></font><span style=\"color: rgb(51, 51, 51);\">&nbsp;</span><font color=\"#333333\">Delivery charge outside dhaka&nbsp;</font><font color=\"#f05a28\">150</font><span style=\"color: rgb(51, 51, 51);\">&nbsp;</span><font color=\"#333333\">Taka</font></div><br><p><br></p><p style=\"box-sizing: content-box; margin: 0px; padding: 8px 0px; border: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: 700; font-stretch: inherit; font-size: 14px; line-height: 14px; font-family: Roboto, Helvetica, Tahoma, Arial, &quot;Microsoft YaHei&quot;; vertical-align: baseline; color: rgb(51, 51, 51); letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><br></p><p style=\"box-sizing: content-box; margin: 0px; padding: 8px 0px; border: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: 700; font-stretch: inherit; font-size: 14px; line-height: 14px; font-family: Roboto, Helvetica, Tahoma, Arial, &quot;Microsoft YaHei&quot;; vertical-align: baseline; color: rgb(51, 51, 51); letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><br></p><table align=\"center\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"box-sizing: border-box; border-spacing: 0px; border-collapse: collapse; background-color: rgb(255, 255, 255); color: rgb(40, 40, 40); font-family: Raleway, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;\"><tbody style=\"box-sizing: border-box;\"><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">Product</td><td style=\"box-sizing: border-box; padding: 0px;\">Antivirus mask KN95 mask</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">Material</td><td style=\"box-sizing: border-box; padding: 0px;\">PP nonwoven, activated carbon layer, melt blown filter, soft cotton, PP nonwoven</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">Size</td><td style=\"box-sizing: border-box; padding: 0px;\">10.5x15.5cm or customized</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">Colour</td><td style=\"box-sizing: border-box; padding: 0px;\">white/gray / black /</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">Certificate</td><td style=\"box-sizing: border-box; padding: 0px;\">CE, FDA, ISO</td></tr><tr style=\"box-sizing: border-box;\"><td rowspan=\"3\" style=\"box-sizing: border-box; padding: 0px;\">Standard</td><td style=\"box-sizing: border-box; padding: 0px;\">GB2626-2006</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">EN149:2001</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">ISO 9001:2015 International Quality</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">MOQ</td><td style=\"box-sizing: border-box; padding: 0px;\">10pcs</td></tr></tbody></table><p><br></p><div class=\"do-entry-title\" data-spm-anchor-id=\"a2700.wholesale.prilinga1e.i1.125d5a5ckdUhj0\" style=\"box-sizing: content-box; margin: 0px; padding: 8px 0px; border: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: 700; font-stretch: inherit; font-size: 14px; line-height: 14px; font-family: Roboto, Helvetica, Tahoma, Arial, &quot;Microsoft YaHei&quot;; vertical-align: baseline; color: rgb(51, 51, 51); letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\">Quick Details</div><div class=\"do-entry-list\" style=\"box-sizing: border-box; margin: 0px -20px; padding: 0px; border: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: 400; font-stretch: inherit; font-size: 12px; line-height: inherit; font-family: Roboto, Helvetica, Tahoma, Arial, &quot;Microsoft YaHei&quot;; vertical-align: baseline; color: rgb(51, 51, 51); letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><dl class=\"do-entry-item\" id=\"1\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Place of Origin\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Place of Origin:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"Zhejiang, China\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; overflow-wrap: normal; white-space: nowrap; text-overflow: ellipsis; width: 330px;\">Zhejiang, China</div></dd></dl><dl class=\"do-entry-item\" id=\"2\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Brand Name\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Brand Name:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"oem\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; overflow-wrap: normal; white-space: nowrap; text-overflow: ellipsis; width: 330px;\">Maccon</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Color\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\"><span style=\"font-family: inherit; font-size: inherit; font-style: inherit; font-variant-ligatures: inherit; font-variant-caps: inherit; font-weight: inherit;\">Quality:</span>Color:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"white, blue\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; overflow-wrap: normal; white-space: nowrap; text-overflow: ellipsis; width: 330px;\">white, Black</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"Top high,Green,Eco-friendly\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; overflow-wrap: normal; white-space: nowrap; text-overflow: ellipsis; width: 330px;\">Top high,Green,Eco-friendly</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Material\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Material:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"3 ply non woven\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; overflow-wrap: normal; white-space: nowrap; text-overflow: ellipsis; width: 330px;\">5 ply non woven</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Usage\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Usage:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"AGANIST VIRUS\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; overflow-wrap: normal; white-space: nowrap; text-overflow: ellipsis; width: 330px;\">AGANIST VIRUS</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"feature\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">feature:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"AGANIST VIRUS\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; overflow-wrap: normal; white-space: nowrap; text-overflow: ellipsis; width: 330px;\">AGANIST VIRUS</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"package\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">package:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"Custom Designs Unique Logo\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; overflow-wrap: normal; white-space: nowrap; text-overflow: ellipsis; width: 330px;\">Custom Designs Unique Logo</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"advantage\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">advantage:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"3 layer\" data-spm-anchor-id=\"a2700.wholesale.prilinga1e.i0.125d5a5ckdUhj0\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; overflow-wrap: normal; white-space: nowrap; text-overflow: ellipsis; width: 330px;\">5 layer</div><p style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; overflow-wrap: normal; white-space: nowrap; text-overflow: ellipsis; width: 330px;\"><br></p><p style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; overflow-wrap: normal; white-space: nowrap; text-overflow: ellipsis; width: 330px;\">\r\n</p><p><br></p></dd></dl></div>', 1500.00, 1500.00, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 998, 2, 1000, 'Box', 1, 50.00, 'percent', 0.00, 'amount', 'free', 0.00, 0.00, 7, 'Maccon KN95 face Mask CE Certified', 'KN95 Mask Delivery charge inside dhaka 100 Taka Delivery charge outside dhaka 150 TakaProductAntivirus mask KN95 maskMaterialPP nonwoven, activated carbon layer, melt blown filter, soft cotton, PP nonwovenSize10.5x15.5cm or customizedColourwhite/gray / black /CertificateCE, FDA, ISOStandardGB2626-2006EN149:2001ISO 9001:2015 International QualityMOQ10pcs﻿﻿Quick DetailsPlace of Origin:Zhejiang, ChinaBrand Name:Maccon Quality:Color:white, BlackTop high,Green,Eco-friendlyMaterial:5ply non wovenUsage:AGANIST VIRUSfeature:AGANIST VIRUSpackage:Custom Designs Unique Logoadvantage:3 layer﻿', 'uploads/products/meta/Zt6Wf5npqUdzsupa5V3PbJ9f7zNPrZJb5i2m4aIY.jpeg', NULL, 'Maccon-KN95-face-Mask-CE-Certified-juNdN', 0, 0.00, 0.00, NULL, 0, NULL, NULL, '2020-06-17 11:43:19', '2020-09-06 17:18:21'),
(31, '3 ply disposable surgical Mask ( Local production)', 'admin', 12, 42, 43, 367, NULL, '[\"uploads\\/products\\/photos\\/eNVBsAaejllJQWTZU66tD6aOe1Lj5SlGr6xg8QkK.png\",\"uploads\\/products\\/photos\\/PbKhS8t9RcrlmD3imjMWiP6xj6dl36bURPAlgE8d.jpeg\",\"uploads\\/products\\/photos\\/bxlOByZvjAHwqA24LpjU1c8KCBurDaN8mRgOmDXw.jpeg\"]', 'uploads/products/thumbnail/Dr6jf6euawfJGO8mHLu0RBQiYCyktqKgAglAqNhx.png', 'uploads/products/featured/6DhB1VraSH4PN5TxJU7Edzfel6L14odMxQlSjIc3.png', 'uploads/products/flash_deal/RxVuDFG2QkxdWxOmZl4yjFw1aE6DXsvt8PsP0oFr.png', 'youtube', NULL, '3 ply disposable surgical Mask', '<p class=\"MsoNormal\" style=\"box-sizing: border-box; outline: none !important; margin: 0px 0px 10px; color: rgb(102, 102, 102); font-family: Muli, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><span style=\"box-sizing: border-box; outline: none !important; font-family: Arial; font-size: 10.5pt;\">Material : Comes form China&nbsp;</span></p><p class=\"MsoNormal\" style=\"box-sizing: border-box; outline: none !important; margin: 0px 0px 10px; color: rgb(102, 102, 102); font-family: Muli, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><span style=\"box-sizing: border-box; outline: none !important; font-family: Arial; font-size: 10.5pt;\">Production: Bangladesh</span></p><p class=\"MsoNormal\" style=\"box-sizing: border-box; outline: none !important; margin: 0px 0px 10px; color: rgb(102, 102, 102); font-family: Muli, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><span style=\"box-sizing: border-box; outline: none !important; font-family: Arial; font-size: 10.5pt;\">50 Disposable Medical Face Masks Sanitary Dental Surgical Hypoallergenic with Elastic Ear Loops 3-Ply Thick Resistance to Fluid &amp; Blood Cotton Filter for Pollen Allergies &amp; Dust<span style=\"box-sizing: border-box; outline: none !important; font-family: Arial; font-size: 10.5pt;\"><o:p style=\"box-sizing: border-box; outline: none !important;\">&nbsp;</o:p></span></span></p><p class=\"MsoNormal\" style=\"box-sizing: border-box; outline: none !important; margin: 0px 0px 10px; color: rgb(102, 102, 102); font-family: Muli, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><span style=\"box-sizing: border-box; outline: none !important; font-family: Arial; font-size: 10.5pt;\">•SUPERIOR QUALITY – Mask is made of non-woven fabric for easy breathability, 99% BFE, 99% PFE Class I Flammability 80 mmHg Fluid Resistance to Blood<span style=\"box-sizing: border-box; outline: none !important; font-family: Arial; font-size: 10.5pt;\"><o:p style=\"box-sizing: border-box; outline: none !important;\">&nbsp;</o:p></span></span></p><p class=\"MsoNormal\" style=\"box-sizing: border-box; outline: none !important; margin: 0px 0px 10px; color: rgb(102, 102, 102); font-family: Muli, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><span style=\"box-sizing: border-box; outline: none !important; font-family: Arial; font-size: 10.5pt;\">•EASY TO USE – Very low resistance to breathing, soft, odorless, does not irritate the skin, 3 layers pleated design gives users cooler, more comfortable performance than other designs currently on the market and makes it thick enough to protect from dust, bacteria, smoke and pollen<span style=\"box-sizing: border-box; outline: none !important; font-family: Arial; font-size: 10.5pt;\"><o:p style=\"box-sizing: border-box; outline: none !important;\">&nbsp;</o:p></span></span></p><p class=\"MsoNormal\" style=\"box-sizing: border-box; outline: none !important; margin: 0px 0px 10px; color: rgb(102, 102, 102); font-family: Muli, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><span style=\"box-sizing: border-box; outline: none !important; font-family: Arial; font-size: 10.5pt;\">•SAFETY &amp; STERILE – Comfortable elastic earloop eliminates pressure to the ears; sensitive inner layer made of soft facial tissue, no dye, no chemical, gentle to the skin<span style=\"box-sizing: border-box; outline: none !important; font-family: Arial; font-size: 10.5pt;\"><o:p style=\"box-sizing: border-box; outline: none !important;\">&nbsp;</o:p></span></span></p><p class=\"MsoNormal\" style=\"box-sizing: border-box; outline: none !important; margin: 0px 0px 10px; color: rgb(102, 102, 102); font-family: Muli, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><span style=\"box-sizing: border-box; outline: none !important; font-family: Arial; font-size: 10.5pt;\">•HIGHLY VERSATILE – Disposable face masks are suitable for medical, dental, hospital, food processing, builder, farmer, cleaner, gardening, painting, construction, beauty, nail, pet, outdoor and other anti-bacterial dust, fog &amp; snow weather, flu season, anti-pollen allergy health and environment use</span></p>', 250.00, 250.00, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 9998, 2, 150, 'Box', 1, 15.00, 'percent', 0.00, 'amount', 'free', 0.00, 0.00, 6, '3 ply disposable surgical Mask', 'Material : Comes form China Production: Bangladesh50 Disposable Medical Face Masks Sanitary Dental Surgical Hypoallergenic with Elastic Ear Loops 3-Ply Thick Resistance to Fluid & Blood Cotton Filter for Pollen Allergies & Dust •SUPERIOR QUALITY – Mask is made of non-woven fabric for easy breathability, 99% BFE, 99% PFE Class I Flammability 80 mmHg Fluid Resistance to Blood •EASY TO USE – Very low resistance to breathing, soft, odorless, does not irritate the skin, 3 layers pleated design gives users cooler, more comfortable performance than other designs currently on the market and makes it thick enough to protect from dust, bacteria, smoke and pollen •SAFETY & STERILE – Comfortable elastic earloop eliminates pressure to the ears; sensitive inner layer made of soft facial tissue, no dye, no chemical, gentle to the skin •HIGHLY VERSATILE – Disposable face masks are suitable for medical, dental, hospital, food processing, builder, farmer, cleaner, gardening, painting, construction, beauty, nail, pet, outdoor and other anti-bacterial dust, fog & snow weather, flu season, anti-pollen allergy health and environment use.', 'uploads/products/meta/3SoGnR0lxhjQ0NgKKIAEsW2P3Ve8OLmKRdyDged5.jpeg', NULL, '3-ply-disposable-surgical-Mask--Local-production-PMQTV', 0, 0.00, 0.00, NULL, 0, NULL, NULL, '2020-06-19 14:26:22', '2020-07-14 19:51:01');
INSERT INTO `products` (`id`, `name`, `added_by`, `user_id`, `category_id`, `subcategory_id`, `subsubcategory_id`, `brand_id`, `photos`, `thumbnail_img`, `featured_img`, `flash_deal_img`, `video_provider`, `video_link`, `tags`, `description`, `unit_price`, `purchase_price`, `variant_product`, `attributes`, `choice_options`, `colors`, `variations`, `todays_deal`, `published`, `featured`, `current_stock`, `min_stock`, `max_stock`, `unit`, `min_qty`, `discount`, `discount_type`, `tax`, `tax_type`, `shipping_type`, `shipping_cost`, `outside_shipping_cost`, `num_of_sale`, `meta_title`, `meta_description`, `meta_img`, `pdf`, `slug`, `refundable`, `earn_point`, `rating`, `barcode`, `digital`, `file_name`, `file_path`, `created_at`, `updated_at`) VALUES
(32, 'Modified Snorkel Pneumask with 10pc filter paper', 'admin', 12, 42, 43, 367, NULL, '[\"uploads\\/products\\/photos\\/4MiDP9joWrGdspkq8EoYSlPYu9T5ZcFRWzHdW5uj.jpeg\",\"uploads\\/products\\/photos\\/ZmNQA0EPcd5eBSff5MP7X9aDE5fwBz6K8EiGE7yR.jpeg\",\"uploads\\/products\\/photos\\/IGzSqtkBQuoOLWReIe2TUZ6PtoERhgc4MWXpnPmJ.jpeg\",\"uploads\\/products\\/photos\\/42xFHpgmYw5ZUGdjbzecktdGEdfCsEurlVh431PO.jpeg\",\"uploads\\/products\\/photos\\/4KOXyr9gLSvRwqSeT4O24SJehcnrXMJpNO3RLdJr.jpeg\"]', 'uploads/products/thumbnail/M1cUrYMY2fXzzKcQuGBhogXS7zif0ilo7jNtkZpr.jpeg', 'uploads/products/featured/4MXSfJnm55W1BdfG0646SlT6bnMcXI4jvoHCd91Z.jpeg', 'uploads/products/flash_deal/QJ7Aw5YtEP4CzSVR3uDejuVihYQoiF2qB8kpKlqy.jpeg', 'youtube', NULL, 'Modified Snorkel Pneumask with10pc filter paper', '<dl class=\"do-entry-item\" id=\"1\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: 400; font-stretch: inherit; font-size: 12px; line-height: inherit; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Tahoma, Arial, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;; vertical-align: baseline; width: 480px; zoom: 1; float: left; color: rgb(51, 51, 51); letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Place of Origin\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Place of Origin:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"Guangdong, China\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">Guangdong, China</div></dd></dl><dl class=\"do-entry-item\" id=\"2\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: 400; font-stretch: inherit; font-size: 12px; line-height: inherit; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Tahoma, Arial, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;; vertical-align: baseline; width: 480px; zoom: 1; float: left; color: rgb(51, 51, 51); letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Brand Name\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Brand Name:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"Bingcell\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">Bingcell</div></dd></dl><dl class=\"do-entry-item\" id=\"3\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: 400; font-stretch: inherit; font-size: 12px; line-height: inherit; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Tahoma, Arial, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;; vertical-align: baseline; width: 480px; zoom: 1; float: left; color: rgb(51, 51, 51); letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Model Number\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Model Number:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"BC-Mask2\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">BC-Mask2</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: 400; font-stretch: inherit; font-size: 12px; line-height: inherit; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Tahoma, Arial, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;; vertical-align: baseline; width: 480px; zoom: 1; float: left; color: rgb(51, 51, 51); letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Product name\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Product name:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"Wholesale Dive Diving Best Snorkeling Full Face Snorkel Mask\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">Modified Snorkel Pneumask with 10pc filter paper</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: 400; font-stretch: inherit; font-size: 12px; line-height: inherit; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Tahoma, Arial, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;; vertical-align: baseline; width: 480px; zoom: 1; float: left; color: rgb(51, 51, 51); letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Usage\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Usage:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"Snorkeling Swimming Diving\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">Snorkeling.</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: 400; font-stretch: inherit; font-size: 12px; line-height: inherit; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Tahoma, Arial, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;; vertical-align: baseline; width: 480px; zoom: 1; float: left; color: rgb(51, 51, 51); letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Colors\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Colors:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"Black,blue,pink,red,green,grey or Customzied\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">Black,blue,pink,red,green,grey or Customzied</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: 400; font-stretch: inherit; font-size: 12px; line-height: inherit; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Tahoma, Arial, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;; vertical-align: baseline; width: 480px; zoom: 1; float: left; color: rgb(51, 51, 51); letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Certificate\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Certificate:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"CE,EU Patent,US Patent,Hongkong Patent,China Patent\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">CE,EU Patent,US Patent,Hongkong Patent,China Patent</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: 400; font-stretch: inherit; font-size: 12px; line-height: inherit; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Tahoma, Arial, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;; vertical-align: baseline; width: 480px; zoom: 1; float: left; color: rgb(51, 51, 51); letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Feature\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Feature:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"Anti fog, Waterproof,easy wear\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">Anti fog, Waterproof,easy wear</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: 400; font-stretch: inherit; font-size: 12px; line-height: inherit; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Tahoma, Arial, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;; vertical-align: baseline; width: 480px; zoom: 1; float: left; color: rgb(51, 51, 51); letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Material\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Material:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"Silicone+PC\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">Silicone+PC</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: 400; font-stretch: inherit; font-size: 12px; line-height: inherit; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Tahoma, Arial, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;; vertical-align: baseline; width: 480px; zoom: 1; float: left; color: rgb(51, 51, 51); letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Size\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Size:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"S/M, L/XL\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">S/M, L/XL</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: 400; font-stretch: inherit; font-size: 12px; line-height: inherit; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Tahoma, Arial, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;; vertical-align: baseline; width: 480px; zoom: 1; float: left; color: rgb(51, 51, 51); letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Weight\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Weight:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"600g(include Package)\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">600g(include Package)</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: 400; font-stretch: inherit; font-size: 12px; line-height: inherit; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Tahoma, Arial, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;; vertical-align: baseline; width: 480px; zoom: 1; float: left; color: rgb(51, 51, 51); letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Carton Size\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Carton Size:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"49.5*35*26.7cm\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">49.5*35*26.7cm</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: 400; font-stretch: inherit; font-size: 12px; line-height: inherit; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Tahoma, Arial, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;; vertical-align: baseline; width: 480px; zoom: 1; float: left; color: rgb(51, 51, 51); letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Caron quantity:\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\"><br></span></dt></dl>', 4200.00, 4200.00, 1, '[]', '[]', '[\"#000000\",\"#0000FF\",\"#008000\",\"#FFC0CB\"]', NULL, 1, 1, 1, 498, 1, 1000, 'Piece', 1, 20.00, 'percent', 0.00, 'amount', 'free', 0.00, 0.00, 4, 'Modified Snorkel Pneumask with 10pc filter paper', 'lace of Origin:\r\nGuangdong, China\r\nBrand Name:\r\nBingcell\r\nModel Number:\r\nBC-Mask2\r\nProduct name:\r\nModified Snorkel Pneumask\r\nUsage:\r\nSnorkel\r\nColors:\r\nBlack,blue,pink,red,green,grey or Customzied\r\nCertificate:\r\nCE,EU Patent,US Patent,Hongkong Patent,China Patent\r\nFeature:\r\nAnti fog, Waterproof,easy wear\r\nMaterial:\r\nSilicone+PC\r\nSize:\r\nS/M, L/XL\r\nWeight:\r\n600g(include Package)\r\nCarton Size:\r\n49.5*35*26.7cm\r\nCaron quantity:', 'uploads/products/meta/q42Cpok3ynJhubkvoUEbqsipxDXu9SwBHoB3YQrB.jpeg', NULL, 'Modified-Snorkel-Pneumask-with-10pc-filter-paper-7jRng', 0, 0.00, 0.00, NULL, 0, NULL, NULL, '2020-06-20 00:24:45', '2020-09-05 23:53:36');
INSERT INTO `products` (`id`, `name`, `added_by`, `user_id`, `category_id`, `subcategory_id`, `subsubcategory_id`, `brand_id`, `photos`, `thumbnail_img`, `featured_img`, `flash_deal_img`, `video_provider`, `video_link`, `tags`, `description`, `unit_price`, `purchase_price`, `variant_product`, `attributes`, `choice_options`, `colors`, `variations`, `todays_deal`, `published`, `featured`, `current_stock`, `min_stock`, `max_stock`, `unit`, `min_qty`, `discount`, `discount_type`, `tax`, `tax_type`, `shipping_type`, `shipping_cost`, `outside_shipping_cost`, `num_of_sale`, `meta_title`, `meta_description`, `meta_img`, `pdf`, `slug`, `refundable`, `earn_point`, `rating`, `barcode`, `digital`, `file_name`, `file_path`, `created_at`, `updated_at`) VALUES
(33, 'Electric disinfectant sprayer atomizer thermal disinfecting fog fogging machine', 'admin', 12, 5, 162, 373, NULL, '[\"uploads\\/products\\/photos\\/Lmvhcsvy28vPchHyP93QKBzC9zrbq6tPJKmyZtIK.jpeg\",\"uploads\\/products\\/photos\\/hRzGOMNGAUXsA4GxWEkekpFRjW9Gqe8uQMg5OiKQ.jpeg\",\"uploads\\/products\\/photos\\/a53rIT1Ce1VScQS3jUIVt8MLBbXVFApIB6FkkF7c.jpeg\",\"uploads\\/products\\/photos\\/NiGXiCHkWUVgWG4MZHCc7NR8vFdoIHAr478TFMOl.jpeg\",\"uploads\\/products\\/photos\\/4qWnCGcGPUjY1ripeEIYsHWyCqdMTgYHj7sUL9AA.jpeg\"]', 'uploads/products/thumbnail/vuj64hQbsmBDz39K5Ym42b7ZeR8naVqSjFBZpMsg.jpeg', 'uploads/products/featured/tRlFkWc5f6XgDyqgjw22mfAETcsDPuVsV05jVpoZ.jpeg', 'uploads/products/flash_deal/34tguy9hb5zxHk9dYKFjs1s18PpJW8h454egAFaW.jpeg', 'youtube', NULL, 'Disinfectant,fog machine,car disinfecting ,room disinfecting', '<div class=\"do-entry-title\" data-spm-anchor-id=\"a2700.wholesale.prilinga1e.i3.644c35f9eQXj2c\" style=\"box-sizing: content-box; margin: 0px; padding: 8px 0px; border: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: 700; font-stretch: inherit; font-size: 14px; line-height: 14px; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Tahoma, Arial, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;; vertical-align: baseline; color: rgb(51, 51, 51); letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\">Quick Details</div><div class=\"do-entry-list\" style=\"box-sizing: border-box; margin: 0px -20px; padding: 0px; border: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: 400; font-stretch: inherit; font-size: 12px; line-height: inherit; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Tahoma, Arial, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;; vertical-align: baseline; color: rgb(51, 51, 51); letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><dl class=\"do-entry-item\" id=\"6\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" data-spm-anchor-id=\"a2700.wholesale.prilinga1e.i1.644c35f9eQXj2c\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Type\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Type:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"Sprayers\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">Sprayers</div></dd></dl><dl class=\"do-entry-item\" id=\"1\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Place of Origin\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Place of Origin:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"Guangdong, China\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">Guangdong, China</div></dd></dl><dl class=\"do-entry-item\" id=\"2\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Brand Name\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Brand Name:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"custom\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">custom</div></dd></dl><dl class=\"do-entry-item\" id=\"3\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Model Number\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Model Number:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"SH-004FG\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">SH-004FG</div></dd></dl><dl class=\"do-entry-item\" id=\"20691\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Sprayer Type\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Sprayer Type:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"Knapsack\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">Knapsack</div></dd></dl><dl class=\"do-entry-item\" id=\"10\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Material\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Material:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"Plastic\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">Plastic</div></dd></dl><dl class=\"do-entry-item\" id=\"1203\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Plastic Type\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Plastic Type:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"ABS\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">ABS</div></dd></dl><dl class=\"do-entry-item\" id=\"100002149\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Usage\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Usage:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"Garden\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">Garden</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Product name\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Product name:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"Portable Electric thermal fogger/sprayer\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">Portable Electric thermal fogger/sprayer</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Color\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Color:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"White\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">White</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Function\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Function:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"Bacteria Killing\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">Bacteria Killing</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Application\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Application:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"Indoor/car\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">Indoor/car</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Certification\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Certification:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"CE\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">CE</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Voltage\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Voltage:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"AC 220V\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">AC 220V</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Power:\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Power::</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"1500W\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">1500W</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Smoke output:\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Smoke output::</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"2000 cu.ft/min\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">2000 cu.ft/min</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Warm-up time:\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Warm-up time::</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"3 Minutes\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">3 Minutes</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Effective range:\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Effective range::</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"6-8M\" data-spm-anchor-id=\"a2700.wholesale.prilinga1e.i0.644c35f9eQXj2c\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">6-8M</div></dd></dl></div><br>', 10000.00, 10000.00, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 1000, 1, 1000, 'Piece', 1, 25.00, 'percent', 0.00, 'amount', 'free', 0.00, 0.00, 0, 'Electric disinfectant sprayer atomizer thermal disinfecting fog fogging machine', 'Quick Details\r\nType:\r\nSprayers\r\nPlace of Origin:\r\nGuangdong, China\r\nBrand Name:\r\ncustom\r\nModel Number:\r\nSH-004FG\r\nSprayer Type:\r\nKnapsack\r\nMaterial:\r\nPlastic\r\nPlastic Type:\r\nABS\r\nUsage:\r\nGarden\r\nProduct name:\r\nPortable Electric thermal fogger/sprayer\r\nColor:\r\nWhite\r\nFunction:\r\nBacteria Killing\r\nApplication:\r\nIndoor/car\r\nCertification:\r\nCE\r\nVoltage:\r\nAC 220V\r\nPower::\r\n1500W\r\nSmoke output::\r\n2000 cu.ft/min\r\nWarm-up time::\r\n3 Minutes\r\nEffective range::\r\n6-8M', 'uploads/products/meta/OOxHY66sH9ysN9BqINAVHGWRwHPlRxKDeqH38JBX.jpeg', NULL, 'Electric-disinfectant-sprayer-atomizer-thermal-disinfecting-fog-fogging-machine-yHOHG', 0, 0.00, 0.00, NULL, 0, NULL, NULL, '2020-06-20 00:37:22', '2020-07-14 19:49:29'),
(34, 'LED disinfection light, germicidal UV sterilizer', 'admin', 12, 5, 162, 373, NULL, '[\"uploads\\/products\\/photos\\/VUdnNWTHaVML3ckrqTuEkuqTMKmBN7kztYZg6MLu.jpeg\",\"uploads\\/products\\/photos\\/8J43iT0h5qAoPXbXELodOdT2WI8e0QcOpEJx6cnc.jpeg\",\"uploads\\/products\\/photos\\/PSFHnybTy9cnZt0NxUGzIcF2FREQazXn1ifVnTMP.jpeg\",\"uploads\\/products\\/photos\\/DooZXU0wxsR6BK5OPjat7hLV7veBHiUj03GqxJ0j.jpeg\"]', 'uploads/products/thumbnail/wOCOOzpiTO4h1dUUM4rHyZ8BRpLCb0iFRUCNv3OL.jpeg', 'uploads/products/featured/0PjlxuADo1nYKn86AQuk3vMk6btN0qOtASUJaxMw.jpeg', 'uploads/products/flash_deal/AgmxubXp9av8YJY5IvaYYFxqfN0yRpfdV4ymZgZh.jpeg', 'youtube', NULL, 'LED disinfection light, germicidal UV sterilizer  ,room disinfecting', '<div class=\"do-entry-title\" data-spm-anchor-id=\"a2700.wholesale.prilinga1e.i2.197f114237EP30\" style=\"box-sizing: content-box; margin: 0px; padding: 8px 0px; border: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: 700; font-stretch: inherit; font-size: 14px; line-height: 14px; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Tahoma, Arial, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;; vertical-align: baseline; color: rgb(51, 51, 51); letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\">Quick Details</div><div class=\"do-entry-list\" style=\"box-sizing: border-box; margin: 0px -20px; padding: 0px; border: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: 400; font-stretch: inherit; font-size: 12px; line-height: inherit; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Tahoma, Arial, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;; vertical-align: baseline; color: rgb(51, 51, 51); letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><dl class=\"do-entry-item\" id=\"100008205\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Warranty(Year)\" data-spm-anchor-id=\"a2700.wholesale.prilinga1e.i1.197f114237EP30\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Warranty(Year):</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"3-YEAR\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">3-YEAR</div></dd></dl><dl class=\"do-entry-item\" id=\"200000865\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Support Dimmer\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Support Dimmer:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"No\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">No</div></dd></dl><dl class=\"do-entry-item\" id=\"230052848\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Lighting solutions service\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Lighting solutions service:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"Lighting and circuitry design\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">Lighting and circuitry design</div></dd></dl><dl class=\"do-entry-item\" id=\"3\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Model Number\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Model Number:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"JY-UVT002\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">JY-UVT002</div></dd></dl><dl class=\"do-entry-item\" id=\"473\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Rated Power\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Rated Power:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"60w\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">60w</div></dd></dl><dl class=\"do-entry-item\" id=\"488\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Voltage\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Voltage:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"110-240V\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">110-240V</div></dd></dl><dl class=\"do-entry-item\" id=\"139\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Application\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Application:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"HOME, MEDICAL, Hotel, Office, Air Purification\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">HOME, MEDICAL, Hotel, Office, Air Purification</div></dd></dl><dl class=\"do-entry-item\" id=\"191288028\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Power Supply\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Power Supply:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"AC\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">AC</div></dd></dl><dl class=\"do-entry-item\" id=\"210202919\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Portable\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Portable:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"Yes\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">Yes</div></dd></dl><dl class=\"do-entry-item\" id=\"200000904\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Light Source\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Light Source:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"LED\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">LED</div></dd></dl><dl class=\"do-entry-item\" id=\"236218728\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"wavelength(nm)\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">wavelength(nm):</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"395\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">395</div></dd></dl><dl class=\"do-entry-item\" id=\"200000838\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Switch Mode\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Switch Mode:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"Remote Control, Manual Button\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">Remote Control, Manual Button</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Product Name\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Product Name:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"UVC Sterilization Lamp\" data-spm-anchor-id=\"a2700.wholesale.prilinga1e.i0.197f114237EP30\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">UVC Sterilization Lamp</div></dd></dl></div><br>', 3600.00, 3600.00, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 1000, 1, 1000, 'Piece', 1, 0.00, 'percent', 0.00, 'amount', 'free', 0.00, 0.00, 0, 'LED disinfection light, germicidal UV sterilizer', 'Quick Details\r\nWarranty(Year):\r\n3-YEAR\r\nSupport Dimmer:\r\nNo\r\nLighting solutions service:\r\nLighting and circuitry design\r\nModel Number:\r\nJY-UVT002\r\nRated Power:\r\n60w\r\nVoltage:\r\n110-240V\r\nApplication:\r\nHOME, MEDICAL, Hotel, Office, Air Purification\r\nPower Supply:\r\nAC\r\nPortable:\r\nYes\r\nLight Source:\r\nLED\r\nwavelength(nm):\r\n395\r\nSwitch Mode:\r\nRemote Control, Manual Button\r\nProduct Name:\r\nUVC Sterilization Lamp', 'uploads/products/meta/kZuFPLPHYVyXtrnMWpQKPQxAJ5s2zo5G2ohyizD1.jpeg', NULL, 'LED-disinfection-light-germicidal-UV-sterilizer-UofIp', 0, 0.00, 0.00, NULL, 0, NULL, NULL, '2020-06-20 00:44:47', '2020-07-20 01:15:17');
INSERT INTO `products` (`id`, `name`, `added_by`, `user_id`, `category_id`, `subcategory_id`, `subsubcategory_id`, `brand_id`, `photos`, `thumbnail_img`, `featured_img`, `flash_deal_img`, `video_provider`, `video_link`, `tags`, `description`, `unit_price`, `purchase_price`, `variant_product`, `attributes`, `choice_options`, `colors`, `variations`, `todays_deal`, `published`, `featured`, `current_stock`, `min_stock`, `max_stock`, `unit`, `min_qty`, `discount`, `discount_type`, `tax`, `tax_type`, `shipping_type`, `shipping_cost`, `outside_shipping_cost`, `num_of_sale`, `meta_title`, `meta_description`, `meta_img`, `pdf`, `slug`, `refundable`, `earn_point`, `rating`, `barcode`, `digital`, `file_name`, `file_path`, `created_at`, `updated_at`) VALUES
(35, 'E27 15W UV disinfection, germicidal UV sterilizer Lamp', 'admin', 12, 5, 162, 373, NULL, '[\"uploads\\/products\\/photos\\/S1QlMYsa97kRYL3MuwmPovShcgdAL3LmuDLwWRay.jpeg\",\"uploads\\/products\\/photos\\/vjEE7m0imDUi2Xd2lIVsHaqCOgsQYYDCcgvXCsVg.jpeg\",\"uploads\\/products\\/photos\\/5RwPdkFPOWUsmQyXATCHOMM5WXhgt06oXymIMSiE.jpeg\",\"uploads\\/products\\/photos\\/MZ9aj0wsJQl45ljA479tpSIHcKyaOywlSnEVqFYE.jpeg\"]', 'uploads/products/thumbnail/7o3XMM2eGyrMJ3L5qUW6jv47Fv9O3uuPrBpoY1Pp.jpeg', 'uploads/products/featured/JrnARbPZ19bpFrs7dVPCY67CsknaLfipX3UTcWyR.jpeg', 'uploads/products/flash_deal/OJXv9aEldQHB0yffNfkwZ7fds2SFhmmUKicIJDMe.jpeg', 'youtube', NULL, 'germicidal UV sterilizer  ,Disinfecting Lamp', '<div class=\"do-entry-title\" data-spm-anchor-id=\"a2700.wholesale.prilinga1e.i2.4d1dbea7IcVMlu\" style=\"box-sizing: content-box; margin: 0px; padding: 8px 0px; border: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: 700; font-stretch: inherit; font-size: 14px; line-height: 14px; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Tahoma, Arial, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;; vertical-align: baseline; color: rgb(51, 51, 51); letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\">Quick Details</div><div class=\"do-entry-list\" style=\"box-sizing: border-box; margin: 0px -20px; padding: 0px; border: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: 400; font-stretch: inherit; font-size: 12px; line-height: inherit; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Tahoma, Arial, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;; vertical-align: baseline; color: rgb(51, 51, 51); letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><dl class=\"do-entry-item\" id=\"100008205\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Warranty(Year)\" data-spm-anchor-id=\"a2700.wholesale.prilinga1e.i1.4d1dbea7IcVMlu\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Warranty(Year):</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"1-year\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">7 days replacement warranty&nbsp;</div></dd></dl><dl class=\"do-entry-item\" id=\"200000865\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Support Dimmer\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Support Dimmer:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"No\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">No</div></dd></dl><dl class=\"do-entry-item\" id=\"230052848\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Lighting solutions service\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Lighting solutions service:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"Project Installation\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">Project Installation</div></dd></dl><dl class=\"do-entry-item\" id=\"230186664\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Luminous Efficacy(lm/w)\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Luminous Efficacy(lm/w):</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"110\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">110</div></dd></dl><dl class=\"do-entry-item\" id=\"1\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Place of Origin\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Place of Origin:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"Hubei, China\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">Hubei, China</div></dd></dl><dl class=\"do-entry-item\" id=\"2\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Brand Name\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Brand Name:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"Jucro\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">Jucro</div></dd></dl><dl class=\"do-entry-item\" id=\"3\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Model Number\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Model Number:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"J-H 15W\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">J-H 15W</div></dd></dl><dl class=\"do-entry-item\" id=\"473\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Rated Power\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Rated Power:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"15/20W\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">15/20W</div></dd></dl><dl class=\"do-entry-item\" id=\"488\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Voltage\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Voltage:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"110/220V\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">110/220V</div></dd></dl><dl class=\"do-entry-item\" id=\"139\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Application\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Application:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"HOME, Hotel, Office, house/air sterilization\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">HOME, Hotel, Office, house/air sterilization</div></dd></dl><dl class=\"do-entry-item\" id=\"191288028\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Power Supply\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Power Supply:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"AC\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">AC</div></dd></dl><dl class=\"do-entry-item\" id=\"210202919\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Portable\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Portable:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"Yes\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">Yes</div></dd></dl><dl class=\"do-entry-item\" id=\"236218728\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"wavelength(nm)\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">wavelength(nm):</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"253.7\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">253.7</div></dd></dl><dl class=\"do-entry-item\" id=\"236214741\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"UV Optiical Power(μW/cm2)\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">UV Optiical Power(μW/cm2):</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"50\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">50</div></dd></dl><dl class=\"do-entry-item\" id=\"236216534\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Appplication Area(㎡)\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Appplication Area(㎡):</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"20\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">20</div></dd></dl><dl class=\"do-entry-item\" id=\"200000838\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Switch Mode\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Switch Mode:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"Remote Control, Manual Button\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">Remote Control, Manual Button</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Tube material\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Tube material:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"Clear Quartz\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">Clear Quartz</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Wavelength\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Wavelength:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"253.7nm/185nm\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">253.7nm/185nm</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Function\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Function:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"Disinfection Germicidal Lamp\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">Disinfection Germicidal Lamp</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Light Source\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Light Source:</span></dt><dd class=\"do-entry-item-val\" data-spm-anchor-id=\"a2700.wholesale.prilinga1e.i3.4d1dbea7IcVMlu\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"UV light\" data-spm-anchor-id=\"a2700.wholesale.prilinga1e.i0.4d1dbea7IcVMlu\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">UV light</div></dd></dl></div>', 3000.00, 3000.00, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 1000, 1, 1000, 'Piece', 1, 20.00, 'percent', 0.00, 'amount', 'free', 0.00, 0.00, 0, 'E27 15W UV disinfection Lamp, germicidal UV sterilizer', 'Quick Details\r\nWarranty(Year):\r\n1-year\r\nSupport Dimmer:\r\nNo\r\nLighting solutions service:\r\nProject Installation\r\nLuminous Efficacy(lm/w):\r\n110\r\nPlace of Origin:\r\nHubei, China\r\nBrand Name:\r\nJucro\r\nModel Number:\r\nJ-H 15W\r\nRated Power:\r\n15/20W\r\nVoltage:\r\n110/220V\r\nApplication:\r\nHOME, Hotel, Office, house/air sterilization\r\nPower Supply:\r\nAC\r\nPortable:\r\nYes\r\nwavelength(nm):\r\n253.7\r\nUV Optiical Power(μW/cm2):\r\n50\r\nAppplication Area(㎡):\r\n20\r\nSwitch Mode:\r\nRemote Control, Manual Button\r\nTube material:\r\nClear Quartz\r\nWavelength:\r\n253.7nm/185nm\r\nFunction:\r\nDisinfection Germicidal Lamp\r\nLight Source:\r\nUV light', 'uploads/products/meta/JoxBrFju6zlgxYGFl13gGNxBGkUW8QjLheFd4KWK.jpeg', NULL, 'E27-15W-UV-disinfection-germicidal-UV-sterilizer-Lamp-VR1zA', 0, 0.00, 0.00, NULL, 0, NULL, NULL, '2020-06-20 00:53:07', '2020-07-19 15:07:56');
INSERT INTO `products` (`id`, `name`, `added_by`, `user_id`, `category_id`, `subcategory_id`, `subsubcategory_id`, `brand_id`, `photos`, `thumbnail_img`, `featured_img`, `flash_deal_img`, `video_provider`, `video_link`, `tags`, `description`, `unit_price`, `purchase_price`, `variant_product`, `attributes`, `choice_options`, `colors`, `variations`, `todays_deal`, `published`, `featured`, `current_stock`, `min_stock`, `max_stock`, `unit`, `min_qty`, `discount`, `discount_type`, `tax`, `tax_type`, `shipping_type`, `shipping_cost`, `outside_shipping_cost`, `num_of_sale`, `meta_title`, `meta_description`, `meta_img`, `pdf`, `slug`, `refundable`, `earn_point`, `rating`, `barcode`, `digital`, `file_name`, `file_path`, `created_at`, `updated_at`) VALUES
(36, 'Disinfecting portable ultraviolet lamp tube', 'admin', 12, 5, 162, 373, NULL, '[\"uploads\\/products\\/photos\\/BsjLZTQXZVwN0OoOXlpTldJ6nqWb8CLg7a6aChOA.jpeg\",\"uploads\\/products\\/photos\\/lXMiYm1TMO6EpZXeUb6MwAErUroYbugxphg3LK9D.jpeg\"]', 'uploads/products/thumbnail/vqJYikGMRV6aS6DfNobJbJWXjt80jltHdNmTsMmc.jpeg', 'uploads/products/featured/Fq6AdRXCFYHTajqdCoYiNPAL9TsRPer3l4elcbEj.jpeg', 'uploads/products/flash_deal/PdjYo72nHBcAxeV7ser88rgyTKFvEGDu27oGDknr.jpeg', 'youtube', NULL, 'Disinfecting light ,UV light,disinfecting Tube', '<dl class=\"do-entry-item\" id=\"100008205\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: 400; font-stretch: inherit; font-size: 12px; line-height: inherit; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Tahoma, Arial, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;; vertical-align: baseline; width: 480px; zoom: 1; float: left; color: rgb(51, 51, 51); letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Warranty(Year)\" data-spm-anchor-id=\"a2700.wholesale.prilinga1e.i1.4c2b1aacDxqXBd\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Warranty(Year):</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"1-year\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">7 day replacement warranty&nbsp;</div></dd></dl><dl class=\"do-entry-item\" id=\"200000865\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: 400; font-stretch: inherit; font-size: 12px; line-height: inherit; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Tahoma, Arial, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;; vertical-align: baseline; width: 480px; zoom: 1; float: left; color: rgb(51, 51, 51); letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Support Dimmer\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Support Dimmer:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"No\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">No</div></dd></dl><dl class=\"do-entry-item\" id=\"230052848\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: 400; font-stretch: inherit; font-size: 12px; line-height: inherit; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Tahoma, Arial, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;; vertical-align: baseline; width: 480px; zoom: 1; float: left; color: rgb(51, 51, 51); letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Lighting solutions service\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Lighting solutions service:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"Lighting and circuitry design, DIALux evo layout, LitePro DLX layout, Agi32 layout, auto CAD layout, Onsite metering, Project Installation\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">Lighting and circuitry design, DIALux evo layout, LitePro DLX layout, Agi32 layout, auto CAD layout, Onsite metering, Project Installation</div></dd></dl><dl class=\"do-entry-item\" id=\"1\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: 400; font-stretch: inherit; font-size: 12px; line-height: inherit; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Tahoma, Arial, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;; vertical-align: baseline; width: 480px; zoom: 1; float: left; color: rgb(51, 51, 51); letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Place of Origin\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Place of Origin:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"Zhejiang, China\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">Zhejiang, China</div></dd></dl><dl class=\"do-entry-item\" id=\"2\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: 400; font-stretch: inherit; font-size: 12px; line-height: inherit; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Tahoma, Arial, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;; vertical-align: baseline; width: 480px; zoom: 1; float: left; color: rgb(51, 51, 51); letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Brand Name\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Brand Name:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"SUNLE\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">SUNLE</div></dd></dl><dl class=\"do-entry-item\" id=\"473\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: 400; font-stretch: inherit; font-size: 12px; line-height: inherit; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Tahoma, Arial, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;; vertical-align: baseline; width: 480px; zoom: 1; float: left; color: rgb(51, 51, 51); letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Rated Power\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Rated Power:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"38W\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">38W</div></dd></dl><dl class=\"do-entry-item\" id=\"488\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: 400; font-stretch: inherit; font-size: 12px; line-height: inherit; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Tahoma, Arial, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;; vertical-align: baseline; width: 480px; zoom: 1; float: left; color: rgb(51, 51, 51); letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Voltage\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Voltage:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"220V/110v\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">220V/110v</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: 400; font-stretch: inherit; font-size: 12px; line-height: inherit; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Tahoma, Arial, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;; vertical-align: baseline; width: 480px; zoom: 1; float: left; color: rgb(51, 51, 51); letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Product Name\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Product Name:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"38W portable uvc ultraviolet uvc  disinfection quartz light\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">38W portable uvc ultraviolet uvc disinfection quartz light</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: 400; font-stretch: inherit; font-size: 12px; line-height: inherit; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Tahoma, Arial, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;; vertical-align: baseline; width: 480px; zoom: 1; float: left; color: rgb(51, 51, 51); letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Size\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Size:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"45*20\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">45*20</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: 400; font-stretch: inherit; font-size: 12px; line-height: inherit; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Tahoma, Arial, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;; vertical-align: baseline; width: 480px; zoom: 1; float: left; color: rgb(51, 51, 51); letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Applicable area:\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Applicable area::</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"5-40\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">5-40</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: 400; font-stretch: inherit; font-size: 12px; line-height: inherit; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Tahoma, Arial, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;; vertical-align: baseline; width: 480px; zoom: 1; float: left; color: rgb(51, 51, 51); letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Light stand material\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Light stand material:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"PC suite\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">PC suite</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: 400; font-stretch: inherit; font-size: 12px; line-height: inherit; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Tahoma, Arial, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;; vertical-align: baseline; width: 480px; zoom: 1; float: left; color: rgb(51, 51, 51); letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Tube material\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Tube material:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"Quartz ultraviolet lamp tube with ozone\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">Quartz ultraviolet lamp tube with ozone</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: 400; font-stretch: inherit; font-size: 12px; line-height: inherit; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Tahoma, Arial, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;; vertical-align: baseline; width: 480px; zoom: 1; float: left; color: rgb(51, 51, 51); letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Remote control\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Remote control:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"The remote control is 5 meters and penetrates walls\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">The remote control is 5 meters and penetrates walls</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: 400; font-stretch: inherit; font-size: 12px; line-height: inherit; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Tahoma, Arial, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;; vertical-align: baseline; width: 480px; zoom: 1; float: left; color: rgb(51, 51, 51); letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Function\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Function:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"three timing functions, 15 , 30 and 60 minutes respectively\" data-spm-anchor-id=\"a2700.wholesale.prilinga1e.i0.4c2b1aacDxqXBd\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">three timing functions, 15 , 30 and 60 minutes respectively</div></dd></dl>', 3500.00, 3500.00, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 999, 1, 1000, 'Piece', 1, 10.00, 'percent', 0.00, 'amount', 'free', 0.00, 0.00, 3, 'Disinfecting portable uv sterilizer lamp, ultraviolet lamp tube with ozone', 'Warranty(Year):\r\n1-year\r\nSupport Dimmer:\r\nNo\r\nLighting solutions service:\r\nLighting and circuitry design, DIALux evo layout, LitePro DLX layout, Agi32 layout, auto CAD layout, Onsite metering, Project Installation\r\nPlace of Origin:\r\nZhejiang, China\r\nBrand Name:\r\nSUNLE\r\nRated Power:\r\n38W\r\nVoltage:\r\n220V/110v\r\nProduct Name:\r\n38W portable uvc ultraviolet uvc disinfection quartz light\r\nSize:\r\n45*20\r\nApplicable area::\r\n5-40\r\nLight stand material:\r\nPC suite\r\nTube material:\r\nQuartz ultraviolet lamp tube with ozone\r\nRemote control:\r\nThe remote control is 5 meters and penetrates walls\r\nFunction:\r\nthree timing functions, 15 , 30 and 60 minutes respectively', 'uploads/products/meta/6QO6vCG5E0KkH8CL8UTkRmewgSC8YsOI0DK7c5Ki.jpeg', NULL, 'Disinfecting-portable-ultraviolet-lamp-tube-fSr7C', 0, 0.00, 0.00, NULL, 0, NULL, NULL, '2020-06-20 01:15:41', '2020-09-06 00:24:56'),
(37, 'CF KN95 Face Mask CE Certified', 'admin', 12, 42, 43, 367, NULL, '[\"uploads\\/products\\/photos\\/bymUnedOkGZqD8E3YeQSgr641JrzUbzTxcXmABrI.jpeg\",\"uploads\\/products\\/photos\\/jQ1kYdZ3iZ2Z2o9ebnuLSLGu1zZn1EaXoo7Ha52q.jpeg\"]', 'uploads/products/thumbnail/zFmHcBvCV19rO88BbcTGDREerAWKuo0aILCsrLcb.jpeg', 'uploads/products/featured/voAG4vuDbii9nH2F1mUvib9efVkF5fzBHbHvPLnU.jpeg', 'uploads/products/flash_deal/XBxWeQaOO29ZGT9YnTuPe81QmJNy3ZRNsP6R7GWj.jpeg', 'youtube', NULL, 'Mask,kn95,face mask', '<table align=\"center\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"box-sizing: border-box; border-collapse: collapse; width: 776.727px; max-width: 100%; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial; border-spacing: 0px; background-color: rgb(255, 255, 255); color: rgb(40, 40, 40); font-family: Raleway, sans-serif; font-size: 14px; text-align: start;\"><tbody style=\"box-sizing: border-box;\"><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">Product</td><td style=\"box-sizing: border-box; padding: 0px;\">Antivirus mask KN95 mask</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">Material</td><td style=\"box-sizing: border-box; padding: 0px;\">PP nonwoven, activated carbon layer, melt blown filter, soft cotton, PP nonwoven</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">Size</td><td style=\"box-sizing: border-box; padding: 0px;\">10.5x15.5cm or customized</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">Colour</td><td style=\"box-sizing: border-box; padding: 0px;\">white/gray / black /</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">Certificate</td><td style=\"box-sizing: border-box; padding: 0px;\">CE, FDA, ISO</td></tr><tr style=\"box-sizing: border-box;\"><td rowspan=\"3\" style=\"box-sizing: border-box; padding: 0px;\">Standard</td><td style=\"box-sizing: border-box; padding: 0px;\">GB2626-2006</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">EN149:2001</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">ISO 9001:2015 International Quality</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">MOQ</td><td style=\"box-sizing: border-box; padding: 0px;\">10pcs</td></tr></tbody></table><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; font-size: 13px; line-height: 1.4rem; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><br style=\"box-sizing: border-box;\"></p><div class=\"do-entry-title\" data-spm-anchor-id=\"a2700.wholesale.prilinga1e.i1.125d5a5ckdUhj0\" style=\"box-sizing: content-box; color: rgb(51, 51, 51); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial; margin: 0px; padding: 8px 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: 700; font-stretch: inherit; font-size: 14px; line-height: 14px; font-family: Roboto, Helvetica, Tahoma, Arial, &quot;Microsoft YaHei&quot;; vertical-align: baseline; text-align: start; background-color: rgb(255, 255, 255);\">Quick Details</div><div class=\"do-entry-list\" style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial; margin: 0px -20px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 12px; line-height: inherit; font-family: Roboto, Helvetica, Tahoma, Arial, &quot;Microsoft YaHei&quot;; vertical-align: baseline; text-align: start; background-color: rgb(255, 255, 255);\"><dl class=\"do-entry-item\" id=\"1\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; font: inherit; margin: 0px; padding: 4px 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Place of Origin\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Place of Origin:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"Zhejiang, China\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; overflow-wrap: normal; white-space: nowrap; text-overflow: ellipsis; width: 330px;\">Zhejiang, China</div></dd></dl><dl class=\"do-entry-item\" id=\"2\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; font: inherit; margin: 0px; padding: 4px 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Brand Name\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Brand Name:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"oem\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; overflow-wrap: normal; white-space: nowrap; text-overflow: ellipsis; width: 330px;\">CF</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; font: inherit; margin: 0px; padding: 4px 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Color\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\"><span style=\"box-sizing: border-box; font-family: inherit; font-size: inherit; font-style: inherit; font-variant-ligatures: inherit; font-variant-caps: inherit; font-weight: inherit;\">Quality:</span>Color:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"white, blue\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; overflow-wrap: normal; white-space: nowrap; text-overflow: ellipsis; width: 330px;\">white, Black</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"Top high,Green,Eco-friendly\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; overflow-wrap: normal; white-space: nowrap; text-overflow: ellipsis; width: 330px;\">Top high,Green,Eco-friendly</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; font: inherit; margin: 0px; padding: 4px 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Material\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Material:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"3 ply non woven\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; overflow-wrap: normal; white-space: nowrap; text-overflow: ellipsis; width: 330px;\">5 ply non woven</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; font: inherit; margin: 0px; padding: 4px 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Usage\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Usage:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"AGANIST VIRUS\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; overflow-wrap: normal; white-space: nowrap; text-overflow: ellipsis; width: 330px;\">AGANIST VIRUS</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; font: inherit; margin: 0px; padding: 4px 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"feature\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">feature:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"AGANIST VIRUS\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; overflow-wrap: normal; white-space: nowrap; text-overflow: ellipsis; width: 330px;\">AGANIST VIRUS</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; font: inherit; margin: 0px; padding: 4px 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"package\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">package:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"Custom Designs Unique Logo\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; overflow-wrap: normal; white-space: nowrap; text-overflow: ellipsis; width: 330px;\">Custom Designs Unique Logo</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; font: inherit; margin: 0px; padding: 4px 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"advantage\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">advantage:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"3 layer\" data-spm-anchor-id=\"a2700.wholesale.prilinga1e.i0.125d5a5ckdUhj0\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; overflow-wrap: normal; white-space: nowrap; text-overflow: ellipsis; width: 330px;\">5 layer</div></dd></dl></div>', 1200.00, 1200.00, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 998, 2, 1000, 'Box', 1, 50.00, 'percent', 0.00, 'amount', 'free', 0.00, 0.00, 2, 'CF KN95 Face Mask CE Certified', 'Product	Antivirus mask KN95 mask\r\nMaterial	PP nonwoven, activated carbon layer, melt blown filter, soft cotton, PP nonwoven\r\nSize	10.5x15.5cm or customized\r\nColour	white/gray / black /\r\nCertificate	CE, FDA, ISO\r\nStandard	GB2626-2006\r\nEN149:2001\r\nISO 9001:2015 International Quality\r\nMOQ	10pcs\r\n\r\n\r\nQuick Details\r\nPlace of Origin:\r\nZhejiang, China\r\nBrand Name:\r\nKSL\r\nQuality:Color:\r\nwhite, Black\r\nTop high,Green,Eco-friendly\r\nMaterial:\r\n3 ply non woven\r\nUsage:\r\nAGANIST VIRUS\r\nfeature:\r\nAGANIST VIRUS\r\npackage:\r\nCustom Designs Unique Logo\r\nadvantage:\r\n3 layer', 'uploads/products/meta/QwNfjeZ093F7kpl2tRvPlP8RqDAWQrMT4rkE0SG8.jpeg', NULL, 'CF-KN95-Face-Mask-CE-Certified-TERt5', 0, 0.00, 0.00, NULL, 0, NULL, NULL, '2020-06-20 20:48:49', '2020-08-29 14:03:28');
INSERT INTO `products` (`id`, `name`, `added_by`, `user_id`, `category_id`, `subcategory_id`, `subsubcategory_id`, `brand_id`, `photos`, `thumbnail_img`, `featured_img`, `flash_deal_img`, `video_provider`, `video_link`, `tags`, `description`, `unit_price`, `purchase_price`, `variant_product`, `attributes`, `choice_options`, `colors`, `variations`, `todays_deal`, `published`, `featured`, `current_stock`, `min_stock`, `max_stock`, `unit`, `min_qty`, `discount`, `discount_type`, `tax`, `tax_type`, `shipping_type`, `shipping_cost`, `outside_shipping_cost`, `num_of_sale`, `meta_title`, `meta_description`, `meta_img`, `pdf`, `slug`, `refundable`, `earn_point`, `rating`, `barcode`, `digital`, `file_name`, `file_path`, `created_at`, `updated_at`) VALUES
(39, 'Chinese 3 ply disposable surgical Mask', 'admin', 12, 42, 43, 367, NULL, '[\"uploads\\/products\\/photos\\/VACCVbrjhAlbGA8HFCNGrKBSOFNCRcGMsNUiOCO8.jpeg\",\"uploads\\/products\\/photos\\/VeeCN3A7UWMpyZv6UYqF8OMcTaKeB91AJGZRWWHY.jpeg\",\"uploads\\/products\\/photos\\/8cxojINDn3b4NoLGyjcI95k9guU4F05gfGKx4xjt.jpeg\"]', 'uploads/products/thumbnail/KkL9LR75renQJkI4qPU2QeOSOBo4hAepeVWKYjlF.jpeg', 'uploads/products/featured/yBxJiMZYQcD4u45kzfN5CEhrAiJG8HvKHNMxVQjj.jpeg', 'uploads/products/flash_deal/vH0HjeiquEqCzO0NbKt6BNihCI30XLSeVXjjUL3M.jpeg', 'youtube', NULL, 'mask,surgical mask, Chinese brand ,3 ply mask', '<p class=\"MsoNormal\" style=\"box-sizing: border-box; outline: none !important; margin: 0px 0px 10px; color: rgb(102, 102, 102); font-family: Muli, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><span style=\"box-sizing: border-box; outline: none !important; font-family: Arial; font-size: 10.5pt;\">Material : Produced In&nbsp;China&nbsp;</span></p><p class=\"MsoNormal\" style=\"box-sizing: border-box; outline: none !important; margin: 0px 0px 10px; color: rgb(102, 102, 102); font-family: Muli, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><span style=\"box-sizing: border-box; outline: none !important; font-family: Arial; font-size: 10.5pt;\">Production: China</span></p><p class=\"MsoNormal\" style=\"box-sizing: border-box; outline: none !important; margin: 0px 0px 10px; color: rgb(102, 102, 102); font-family: Muli, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><span style=\"box-sizing: border-box; outline: none !important; font-family: Arial; font-size: 10.5pt;\">10 Disposable Medical Face Masks in one pack </span></p><p class=\"MsoNormal\" style=\"box-sizing: border-box; outline: none !important; margin: 0px 0px 10px; color: rgb(102, 102, 102); font-family: Muli, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><span style=\"box-sizing: border-box; outline: none !important; font-family: Arial; font-size: 10.5pt;\">Sanitary Dental Surgical Hypoallergenic with Elastic Ear Loops 3-Ply Thick Resistance to Fluid &amp; Blood Cotton Filter for Pollen Allergies &amp; Dust<span style=\"box-sizing: border-box; outline: none !important; font-family: Arial; font-size: 10.5pt;\"><o:p style=\"box-sizing: border-box; outline: none !important;\">&nbsp;</o:p></span></span></p><p class=\"MsoNormal\" style=\"box-sizing: border-box; outline: none !important; margin: 0px 0px 10px; color: rgb(102, 102, 102); font-family: Muli, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><span style=\"box-sizing: border-box; outline: none !important; font-family: Arial; font-size: 10.5pt;\">•SUPERIOR QUALITY – Mask is made of non-woven fabric for easy breathability, 99% BFE, 99% PFE Class I Flammability 80 mmHg Fluid Resistance to Blood<span style=\"box-sizing: border-box; outline: none !important; font-family: Arial; font-size: 10.5pt;\"><o:p style=\"box-sizing: border-box; outline: none !important;\">&nbsp;</o:p></span></span></p><p class=\"MsoNormal\" style=\"box-sizing: border-box; outline: none !important; margin: 0px 0px 10px; color: rgb(102, 102, 102); font-family: Muli, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><span style=\"box-sizing: border-box; outline: none !important; font-family: Arial; font-size: 10.5pt;\">•EASY TO USE – Very low resistance to breathing, soft, odorless, does not irritate the skin, 3 layers pleated design gives users cooler, more comfortable performance than other designs currently on the market and makes it thick enough to protect from dust, bacteria, smoke and pollen<span style=\"box-sizing: border-box; outline: none !important; font-family: Arial; font-size: 10.5pt;\"><o:p style=\"box-sizing: border-box; outline: none !important;\">&nbsp;</o:p></span></span></p><p class=\"MsoNormal\" style=\"box-sizing: border-box; outline: none !important; margin: 0px 0px 10px; color: rgb(102, 102, 102); font-family: Muli, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><span style=\"box-sizing: border-box; outline: none !important; font-family: Arial; font-size: 10.5pt;\">•SAFETY &amp; STERILE – Comfortable elastic earloop eliminates pressure to the ears; sensitive inner layer made of soft facial tissue, no dye, no chemical, gentle to the skin<span style=\"box-sizing: border-box; outline: none !important; font-family: Arial; font-size: 10.5pt;\"><o:p style=\"box-sizing: border-box; outline: none !important;\">&nbsp;</o:p></span></span></p><p class=\"MsoNormal\" style=\"box-sizing: border-box; outline: none !important; margin: 0px 0px 10px; color: rgb(102, 102, 102); font-family: Muli, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><span style=\"box-sizing: border-box; outline: none !important; font-family: Arial; font-size: 10.5pt;\">•HIGHLY VERSATILE – Disposable face masks are suitable for medical, dental, hospital, food processing, builder, farmer, cleaner, gardening, painting, construction, beauty, nail, pet, outdoor and other anti-bacterial dust, fog &amp; snow weather, flu season, anti-pollen allergy health and environment use</span></p>', 440.00, 440.00, 0, '[]', '[]', '[]', NULL, 1, 1, 1, 99997, 1, 1000, '1000Pcs', 1, 10.00, 'percent', 0.00, 'amount', 'flat_rate', 100.00, 0.00, 3, 'Chinese 3 ply disposable surgical Mask', 'Material : Produced In China Production: China10 Disposable Medical Face Masks in one pack Sanitary Dental Surgical Hypoallergenic with Elastic Ear Loops 3-Ply Thick Resistance to Fluid & Blood Cotton Filter for Pollen Allergies & Dust •SUPERIOR QUALITY – Mask is made of non-woven fabric for easy breathability, 99% BFE, 99% PFE Class I Flammability 80 mmHg Fluid Resistance to Blood •EASY TO USE – Very low resistance to breathing, soft, odorless, does not irritate the skin, 3 layers pleated design gives users cooler, more comfortable performance than other designs currently on the market and makes it thick enough to protect from dust, bacteria, smoke and pollen •SAFETY & STERILE – Comfortable elastic earloop eliminates pressure to the ears; sensitive inner layer made of soft facial tissue, no dye, no chemical, gentle to the skin •HIGHLY VERSATILE – Disposable face masks are suitable for medical, dental, hospital, food processing, builder, farmer, cleaner, gardening, painting, construction, beauty, nail, pet, outdoor and other anti-bacterial dust, fog & snow weather, flu season, anti-pollen allergy health and environment use', 'uploads/products/meta/S4KvGfKaKpRWssB3anVIgNnDgRsXD5FvT0zduK05.png', NULL, 'Chinese-3-ply-disposable-surgical-Mask-2Aq8H', 0, 0.00, 0.00, NULL, 0, NULL, NULL, '2020-06-23 21:48:16', '2020-09-07 00:03:50'),
(40, 'Hui Xiang KN95 ( Without Filter) Face Mask CE Certified', 'admin', 12, 42, 43, 367, NULL, '[\"uploads\\/products\\/photos\\/ECsrP5693kepuPVZhQULXpJjBmfxpqfd9uxECQ8a.jpeg\",\"uploads\\/products\\/photos\\/ahkd1nyKEmzP7PcxZyplGDGkMnwcp7CiKIiSZiGF.jpeg\",\"uploads\\/products\\/photos\\/ecbgIvI6whszFrnPUaOTIClRsmraWVcXNgjeGq9k.jpeg\"]', 'uploads/products/thumbnail/7wTpspkGE4tgAgCna0VEp0MhsFKEtxIQupafRHJw.jpeg', 'uploads/products/featured/QpYORFomRL7vYJG99JGzyMGby0EEBUg7Yk8pcBNL.jpeg', 'uploads/products/flash_deal/3JNeA5IOARwEqnk9r8MSIm3W8xejuRAW7gjgxYbf.jpeg', 'youtube', NULL, 'Mask,KN95,Face Mask, CE certified', '<table align=\"center\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"box-sizing: border-box; border-collapse: collapse; width: 776.727px; max-width: 100%; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial; border-spacing: 0px; background-color: rgb(255, 255, 255); color: rgb(40, 40, 40); font-family: Raleway, sans-serif; font-size: 14px; text-align: start;\"><tbody style=\"box-sizing: border-box;\"><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">Product</td><td style=\"box-sizing: border-box; padding: 0px;\">Hui Xiang KN95 ( Without Filter) Face Mask CE Certified</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">Material</td><td style=\"box-sizing: border-box; padding: 0px;\">PP nonwoven, activated carbon layer, melt blown filter, soft cotton, PP nonwoven</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">Size</td><td style=\"box-sizing: border-box; padding: 0px;\">10.5x15.5cm or customized</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">Colour</td><td style=\"box-sizing: border-box; padding: 0px;\">white/gray / black /</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">Certificate</td><td style=\"box-sizing: border-box; padding: 0px;\">CE, FDA, ISO</td></tr><tr style=\"box-sizing: border-box;\"><td rowspan=\"3\" style=\"box-sizing: border-box; padding: 0px;\">Standard</td><td style=\"box-sizing: border-box; padding: 0px;\">GB2626-2006</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">EN149:2001</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">ISO 9001:2015 International Quality</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">MOQ</td><td style=\"box-sizing: border-box; padding: 0px;\">1 box</td></tr></tbody></table><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; font-size: 13px; line-height: 1.4rem; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><br style=\"box-sizing: border-box;\"></p><div class=\"do-entry-title\" data-spm-anchor-id=\"a2700.wholesale.prilinga1e.i1.125d5a5ckdUhj0\" style=\"box-sizing: content-box; color: rgb(51, 51, 51); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial; margin: 0px; padding: 8px 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: 700; font-stretch: inherit; font-size: 14px; line-height: 14px; font-family: Roboto, Helvetica, Tahoma, Arial, &quot;Microsoft YaHei&quot;; vertical-align: baseline; text-align: start; background-color: rgb(255, 255, 255);\">Quick Details</div><div class=\"do-entry-list\" style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial; margin: 0px -20px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 12px; line-height: inherit; font-family: Roboto, Helvetica, Tahoma, Arial, &quot;Microsoft YaHei&quot;; vertical-align: baseline; text-align: start; background-color: rgb(255, 255, 255);\"><dl class=\"do-entry-item\" id=\"1\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; font: inherit; margin: 0px; padding: 4px 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Place of Origin\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Place of Origin:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"Zhejiang, China\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; overflow-wrap: normal; white-space: nowrap; text-overflow: ellipsis; width: 330px;\">Zhejiang, China</div></dd></dl><dl class=\"do-entry-item\" id=\"2\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; font: inherit; margin: 0px; padding: 4px 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Brand Name\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Brand Name:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"oem\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; overflow-wrap: normal; white-space: nowrap; text-overflow: ellipsis; width: 330px;\">Hui Xiang</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; font: inherit; margin: 0px; padding: 4px 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Color\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\"><span style=\"box-sizing: border-box; font-family: inherit; font-size: inherit; font-style: inherit; font-variant-ligatures: inherit; font-variant-caps: inherit; font-weight: inherit;\">Quality:</span>Color:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"white, blue\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; overflow-wrap: normal; white-space: nowrap; text-overflow: ellipsis; width: 330px;\">white, Black</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"Top high,Green,Eco-friendly\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; overflow-wrap: normal; white-space: nowrap; text-overflow: ellipsis; width: 330px;\">Top high,Green,Eco-friendly</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; font: inherit; margin: 0px; padding: 4px 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Material\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Material:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"3 ply non woven\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; overflow-wrap: normal; white-space: nowrap; text-overflow: ellipsis; width: 330px;\">5 ply non woven</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; font: inherit; margin: 0px; padding: 4px 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Usage\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Usage:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"AGANIST VIRUS\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; overflow-wrap: normal; white-space: nowrap; text-overflow: ellipsis; width: 330px;\">AGANIST VIRUS</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; font: inherit; margin: 0px; padding: 4px 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"feature\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">feature:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"AGANIST VIRUS\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; overflow-wrap: normal; white-space: nowrap; text-overflow: ellipsis; width: 330px;\">AGANIST VIRUS</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; font: inherit; margin: 0px; padding: 4px 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"package\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">package:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"Custom Designs Unique Logo\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; overflow-wrap: normal; white-space: nowrap; text-overflow: ellipsis; width: 330px;\">Custom Designs Unique Logo</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; font: inherit; margin: 0px; padding: 4px 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"advantage\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">advantage:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"3 layer\" data-spm-anchor-id=\"a2700.wholesale.prilinga1e.i0.125d5a5ckdUhj0\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; overflow-wrap: normal; white-space: nowrap; text-overflow: ellipsis; width: 330px;\">5 layer</div></dd></dl></div>', 1000.00, 1000.00, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 993, 2, 1000, 'Box', 1, 40.00, 'percent', 0.00, 'amount', 'free', 0.00, 0.00, 5, 'Hui Xiang KN95 ( Without Filter) Face Mask CE Certified', 'ProductAntivirus mask KN95 maskMaterialPP nonwoven, activated carbon layer, melt blown filter, soft cotton, PP nonwovenSize10.5x15.5cm or customizedColourwhite/gray / black /CertificateCE, FDA, ISOStandardGB2626-2006EN149:2001ISO 9001:2015 International QualityMOQ1 boxQuick DetailsPlace of Origin:Zhejiang, ChinaBrand Name:CFQuality:Color:white, BlackTop high,Green,Eco-friendlyMaterial:5 ply non wovenUsage:AGANIST VIRUSfeature:AGANIST VIRUSpackage:Custom Designs Unique Logoadvantage:5 layer', NULL, NULL, 'Hui-Xiang-KN95--Without-Filter-Face-Mask-CE-Certified-U0Pqa', 0, 0.00, 0.00, NULL, 0, NULL, NULL, '2020-06-23 22:50:09', '2020-09-07 00:51:27'),
(42, '20pcs Box 3M 8210CN 8210 CN N95 P2 Particulate Respirator Face Mask', 'admin', 12, 42, 43, 367, NULL, '[\"uploads\\/products\\/photos\\/B81yH4ZidNUPgiXOucIPGWIhklVdJ3AJweOrq6fW.jpeg\",\"uploads\\/products\\/photos\\/EOptjGc2MRWiLl6hI0iQ9vPvtS1Ztkpv2iIYuRys.jpeg\",\"uploads\\/products\\/photos\\/2KfQd1HwChgUqnqFPwJydOI4Jg8Odie3PnVF01Vt.jpeg\",\"uploads\\/products\\/photos\\/77JxIKUejJ1wxYQHKQyQbHh8twcZJGbVgwL70HDD.jpeg\",\"uploads\\/products\\/photos\\/xZEfmqdst1VqOK9FS3lirfJ9J5dx0st6DOCnImq2.webp\"]', 'uploads/products/thumbnail/ZCjX2fedDmrNSYjJCfYNSp1uKXB9EVc3vyyBdRbE.jpeg', 'uploads/products/featured/R2gbQWFInvSZf8UV8XO9n2lKBUbM7Yvv5vycCjxq.jpeg', 'uploads/products/flash_deal/m150YOV0n5hL4tghTbnsX3U5T37WICer2SyUyogf.jpeg', 'youtube', NULL, 'Mask,N95,face Mask,3M 8210CN', '<table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" role=\"presentation\" style=\"margin: 0px; padding: 0px; border: 0px; font-size: 13px; border-collapse: collapse; border-spacing: 0px; font-weight: 400; font-family: &quot;Helvetica neue&quot;, Helvetica, Verdana, sans-serif; color: rgb(51, 51, 51); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><tbody style=\"margin: 0px; padding: 0px; border: 0px; font-size: 13px; font-weight: normal; font-family: &quot;Helvetica neue&quot;, Helvetica, Verdana, sans-serif;\"><tr style=\"margin: 0px; padding: 0px; border: 0px; font-size: 13px; font-weight: normal; font-family: &quot;Helvetica neue&quot;, Helvetica, Verdana, sans-serif;\"><td class=\"attrLabels\" style=\"margin: 0px; padding: 3px 30px 3px 0px; border: 0px; font-size: 13px; font-weight: normal; white-space: nowrap; vertical-align: top; font-family: &quot;Helvetica neue&quot;, Helvetica, Verdana, sans-serif;\">Condition:</td><td width=\"50.0%\" style=\"margin: 0px; padding: 3px 30px 3px 0px; border: 0px; font-size: 13px; font-weight: normal; vertical-align: top; font-family: &quot;Helvetica neue&quot;, Helvetica, Verdana, sans-serif;\"><div aria-live=\"polite\" style=\"margin: 0px; padding: 0px; border: 0px; font-size: 13px; font-weight: normal; font-family: &quot;Helvetica neue&quot;, Helvetica, Verdana, sans-serif;\">Brand New:<span>&nbsp;</span></div><div aria-live=\"polite\" style=\"margin: 0px; padding: 0px; border: 0px; font-size: 13px; font-weight: normal; font-family: &quot;Helvetica neue&quot;, Helvetica, Verdana, sans-serif;\"><span id=\"vi-cond-addl-info\" style=\"margin: 0px; padding: 0px; border: 0px; font-size: inherit; font-weight: normal; font-family: &quot;Helvetica neue&quot;, Helvetica, Verdana, sans-serif;\">A brand-new, unused, unopened, undamaged item in its original packaging (where packaging is<span>&nbsp;</span></span><span id=\"hiddenContent\" class=\"u-dspn\" aria-expanded=\"true\" style=\"margin: 0px; padding: 0px; border: 0px; font-size: inherit; font-weight: normal; display: inline; font-family: &quot;Helvetica neue&quot;, Helvetica, Verdana, sans-serif;\">applicable). Packaging should be the same as what is available in a retail store, unless the item was packaged by the manufacturer in non-retail packaging, such as an unprinted box or plastic bag.<a href=\"https://pages.ebay.com.au/help/sell/contextual/condition_1.html\" target=\"_blank\" class=\"infoLink u-nowrap\" style=\"color: rgb(6, 84, 186); text-decoration: none; white-space: nowrap; font-size: 10px; font-family: &quot;Helvetica neue&quot;, Helvetica, Verdana, sans-serif;\"></a></span></div></td><td class=\"attrLabels\" style=\"margin: 0px; padding: 3px 30px 3px 0px; border: 0px; font-size: 13px; font-weight: normal; white-space: nowrap; vertical-align: top; font-family: &quot;Helvetica neue&quot;, Helvetica, Verdana, sans-serif;\">Size:</td><td width=\"50.0%\" style=\"margin: 0px; padding: 3px 30px 3px 0px; border: 0px; font-size: 13px; font-weight: normal; vertical-align: top; font-family: &quot;Helvetica neue&quot;, Helvetica, Verdana, sans-serif;\"><span style=\"margin: 0px; padding: 0px; border: 0px; font-size: inherit; font-weight: normal; font-family: &quot;Helvetica neue&quot;, Helvetica, Verdana, sans-serif;\">Universal</span></td></tr><tr style=\"margin: 0px; padding: 0px; border: 0px; font-size: 13px; font-weight: normal; font-family: &quot;Helvetica neue&quot;, Helvetica, Verdana, sans-serif;\"><td class=\"attrLabels\" style=\"margin: 0px; padding: 3px 30px 3px 0px; border: 0px; font-size: 13px; font-weight: normal; white-space: nowrap; vertical-align: top; font-family: &quot;Helvetica neue&quot;, Helvetica, Verdana, sans-serif;\">Model:</td><td width=\"50.0%\" style=\"margin: 0px; padding: 3px 30px 3px 0px; border: 0px; font-size: 13px; font-weight: normal; vertical-align: top; font-family: &quot;Helvetica neue&quot;, Helvetica, Verdana, sans-serif;\"><span style=\"margin: 0px; padding: 0px; border: 0px; font-size: inherit; font-weight: normal; font-family: &quot;Helvetica neue&quot;, Helvetica, Verdana, sans-serif;\">8210CN</span></td><td class=\"attrLabels\" style=\"margin: 0px; padding: 3px 30px 3px 0px; border: 0px; font-size: 13px; font-weight: normal; white-space: nowrap; vertical-align: top; font-family: &quot;Helvetica neue&quot;, Helvetica, Verdana, sans-serif;\">Number of Items:</td><td width=\"50.0%\" style=\"margin: 0px; padding: 3px 30px 3px 0px; border: 0px; font-size: 13px; font-weight: normal; vertical-align: top; font-family: &quot;Helvetica neue&quot;, Helvetica, Verdana, sans-serif;\"><span style=\"margin: 0px; padding: 0px; border: 0px; font-size: inherit; font-weight: normal; font-family: &quot;Helvetica neue&quot;, Helvetica, Verdana, sans-serif;\">20</span></td></tr><tr style=\"margin: 0px; padding: 0px; border: 0px; font-size: 13px; font-weight: normal; font-family: &quot;Helvetica neue&quot;, Helvetica, Verdana, sans-serif;\"><td class=\"attrLabels\" style=\"margin: 0px; padding: 3px 30px 3px 0px; border: 0px; font-size: 13px; font-weight: normal; white-space: nowrap; vertical-align: top; font-family: &quot;Helvetica neue&quot;, Helvetica, Verdana, sans-serif;\">Modified Item:</td><td width=\"50.0%\" style=\"margin: 0px; padding: 3px 30px 3px 0px; border: 0px; font-size: 13px; font-weight: normal; vertical-align: top; font-family: &quot;Helvetica neue&quot;, Helvetica, Verdana, sans-serif;\"><span style=\"margin: 0px; padding: 0px; border: 0px; font-size: inherit; font-weight: normal; font-family: &quot;Helvetica neue&quot;, Helvetica, Verdana, sans-serif;\">No</span></td><td class=\"attrLabels\" style=\"margin: 0px; padding: 3px 30px 3px 0px; border: 0px; font-size: 13px; font-weight: normal; white-space: nowrap; vertical-align: top; font-family: &quot;Helvetica neue&quot;, Helvetica, Verdana, sans-serif;\">Expiry Date:</td><td width=\"50.0%\" style=\"margin: 0px; padding: 3px 30px 3px 0px; border: 0px; font-size: 13px; font-weight: normal; vertical-align: top; font-family: &quot;Helvetica neue&quot;, Helvetica, Verdana, sans-serif;\"><span style=\"margin: 0px; padding: 0px; border: 0px; font-size: inherit; font-weight: normal; font-family: &quot;Helvetica neue&quot;, Helvetica, Verdana, sans-serif;\">01/2025</span></td></tr><tr style=\"margin: 0px; padding: 0px; border: 0px; font-size: 13px; font-weight: normal; font-family: &quot;Helvetica neue&quot;, Helvetica, Verdana, sans-serif;\"><td class=\"attrLabels\" style=\"margin: 0px; padding: 3px 30px 3px 0px; border: 0px; font-size: 13px; font-weight: normal; white-space: nowrap; vertical-align: top; font-family: &quot;Helvetica neue&quot;, Helvetica, Verdana, sans-serif;\">Department:</td><td width=\"50.0%\" style=\"margin: 0px; padding: 3px 30px 3px 0px; border: 0px; font-size: 13px; font-weight: normal; vertical-align: top; font-family: &quot;Helvetica neue&quot;, Helvetica, Verdana, sans-serif;\"><span style=\"margin: 0px; padding: 0px; border: 0px; font-size: inherit; font-weight: normal; font-family: &quot;Helvetica neue&quot;, Helvetica, Verdana, sans-serif;\">Unisex</span></td><td class=\"attrLabels\" style=\"margin: 0px; padding: 3px 30px 3px 0px; border: 0px; font-size: 13px; font-weight: normal; white-space: nowrap; vertical-align: top; font-family: &quot;Helvetica neue&quot;, Helvetica, Verdana, sans-serif;\">Type:</td><td width=\"50.0%\" style=\"margin: 0px; padding: 3px 30px 3px 0px; border: 0px; font-size: 13px; font-weight: normal; vertical-align: top; font-family: &quot;Helvetica neue&quot;, Helvetica, Verdana, sans-serif;\"><span style=\"margin: 0px; padding: 0px; border: 0px; font-size: inherit; font-weight: normal; font-family: &quot;Helvetica neue&quot;, Helvetica, Verdana, sans-serif;\">Disposable Face Mask</span></td></tr><tr style=\"margin: 0px; padding: 0px; border: 0px; font-size: 13px; font-weight: normal; font-family: &quot;Helvetica neue&quot;, Helvetica, Verdana, sans-serif;\"><td class=\"attrLabels\" style=\"margin: 0px; padding: 3px 30px 3px 0px; border: 0px; font-size: 13px; font-weight: normal; white-space: nowrap; vertical-align: top; font-family: &quot;Helvetica neue&quot;, Helvetica, Verdana, sans-serif;\">MPN:</td><td width=\"50.0%\" style=\"margin: 0px; padding: 3px 30px 3px 0px; border: 0px; font-size: 13px; font-weight: normal; vertical-align: top; font-family: &quot;Helvetica neue&quot;, Helvetica, Verdana, sans-serif;\"><span style=\"margin: 0px; padding: 0px; border: 0px; font-size: inherit; font-weight: normal; font-family: &quot;Helvetica neue&quot;, Helvetica, Verdana, sans-serif;\">3M 8210CN</span></td><td class=\"attrLabels\" style=\"margin: 0px; padding: 3px 30px 3px 0px; border: 0px; font-size: 13px; font-weight: normal; white-space: nowrap; vertical-align: top; font-family: &quot;Helvetica neue&quot;, Helvetica, Verdana, sans-serif;\">Application:</td><td width=\"50.0%\" style=\"margin: 0px; padding: 3px 30px 3px 0px; border: 0px; font-size: 13px; font-weight: normal; vertical-align: top; font-family: &quot;Helvetica neue&quot;, Helvetica, Verdana, sans-serif;\"><span style=\"margin: 0px; padding: 0px; border: 0px; font-size: inherit; font-weight: normal; font-family: &quot;Helvetica neue&quot;, Helvetica, Verdana, sans-serif;\">Face Protection</span></td></tr><tr style=\"margin: 0px; padding: 0px; border: 0px; font-size: 13px; font-weight: normal; font-family: &quot;Helvetica neue&quot;, Helvetica, Verdana, sans-serif;\"><td class=\"attrLabels\" style=\"margin: 0px; padding: 3px 30px 3px 0px; border: 0px; font-size: 13px; font-weight: normal; white-space: nowrap; vertical-align: top; font-family: &quot;Helvetica neue&quot;, Helvetica, Verdana, sans-serif;\">Brand:</td><td width=\"50.0%\" style=\"margin: 0px; padding: 3px 30px 3px 0px; border: 0px; font-size: 13px; font-weight: normal; vertical-align: top; font-family: &quot;Helvetica neue&quot;, Helvetica, Verdana, sans-serif;\"><span style=\"margin: 0px; padding: 0px; border: 0px; font-size: inherit; font-weight: normal; font-family: &quot;Helvetica neue&quot;, Helvetica, Verdana, sans-serif;\">3M</span></td><td class=\"attrLabels\" style=\"margin: 0px; padding: 3px 30px 3px 0px; border: 0px; font-size: 13px; font-weight: normal; white-space: nowrap; vertical-align: top; font-family: &quot;Helvetica neue&quot;, Helvetica, Verdana, sans-serif;\">UPC:</td><td width=\"50.0%\" style=\"margin: 0px; padding: 3px 30px 3px 0px; border: 0px; font-size: 13px; font-weight: normal; vertical-align: top; font-family: &quot;Helvetica neue&quot;, Helvetica, Verdana, sans-serif;\"><span style=\"margin: 0px; padding: 0px; border: 0px; font-size: inherit; font-weight: normal; font-family: &quot;Helvetica neue&quot;, Helvetica, Verdana, sans-serif;\">8887719334648</span></td></tr></tbody></table>', 13000.00, 13000.00, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 997, 1, 100, 'Box', 1, 5.00, 'percent', 0.00, 'amount', 'free', 0.00, 0.00, 3, '20pcs Box 3M 8210CN 8210 CN N95 P2 Particulate Respirator Face Mask', 'Condition:	\r\nBrand New: A brand-new, unused, unopened, undamaged item in its original packaging (where packaging is applicable). Packaging should be the same as what is available in a retail store, unless the item was packaged by the manufacturer in non-retail packaging, such as an unprinted box or plastic bag. See the seller\'s listing for full details. See all condition definitions	Size:	Universal\r\nModel:	8210CN	Number of Items:	20\r\nModified Item:	No	Expiry Date:	01/2025\r\nDepartment:	Unisex	Type:	Disposable Face Mask\r\nMPN:	3M 8210CN	Application:	Face Protection\r\nBrand:	3M	UPC:	8887719334648', 'uploads/products/meta/tueUDFKKV8IAHbcbQnLtff3RGwEemaZt0dpX9zdJ.jpeg', NULL, '20pcs-Box-3M-8210CN-8210-CN-N95-P2-Particulate-Respirator-Face-Mask-QJ4D3', 0, 0.00, 0.00, NULL, 0, NULL, NULL, '2020-06-25 02:10:19', '2020-09-07 00:26:58'),
(43, 'Pickle', 'seller', 26, 22, 186, 426, NULL, '[\"uploads\\/products\\/photos\\/cRsQ2Qi3HU5T5kkGYK6ivdKIRUzPTBR10TQneXSo.jpeg\",\"uploads\\/products\\/photos\\/XNr1CG5a0Ugs6epTzx16DbCleTnd1BN0cZnHSHB9.jpeg\"]', NULL, NULL, NULL, 'youtube', NULL, 'Pickle', 'Misti Boroi Achar\r\nদামঃ ১৩৫ টাকা\r\n\r\nস্বাদঃ মুখরোচক এই Tok Jhal Boroi আচারটি ১০০% অরিজিনাল ও এক্সপোর্ট কোয়ালিটির। মিষ্টি স্বাদের এই আচারটির প্যাকেটে থাকছে ছোট ছোট ১০টি প্যাকেট। যারা আঁচারের মধ্যে মিষ্টি স্বাদ পেতে চান তাদের জন্য এই আচারটি অতুলনীয়।\r\nঅর্ডার করতে ইনবক্স করুন আপনার নাম, ফোন নাম্বার, ঠিকানা।', 13.00, 13.00, 0, '[]', '[]', '[]', NULL, 0, 1, 0, 10, 1, 10, '10', 1, 0.00, 'amount', 0.00, 'amount', 'free', 0.00, 0.00, 0, NULL, NULL, NULL, NULL, 'Pickle-AvqDD', 0, 0.00, 0.00, NULL, 0, NULL, NULL, '2020-06-25 21:42:31', '2020-06-25 21:44:41');
INSERT INTO `products` (`id`, `name`, `added_by`, `user_id`, `category_id`, `subcategory_id`, `subsubcategory_id`, `brand_id`, `photos`, `thumbnail_img`, `featured_img`, `flash_deal_img`, `video_provider`, `video_link`, `tags`, `description`, `unit_price`, `purchase_price`, `variant_product`, `attributes`, `choice_options`, `colors`, `variations`, `todays_deal`, `published`, `featured`, `current_stock`, `min_stock`, `max_stock`, `unit`, `min_qty`, `discount`, `discount_type`, `tax`, `tax_type`, `shipping_type`, `shipping_cost`, `outside_shipping_cost`, `num_of_sale`, `meta_title`, `meta_description`, `meta_img`, `pdf`, `slug`, `refundable`, `earn_point`, `rating`, `barcode`, `digital`, `file_name`, `file_path`, `created_at`, `updated_at`) VALUES
(44, 'Hui Xiang KN95 ( With Filter) Face Mask CE Certified', 'admin', 12, 42, 43, 367, NULL, '[\"uploads\\/products\\/photos\\/ECsrP5693kepuPVZhQULXpJjBmfxpqfd9uxECQ8a.jpeg\",\"uploads\\/products\\/photos\\/ahkd1nyKEmzP7PcxZyplGDGkMnwcp7CiKIiSZiGF.jpeg\",\"uploads\\/products\\/photos\\/ecbgIvI6whszFrnPUaOTIClRsmraWVcXNgjeGq9k.jpeg\"]', 'uploads/products/thumbnail/7wTpspkGE4tgAgCna0VEp0MhsFKEtxIQupafRHJw.jpeg', 'uploads/products/featured/QpYORFomRL7vYJG99JGzyMGby0EEBUg7Yk8pcBNL.jpeg', 'uploads/products/flash_deal/3JNeA5IOARwEqnk9r8MSIm3W8xejuRAW7gjgxYbf.jpeg', 'youtube', NULL, 'Mask,KN95,Face Mask, CE certified', '<table align=\"center\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"box-sizing: border-box; border-collapse: collapse; width: 776.727px; max-width: 100%; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial; border-spacing: 0px; background-color: rgb(255, 255, 255); color: rgb(40, 40, 40); font-family: Raleway, sans-serif; font-size: 14px; text-align: start;\"><tbody style=\"box-sizing: border-box;\"><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">Product</td><td style=\"box-sizing: border-box; padding: 0px;\">Hui Xiang KN95 ( Without Filter) Face Mask CE Certified</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">Material</td><td style=\"box-sizing: border-box; padding: 0px;\">PP nonwoven, activated carbon layer, melt blown filter, soft cotton, PP nonwoven</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">Size</td><td style=\"box-sizing: border-box; padding: 0px;\">10.5x15.5cm or customized</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">Colour</td><td style=\"box-sizing: border-box; padding: 0px;\">white/gray / black /</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">Certificate</td><td style=\"box-sizing: border-box; padding: 0px;\">CE, FDA, ISO</td></tr><tr style=\"box-sizing: border-box;\"><td rowspan=\"3\" style=\"box-sizing: border-box; padding: 0px;\">Standard</td><td style=\"box-sizing: border-box; padding: 0px;\">GB2626-2006</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">EN149:2001</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">ISO 9001:2015 International Quality</td></tr><tr style=\"box-sizing: border-box;\"><td style=\"box-sizing: border-box; padding: 0px;\">MOQ</td><td style=\"box-sizing: border-box; padding: 0px;\">1 box</td></tr></tbody></table><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; font-size: 13px; line-height: 1.4rem; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><br style=\"box-sizing: border-box;\"></p><div class=\"do-entry-title\" data-spm-anchor-id=\"a2700.wholesale.prilinga1e.i1.125d5a5ckdUhj0\" style=\"box-sizing: content-box; color: rgb(51, 51, 51); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial; margin: 0px; padding: 8px 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: 700; font-stretch: inherit; font-size: 14px; line-height: 14px; font-family: Roboto, Helvetica, Tahoma, Arial, &quot;Microsoft YaHei&quot;; vertical-align: baseline; text-align: start; background-color: rgb(255, 255, 255);\">Quick Details</div><div class=\"do-entry-list\" style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial; margin: 0px -20px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 12px; line-height: inherit; font-family: Roboto, Helvetica, Tahoma, Arial, &quot;Microsoft YaHei&quot;; vertical-align: baseline; text-align: start; background-color: rgb(255, 255, 255);\"><dl class=\"do-entry-item\" id=\"1\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; font: inherit; margin: 0px; padding: 4px 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Place of Origin\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Place of Origin:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"Zhejiang, China\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; overflow-wrap: normal; white-space: nowrap; text-overflow: ellipsis; width: 330px;\">Zhejiang, China</div></dd></dl><dl class=\"do-entry-item\" id=\"2\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; font: inherit; margin: 0px; padding: 4px 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Brand Name\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Brand Name:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"oem\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; overflow-wrap: normal; white-space: nowrap; text-overflow: ellipsis; width: 330px;\">Hui Xiang</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; font: inherit; margin: 0px; padding: 4px 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Color\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\"><span style=\"box-sizing: border-box; font-family: inherit; font-size: inherit; font-style: inherit; font-variant-ligatures: inherit; font-variant-caps: inherit; font-weight: inherit;\">Quality:</span>Color:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"white, blue\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; overflow-wrap: normal; white-space: nowrap; text-overflow: ellipsis; width: 330px;\">white, Black</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"Top high,Green,Eco-friendly\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; overflow-wrap: normal; white-space: nowrap; text-overflow: ellipsis; width: 330px;\">Top high,Green,Eco-friendly</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; font: inherit; margin: 0px; padding: 4px 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Material\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Material:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"3 ply non woven\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; overflow-wrap: normal; white-space: nowrap; text-overflow: ellipsis; width: 330px;\">5 ply non woven</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; font: inherit; margin: 0px; padding: 4px 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Usage\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Usage:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"AGANIST VIRUS\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; overflow-wrap: normal; white-space: nowrap; text-overflow: ellipsis; width: 330px;\">AGANIST VIRUS</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; font: inherit; margin: 0px; padding: 4px 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"feature\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">feature:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"AGANIST VIRUS\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; overflow-wrap: normal; white-space: nowrap; text-overflow: ellipsis; width: 330px;\">AGANIST VIRUS</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; font: inherit; margin: 0px; padding: 4px 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"package\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">package:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"Custom Designs Unique Logo\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; overflow-wrap: normal; white-space: nowrap; text-overflow: ellipsis; width: 330px;\">Custom Designs Unique Logo</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; font: inherit; margin: 0px; padding: 4px 0px; border: 0px; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"advantage\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">advantage:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"3 layer\" data-spm-anchor-id=\"a2700.wholesale.prilinga1e.i0.125d5a5ckdUhj0\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; overflow-wrap: normal; white-space: nowrap; text-overflow: ellipsis; width: 330px;\">5 layer</div></dd></dl></div>', 1100.00, 1100.00, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 996, 2, 1000, 'Box', 1, 40.00, 'percent', 0.00, 'amount', 'free', 0.00, 0.00, 3, 'Hui Xiang KN95 ( Without Filter) Face Mask CE Certified', 'ProductAntivirus mask KN95 maskMaterialPP nonwoven, activated carbon layer, melt blown filter, soft cotton, PP nonwovenSize10.5x15.5cm or customizedColourwhite/gray / black /CertificateCE, FDA, ISOStandardGB2626-2006EN149:2001ISO 9001:2015 International QualityMOQ1 boxQuick DetailsPlace of Origin:Zhejiang, ChinaBrand Name:CFQuality:Color:white, BlackTop high,Green,Eco-friendlyMaterial:5 ply non wovenUsage:AGANIST VIRUSfeature:AGANIST VIRUSpackage:Custom Designs Unique Logoadvantage:5 layer', NULL, NULL, 'Hui-Xiang-KN95--With-Filter-Face-Mask-CE-Certified-H0TTC', 0, 0.00, 0.00, NULL, 0, NULL, NULL, '2020-06-25 22:35:30', '2020-09-06 21:51:23'),
(46, 'Broiler Chicken Skin on - 1KG', 'seller', 28, 22, 192, NULL, NULL, '[\"uploads\\/products\\/photos\\/LV0zMgR3HM0viwZywJh1qRd5N7AlIJlhNOeWXdyB.png\"]', 'uploads/products/thumbnail/xOHGyInL5BxOn0lgdhgrFVORU2FUa1AGXkugf7T9.png', 'uploads/products/featured/EChPPnDzobvCsAtgaXfQtbOdhYrzfctEN9lEGrNa.png', 'uploads/products/flash_deal/YZobbz0BchvuB5RxZJIgwTiX4tneq3YsXntgGwAU.png', 'youtube', NULL, 'Broiler Chicken Skin on - 1KG', 'Broiler Chicken Skin on - 1KG', 1100.00, 1100.00, 0, '[]', '[]', '[]', NULL, 0, 1, 0, 10000, 1, 79, '5', 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 60.00, 0.00, 0, 'Broiler Chicken Skin on - 1KG', 'Broiler Chicken Skin on - 1KG', 'uploads/products/meta/WC2SStiox8SzAcY9kSDMaWZNTwBYsJONNtQZJEa4.png', NULL, 'Broiler-Chicken-Skin-on---1KG-putur', 0, 0.00, 0.00, NULL, 0, NULL, NULL, '2020-06-28 08:16:09', '2020-06-28 08:48:41'),
(47, 'Sonali Cock Chicken Skin off - 600gm', 'seller', 28, 22, 192, NULL, NULL, '[\"uploads\\/products\\/photos\\/DwOBgmN7Riff04QvwKqrHoRhBrrPwYGO4oV0j7fH.jpeg\"]', 'uploads/products/thumbnail/sPKs9npAbFUT0F6HYey3KjRSj4rbInVeEYTGUgBT.jpeg', 'uploads/products/featured/ZQQ4359hemLEXwCvSf4bby1otAHB9xJnvObhfGMA.jpeg', 'uploads/products/flash_deal/O2KxaeAKC6ziioiKjlxJjMnBNQ6XgLEaAGzX9aIo.jpeg', 'youtube', NULL, 'Sonali Cock Chicken Skin off - 600gm', 'Sonali Cock Chicken Skin off - 600gm', 1300.00, 1300.00, 0, '[]', '[]', '[]', NULL, 0, 1, 0, 10000, 1, 80, '5', 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 60.00, 0.00, 0, 'Sonali Cock Chicken Skin off - 600gm', 'Sonali Cock Chicken Skin off - 600gm', 'uploads/products/meta/j9K25BiSCa8oAEiMdtuLw2U0AqBOmAswfYYj3KUL.jpeg', NULL, 'Sonali-Cock-Chicken-Skin-off---600gm-YtVTH', 0, 0.00, 0.00, NULL, 0, NULL, NULL, '2020-06-28 08:35:52', '2020-06-28 08:49:33'),
(48, 'Regular Beef - 3.22 kg (Bone Max 150gm to 200gm per/kg)', 'seller', 28, 47, 199, 484, NULL, '[\"uploads\\/products\\/photos\\/BRAFUJ9lS2cVeXcDxrIua3UUSa8Ln5DlyScRxirb.jpeg\"]', 'uploads/products/thumbnail/GKy5LghPZhqOB2RiiLiy5oeKjFHmj85fwXoXCYSi.jpeg', 'uploads/products/featured/BFFLjTa8GQJlmAyPKmeOt2rR2ypqDFNkrdFuG1oL.jpeg', 'uploads/products/flash_deal/C3iGWAfvk35vHoBpnEzmW8ywCpeg84qVnSkSLMjW.jpeg', 'youtube', NULL, 'Meat', '<h2 class=\"font-bold\" style=\"box-sizing: border-box; border: 0px solid rgb(224, 224, 224); font-family: &quot;Nunito Sans&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; margin: 0px 0px 0.5rem; font-size: 1.5rem; font-weight: 700; line-height: 1.2; color: rgb(0, 0, 0); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\">Regular Beef - 3.22 kg (Bone Max 150gm to 200gm per/kg)</h2><br>', 2000.00, 2000.00, 0, '[]', '[]', '[]', NULL, 0, 1, 0, 200000, 4, 20, '3.22', 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 60.00, 30.00, 0, 'Regular Beef - 3.22 kg (Bone Max 150gm to 200gm per/kg)', 'Regular Beef - 3.22 kg (Bone Max 150gm to 200gm per/kg)', 'uploads/products/meta/HmECiydb0Dp3cyYhZblxPnu3dhn244y65RYUMJsq.jpeg', NULL, 'Regular-Beef---322-kg-Bone-Max-150gm-to-200gm-perkg-7sNXo', 0, 0.00, 0.00, NULL, 0, NULL, NULL, '2020-06-28 08:47:04', '2020-06-29 15:45:11'),
(51, 'Half Silk Sharee', 'seller', 40, 45, 147, 343, 11, '[\"uploads\\/products\\/photos\\/l3xEHq1vaPvHPBUNX2ewmraxEbowuQWTrQfiilVt.jpeg\",\"uploads\\/products\\/photos\\/Uvd8kn0GeAnEIEOSt0yfjw0kcxjIbLhoQUXukgOH.jpeg\",\"uploads\\/products\\/photos\\/LzTJJvVsSzOZHo7okpZJGWTPfpDcoHFiU7xh73RB.jpeg\",\"uploads\\/products\\/photos\\/NyVd5c9UvG35wqSTqDFb6lKZOpdye2TiTkrvQSGt.jpeg\"]', 'uploads/products/thumbnail/iPVojgbfTqjcUZWOIMMUwZu2Wuw5XpH0M6Q1pHWW.jpeg', NULL, NULL, 'youtube', NULL, 'Half Silk', NULL, 1750.00, 1749.97, 0, '[]', '[]', '[]', NULL, 0, 1, 0, 10, 10, 98, 'Available', 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0.00, 0, NULL, NULL, 'uploads/products/meta/Il75uCTsOvVLfGCZlkmlWW7FCSp5E5UatU8LzvJQ.jpeg', NULL, 'Half-Silk-Sharee-QXbdQ', 0, 0.00, 0.00, NULL, 0, NULL, NULL, '2020-07-01 15:26:08', '2020-07-01 15:26:08'),
(52, 'Half Silk Sharee', 'seller', 40, 45, 147, 343, 11, '[\"uploads\\/products\\/photos\\/KYOybffuw2q1egv3qiC9tWBgxvBJC2DHVIZtLZBE.jpeg\",\"uploads\\/products\\/photos\\/rnPu297uoW383TEDq5659BYYaRLOUHxgizxwb5Bb.jpeg\",\"uploads\\/products\\/photos\\/kMxGIemUr6CUX4hoqpIMoaXQ36mnrqP06PFdIrjy.jpeg\",\"uploads\\/products\\/photos\\/VuapEy2ivT0TZx2kQkaNboQBzdLrEguuNLquK2zs.jpeg\"]', 'uploads/products/thumbnail/o3s3KPOrKB9rCk2VAmdOJmS1pCNYIf01efTUX3VO.jpeg', NULL, NULL, 'youtube', NULL, 'Half Silk', NULL, 1750.00, 1749.97, 0, '[]', '[]', '[]', NULL, 0, 1, 0, 10, 10, 98, 'Available', 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0.00, 0, NULL, NULL, 'uploads/products/meta/exAIi6MSfPxjFiLtQvt1gGbpBJ7JrBjaDr0ROWYH.jpeg', NULL, 'Half-Silk-Sharee-SPurJ', 0, 0.00, 0.00, NULL, 0, NULL, NULL, '2020-07-01 15:26:17', '2020-07-01 15:26:17');
INSERT INTO `products` (`id`, `name`, `added_by`, `user_id`, `category_id`, `subcategory_id`, `subsubcategory_id`, `brand_id`, `photos`, `thumbnail_img`, `featured_img`, `flash_deal_img`, `video_provider`, `video_link`, `tags`, `description`, `unit_price`, `purchase_price`, `variant_product`, `attributes`, `choice_options`, `colors`, `variations`, `todays_deal`, `published`, `featured`, `current_stock`, `min_stock`, `max_stock`, `unit`, `min_qty`, `discount`, `discount_type`, `tax`, `tax_type`, `shipping_type`, `shipping_cost`, `outside_shipping_cost`, `num_of_sale`, `meta_title`, `meta_description`, `meta_img`, `pdf`, `slug`, `refundable`, `earn_point`, `rating`, `barcode`, `digital`, `file_name`, `file_path`, `created_at`, `updated_at`) VALUES
(53, 'Pen shape hand sanitizer spray', 'admin', 12, 42, 47, NULL, NULL, '[\"uploads\\/products\\/photos\\/H8mks9NzzcGZOwKpSPEs9Wt3nEivazD1jRqC7FnW.jpeg\",\"uploads\\/products\\/photos\\/kne0FfxlGycsBziUtkFqx8nJxuVWo7eLoxEcQo66.jpeg\",\"uploads\\/products\\/photos\\/4SOCGFPE2fSOQxfUFd937gv1OoihlgPEFbxYVYwt.jpeg\"]', 'uploads/products/thumbnail/FcfznJdsR6uWD3ViSVRrUJxG0fajaDp7zrE115vv.jpeg', 'uploads/products/featured/sbId9ZwGdRZZyXLx3PByZGCYua8giP37mOV55bcM.jpeg', 'uploads/products/flash_deal/gWE6ghx955otucrBGr33pvyohuQwx6KHWybDOai4.jpeg', 'youtube', NULL, 'hand Sanitizer,Pen Shape,spray sanitizer', '<div class=\"do-entry-title\" data-spm-anchor-id=\"a2700.details.prilinga1e.i2.73616859mHJbou\" style=\"box-sizing: content-box; margin: 0px; padding: 8px 0px; border: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: 700; font-stretch: inherit; font-size: 14px; line-height: 14px; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Tahoma, Arial, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;; vertical-align: baseline; color: rgb(51, 51, 51); letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\">Quick Details</div><ul><li>Easy to Refill</li><li>Easy to use and possible to keep in pocket&nbsp;&nbsp;as like pen</li></ul><div class=\"do-entry-list\" style=\"box-sizing: border-box; margin: 0px -20px; padding: 0px; border: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: 400; font-stretch: inherit; font-size: 12px; line-height: inherit; font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Tahoma, Arial, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;; vertical-align: baseline; color: rgb(51, 51, 51); letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><dl class=\"do-entry-item\" id=\"1\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Place of Origin\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Place of Origin:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"Jiangsu, China\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">Jiangsu, China</div></dd></dl><dl class=\"do-entry-item\" id=\"2\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Brand Name\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Brand Name:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"Health &amp; Beyond\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">Health &amp; Beyond</div></dd></dl><dl class=\"do-entry-item\" id=\"3\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Model Number\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Model Number:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"IHS0010\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">IHS0010</div></dd></dl><dl class=\"do-entry-item\" id=\"19501\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Medicated\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Medicated:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"No\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">No</div></dd></dl><dl class=\"do-entry-item\" id=\"19502\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Transparent\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Transparent:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"Yes\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">Yes</div></dd></dl><dl class=\"do-entry-item\" id=\"19503\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Handmade\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Handmade:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"No\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">No</div></dd></dl><dl class=\"do-entry-item\" id=\"19504\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Wash Style\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Wash Style:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"Waterless\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">Waterless</div></dd></dl><dl class=\"do-entry-item\" id=\"191284643\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Form\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Form:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"Liquid\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">Liquid</div></dd></dl><dl class=\"do-entry-item\" id=\"191284926\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Ingredient\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Ingredient:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"Chemical\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">Chemical</div></dd></dl><dl class=\"do-entry-item\" id=\"191286576\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Age Group\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Age Group:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"Adults\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">Adults</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Product name\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Product name:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"Pocketbac Hand Sanitizers\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">Pocketbac Hand Sanitizers</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Color\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Color:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"Transparent\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">Transparent</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"MOQ\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">MOQ:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"5000pcs\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">5000pcs</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Style\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Style:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"Liquid Gel\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">Liquid Gel</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Key words\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Key words:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"Pen Spray Hand Sanitizer\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">Pen Spray Hand Sanitizer</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Volume\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Volume:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"10ml\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">10ml</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Function\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Function:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"Kills 99.99% Germs\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">Kills 99.99% Germs</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"OEM\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">OEM:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"Availablility\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">Availablility</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Port\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Port:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"Shang Hai\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">Shang Hai</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Liquid Color\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Liquid Color:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"Clients\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">Clients</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Type\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Type:</span></dt><dd class=\"do-entry-item-val\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"Toilet Soap\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">Toilet Soap</div></dd></dl><dl class=\"do-entry-item\" id=\"\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 20px; border: 0px; font: inherit; vertical-align: baseline; width: 480px; zoom: 1; float: left;\"><dt class=\"do-entry-item\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; color: rgb(102, 102, 102); width: 110px; float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\"><span class=\"attr-name J-attr-name\" title=\"Toilet Soap Type\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Toilet Soap Type:</span></dt><dd class=\"do-entry-item-val\" data-spm-anchor-id=\"a2700.details.prilinga1e.i1.73616859mHJbou\" style=\"box-sizing: content-box; margin: 0px; padding: 4px 0px; border: 0px; font: inherit; vertical-align: baseline; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; color: rgb(51, 51, 51);\"><div class=\"ellipsis\" title=\"Hand soap\" style=\"box-sizing: content-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; display: inline-block; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; width: 330px;\">Hand soap</div></dd></dl></div>', 100.00, 100.00, 1, '[]', '[]', '[\"#00008B\",\"#ADFF2F\",\"#90EE90\",\"#D3D3D3\",\"#FFB6C1\"]', NULL, 1, 1, 1, 0, 5, 100, '1', 1, 20.00, 'percent', 0.00, 'amount', 'free', 0.00, 0.00, 9, 'Pen shape hand sanitizer spray', 'Quick DetailsEasy to RefillEasy to use and possible to keep in pocket  as like penPlace of Origin:Jiangsu, ChinaBrand Name:Health & BeyondModel Number:IHS0010Medicated:NoTransparent:YesHandmade:NoWash Style:WaterlessForm:LiquidIngredient:ChemicalAge Group:AdultsProduct name:Pocketbac Hand SanitizersColor:TransparentMOQ:5000pcsStyle:Liquid GelKey words:Pen Spray Hand SanitizerVolume:10mlFunction:Kills 99.99% GermsOEM:AvailablilityPort:Shang HaiLiquid Color:ClientsType:Toilet SoapToilet Soap Type:Hand soap', 'uploads/products/meta/L0PWFoqawOHmnkq110GTcZ1KAoQkxeIEVsobQmLd.jpeg', NULL, 'Pen-shape-hand-sanitizer-spray-eWLmj', 0, 0.00, 0.00, NULL, 0, NULL, NULL, '2020-07-02 07:52:21', '2020-09-05 23:02:42'),
(54, 'Sanityza Hand Rub 50ml', 'admin', 12, 42, 47, NULL, NULL, '[\"uploads\\/products\\/photos\\/BWVJyZKG25TSB2E8baboWJ4GcXSIuxse7zU715PA.jpeg\",\"uploads\\/products\\/photos\\/gKA2f2Xzej7W3wxv6ecPAO72WvA5Vp6TgHrZoBUU.jpeg\",\"uploads\\/products\\/photos\\/vZdckkj4hUeHgRmmCPX2cG285kHCxQ7vX3ZaVkUD.jpeg\"]', 'uploads/products/thumbnail/NPB7Ga0nUxvYKr1KFwOrAqjHxRraRPazXjhdVoBe.jpeg', 'uploads/products/featured/8QBIqF1kYvBr2UniR7n7ZCGKeuG1O6Dg2JMrM2i2.jpeg', 'uploads/products/flash_deal/EUoWiZThpUIExuHU5HQqa9ET3Kh9S28Ezp5Tz8Fl.jpeg', 'youtube', NULL, 'hand Sanitizer', '<div class=\"fade in\" style=\"box-sizing: border-box; color: rgb(119, 119, 119); font-family: Lato, sans-serif; font-size: medium; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><h3 style=\"box-sizing: border-box; color: rgb(85, 85, 85); width: 1050px; margin-top: 0px; margin-bottom: 0.5em; text-rendering: optimizespeed; font-size: 1.25em; font-family: Lato, sans-serif; font-weight: 700;\">Presentation</h3><p style=\"box-sizing: border-box; margin-bottom: 1.3em; margin-top: 0px;\">Contains 0.5% w/v Chlorhexidine Gluconate (equivalent to 2.5% v/v Chlorhexidine Gluconate solution BP) in 70% v/v Isopropyl Alcohol B</p></div><div class=\"fade in\" style=\"box-sizing: border-box; color: rgb(119, 119, 119); font-family: Lato, sans-serif; font-size: medium; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><h3 style=\"box-sizing: border-box; color: rgb(85, 85, 85); width: 1050px; margin-top: 0px; margin-bottom: 0.5em; text-rendering: optimizespeed; font-size: 1.25em; font-family: Lato, sans-serif; font-weight: 700;\">Description</h3><p style=\"box-sizing: border-box; margin-bottom: 1.3em; margin-top: 0px;\">Chlorhexidine Gluconate has wide spectrum of microbial coverage. It is used for intact disinfection of intact skin.</p></div><div class=\"fade in\" style=\"box-sizing: border-box; color: rgb(119, 119, 119); font-family: Lato, sans-serif; font-size: medium; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><h3 style=\"box-sizing: border-box; color: rgb(85, 85, 85); width: 1050px; margin-top: 0px; margin-bottom: 0.5em; text-rendering: optimizespeed; font-size: 1.25em; font-family: Lato, sans-serif; font-weight: 700;\">Indications</h3><p style=\"box-sizing: border-box; margin-bottom: 1.3em; margin-top: 0px;\">For antisepsis of clean and surgical hand to prevent infections</p></div><div class=\"fade in\" style=\"box-sizing: border-box; color: rgb(119, 119, 119); font-family: Lato, sans-serif; font-size: medium; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><h3 style=\"box-sizing: border-box; color: rgb(85, 85, 85); width: 1050px; margin-top: 0px; margin-bottom: 0.5em; text-rendering: optimizespeed; font-size: 1.25em; font-family: Lato, sans-serif; font-weight: 700;\">Dosage &amp; Administration</h3><p style=\"box-sizing: border-box; margin-bottom: 1.3em; margin-top: 0px;\">To sterilize clean hand: Take adequate amount (about 3 ml) of Sanityza on the palm of the both hands and wrists; rub until full drying as if every part is sterilized effectively<br style=\"box-sizing: border-box;\">Before surgery: Apply about 5 ml of Sanityza following above mentioned method; apply upto the elbow</p></div><div class=\"fade in\" style=\"box-sizing: border-box; color: rgb(119, 119, 119); font-family: Lato, sans-serif; font-size: medium; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><h3 style=\"box-sizing: border-box; color: rgb(85, 85, 85); width: 1050px; margin-top: 0px; margin-bottom: 0.5em; text-rendering: optimizespeed; font-size: 1.25em; font-family: Lato, sans-serif; font-weight: 700;\">Precautions</h3><p style=\"box-sizing: border-box; margin-bottom: 1.3em; margin-top: 0px;\">• Keep away from the reach of children<br style=\"box-sizing: border-box;\">• If the solution comes in contact with eyes, wash your eyes with water immediately ·<br style=\"box-sizing: border-box;\">• 3. Keep away from light and keep at room temperature<br style=\"box-sizing: border-box;\">• Keep away from combustible material and fire</p></div>', 40.00, 40.00, 0, '[]', '[]', '[]', NULL, 0, 1, 0, 1000, 5, 500, '1', 1, 0.00, 'amount', 0.00, 'amount', 'free', 0.00, 0.00, 0, 'Sanityza Hand Rub 50ml', 'PresentationContains 0.5% w/v Chlorhexidine Gluconate (equivalent to 2.5% v/v Chlorhexidine Gluconate solution BP) in 70% v/v Isopropyl Alcohol BDescriptionChlorhexidine Gluconate has wide spectrum of microbial coverage. It is used for intact disinfection of intact skin.IndicationsFor antisepsis of clean and surgical hand to prevent infectionsDosage & AdministrationTo sterilize clean hand: Take adequate amount (about 3 ml) of Sanityza on the palm of the both hands and wrists; rub until full drying as if every part is sterilized effectivelyBefore surgery: Apply about 5 ml of Sanityza following above mentioned method; apply upto the elbowPrecautions• Keep away from the reach of children• If the solution comes in contact with eyes, wash your eyes with water immediately ·• 3. Keep away from light and keep at room temperature• Keep away from combustible material and fire﻿﻿', 'uploads/products/meta/rx2jK7yrPHhxgSgLNZHJu6cFvvJnHcYSSzdtV9Kz.jpeg', NULL, 'Sanityza-Hand-Rub-50ml-HWNxZ', 0, 0.00, 0.00, NULL, 0, NULL, NULL, '2020-07-02 08:22:18', '2020-07-14 19:29:41'),
(55, 'Sanityza Hand Rub 250ml', 'admin', 12, 42, 47, NULL, NULL, '[\"uploads\\/products\\/photos\\/sa3dWEj7lMpslcAhdq7X3sIS14CKJ8Tazpmi9x0b.jpeg\",\"uploads\\/products\\/photos\\/fjcP9GKP0j4EbrcM9YZyS1qrQuD84sGctxcyLtCt.jpeg\",\"uploads\\/products\\/photos\\/RfzW17fXcOUa5AYO6Qj1UgSMW7ZcpMBQ5knZx2J3.jpeg\"]', 'uploads/products/thumbnail/fRIx36yH8fvTLNfo4zxFVnByCmWV8JVLaXUJAgGF.jpeg', 'uploads/products/featured/STeogbycGbrAw7Zgv8XAbiF51KqN8CusJVVdkJpg.jpeg', 'uploads/products/flash_deal/Qpi0xxWyAeoJgL1RI561ESYHTIppET6t5RNgRPg6.jpeg', 'youtube', NULL, 'hand Sanitizer', '<div class=\"fade in\" style=\"box-sizing: border-box; color: rgb(119, 119, 119); font-family: Lato, sans-serif; font-size: medium; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><h3 style=\"box-sizing: border-box; color: rgb(85, 85, 85); width: 1050px; margin-top: 0px; margin-bottom: 0.5em; text-rendering: optimizespeed; font-size: 1.25em; font-family: Lato, sans-serif; font-weight: 700;\">Presentation</h3><p style=\"box-sizing: border-box; margin-bottom: 1.3em; margin-top: 0px;\">Contains 0.5% w/v Chlorhexidine Gluconate (equivalent to 2.5% v/v Chlorhexidine Gluconate solution BP) in 70% v/v Isopropyl Alcohol B</p></div><div class=\"fade in\" style=\"box-sizing: border-box; color: rgb(119, 119, 119); font-family: Lato, sans-serif; font-size: medium; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><h3 style=\"box-sizing: border-box; color: rgb(85, 85, 85); width: 1050px; margin-top: 0px; margin-bottom: 0.5em; text-rendering: optimizespeed; font-size: 1.25em; font-family: Lato, sans-serif; font-weight: 700;\">Description</h3><p style=\"box-sizing: border-box; margin-bottom: 1.3em; margin-top: 0px;\">Chlorhexidine Gluconate has wide spectrum of microbial coverage. It is used for intact disinfection of intact skin.</p></div><div class=\"fade in\" style=\"box-sizing: border-box; color: rgb(119, 119, 119); font-family: Lato, sans-serif; font-size: medium; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><h3 style=\"box-sizing: border-box; color: rgb(85, 85, 85); width: 1050px; margin-top: 0px; margin-bottom: 0.5em; text-rendering: optimizespeed; font-size: 1.25em; font-family: Lato, sans-serif; font-weight: 700;\">Indications</h3><p style=\"box-sizing: border-box; margin-bottom: 1.3em; margin-top: 0px;\">For antisepsis of clean and surgical hand to prevent infections</p></div><div class=\"fade in\" style=\"box-sizing: border-box; color: rgb(119, 119, 119); font-family: Lato, sans-serif; font-size: medium; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><h3 style=\"box-sizing: border-box; color: rgb(85, 85, 85); width: 1050px; margin-top: 0px; margin-bottom: 0.5em; text-rendering: optimizespeed; font-size: 1.25em; font-family: Lato, sans-serif; font-weight: 700;\">Dosage &amp; Administration</h3><p style=\"box-sizing: border-box; margin-bottom: 1.3em; margin-top: 0px;\">To sterilize clean hand: Take adequate amount (about 3 ml) of Sanityza on the palm of the both hands and wrists; rub until full drying as if every part is sterilized effectively<br style=\"box-sizing: border-box;\">Before surgery: Apply about 5 ml of Sanityza following above mentioned method; apply upto the elbow</p></div><div class=\"fade in\" style=\"box-sizing: border-box; color: rgb(119, 119, 119); font-family: Lato, sans-serif; font-size: medium; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><h3 style=\"box-sizing: border-box; color: rgb(85, 85, 85); width: 1050px; margin-top: 0px; margin-bottom: 0.5em; text-rendering: optimizespeed; font-size: 1.25em; font-family: Lato, sans-serif; font-weight: 700;\">Precautions</h3><p style=\"box-sizing: border-box; margin-bottom: 1.3em; margin-top: 0px;\">• Keep away from the reach of children<br style=\"box-sizing: border-box;\">• If the solution comes in contact with eyes, wash your eyes with water immediately ·<br style=\"box-sizing: border-box;\">• 3. Keep away from light and keep at room temperature<br style=\"box-sizing: border-box;\">• Keep away from combustible material and fire</p></div>', 130.00, 130.00, 0, '[]', '[]', '[]', NULL, 0, 1, 0, 9999, 2, 100, '1', 1, 0.00, 'amount', 0.00, 'amount', 'free', 0.00, 0.00, 1, 'Sanityza Hand Rub 250ml', 'PresentationContains 0.5% w/v Chlorhexidine Gluconate (equivalent to 2.5% v/v Chlorhexidine Gluconate solution BP) in 70% v/v Isopropyl Alcohol BDescriptionChlorhexidine Gluconate has wide spectrum of microbial coverage. It is used for intact disinfection of intact skin.IndicationsFor antisepsis of clean and surgical hand to prevent infectionsDosage & AdministrationTo sterilize clean hand: Take adequate amount (about 3 ml) of Sanityza on the palm of the both hands and wrists; rub until full drying as if every part is sterilized effectivelyBefore surgery: Apply about 5 ml of Sanityza following above mentioned method; apply upto the elbowPrecautions• Keep away from the reach of children• If the solution comes in contact with eyes, wash your eyes with water immediately ·• 3. Keep away from light and keep at room temperature• Keep away from combustible material and fire﻿﻿', 'uploads/products/meta/nUMPG53ZuwiCjOt2r5WZJgZUygC0b9Z5WPINWYR5.jpeg', NULL, 'Sanityza-Hand-Rub-250ml-fwh4Q', 0, 0.00, 0.00, NULL, 0, NULL, NULL, '2020-07-02 08:28:02', '2020-09-06 00:54:01'),
(56, 'Commercial Water Purifier – GRO-200', 'seller', 37, 5, 162, 373, NULL, '[\"uploads\\/products\\/photos\\/BF0X1yaFJom9S7i0nj6VqiA0s79EVLWLojsKBPyO.png\"]', 'uploads/products/thumbnail/pw3omZHEMZiy2eaYBokHlgVhSL2dfWwDDbzRo1Zd.png', NULL, NULL, 'youtube', NULL, 'Water Purifier', '<p>Product Details\r\nCommercial Water Purifier – GRO-200\r\nProduct Model: GRO-200\r\nBrand: Heron\r\nOrigin: Taiwan\r\nOrigin of Membrane: USA\r\nCapacity: 200 GPD {30 Liter Per Hour (LPH)}\r\nReserve Capacity: 11 G Pressure Tank\r\nFiltration Stage: Five\r\nDimension: 78x41x26 CM\r\nTechnology: Reverse Osmosis (RO)\r\n</p><p>__________________________________\r\n</p><p>Free delivery and installation in Dhaka City\r\n1 year Motor Guaranty \r\n1 year product warranty\r\n1 year free service </p>', 31500.00, 31000.00, 0, '[]', '[]', '[]', NULL, 0, 1, 0, 1, 1, 20, '15', 1, 0.00, 'amount', 0.00, 'amount', 'free', 0.00, 0.00, 0, 'Commercial Water Purifier', 'Product Details\r\nCommercial Water Purifier – GRO-200\r\nProduct Model: GRO-200\r\nBrand: Heron\r\nOrigin: Taiwan\r\nOrigin of Membrane: USA\r\nCapacity: 200 GPD {30 Liter Per Hour (LPH)}\r\nReserve Capacity: 11 G Pressure Tank\r\nFiltration Stage: Five\r\nDimension: 78x41x26 CM\r\nTechnology: Reverse Osmosis (RO)\r\n__________________________________\r\nFree delivery and installation in Dhaka City\r\n1 year Motor Guaranty \r\n1 year product warranty\r\n1 year free service', 'uploads/products/meta/6cdNCjM9OcTQBiBnSHTUi8TTM0teJa2R9R0oJSSn.png', NULL, 'Commercial-Water-Purifier--GRO-200-Jzurr', 0, 0.00, 0.00, NULL, 0, NULL, NULL, '2020-07-04 16:14:15', '2020-07-04 16:18:48'),
(57, 'Heron Gold Water Purifier – GRO-075', 'seller', 37, 5, 162, 373, NULL, '[\"uploads\\/products\\/photos\\/Y7kdxSpDgE1JvtePwfs6G2FMbOSYTe6OUVfOFebv.png\"]', 'uploads/products/thumbnail/4J2hn4I9fthpDJBwebqkXlaoF6FGdVZujzJTJQD2.png', NULL, NULL, 'youtube', NULL, 'Water Purifier', '<p>Product DetailsHeron Gold Water Purifier – GRO-075\r\nModel: GRO-075\r\nBrand: Heron\r\nOrigin: Taiwan\r\nOrigin of Membrane: USA\r\nCapacity: 75 GPD\r\nReserve Capacity: 3.2 G Pressure Tank\r\nFiltration Stage: Six\r\nFaucet: Goose type Golden Hand\r\nTechnology: Mineral RO\r\n__________________________________\r\n</p><p>Free delivery and installation in Dhaka City\r\n1 year Motor Guaranty \r\n1 year product warranty\r\n1 year free service \r\n----------------------------------------------</p>', 12600.00, 12100.00, 0, '[]', '[]', '[]', NULL, 0, 1, 0, 1, 1, 10, '15', 1, 0.00, 'amount', 0.00, 'amount', 'free', 0.00, 0.00, 0, NULL, 'Product Details\r\nHeron Gold Water Purifier – GRO-075\r\nModel: GRO-075\r\nBrand: Heron\r\nOrigin: Taiwan\r\nOrigin of Membrane: USA\r\nCapacity: 75 GPD\r\nReserve Capacity: 3.2 G Pressure Tank\r\nFiltration Stage: Six\r\nFaucet: Goose type Golden Hand\r\nTechnology: Mineral RO\r\n__________________________________\r\nFree delivery and installation in Dhaka City\r\n1 year Motor Guaranty \r\n1 year product warranty\r\n1 year free service \r\n----------------------------------------------', NULL, NULL, 'Heron-Gold-Water-Purifier--GRO-075-2PLA6', 0, 0.00, 0.00, NULL, 0, NULL, NULL, '2020-07-04 16:30:42', '2020-07-04 16:30:42'),
(58, 'RO Water Purifier with Mineral – GRO-060-M', 'seller', 37, 5, 162, 373, NULL, '[\"uploads\\/products\\/photos\\/lSxdgMMWAOKgvZZKFUdiFKNS6LHVTdDaK1Qk1f9o.png\"]', 'uploads/products/thumbnail/jKY2VAcvnW5y7C7jtHoXe934joLhAl4o1Z2jOODC.png', NULL, NULL, 'youtube', NULL, 'Water Purifier', 'Product DetailsModel: GRO-060-M\r\nBrand: Heron\r\nOrigin of Membrane: USA\r\nCapacity: 60/75/100 GPD\r\nReserve Capacity: 3.2G Pressure Tank\r\nFiltration Stage: Six\r\nDimension: 460 X 410 X 210 mm\r\nTechnology: Reverse Osmosis\r\n_________________________________\r\nFree delivery and installation in Dhaka City\r\n1 year Motor Guaranty \r\n1 year product warranty\r\n1 year free service', 14500.00, 14000.00, 0, '[]', '[]', '[]', NULL, 0, 1, 0, 0, 0, 0, '1', 1, 0.00, 'amount', 0.00, 'amount', 'free', 0.00, 0.00, 0, 'Water Purifier', 'Product Details\r\nModel: GRO-060-M\r\nBrand: Heron\r\nOrigin of Membrane: USA\r\nCapacity: 60/75/100 GPD\r\nReserve Capacity: 3.2G Pressure Tank\r\nFiltration Stage: Six\r\nDimension: 460 X 410 X 210 mm\r\nTechnology: Reverse Osmosis\r\n_________________________________\r\nFree delivery and installation in Dhaka City\r\n1 year Motor Guaranty \r\n1 year product warranty\r\n1 year free service', NULL, NULL, 'RO-Water-Purifier-with-Mineral--GRO-060-M-g4L0k', 0, 0.00, 0.00, NULL, 0, NULL, NULL, '2020-07-04 16:37:35', '2020-07-04 16:37:35');
INSERT INTO `products` (`id`, `name`, `added_by`, `user_id`, `category_id`, `subcategory_id`, `subsubcategory_id`, `brand_id`, `photos`, `thumbnail_img`, `featured_img`, `flash_deal_img`, `video_provider`, `video_link`, `tags`, `description`, `unit_price`, `purchase_price`, `variant_product`, `attributes`, `choice_options`, `colors`, `variations`, `todays_deal`, `published`, `featured`, `current_stock`, `min_stock`, `max_stock`, `unit`, `min_qty`, `discount`, `discount_type`, `tax`, `tax_type`, `shipping_type`, `shipping_cost`, `outside_shipping_cost`, `num_of_sale`, `meta_title`, `meta_description`, `meta_img`, `pdf`, `slug`, `refundable`, `earn_point`, `rating`, `barcode`, `digital`, `file_name`, `file_path`, `created_at`, `updated_at`) VALUES
(59, 'Small Inline Water Purifier – G-UV-501', 'seller', 37, 5, 162, 373, NULL, '[\"uploads\\/products\\/photos\\/xyhNPNCbtBZVuFgkVOKBgIopQWHQQ24KHGr9H1Nf.png\"]', 'uploads/products/thumbnail/3HRaYNpoZsRy9KZT76vtNbp71KYXP8xF6k5GFuuG.png', NULL, NULL, 'youtube', NULL, 'Water Purifier', 'rSmall Inline Water Purifier – G-UV-501\r\nProduct Model: G-UV-501\r\nBrand: Heron\r\nOrigin: Taiwan\r\nCapacity: 1 GPM\r\nFiltration Stage: Five\r\nDimension: 46x41x21 CM\r\nTechnology: Ultra Violet\r\n_________________________________\r\nFree delivery and installation in Dhaka City\r\n1 year Motor Guaranty \r\n1 year product warranty\r\n1 year free service', 6800.00, 6500.00, 0, '[]', '[]', '[]', NULL, 0, 1, 0, 1, 1, 15, '1', 1, 0.00, 'amount', 0.00, 'amount', 'free', 0.00, 0.00, 0, 'Small Inline Water Purifier – G-UV-501', 'Small Inline Water Purifier – G-UV-501\r\nProduct Model: G-UV-501\r\nBrand: Heron\r\nOrigin: Taiwan\r\nCapacity: 1 GPM\r\nFiltration Stage: Five\r\nDimension: 46x41x21 CM\r\nTechnology: Ultra Violet\r\n_________________________________\r\nFree delivery and installation in Dhaka City\r\n1 year Motor Guaranty \r\n1 year product warranty\r\n1 year free service', NULL, NULL, 'Small-Inline-Water-Purifier--G-UV-501-Okrid', 0, 0.00, 0.00, NULL, 0, NULL, NULL, '2020-07-04 16:42:28', '2020-07-04 16:42:28'),
(60, 'Water Purifier – Heron GRO-2300', 'seller', 37, 5, 162, 373, NULL, '[\"uploads\\/products\\/photos\\/TNg7iDU0hC1xHL2pnOvtqBzahI44KDR8HqynZIyB.png\"]', 'uploads/products/thumbnail/M6ZwNmVFrjLWd8ExSQSFqRB70Udj5SE5H6OZxnwo.png', NULL, NULL, 'youtube', NULL, 'Water Purifier ,Heron,Shopaz eStore', '<p>Product Details</p><p>\r\nModel: GRO-2300\r\nBrand: Heron\r\nOrigin: Taiwan\r\nOrigin of Membrane: USA\r\nPower: Hot: 500 W &amp; Cold: 85 W\r\n</p><p>Reserve Capacity: 6.1 Liter\r\nFiltration Stage: Five\r\nDimension: 30x39.5x111 CM\r\nTechnology: Reverse Osmosis\r\n</p><p>__________________________________\r\n</p><p>Free delivery and installation in Dhaka City\r\n1 year </p><p>Motor Guaranty \r\n1 year</p><p> product warranty\r\n1 year</p><p> free service \r\n----------------------------------------------\r\n</p>', 30500.00, 30000.00, 0, '[]', '[]', '[]', NULL, 0, 1, 0, 1, 1, 5, '15', 1, 0.00, 'amount', 0.00, 'amount', 'free', 0.00, 0.00, 0, NULL, 'Product Details\r\nModel: GRO-2300\r\nBrand: Heron\r\nOrigin: Taiwan\r\nOrigin of Membrane: USA\r\nPower: Hot: 500 W & Cold: 85 W\r\nReserve Capacity: 6.1 Liter\r\nFiltration Stage: Five\r\nDimension: 30x39.5x111 CM\r\nTechnology: Reverse Osmosis\r\n__________________________________\r\nFree delivery and installation in Dhaka City\r\n1 year Motor Guaranty \r\n1 year product warranty\r\n1 year free service \r\n----------------------------------------------', NULL, NULL, 'Water-Purifier--Heron-GRO-2300-lOzQN', 0, 0.00, 0.00, NULL, 0, NULL, NULL, '2020-07-04 16:47:51', '2020-07-04 16:47:51'),
(61, 'LSRO-101-BWG Water Purifier', 'seller', 37, 5, 162, 373, NULL, '[\"uploads\\/products\\/photos\\/dz4Pc8DTmxzhSGGS5OEAt9GgNGyzXSZaPK06qwd0.png\"]', 'uploads/products/thumbnail/TKquK4fDlx7y5jrSBPuwpo4PgNqYTmOGpqgLPQlP.png', NULL, NULL, 'youtube', NULL, 'Water Purifier', 'Product DetailsMODEL NO: LSRO-101-BWG\r\n\r\nBrand: Lan Shan\r\nOrigin: Taiwan\r\nMembrane: USA\r\nCapacity: 75 / 100 GPD\r\nFiltration Stage: Five\r\nDimension: 13 X 40 X 40 cm\r\nTechnology: Reverse Osmosis (RO)\r\n\r\n&gt;&gt; Warranty: 1 Year\r\n&gt;&gt; Home delivery and Installation', 15500.00, 15000.00, 0, '[]', '[]', '[]', NULL, 0, 1, 0, 1, 1, 5, '15', 1, 0.00, 'amount', 0.00, 'amount', 'free', 0.00, 0.00, 0, 'Water Purifier', 'Product Details\r\nMODEL NO: LSRO-101-BWG\r\n\r\nBrand: Lan Shan\r\nOrigin: Taiwan\r\nMembrane: USA\r\nCapacity: 75 / 100 GPD\r\nFiltration Stage: Five\r\nDimension: 13 X 40 X 40 cm\r\nTechnology: Reverse Osmosis (RO)\r\n\r\n>> Warranty: 1 Year\r\n>> Home delivery and Installation', NULL, NULL, 'LSRO-101-BWG-Water-Purifier-Qz2rj', 0, 0.00, 0.00, NULL, 0, NULL, NULL, '2020-07-04 16:53:14', '2020-07-04 16:53:14'),
(62, 'LSRO-101-BW Lan Shan Water Purifier', 'seller', 37, 5, 162, 373, NULL, '[\"uploads\\/products\\/photos\\/d2gX4W7BB2ax7aGx6CRSPHXSWuZ0h5R13V3kw1BS.png\"]', 'uploads/products/thumbnail/gVBttlo51fCI6Lh95k5iAO1M7I3JRcELuqnh2vOm.png', NULL, NULL, 'youtube', NULL, 'Water Purifier,Lan Shan', 'Product DetailsMODEL NO: LSRO-101-BW\r\n\r\nBrand: Lan Shan\r\nOrigin: Taiwan\r\nMembrane: USA\r\nCapacity: 75 / 100 GPD\r\nFiltration Stage: 5 (Five)\r\nReserve Capacity: 4.0 G Pressure Tank\r\nDimension: 13 X 40 X 40 cm\r\nTechnology: Reverse Osmosis (RO)\r\n\r\n&gt;&gt; Warranty: 1 Year\r\n&gt;&gt; Home delivery and Installation', 15900.00, 15400.00, 0, '[]', '[]', '[]', NULL, 0, 1, 0, 1, 1, 5, '15', 1, 0.00, 'amount', 0.00, 'amount', 'free', 0.00, 0.00, 0, 'Water Purifier', 'Product Details\r\nMODEL NO: LSRO-101-BW\r\n\r\nBrand: Lan Shan\r\nOrigin: Taiwan\r\nMembrane: USA\r\nCapacity: 75 / 100 GPD\r\nFiltration Stage: 5 (Five)\r\nReserve Capacity: 4.0 G Pressure Tank\r\nDimension: 13 X 40 X 40 cm\r\nTechnology: Reverse Osmosis (RO)\r\n\r\n>> Warranty: 1 Year\r\n>> Home delivery and Installation', NULL, NULL, 'LSRO-101-BW-Lan-Shan-Water-Purifier-Fsh6D', 0, 0.00, 0.00, NULL, 0, NULL, NULL, '2020-07-04 16:57:38', '2020-07-04 16:57:38'),
(63, 'LSRO-575-G Water Purifier', 'seller', 37, 5, 162, 373, NULL, '[\"uploads\\/products\\/photos\\/TT1U4457vKWfDUin72DK2bcKCuW9vZ78zf7wG5hO.png\"]', 'uploads/products/thumbnail/cELh6eI7yVskamoncWbLVLyUDr3x8Lcis5d1REAB.png', NULL, NULL, 'youtube', NULL, 'wa', 'Product Details MODEL NO: LSRO-575-G\r\n\r\nBrand: Lan Shan\r\nOrigin: Taiwan\r\nMembrane: USA\r\nCapacity: 75 / 100 GPD\r\nFiltration Stage: Six\r\nDimension: 22 X 37 X 38 cm\r\nTechnology: Reverse Osmosis (RO)\r\n\r\n&gt;&gt; Warranty: 1 Year\r\n&gt;&gt; Home delivery and Installation', 16500.00, 16000.00, 0, '[]', '[]', '[]', NULL, 0, 1, 0, 1, 1, 0, '15', 1, 0.00, 'amount', 0.00, 'amount', 'free', 0.00, 0.00, 0, NULL, 'Product Details\r\nMODEL NO: LSRO-575-G\r\n\r\nBrand: Lan Shan\r\nOrigin: Taiwan\r\nMembrane: USA\r\nCapacity: 75 / 100 GPD\r\nFiltration Stage: Six\r\nDimension: 22 X 37 X 38 cm\r\nTechnology: Reverse Osmosis (RO)\r\n\r\n>> Warranty: 1 Year\r\n>> Home delivery and Installation', NULL, NULL, 'LSRO-575-G-Water-Purifier-R4Tr7', 0, 0.00, 0.00, NULL, 0, NULL, NULL, '2020-07-04 16:59:33', '2020-07-04 17:00:15'),
(64, 'LSRO-101-M Water Purifier', 'seller', 37, 5, 162, 373, NULL, '[\"uploads\\/products\\/photos\\/iJHY6MQJ74XDQrPFamLxMN5bviX3wrzW8WwBog13.png\"]', 'uploads/products/thumbnail/3Z2ckZ703W2uvSbzuipvTYVn3OezA15fWyokgfxq.png', NULL, NULL, 'youtube', NULL, 'Water Purifier,Shopaz eStore,Lan Shan', '<p style=\"text-align: justify;\"><strong>Product DetailsMODEL NO: LSRO-101-M\r\n\r\nBrand: Lan Shan\r\nOrigin: Taiwan\r\nMembrane: USA\r\nCapacity: 50/  75 GPD\r\nFiltration Stage: Six\r\nReserve Capacity: 4.0 G Pressure Tank\r\nDimension: 13 X 40 X 40 cm\r\nTechnology: Reverse Osmosis (RO)\r\n\r\n&gt;&gt; Warranty: 1 Year\r\n&gt;&gt; Home delivery and Installation</strong></p>', 16900.00, 16400.00, 0, '[]', '[]', '[]', NULL, 0, 1, 0, 1, 1, 5, '15', 1, 0.00, 'amount', 0.00, 'amount', 'free', 0.00, 0.00, 0, 'Water Purifier', NULL, NULL, NULL, 'LSRO-101-M-Water-Purifier-bvWaI', 0, 0.00, 0.00, NULL, 0, NULL, NULL, '2020-07-04 17:04:05', '2020-07-04 17:04:05'),
(65, 'LSRO-1550-G Water Purifier', 'seller', 37, 5, 162, 373, NULL, '[\"uploads\\/products\\/photos\\/hnCAdj4haNPEbip9mjW21A7HMM4ZqjHg6uFXQ1Fy.png\"]', 'uploads/products/thumbnail/hHC1jV8yS195ATSviab98kJv2DF9cB6wk69lQbut.png', NULL, NULL, 'youtube', NULL, 'Water Purifier,Shopaz eStore ,Lan Shan', '<p style=\"text-align: justify;\">Product DetailsMODEL NO: LSRO-1550-G\r\n\r\nBrand: Lan Shan\r\nOrigin: Taiwan\r\nMembrane: USA\r\nCapacity: 50 / 100 GPD\r\nFiltration Stage: Five\r\nReserve Capacity: 15 Liters\r\nDimension: 28 X 34 X 46 cm\r\nTechnology: Reverse Osmosis (RO)\r\n\r\n&gt;&gt; Warranty: 1 Year\r\n&gt;&gt; Home delivery and Installation</p>', 21900.00, 21000.00, 0, '[]', '[]', '[]', NULL, 0, 1, 0, 1, 1, 5, '15', 1, 0.00, 'amount', 0.00, 'amount', 'free', 0.00, 0.00, 0, 'Water Purifier', 'Product Details\r\nMODEL NO: LSRO-1550-G\r\n\r\nBrand: Lan Shan\r\nOrigin: Taiwan\r\nMembrane: USA\r\nCapacity: 50 / 100 GPD\r\nFiltration Stage: Five\r\nReserve Capacity: 15 Liters\r\nDimension: 28 X 34 X 46 cm\r\nTechnology: Reverse Osmosis (RO)\r\n\r\n>> Warranty: 1 Year\r\n>> Home delivery and Installation', NULL, NULL, 'LSRO-1550-G-Water-Purifier-qyYQi', 0, 0.00, 0.00, NULL, 0, NULL, NULL, '2020-07-04 17:07:34', '2020-07-04 17:07:34'),
(66, 'STANDING RO WATER PURIFIER', 'seller', 37, 5, 162, 373, NULL, '[\"uploads\\/products\\/photos\\/7PVznuiQ8EzTvnpdC48FdZ1ECzb1vaJdMzrP8BOj.png\"]', 'uploads/products/thumbnail/I7RyE9k9AzA2CVjMrvqqcdffuMq1CsLLl6eWgjDq.png', NULL, NULL, 'youtube', NULL, 'WATER PURIFIER,Shopaz eStore', '<p style=\"text-align: justify;\">Product Details\r\nMODEL NO: LSRO-929-CAR\r\n\r\nFeature:\r\n&gt;&gt;Built-in Reverse Osmosis (RO)\r\n&gt;&gt;5 Stage RO system inside with booster pump\r\n&gt;&gt;Highly efficient, noiseless and low power consuming compressor\r\n&gt;&gt;Re-boiling feature convenient for making coffee, tea or instant soup.\r\n&gt;&gt;Hot water capacity 2L, Cold water 3L and warm water 8L.\r\n&gt;&gt;USA based Reverse Osmosis membrane.\r\n&gt;&gt;Dimension: D33 X W40 X H105 cm\r\n\r\n&gt;&gt;Origin: Taiwan\r\n&gt;&gt;Brand: LAN SHAN\r\n&gt;&gt;Warranty: 1 Year\r\n\r\n&gt;&gt; Home Delivery &amp; Installation</p>', 51900.00, 50000.00, 0, '[]', '[]', '[]', NULL, 0, 1, 0, 1, 1, 5, '15', 1, 0.00, 'amount', 0.00, 'amount', 'free', 0.00, 0.00, 0, 'Water Purifier', 'Product Details\r\nMODEL NO: LSRO-929-CAR\r\n\r\nFeature:\r\n>>Built-in Reverse Osmosis (RO)\r\n>>5 Stage RO system inside with booster pump\r\n>>Highly efficient, noiseless and low power consuming compressor\r\n>>Re-boiling feature convenient for making coffee, tea or instant soup.\r\n>>Hot water capacity 2L, Cold water 3L and warm water 8L.\r\n>>USA based Reverse Osmosis membrane.\r\n>>Dimension: D33 X W40 X H105 cm\r\n\r\n>>Origin: Taiwan\r\n>>Brand: LAN SHAN\r\n>>Warranty: 1 Year\r\n\r\n>> Home Delivery & Installation', NULL, NULL, 'STANDING-RO-WATER-PURIFIER-tnQOZ', 0, 0.00, 0.00, NULL, 0, NULL, NULL, '2020-07-04 17:10:34', '2020-07-04 17:10:34'),
(67, 'DIGITAL HOT COLD WARM WATER PURIFIER', 'seller', 37, 5, 162, 373, NULL, '[\"uploads\\/products\\/photos\\/0RzovdOicwcDYnkfCN9VTzzWtT46Fbr4DvDv2IUe.png\"]', 'uploads/products/thumbnail/t8gUycuTHa7x0F2B8YDgiC2FXxdUSzvJ1buaAZe3.png', NULL, NULL, 'youtube', NULL, 'WARM WATER PURIFIER,Shopaz eStore', '<p style=\"text-align: justify;\">Product DetailsMODEL NO: LSRO-171\r\n\r\nFeature:\r\n&gt;&gt;Built-in Reverse Osmosis (RO)\r\n&gt;&gt;5 Stage RO system inside with booster pump\r\n&gt;&gt;LED Hot water temperature display\r\n&gt;&gt;Highly efficient, noiseless and low power consuming compressor\r\n&gt;&gt;Re-boiling feature convenient for making coffee, tea or instant soup.\r\n&gt;&gt;Hot water capacity 5L, Cold water 3L and warm water 10L.\r\n&gt;&gt;USA based Reverse Osmosis membrane.\r\n\r\n&gt;&gt;Origin: Taiwan\r\n&gt;&gt;Brand: LAN SHAN\r\n&gt;&gt;Warranty: 1 Year\r\n\r\n&gt;&gt; Home Delivery &amp; Installation</p>', 69900.00, 69000.00, 0, '[]', '[]', '[]', NULL, 0, 1, 0, 1, 1, 5, '15', 1, 0.00, 'amount', 0.00, 'amount', 'free', 0.00, 0.00, 0, 'Water Purifier', 'Product Details\r\nMODEL NO: LSRO-171\r\n\r\nFeature:\r\n>>Built-in Reverse Osmosis (RO)\r\n>>5 Stage RO system inside with booster pump\r\n>>LED Hot water temperature display\r\n>>Highly efficient, noiseless and low power consuming compressor\r\n>>Re-boiling feature convenient for making coffee, tea or instant soup.\r\n>>Hot water capacity 5L, Cold water 3L and warm water 10L.\r\n>>USA based Reverse Osmosis membrane.\r\n\r\n>>Origin: Taiwan\r\n>>Brand: LAN SHAN\r\n>>Warranty: 1 Year\r\n\r\n>> Home Delivery & Installation', NULL, NULL, 'DIGITAL-HOT-COLD-WARM-WATER-PURIFIER-bkctA', 0, 0.00, 0.00, NULL, 0, NULL, NULL, '2020-07-04 17:12:38', '2020-07-04 17:16:07'),
(68, 'Hand Clean Gel 200ml', 'admin', 12, 42, 47, NULL, NULL, '[\"uploads\\/products\\/photos\\/aaIVg30R0mBd09mDTgp8vZ5FV49U6bGzMnBVHsiN.jpeg\",\"uploads\\/products\\/photos\\/59yArefJKyjTvsjBxuC4x5NpbMooNPryhgjtPW90.jpeg\",\"uploads\\/products\\/photos\\/6OjHLD0Wkkjv6khvzf7kVgIQT13zgwSg7clFJoji.jpeg\"]', 'uploads/products/thumbnail/dX1Yrhd9mTetCRFpRxd0knvLobdnyFrBDSqXLlH5.jpeg', 'uploads/products/featured/0NuayRvIAgdlxKjgki6tcEJ1ZN4K3MqYZp89mZzX.jpeg', 'uploads/products/flash_deal/pT4RfuRucSBiQf7SbSiTTk2W63NMpo5vLm9u8UaG.jpeg', 'youtube', NULL, 'Gel,Hand sanitizer,Hand rub,hand clean', '<p style=\"box-sizing: border-box; margin: 0px 0px 15px; color: rgb(64, 59, 55); font-family: &quot;Avenir Next Rounded&quot;, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><span style=\"box-sizing: border-box;\">Ethanol hand refreshing gel to help protecting skin from harmful substances.</span><span style=\"box-sizing: border-box;\">This hand gel contains 62% ethanol removes 99.9 of germs, water is not required for use and there is no need to wash hands after use.<br style=\"box-sizing: border-box;\"><br style=\"box-sizing: border-box;\">Vegan &amp; Cruelty Free Products</span></p><p style=\"box-sizing: border-box; margin: 0px 0px 15px; color: rgb(64, 59, 55); font-family: &quot;Avenir Next Rounded&quot;, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><span style=\"box-sizing: border-box;\">7 Types of Plant extract!<br style=\"box-sizing: border-box;\">- Celery, Carrot, Fennel, Kale, Coriander, Lettuce and Spinach.</span></p><p style=\"box-sizing: border-box; margin: 0px 0px 15px; color: rgb(64, 59, 55); font-family: &quot;Avenir Next Rounded&quot;, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><span style=\"box-sizing: border-box;\">Ingredients:<br style=\"box-sizing: border-box;\">Alcohol, Water, Carbomer, 1,2-Hexanediol, Apium Graveolens(Celery) Extract, Daucus Carota Sativa (Carrot) Root Extract, Foeniculum Vulgare (Fennel) Seed Extract, Aminomethyl Propanol, Brassica Oleracea Acephala (Kale) Leaf Extract, Coriandrum Sativum (Coriander) Extract, Lactuca Scariola Sativa (Lettuce) Leaf Extract,&nbsp;Spinach Oleracea (Spinach) Leaf Extract.</span></p><h3 style=\"box-sizing: border-box; font-family: &quot;Avenir Next Rounded&quot;, sans-serif; font-weight: 400; font-style: normal; margin: 2em 0px 15px; line-height: 1.4; font-size: 1.3125em; color: rgb(64, 59, 55); font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\">Description</h3><div class=\"detail-desc\" style=\"box-sizing: border-box; margin-bottom: 15px; color: rgb(64, 59, 55); font-family: &quot;Avenir Next Rounded&quot;, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><p style=\"box-sizing: border-box; margin: 0px 0px 15px;\">Ethanol hand refreshing gel to help protecting skin from harmful substances. This hand gel contains 62% ethanol removes 99.9 of germs, water is not required for use and there is no need to wash hands after use.</p><p style=\"box-sizing: border-box; margin: 0px 0px 15px;\">CDC recommends the use of alcohol-based hand sanitizers with greater than 60% ETHANOL or 70% ISOPROPANOL as the preferred form of hand hygiene in healthcare settings, based upon greater access to hand sanitizer.</p><p style=\"box-sizing: border-box; margin: 0px 0px 15px;\">Health care providers who use alcohol-based hand sanitizers as part of their hand hygiene routine can inform patients that they are following CDC guidelines.</p></div>', 300.00, 300.00, 0, '[]', '[]', '[]', NULL, 0, 1, 0, 10000, 1, 100, '1', 1, 0.00, 'percent', 0.00, 'amount', 'free', 0.00, 70.00, 0, 'Hand Clean Gel 200ml', 'Ethanol hand refreshing gel to help protecting skin from harmful substances.This hand gel contains 62% ethanol removes 99.9 of germs, water is not required for use and there is no need to wash hands after use.Vegan & Cruelty Free Products7 Types of Plant extract!- Celery, Carrot, Fennel, Kale, Coriander, Lettuce and Spinach.Ingredients:Alcohol, Water, Carbomer, 1,2-Hexanediol, Apium Graveolens(Celery) Extract, Daucus Carota Sativa (Carrot) Root Extract, Foeniculum Vulgare (Fennel) Seed Extract, Aminomethyl Propanol, Brassica Oleracea Acephala (Kale) Leaf Extract, Coriandrum Sativum (Coriander) Extract, Lactuca Scariola Sativa (Lettuce) Leaf Extract, Spinach Oleracea (Spinach) Leaf Extract.DescriptionEthanol hand refreshing gel to help protecting skin from harmful substances. This hand gel contains 62% ethanol removes 99.9 of germs, water is not required for use and there is no need to wash hands after use.CDC recommends the use of alcohol-based hand sanitizers with greater than 60% ETHANOL or 70% ISOPROPANOL as the preferred form of hand hygiene in healthcare settings, based upon greater access to hand sanitizer.Health care providers who use alcohol-based hand sanitizers as part of their hand hygiene routine can inform patients that they are following CDC guidelines.﻿﻿', 'uploads/products/meta/S6MqFIQsn8bKWep4xLDcmHVJF2ePNxiW9oVSxk8t.jpeg', NULL, 'Hand-Clean-Gel-200ml-UU2gw', 0, 0.00, 0.00, NULL, 0, NULL, NULL, '2020-07-04 19:32:52', '2020-07-14 19:29:00'),
(69, 'Hand Clean Gel 50ml', 'admin', 12, 42, 47, NULL, NULL, '[\"uploads\\/products\\/photos\\/MvByrDVbHrgrovWLMbc3oalnrJU9ymL7JQudAPxw.jpeg\",\"uploads\\/products\\/photos\\/KA4rQPJSdsJOhzmBcgSIFE8wym9MbR0jSoWMOgIu.jpeg\",\"uploads\\/products\\/photos\\/lr65RiyXOcBqfEz4ZhYqrIhpCxJLQTtqLhLPQWVA.jpeg\"]', 'uploads/products/thumbnail/5F5PapmYuVIahVmcnQqZtdpMp2IE5vWoHeOUNeOj.jpeg', 'uploads/products/featured/4RBtM4ZHnGqy4VQKXMzjvhiTgxhElGegHaSSdWkx.jpeg', 'uploads/products/flash_deal/9yUh41MkeoQBraq821sytSyuyWk9RVKI5WSUHRDq.jpeg', 'youtube', NULL, 'gel,hand sanitizer,hand rub', '<p style=\"box-sizing: border-box; margin: 0px 0px 15px; color: rgb(64, 59, 55); font-family: &quot;Avenir Next Rounded&quot;, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><span style=\"box-sizing: border-box;\">Ethanol hand refreshing gel to help protecting skin from harmful substances.</span><span style=\"box-sizing: border-box;\">This hand gel contains 62% ethanol removes 99.9 of germs, water is not required for use and there is no need to wash hands after use.<br style=\"box-sizing: border-box;\"><br style=\"box-sizing: border-box;\">Vegan &amp; Cruelty Free Products</span></p><p style=\"box-sizing: border-box; margin: 0px 0px 15px; color: rgb(64, 59, 55); font-family: &quot;Avenir Next Rounded&quot;, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><span style=\"box-sizing: border-box;\">7 Types of Plant extract!<br style=\"box-sizing: border-box;\">- Celery, Carrot, Fennel, Kale, Coriander, Lettuce and Spinach.</span></p><p style=\"box-sizing: border-box; margin: 0px 0px 15px; color: rgb(64, 59, 55); font-family: &quot;Avenir Next Rounded&quot;, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><span style=\"box-sizing: border-box;\">Ingredients:<br style=\"box-sizing: border-box;\">Alcohol, Water, Carbomer, 1,2-Hexanediol, Apium Graveolens(Celery) Extract, Daucus Carota Sativa (Carrot) Root Extract, Foeniculum Vulgare (Fennel) Seed Extract, Aminomethyl Propanol, Brassica Oleracea Acephala (Kale) Leaf Extract, Coriandrum Sativum (Coriander) Extract, Lactuca Scariola Sativa (Lettuce) Leaf Extract,&nbsp;Spinach Oleracea (Spinach) Leaf Extract.</span></p><h3 style=\"box-sizing: border-box; font-family: &quot;Avenir Next Rounded&quot;, sans-serif; font-weight: 400; font-style: normal; margin: 2em 0px 15px; line-height: 1.4; font-size: 1.3125em; color: rgb(64, 59, 55); font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\">Description</h3><div class=\"detail-desc\" style=\"box-sizing: border-box; margin-bottom: 15px; color: rgb(64, 59, 55); font-family: &quot;Avenir Next Rounded&quot;, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><p style=\"box-sizing: border-box; margin: 0px 0px 15px;\">Ethanol hand refreshing gel to help protecting skin from harmful substances. This hand gel contains 62% ethanol removes 99.9 of germs, water is not required for use and there is no need to wash hands after use.</p><p style=\"box-sizing: border-box; margin: 0px 0px 15px;\">CDC recommends the use of alcohol-based hand sanitizers with greater than 60% ETHANOL or 70% ISOPROPANOL as the preferred form of hand hygiene in healthcare settings, based upon greater access to hand sanitizer.</p><p style=\"box-sizing: border-box; margin: 0px 0px 15px;\">Health care providers who use alcohol-based hand sanitizers as part of their hand hygiene routine can inform patients that they are following CDC guidelines.</p></div><br>', 100.00, 100.00, 0, '[]', '[]', '[]', NULL, 0, 1, 0, 1000, 5, 1000, '5', 1, 0.00, 'amount', 0.00, 'amount', 'free', 0.00, 0.00, 0, 'Hand Clean Gel 200ml', 'Ethanol hand refreshing gel to help protecting skin from harmful substances.This hand gel contains 62% ethanol removes 99.9 of germs, water is not required for use and there is no need to wash hands after use.Vegan & Cruelty Free Products7 Types of Plant extract!- Celery, Carrot, Fennel, Kale, Coriander, Lettuce and Spinach.Ingredients:Alcohol, Water, Carbomer, 1,2-Hexanediol, Apium Graveolens(Celery) Extract, Daucus Carota Sativa (Carrot) Root Extract, Foeniculum Vulgare (Fennel) Seed Extract, Aminomethyl Propanol, Brassica Oleracea Acephala (Kale) Leaf Extract, Coriandrum Sativum (Coriander) Extract, Lactuca Scariola Sativa (Lettuce) Leaf Extract, Spinach Oleracea (Spinach) Leaf Extract.DescriptionEthanol hand refreshing gel to help protecting skin from harmful substances. This hand gel contains 62% ethanol removes 99.9 of germs, water is not required for use and there is no need to wash hands after use.CDC recommends the use of alcohol-based hand sanitizers with greater than 60% ETHANOL or 70% ISOPROPANOL as the preferred form of hand hygiene in healthcare settings, based upon greater access to hand sanitizer.Health care providers who use alcohol-based hand sanitizers as part of their hand hygiene routine can inform patients that they are following CDC guidelines.', 'uploads/products/meta/6ZfXZhRLTUmvNa460IAjw0W9W2gxteY90KDkEDcw.jpeg', NULL, 'Hand-Clean-Gel-50ml-0HFxD', 0, 0.00, 0.00, NULL, 0, NULL, NULL, '2020-07-11 14:44:12', '2020-07-14 19:30:56'),
(70, 'Nano Spray', 'admin', 12, 42, 47, NULL, NULL, '[\"uploads\\/products\\/photos\\/IWZiTGqPM2FppH1kP70LfZqoiUfwluA2eWZLaHiC.jpeg\",\"uploads\\/products\\/photos\\/D1ZvQk2BbaFGmFGWDCyfrY1tZO3xpBVDQxVoM3kR.jpeg\",\"uploads\\/products\\/photos\\/MgGLUSR8G70bRayRhRDXcV5zKPFj6Rho9IOcFcOw.jpeg\",\"uploads\\/products\\/photos\\/L4R8mXQN36ktWO84gfA7nQErZyLrp3QF4N9iTjuO.jpeg\"]', 'uploads/products/thumbnail/CgPjBmamV0IZhQ9Dt4eT9JVhlEVZPrW7kVBK5RnN.jpeg', 'uploads/products/featured/HjABhiJhlwCM2dYp9Jj2VC8kUFuV0FDSXjXj6DWV.jpeg', 'uploads/products/flash_deal/YyVa4U7USHZMJ60SPG5x0Rrut0Ix0hgKK33yTTqq.jpeg', 'youtube', NULL, 'sanitizer,spray,nano spray', '<div class=\"o9v6fnle cxmmr5t8 oygrvhab hcukyx3x c1et5uql ii04i59q\" style=\"overflow-wrap: break-word; margin: 0.5em 0px 0px; white-space: pre-wrap; font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; color: rgb(5, 5, 5); font-size: 15px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><div dir=\"auto\" style=\"font-family: inherit; text-align: start;\">Model: JPM-076</div><div dir=\"auto\" style=\"font-family: inherit; text-align: start;\">Features:</div><div dir=\"auto\" style=\"font-family: inherit; text-align: start;\">Power: 3.7V</div><div dir=\"auto\" style=\"font-family: inherit; text-align: start;\">Battery: 450mAh</div><div dir=\"auto\" style=\"font-family: inherit; text-align: start;\">Tank capacity: 30ML</div></div><div class=\"o9v6fnle cxmmr5t8 oygrvhab hcukyx3x c1et5uql ii04i59q\" style=\"overflow-wrap: break-word; margin: 0.5em 0px 0px; white-space: pre-wrap; font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; color: rgb(5, 5, 5); font-size: 15px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><div dir=\"auto\" style=\"font-family: inherit; text-align: start;\">আপনার জুতো , মানিব্যাগ, চাবি, গ্যাজেট, আসবাবপত্র, মোবাইল, গাড়ি, দরজা, হাতল , কোথাও বসার আগে , অফিস এ কাজ শুরু করার আগে চেয়ার, কীবোর্ড, মাউস নিখুঁতভাবে সানিটাইজের জন্য ব্যবহার করুন |</div></div><div class=\"o9v6fnle cxmmr5t8 oygrvhab hcukyx3x c1et5uql ii04i59q\" style=\"overflow-wrap: break-word; margin: 0.5em 0px 0px; white-space: pre-wrap; font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; color: rgb(5, 5, 5); font-size: 15px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><div dir=\"auto\" style=\"font-family: inherit; text-align: start;\">উপাদান:  dettol , স্যাভলন বা hexasol করে ব্যবহার করতে হবে | প্রতিবার একই মিশ্রণ তৈরী করে বারবার ব্যবহার করতে পারবেন|  </div></div><div class=\"o9v6fnle cxmmr5t8 oygrvhab hcukyx3x c1et5uql ii04i59q\" style=\"overflow-wrap: break-word; margin: 0.5em 0px 0px; white-space: pre-wrap; font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; color: rgb(5, 5, 5); font-size: 15px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><div dir=\"auto\" style=\"font-family: inherit; text-align: start;\">৪৫০mAh ব্যাটারিটি কোন ঝামেলা নাই আপনি শুধু USB ক্যাবল এর মাধ্যমে যেকোন চার্জার অথবা ল্যাপটপ / কম্পিউটার দিয়ে চার্জ করে নিবেন। একবার চার্জ দিলেই সারাদিন ব্যবহার করা যায়।</div><div dir=\"auto\" style=\"font-family: inherit; text-align: start;\">অন্যান ব্যবহার: মেয়েরা ত্বক moisture করার জন্য মেকআপ এর সাথে ব্যবহার করতে পারবেন | শীতের সময় বাতাসের আদ্রতা কমে গেলে ঘুমোনোর সময় মাথার কাছে রেখে ঘুমালে আপনার ত্বক ফাটবে না,ঠোঁট ফাটবে না |</div><div dir=\"auto\" style=\"font-family: inherit; text-align: start;\">Note: ব্যবহার করার পূর্বে অবশ্যই ১ থেকে ২ ঘন্টা চার্জ দিয়ে নিবেন |</div></div>', 420.00, 420.00, 0, '[]', '[]', '[]', NULL, 0, 1, 0, 1000, 1, 500, '1', 1, 0.00, 'amount', 0.00, 'amount', 'free', 0.00, 0.00, 0, 'Nano Spray', 'Model: JPM-076Features:Power: 3.7VBattery: 450mAhTank capacity: 30MLআপনার জুতো , মানিব্যাগ, চাবি, গ্যাজেট, আসবাবপত্র, মোবাইল, গাড়ি, দরজা, হাতল , কোথাও বসার আগে , অফিস এ কাজ শুরু করার আগে চেয়ার, কীবোর্ড, মাউস নিখুঁতভাবে সানিটাইজের জন্য ব্যবহার করুন |উপাদান:  dettol , স্যাভলন বা hexasol করে ব্যবহার করতে হবে | প্রতিবার একই মিশ্রণ তৈরী করে বারবার ব্যবহার করতে পারবেন|  ৪৫০mAh ব্যাটারিটি কোন ঝামেলা নাই আপনি শুধু USB ক্যাবল এর মাধ্যমে যেকোন চার্জার অথবা ল্যাপটপ / কম্পিউটার দিয়ে চার্জ করে নিবেন। একবার চার্জ দিলেই সারাদিন ব্যবহার করা যায়।অন্যান ব্যবহার: মেয়েরা ত্বক moisture করার জন্য মেকআপ এর সাথে ব্যবহার করতে পারবেন | শীতের সময় বাতাসের আদ্রতা কমে গেলে ঘুমোনোর সময় মাথার কাছে রেখে ঘুমালে আপনার ত্বক ফাটবে না,ঠোঁট ফাটবে না |Note: ব্যবহার করার পূর্বে অবশ্যই ১ থেকে ২ ঘন্টা চার্জ দিয়ে নিবেন |﻿﻿', 'uploads/products/meta/jBxBczMvMVw2UtSUKu1qBa36dsrYaYvIRKynV0Ik.jpeg', NULL, 'Nano-Spray-GyhHe', 0, 0.00, 0.00, NULL, 0, NULL, NULL, '2020-07-11 14:54:02', '2020-07-14 19:26:14'),
(71, 'Ghee', 'seller', 41, 22, 192, 458, NULL, '[\"uploads\\/products\\/photos\\/qqeChFf0hELf7tRuycuP7eOSCWJM5IiCGzmtZRk4.jpeg\"]', 'uploads/products/thumbnail/673ypNUZWHM7NGAB7t9q0d7ZGZFvRpQ0pvq9YgkP.jpeg', 'uploads/products/featured/vOrtvuOKWMaAP8uxGx8aP98Lrcx4gPgTE1L5sz3X.jpeg', 'uploads/products/flash_deal/SqErv7qdl4SMo8ATwjPzZmxk2p8Sfm1x6ot7pIBS.jpeg', 'youtube', NULL, 'Good  and original', '<p>১/  original গাও ঘি আমাদের পরীক্ষাভিত্তিক কোনো রকম বেজাল মুক্ত এবং বিশ্বের সাথে কাজ করি।</p>', 1100.00, 1100.00, 1, '[]', '[]', '[\"#FFE4C4\"]', NULL, 0, 1, 0, 0, 1, 5, 'Kg', 1, 0.00, 'amount', 0.00, 'amount', 'free', 0.00, 0.00, 0, 'Ghee(ঘি)', '১/  original গাও ঘি আমাদের পরীক্ষাভিত্তিক কোনো রকম বেজাল মুক্ত এবং বিশ্বের সাথে কাজ করি।', 'uploads/products/meta/SOziLPVL7um6RgWB7KfNwsN7jAuVyzjNUChxfJtP.jpeg', NULL, 'Ghee-zQ9aL', 0, 0.00, 0.00, NULL, 0, NULL, NULL, '2020-07-25 14:48:24', '2020-08-18 04:24:51'),
(73, 'Leegor 10 Pcs Set Kids Play House Kitchen Toys Super anti-fall Stainless Steel Cookware Cooking Utensils Pots Pans Educational Toys Great Xmas Gift', 'seller', 53, 33, 18, 840, NULL, '[\"uploads\\/products\\/photos\\/aR3q69iNsqEdsBpufvZg7jpP0FYmpLq0qpqebqJW.jpeg\"]', 'uploads/products/thumbnail/J8dsBekGaiH2PlV5Lj7cThU7UMKKRDMZ8R0N7OVC.jpeg', 'uploads/products/featured/qZBiORD7gWbUYfGrkwwIcwmqrK6X587S6xJI2iOc.jpeg', 'uploads/products/flash_deal/PSgJbGkcUrKjozrMeMNt3GZK0C3YsuXqgY7zfkVu.jpeg', 'youtube', 'https://www.youtube.com/watch?v=hPGqGOJ9ke8', 'kids kitchen set,kitchen set,steel kitchen set', '<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; font-size: 13px; line-height: 1.4rem; color: rgb(51, 51, 51); font-family: &quot;open sans&quot;, sans-serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\">We don\'t know when or if this item will be back in stock.</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; font-size: 13px; line-height: 1.4rem; color: rgb(51, 51, 51); font-family: &quot;open sans&quot;, sans-serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\">♥ Safe and durable material: hand-polished stainless steel. Not like plastic,stainless steel is much more durable for children ♥ Developing abilities: Pretend play and role play develop children\'s brain a lot Good for kids to know about cookware and their functions. ♥ Sturdy looped handles with riveted construction ♥ Large size for extra-large portions of fun! ♥ A very creative toy for your kids to play and improve their hands-on ability and imagination capacity.</p><br>', 400.00, 400.00, 0, '[]', '[]', '[]', NULL, 0, 1, 0, 997, 1, 100, 'Set', 1, 0.00, 'amount', 0.00, 'amount', 'free', 0.00, 0.00, 3, 'Leegor 10 Pcs Set Kids Play House Kitchen Toys Super anti-fall Stainless Steel Cookware Cooking Utensils Pots Pans Educational Toys Great Xmas Gift', 'Leegor 10 Pcs Set Kids Play House Kitchen Toys Super anti-fall Stainless Steel Cookware Cooking Utensils Pots Pans Educational Toys Great Xmas Gift', 'uploads/products/meta/MUxMMFsk2dRPA2wmm9qj6wSbXwRANPZCVHPWcPtt.jpeg', NULL, 'Leegor-10-Pcs-Set-Kids-Play-House-Kitchen-Toys-Super-anti-fall-Stainless-Steel-Cookware-Cooking-Utensils-Pots-Pans-Educational-Toys-Great-Xmas-Gift-JRdni', 0, 0.00, 0.00, NULL, 0, NULL, NULL, '2020-08-17 23:58:53', '2020-09-05 23:41:58'),
(75, '15 Pcs Set Kids Play House Kitchen Toys Super anti-fall Stainless Steel Cookware Cooking Utensils Pots Pans Educational Toys Great Xmas Gift', 'seller', 53, 33, 18, 840, NULL, '[\"uploads\\/products\\/photos\\/IQygmwtGa7qoBGvVjZk6VfmzBeY44RaEYsGNCLmO.jpeg\"]', 'uploads/products/thumbnail/7hhdSEGInA9QDovMcYT7uYd4d9JBIS8rKeIhAEz0.jpeg', 'uploads/products/featured/r216FFY04zUD4QXS3EiA96tC5tOmeyTyRFTzqcRv.jpeg', 'uploads/products/flash_deal/9HNgC226uAu6TJdUBalxyGIQZvAtjSwaPMrtKruZ.jpeg', 'youtube', NULL, 'kitchen set', '<div id=\"availability_feature_div\" class=\"celwidget\" data-feature-name=\"availability\" data-csa-c-id=\"cp4unl-w5a932-wn1qju-v8di3x\" data-cel-widget=\"availability_feature_div\" style=\"box-sizing: border-box; color: rgb(17, 17, 17); font-family: Arial, sans-serif; font-size: 13px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><div id=\"availability\" class=\"a-section a-spacing-base\" style=\"box-sizing: border-box; margin-bottom: 22px;\">We don\'t know when or if this item will be back in stock.</div></div><div id=\"featurebullets_feature_div\" class=\"celwidget\" data-feature-name=\"featurebullets\" data-csa-c-id=\"1q1gup-7l87i2-gs2wch-pzka30\" data-cel-widget=\"featurebullets_feature_div\" style=\"box-sizing: border-box; color: rgb(17, 17, 17); font-family: Arial, sans-serif; font-size: 13px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><div id=\"feature-bullets\" class=\"a-section a-spacing-medium a-spacing-top-small\" style=\"box-sizing: border-box; margin-top: 10px !important; margin-bottom: 0px;\"><ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"box-sizing: border-box; margin: 0px 0px 0px 18px; color: rgb(17, 17, 17); padding: 0px;\"><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box; color: rgb(17, 17, 17);\">♥ Safe and durable material: hand-polished stainless steel. Not like plastic,stainless steel is much more durable for children</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box; color: rgb(17, 17, 17);\">♥ Developing abilities: Pretend play and role play develop children\'s brain a lot Good for kids to know about cookware and their functions.</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box; color: rgb(17, 17, 17);\">♥ Sturdy looped handles with riveted construction</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box; color: rgb(17, 17, 17);\">♥ Large size for extra-large portions of fun!</span></li><li style=\"box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item\" style=\"box-sizing: border-box; color: rgb(17, 17, 17);\">♥ A very creative toy for your kids to play and improve their hands-on ability and imagination capacity.</span></li></ul></div></div>', 600.00, 600.00, 0, '[]', '[]', '[]', NULL, 0, 1, 0, 1000, 1, 100, 'Set', 1, 0.00, 'amount', 0.00, 'amount', 'free', 0.00, 0.00, 0, '15 Pcs Set Kids Play House Kitchen Toys Super anti-fall Stainless Steel Cookware Cooking Utensils Pots Pans Educational Toys Great Xmas Gift', '15 Pcs Set Kids Play House Kitchen Toys Super anti-fall Stainless Steel Cookware Cooking Utensils Pots Pans Educational Toys Great Xmas Gift', 'uploads/products/meta/S83Ihy3Mz4yxI6sbksrcCqhV50qBXAZSRBG08Btn.jpeg', NULL, '15-Pcs-Set-Kids-Play-House-Kitchen-Toys-Super-anti-fall-Stainless-Steel-Cookware-Cooking-Utensils-Pots-Pans-Educational-Toys-Great-Xmas-Gift-G62y3', 0, 0.00, 0.00, NULL, 0, NULL, NULL, '2020-08-19 18:53:13', '2020-08-19 18:56:19'),
(76, 'Leegor 20 Pcs Set Kids Play House Kitchen Toys Super anti-fall Stainless Steel Cookware Cooking Utensils Pots Pans Educational Toys Great Xmas Gift', 'seller', 53, 33, 18, 840, NULL, '[\"uploads\\/products\\/photos\\/9RveVEd8hBBoqvqQJRQQ7CtfO6x6ILjqeKOn4a8D.jpeg\"]', 'uploads/products/thumbnail/f2P4hsfWY1OA1ad5WCo5qP2fPcfb6vCTpZEk3jI3.jpeg', 'uploads/products/featured/7oJTpG1aTTIpikh71bMfoxtgkAdVAjQPeWtZQlF2.jpeg', 'uploads/products/flash_deal/xsrtacmhh0tcKVOK40ELv7qTWZOPOFJj68cP1vU0.jpeg', 'youtube', NULL, 'kitchen set', '<p>We don\'t know when or if this item will be back in stock.\r\n</p><p>♥ Safe and durable material: hand-polished stainless steel. Not like plastic,stainless steel is much more durable for children\r\n♥ Developing abilities: Pretend play and role play develop children\'s brain a lot Good for kids to know about cookware and their functions.\r\n♥ Sturdy looped handles with riveted construction\r\n♥ Large size for extra-large portions of fun!\r\n♥ A very creative toy for your kids to play and improve their hands-on ability and imagination capacity.</p>', 800.00, 800.00, 0, '[]', '[]', '[]', NULL, 0, 1, 0, 1000, 1, 100, 'Set', 1, 0.00, 'amount', 0.00, 'amount', 'free', 0.00, 0.00, 0, 'Leegor 20Pcs Set Kids Play House Kitchen Toys Super anti-fall Stainless Steel Cookware Cooking Utensils Pots Pans Educational Toys Great Xmas Gift', 'Leegor 20 Pcs Set Kids Play House Kitchen Toys Super anti-fall Stainless Steel Cookware Cooking Utensils Pots Pans Educational Toys Great Xmas Gift', 'uploads/products/meta/gNhEwE6qVmnseAgjyRhjPXpFH2IMTotFYm95JPEN.jpeg', NULL, 'Leegor-20-Pcs-Set-Kids-Play-House-Kitchen-Toys-Super-anti-fall-Stainless-Steel-Cookware-Cooking-Utensils-Pots-Pans-Educational-Toys-Great-Xmas-Gift-v5iIJ', 0, 0.00, 0.00, NULL, 0, NULL, NULL, '2020-08-19 18:55:58', '2020-08-19 18:55:58'),
(77, 'Suma Akter', 'admin', 12, 5, 103, 841, 9, '[\"uploads\\/products\\/photos\\/ZCvduJC8JGH64ZBU5hxbls2oAUCHutFf4QnwpPeK.jpeg\"]', 'uploads/products/thumbnail/4fVB1Cg0LqU2JxioQ9KQQsIR7VlxAxhW38gcrWnn.jpeg', NULL, NULL, 'youtube', NULL, 'suma', 'essddddddddddddddddddd', 10.00, 10.00, 0, '[]', '[]', '[]', NULL, 0, 1, 0, 90, 5, 10, 'KG', 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, NULL, 1, 'Suma Akter', 'essddddddddddddddddddd', 'uploads/products/meta/4fVB1Cg0LqU2JxioQ9KQQsIR7VlxAxhW38gcrWnn.jpeg', NULL, 'Suma-Akter-LoGJp', 1, 0.00, 0.00, NULL, 0, NULL, NULL, '2020-09-06 16:54:55', '2020-09-06 17:14:14');

-- --------------------------------------------------------

--
-- Table structure for table `product_stocks`
--

CREATE TABLE `product_stocks` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `variant` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sku` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` double(10,2) NOT NULL DEFAULT 0.00,
  `qty` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_stocks`
--

INSERT INTO `product_stocks` (`id`, `product_id`, `variant`, `sku`, `price`, `qty`, `created_at`, `updated_at`) VALUES
(1, 21, 'Black', 'ARSGGGL(I85G1T6W)-Black', 138000.00, 1000, '2020-06-12 07:01:52', '2020-06-12 07:01:52'),
(2, 22, 'Black-Adult', 'SP-Black-Adult', 3600.00, 1, '2020-06-13 14:36:57', '2020-06-13 15:39:46'),
(3, 22, 'Blue-Adult', 'SP-Blue-Adult', 3600.00, 1, '2020-06-13 14:36:57', '2020-06-13 14:36:57'),
(4, 22, 'Green-Adult', 'SP-Green-Adult', 3600.00, 1, '2020-06-13 14:36:57', '2020-06-13 14:36:57'),
(5, 22, 'Pink-Adult', 'SP-Pink-Adult', 3600.00, 1, '2020-06-13 14:36:57', '2020-06-13 14:36:57'),
(14, 25, 'Black', 'TaHqcdbdmffs-Black', 3800.00, 992, '2020-06-14 18:15:41', '2020-06-15 03:31:10'),
(15, 25, 'Blue', 'TaHqcdbdmffs-Blue', 3800.00, 1000, '2020-06-14 18:15:41', '2020-06-14 18:15:41'),
(30, 38, 'Black', 'NSBMMBTSW2-Black', 450.00, 500, '2020-06-22 05:03:50', '2020-06-22 05:03:50'),
(31, 38, 'White', 'NSBMMBTSW2-White', 450.00, 500, '2020-06-22 05:03:50', '2020-06-22 05:03:50'),
(46, 32, 'Black', 'MSPw1fp-Black', 4200.00, 498, '2020-07-14 19:50:25', '2020-09-05 23:53:36'),
(47, 32, 'Blue', 'MSPw1fp-Blue', 4200.00, 500, '2020-07-14 19:50:25', '2020-07-14 19:50:25'),
(48, 32, 'Green', 'MSPw1fp-Green', 4200.00, 500, '2020-07-14 19:50:25', '2020-07-14 19:50:25'),
(49, 32, 'Pink', 'MSPw1fp-Pink', 4200.00, 500, '2020-07-14 19:50:25', '2020-07-14 19:50:25'),
(54, 74, 'Bisque', 'G-Bisque', 1100.00, 1000, '2020-08-18 04:19:29', '2020-08-18 04:19:29'),
(56, 71, 'Bisque', 'G-Bisque', 1100.00, 1000, '2020-08-18 04:24:51', '2020-08-18 04:24:51'),
(57, 53, 'DarkBlue', 'Pshss-DarkBlue', 100.00, 960, '2020-08-30 10:18:34', '2020-09-05 23:02:42'),
(58, 53, 'GreenYellow', 'Pshss-GreenYellow', 100.00, 1000, '2020-08-30 10:18:34', '2020-08-30 10:18:34'),
(59, 53, 'LightGreen', 'Pshss-LightGreen', 100.00, 1000, '2020-08-30 10:18:34', '2020-08-30 10:18:34'),
(60, 53, 'LightGrey', 'Pshss-LightGrey', 100.00, 1000, '2020-08-30 10:18:34', '2020-08-30 10:18:34'),
(61, 53, 'LightPink', 'Pshss-LightPink', 100.00, 1000, '2020-08-30 10:18:34', '2020-08-30 10:18:34');

-- --------------------------------------------------------

--
-- Table structure for table `refund_requests`
--

CREATE TABLE `refund_requests` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_detail_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `seller_approval` int(1) NOT NULL DEFAULT 0,
  `admin_approval` int(1) NOT NULL DEFAULT 0,
  `refund_amount` double(8,2) NOT NULL DEFAULT 0.00,
  `reason` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_seen` int(11) NOT NULL,
  `refund_status` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL DEFAULT 0,
  `comment` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  `viewed` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `product_id`, `user_id`, `rating`, `comment`, `status`, `viewed`, `created_at`, `updated_at`) VALUES
(1, 15, 12, 5, 'Love the product.', 1, 0, '2020-06-03 03:48:31', '2020-06-03 03:57:04'),
(2, 15, 15, 5, 'So much good.', 1, 0, '2020-06-03 03:56:28', '2020-06-03 03:57:03');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `permissions` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `permissions`, `created_at`, `updated_at`) VALUES
(1, 'Manager', '[\"1\",\"2\",\"4\"]', '2018-10-10 04:39:47', '2018-10-10 04:51:37'),
(2, 'Accountant', '[\"2\",\"3\"]', '2018-10-10 04:52:09', '2018-10-10 04:52:09');

-- --------------------------------------------------------

--
-- Table structure for table `searches`
--

CREATE TABLE `searches` (
  `id` int(11) NOT NULL,
  `query` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `count` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `searches`
--

INSERT INTO `searches` (`id`, `query`, `count`, `created_at`, `updated_at`) VALUES
(2, 'dcs', 1, '2020-03-08 00:29:09', '2020-03-08 00:29:09'),
(3, 'das', 3, '2020-03-08 00:29:15', '2020-03-08 00:29:50'),
(4, 'adsd', 10, '2020-09-07 05:01:15', '2020-09-07 05:26:43'),
(5, 'afd', 2, '2020-09-07 05:12:23', '2020-09-07 05:12:32');

-- --------------------------------------------------------

--
-- Table structure for table `sellers`
--

CREATE TABLE `sellers` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `seller_package_id` int(11) DEFAULT NULL,
  `remaining_uploads` int(11) NOT NULL DEFAULT 0,
  `remaining_digital_uploads` int(11) NOT NULL DEFAULT 0,
  `invalid_at` date DEFAULT NULL,
  `verification_status` int(1) NOT NULL DEFAULT 0,
  `verification_info` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `cash_on_delivery_status` int(1) NOT NULL DEFAULT 0,
  `admin_to_pay` double(8,2) NOT NULL DEFAULT 0.00,
  `bank_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_acc_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_acc_no` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_routing_no` int(50) DEFAULT NULL,
  `bank_payment_status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sellers`
--

INSERT INTO `sellers` (`id`, `user_id`, `seller_package_id`, `remaining_uploads`, `remaining_digital_uploads`, `invalid_at`, `verification_status`, `verification_info`, `cash_on_delivery_status`, `admin_to_pay`, `bank_name`, `bank_acc_name`, `bank_acc_no`, `bank_routing_no`, `bank_payment_status`, `created_at`, `updated_at`) VALUES
(1, 3, NULL, 0, 0, NULL, 1, '[{\"type\":\"text\",\"label\":\"Name\",\"value\":\"Mr. Seller\"},{\"type\":\"select\",\"label\":\"Marital Status\",\"value\":\"Married\"},{\"type\":\"multi_select\",\"label\":\"Company\",\"value\":\"[\\\"Company\\\"]\"},{\"type\":\"select\",\"label\":\"Gender\",\"value\":\"Male\"},{\"type\":\"file\",\"label\":\"Image\",\"value\":\"uploads\\/verification_form\\/CRWqFifcbKqibNzllBhEyUSkV6m1viknGXMEhtiW.png\"}]', 1, 78.40, NULL, NULL, NULL, NULL, 0, '2018-10-07 04:42:57', '2020-01-26 04:21:11'),
(3, 26, NULL, 0, 0, NULL, 0, NULL, 0, 0.00, NULL, NULL, NULL, NULL, 0, '2020-06-21 14:29:57', '2020-06-28 16:05:45'),
(4, 27, NULL, 0, 0, NULL, 0, NULL, 0, 0.00, NULL, NULL, NULL, NULL, 0, '2020-06-21 21:14:53', '2020-06-22 21:52:34'),
(5, 28, NULL, 0, 0, NULL, 1, NULL, 1, 450.00, 'DUTCH-BANGLA BANK LTD', 'Md Sala Uddin', '1151050037026', 90262982, 1, '2020-06-22 03:59:55', '2020-06-28 20:03:50'),
(7, 36, NULL, 0, 0, NULL, 0, NULL, 0, 0.00, NULL, NULL, NULL, NULL, 0, '2020-06-25 18:38:26', '2020-06-25 18:38:26'),
(8, 37, NULL, 0, 0, NULL, 1, NULL, 1, 0.00, NULL, NULL, NULL, NULL, 0, '2020-06-27 22:10:28', '2020-07-04 17:18:58'),
(9, 38, NULL, 0, 0, NULL, 0, NULL, 0, 0.00, NULL, NULL, NULL, NULL, 0, '2020-06-28 02:08:48', '2020-06-28 02:08:48'),
(10, 39, NULL, 0, 0, NULL, 0, NULL, 0, 0.00, NULL, NULL, NULL, NULL, 0, '2020-06-28 16:03:32', '2020-06-28 16:03:32'),
(11, 40, NULL, 0, 0, NULL, 1, NULL, 0, 0.00, NULL, NULL, NULL, NULL, 0, '2020-07-01 14:25:21', '2020-07-01 16:08:49'),
(12, 41, NULL, 0, 0, NULL, 0, NULL, 0, 0.00, NULL, 'husaincpi09@gmail.com', NULL, NULL, 0, '2020-07-07 21:07:34', '2020-08-23 18:41:29'),
(13, 42, NULL, 0, 0, NULL, 0, NULL, 0, 0.00, NULL, NULL, NULL, NULL, 0, '2020-07-08 21:37:11', '2020-07-08 21:37:11'),
(16, 47, NULL, 0, 0, NULL, 0, NULL, 0, 0.00, NULL, NULL, NULL, NULL, 0, '2020-07-15 20:43:40', '2020-07-15 20:43:40'),
(17, 53, NULL, 0, 0, NULL, 1, NULL, 1, 0.00, NULL, 'sumaakterakon@gmail.com', NULL, NULL, 1, '2020-08-17 22:59:34', '2020-09-02 02:50:09'),
(18, 54, NULL, 0, 0, NULL, 0, NULL, 0, 0.00, NULL, NULL, NULL, NULL, 0, '2020-08-18 03:19:29', '2020-08-18 03:19:29');

-- --------------------------------------------------------

--
-- Table structure for table `seller_packages`
--

CREATE TABLE `seller_packages` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` double(11,2) NOT NULL DEFAULT 0.00,
  `product_upload` int(11) NOT NULL DEFAULT 0,
  `digital_product_upload` int(11) NOT NULL DEFAULT 0,
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `duration` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seller_withdraw_requests`
--

CREATE TABLE `seller_withdraw_requests` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `amount` double(8,2) DEFAULT NULL,
  `message` longtext DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `viewed` int(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `seller_withdraw_requests`
--

INSERT INTO `seller_withdraw_requests` (`id`, `user_id`, `amount`, `message`, `status`, `viewed`, `created_at`, `updated_at`) VALUES
(5, 5, 50.00, 'Amount', 1, 1, '2020-06-22 05:05:50', '2020-06-22 05:06:18');

-- --------------------------------------------------------

--
-- Table structure for table `seo_settings`
--

CREATE TABLE `seo_settings` (
  `id` int(11) NOT NULL,
  `keyword` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `author` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `revisit` int(11) NOT NULL,
  `sitemap_link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `seo_settings`
--

INSERT INTO `seo_settings` (`id`, `keyword`, `author`, `revisit`, `sitemap_link`, `description`, `created_at`, `updated_at`) VALUES
(1, 'bootstrap,responsive,template,developer', 'Zianz E-Tail Market', 11, 'https://www.zianz.com', 'Zianz is an e-commerce site which will be capable of providing every kind of goods and products from every sector to every consumer located in Bangladesh. ... It is a platform where people can purchase all kinds of goods from a single website.', '2020-06-16 00:45:15', '2020-06-16 04:45:15');

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE `shops` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sliders` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `google` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `youtube` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `pick_up_point_id` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_cost` double(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `shops`
--

INSERT INTO `shops` (`id`, `user_id`, `name`, `logo`, `sliders`, `address`, `facebook`, `google`, `twitter`, `youtube`, `slug`, `meta_title`, `meta_description`, `pick_up_point_id`, `shipping_cost`, `created_at`, `updated_at`) VALUES
(3, 26, 'Arham enterprises', NULL, NULL, '443/4, West Shewrapara, Mirpur, Dhaka-1216', NULL, NULL, NULL, NULL, 'Arham-enterprises-', NULL, NULL, NULL, 0.00, '2020-06-21 14:29:57', '2020-06-21 14:29:57'),
(4, 27, 'Biotic Food', NULL, NULL, '443/3, West Shewrapar,  Mirpur, Dhaka-1216', NULL, NULL, NULL, NULL, 'Biotic-Food-', NULL, NULL, NULL, 0.00, '2020-06-21 21:14:53', '2020-06-21 21:14:53'),
(5, 28, 'Zianz Fish & Meat shop ( Available only Agargaon, Taltoal, Shewarapara & full Mirpur area Dhaka)', 'uploads/shop/logo/WIxNbOAK805c8MsizXY3LgoPN7Cqw72ZOOeICWzW.jpeg', '[\"uploads\\/shop\\/sliders\\/OocbQaFC1JH3a6c4X8ZqEjOWTNEM1WAtVlpj4co9.png\"]', '171/2/C West Kafrul, Sher-E-Bangla Nagar, Dhaka-1207', NULL, NULL, NULL, NULL, 'Zianz-Fish-&-Meat-shop-(-Available-only-Agargaon,-Taltoal,-Shewarapara-&-full-Mirpur-area-Dhaka)-5', 'Zianz Fish & Meat shop', 'Zianz Fish & Meat shop', '[]', 0.00, '2020-06-22 03:59:55', '2020-06-28 15:20:18'),
(7, 36, 'spark idea', NULL, NULL, '532 lovely kunjo', NULL, NULL, NULL, NULL, 'spark-idea-', NULL, NULL, NULL, 0.00, '2020-06-25 18:38:26', '2020-06-25 18:38:26'),
(8, 37, 'Shopaz eStore', 'uploads/shop/logo/120eshop.jpg', NULL, 'Online store', NULL, NULL, NULL, NULL, 'Shopaz-eStore-', NULL, NULL, NULL, 0.00, '2020-06-27 22:10:28', '2020-06-27 22:10:28'),
(9, 38, 'Shopaz Estore', NULL, NULL, 'Shewrapar, Dhaka', NULL, NULL, NULL, NULL, 'Shopaz-Estore-', NULL, NULL, NULL, 0.00, '2020-06-28 02:08:48', '2020-06-28 02:08:48'),
(10, 39, 'HuT MaSTeR', NULL, NULL, '310/A East Senpara, Mirpur, Dhaka-1216', NULL, NULL, NULL, NULL, 'HuT-MaSTeR-', NULL, NULL, NULL, 0.00, '2020-06-28 16:03:32', '2020-06-28 16:03:32'),
(11, 40, 'Rupoboti', 'uploads/shop/logo/CBBPAoIHR6MFCFjAzluwjqX2qIzai9dykXo6VnB5.jpeg', '[\"uploads\\/shop\\/sliders\\/I8QJF3CnwSaHOWGkguM26yJdNc3YKLtSaadF5HMd.jpeg\",\"uploads\\/shop\\/sliders\\/TMBEPcfIDRcKE30sdXzPCTojO74fqRbmXYVDV48z.jpeg\",\"uploads\\/shop\\/sliders\\/QEsSACNlBOO2oHDZYNrJcOw4OsrqVUIF0Iey5G85.jpeg\",\"uploads\\/shop\\/sliders\\/Pz76GF0rvn3koODLwhW8GbVIpYE9Pg6w3T6kTGQZ.jpeg\",\"uploads\\/shop\\/sliders\\/NF0MqQN6d4ifPyHs9NFpf3nTYPPOHHyPuVHa76cs.jpeg\",\"uploads\\/shop\\/sliders\\/HAlIIQawFAEeILWX7Na3ByPvujHgfg5QGU9tlWmK.jpeg\",\"uploads\\/shop\\/sliders\\/hxiHl5YQNJbnZY0c61uaMTOGFXpR0qLRdP8cYCbd.jpeg\",\"uploads\\/shop\\/sliders\\/8Vi7D1SDfm9qwWOtQQFuKn41hDmeHk6vSSKpc4zo.jpeg\",\"uploads\\/shop\\/sliders\\/1vddwXir3DuMfng2w90y7OEd1Cqju8NAtAYP9iPI.jpeg\"]', '583, Anamica Concord Shopping Complex, 102 Shop', NULL, NULL, NULL, NULL, 'Rupoboti-11', 'we are selling our own country products', 'we are selling our own country products', '[]', 0.00, '2020-07-01 14:25:21', '2020-07-01 14:36:22'),
(12, 41, 'TEEF', 'uploads/shop/logo/teef.jpg', NULL, '171/2/C West Kafrul, Sher-E-Bangla Nagar, Dhaka-1207', NULL, NULL, NULL, NULL, 'TEEF-12', 'Ghee(ঘি)', 'pure ঘি  ১২00৳  মাএ আমাদের নিজেস্ব গরুর ফার্মে দুধের  তৈরি।', '[]', 0.00, '2020-07-07 21:07:34', '2020-07-07 21:15:08'),
(13, 42, 'ST Collection 2020', NULL, NULL, 'House-44, Road-29, Block-D, Section-12, Mirpur, Dhaka', NULL, NULL, NULL, NULL, 'ST-Collection-2020-', NULL, NULL, NULL, 0.00, '2020-07-08 21:37:11', '2020-07-08 21:37:11'),
(16, 47, 'Zianz Fashion', NULL, NULL, 'Mirpur', NULL, NULL, NULL, NULL, 'Zianz-Fashion-', NULL, NULL, NULL, 0.00, '2020-07-15 20:43:40', '2020-07-15 20:43:40'),
(17, 53, 'Tiny Food Kitchen', 'uploads/shop/logo/68LxqjmqD8rO45yQYZOaSmgdpFdX9ff69L01gU1M.png', NULL, '334/2 West Shewrapara, Mirpur, Dhaka-1216', NULL, NULL, NULL, NULL, 'Tiny-Food-Kitchen-17', 'Tiny Food Kitchen', 'Tiny Food Kitchen', '[]', 0.00, '2020-08-17 22:59:34', '2020-08-17 23:10:46'),
(18, 54, 'LIVE ONCE', NULL, NULL, 'DHAKA, BANGLADESH', NULL, NULL, NULL, NULL, 'LIVE-ONCE-', NULL, NULL, NULL, 0.00, '2020-08-18 03:19:29', '2020-08-18 03:19:29');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` int(11) NOT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `published` int(1) NOT NULL DEFAULT 1,
  `link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `photo`, `published`, `link`, `created_at`, `updated_at`) VALUES
(19, 'uploads/sliders/EEYiMjZWIps9JciekAfTHxRAqzcapjbjzcRrmGIn.png', 1, 'https://zianz.com/products', '2020-06-19 03:41:52', '2020-06-19 03:41:52'),
(20, 'uploads/sliders/Icjnt6oUEzbP6f9QzaIgjlptPGlIOwAYvH6Z4NbL.png', 1, 'https://zianz.com/products', '2020-06-19 03:53:00', '2020-06-19 03:53:00'),
(23, 'uploads/sliders/bCfCS54FtUW9APQuffh7EipHqVUYH3P189bXbcZo.png', 1, 'https://zianz.com/flash-deal/mega-flash-deal-txyqt', '2020-06-21 02:00:50', '2020-06-21 02:00:50');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `user_id`, `role_id`, `created_at`, `updated_at`) VALUES
(2, 20, 1, '2020-06-19 06:09:44', '2020-06-19 06:09:44');

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` int(11) NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `subscribers`
--

INSERT INTO `subscribers` (`id`, `email`, `created_at`, `updated_at`) VALUES
(1, 'medinet.ctg@gmail.com', '2020-06-23 10:47:52', '2020-06-23 10:47:52'),
(2, 'symonhasan006@gmail.com', '2020-06-25 17:46:23', '2020-06-25 17:46:23'),
(3, 'shuvroscyien@sshcg.net', '2020-06-26 10:35:44', '2020-06-26 10:35:44'),
(4, 'husaincpi09@gmail.com', '2020-07-07 21:19:59', '2020-07-07 21:19:59'),
(5, 'nahiniqubal@gmail.com', '2020-07-20 11:10:22', '2020-07-20 11:10:22');

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `name`, `category_id`, `slug`, `meta_title`, `meta_description`, `created_at`, `updated_at`) VALUES
(13, 'Backpack', 12, 'Backpack-rUmVc', 'Backpack', 'Backpack', '2020-06-08 17:03:15', '2020-06-08 17:03:15'),
(14, 'Men\'s Apparel', 46, 'Apparel--Fashion-for-Men-RMpZO', NULL, 'Men\'s Apparel', '2020-06-09 09:44:21', '2020-06-12 08:07:05'),
(15, 'Men\'s Accessories', 46, 'Apparel--Fashion-for-Women-iy7bV', NULL, 'Men\'s Accessories', '2020-06-09 09:44:42', '2020-06-12 08:05:56'),
(16, 'Home & Living Products', 26, 'Home--Living-Products-tw0Yw', NULL, 'Home & Living Products', '2020-06-09 09:51:44', '2020-06-09 09:51:44'),
(17, 'Home appliance products', 26, 'Home-appliance-products-YftHR', NULL, 'Home appliance products', '2020-06-09 09:52:13', '2020-06-09 09:52:13'),
(18, 'Toys', 33, 'Toys-RpkmH', NULL, 'Toys', '2020-06-09 10:05:16', '2020-06-09 10:05:16'),
(19, 'Card Holders', 12, 'Card-Holders-zn6Cs', NULL, 'Card Holders', '2020-06-09 10:22:25', '2020-06-09 10:22:25'),
(20, 'Clutches', 12, 'Clutches-hi4eS', NULL, 'Clutches', '2020-06-09 10:22:50', '2020-06-09 10:22:50'),
(21, 'Cross body bags', 12, 'Cross-body-bags-m5UEf', NULL, 'Cross body bags', '2020-06-09 10:23:22', '2020-06-09 10:23:22'),
(22, 'Designer\'s Bag', 12, 'Designers-Bag-UDUCE', NULL, 'Designer\'s Bag', '2020-06-09 10:23:50', '2020-06-09 10:23:50'),
(23, 'Hand Bag', 12, 'Hand-Bag-PKyNS', NULL, 'Hand Bag', '2020-06-09 10:24:07', '2020-06-09 10:24:07'),
(24, 'Kids Bag', 33, 'Kids-Bag-8gS2u', NULL, 'Kids Bag', '2020-06-09 10:24:38', '2020-06-09 10:24:38'),
(25, 'Laptop & Tablet Bags', 12, 'Laptop--Tablet-Bags-0uP5B', NULL, 'Laptop & Tablet Bags', '2020-06-09 10:25:17', '2020-06-09 10:25:17'),
(26, 'Luggages', 12, 'Luggages-zuOcL', NULL, 'Luggages', '2020-06-09 10:25:51', '2020-06-09 10:25:51'),
(27, 'Office Bag', 12, 'Office-Bag-b3RKd', NULL, 'Luggages', '2020-06-09 10:26:11', '2020-06-09 10:26:11'),
(28, 'Pouches', 12, 'Pouches-g6UtM', NULL, 'Pouches', '2020-06-09 10:26:34', '2020-06-09 10:26:34'),
(29, 'Purses', 12, 'Purses-8cHcM', NULL, 'Purses', '2020-06-09 10:26:59', '2020-06-09 10:26:59'),
(30, 'Shopping bag', 12, 'Shopping-bag-gxGYh', NULL, 'Shopping bag', '2020-06-09 10:27:18', '2020-06-09 10:27:18'),
(31, 'Shoulder bag', 12, 'Shoulder-bag-5SKFi', NULL, 'Shoulder bag', '2020-06-09 10:28:10', '2020-06-09 10:28:10'),
(32, 'Sports Bag', 8, 'Sports-Bag-RBAg4', NULL, 'Sports Bag', '2020-06-09 10:28:56', '2020-06-09 10:28:56'),
(33, 'Travel Bag', 12, 'Travel-Bag-Qz61c', NULL, 'Travel Bag', '2020-06-09 10:29:15', '2020-06-09 10:29:15'),
(34, 'Fashion accessories for Men', 21, 'Fashion-accessories-for-Men-msNvg', NULL, 'Fashion accessories for Men', '2020-06-09 10:32:09', '2020-06-09 10:32:09'),
(35, 'Fashion accessories for Women', 21, 'Fashion-accessories-for-Women-6PdhR', NULL, 'Fashion accessories for Women', '2020-06-09 10:32:37', '2020-06-09 10:32:37'),
(36, 'Bath & Body', 11, 'Bath--Body-nMk49', NULL, 'Bath & Body', '2020-06-09 11:32:29', '2020-06-09 11:32:29'),
(37, 'Beauty Tools', 11, 'Beauty-Tools-Bq5AM', NULL, 'Beauty Tools', '2020-06-09 11:32:52', '2020-06-09 11:32:52'),
(38, 'Facial Cleaning', 11, 'Facial-Cleaning-eZLkW', NULL, 'Facial Cleaning', '2020-06-09 11:33:16', '2020-06-09 11:33:16'),
(39, 'Perfumes', 11, 'Perfumes-zo1Kf', NULL, 'Perfumes', '2020-06-09 11:34:42', '2020-06-09 11:34:42'),
(40, 'Gift Package', 11, 'Gift-Package-7tfVW', NULL, 'Gift Package', '2020-06-09 11:35:09', '2020-06-09 11:35:09'),
(41, 'Hair Care', 11, 'Hair-Solution-gQrKw', NULL, 'Hair Care', '2020-06-09 11:35:35', '2020-06-09 13:22:13'),
(42, 'Makeup Items', 11, 'Makeup-Items-YYWvm', NULL, 'Makeup Items', '2020-06-09 11:36:05', '2020-06-09 11:36:05'),
(43, 'Mask', 42, 'Face-Mask-3YZYq', NULL, 'Mask', '2020-06-09 11:52:21', '2020-06-14 15:14:57'),
(44, 'Anti Snoring', 42, 'Anti-Snoring-fG0H8', NULL, 'Anti Snoring', '2020-06-09 11:53:00', '2020-06-09 11:53:00'),
(45, 'Compression Stockings', 42, 'Compression-Stockings-nQKE7', NULL, 'Compression Stockings', '2020-06-09 11:54:21', '2020-06-09 11:54:21'),
(46, 'Eye Diagnosis & Surgery', 42, 'Eye-Diagnosis--Surgery-BSpMG', NULL, 'Eye Diagnosis & Surgery', '2020-06-09 11:55:09', '2020-06-09 11:55:09'),
(47, 'Fast aid Supplies', 42, 'Fast-aid-Supplies-N21xi', NULL, 'Fast aid Supplies', '2020-06-09 11:56:13', '2020-06-09 11:56:13'),
(48, 'Health Monitors', 42, 'Health-Monitors-cT6Ud', NULL, 'Health Monitors', '2020-06-09 11:57:12', '2020-06-09 11:57:12'),
(49, 'Hearing Aid', 42, 'Hearing-Aid-p6E0W', NULL, 'Hearing Aid', '2020-06-09 11:58:04', '2020-06-09 11:58:04'),
(50, 'Hospital Bed', 42, 'Hospital-Bed-v64xn', NULL, 'Hospital Bed', '2020-06-09 11:58:43', '2020-06-09 11:58:43'),
(51, 'Hot Water Bag', 42, 'Hot-Water-Bag-KV0xT', NULL, 'Hot Water Bag', '2020-06-09 11:59:11', '2020-06-09 11:59:11'),
(52, 'Ice Bag', 42, 'Ice-Bag-qgIVX', NULL, 'Ice Bag', '2020-06-09 12:12:26', '2020-06-09 12:12:26'),
(53, 'Injury Support & Braces', 42, 'Injury-Support--Braces-i1HUn', NULL, 'Injury Support & Braces', '2020-06-09 12:13:37', '2020-06-09 12:13:37'),
(54, 'Nebulizers & Aspiratiors', 42, 'Nebulizers--Aspiratiors-M8O85', NULL, 'Nebulizers & Aspiratiors', '2020-06-09 12:15:19', '2020-06-09 12:15:19'),
(55, 'Ointments & Creams', 42, 'Ointments--Creams-VwhWz', NULL, 'Ointments & Creams', '2020-06-09 12:16:23', '2020-06-09 12:16:23'),
(56, 'Pedometers', 42, 'Pedometers-Ncq0C', NULL, 'Pedometers', '2020-06-09 12:17:12', '2020-06-09 12:17:12'),
(57, 'Personal protective equipment', 42, 'Personal-protective-equipment-bztTv', NULL, 'Personal protective equipment', '2020-06-09 12:18:03', '2020-06-09 12:18:03'),
(58, 'Scale & Body Fat Analyzers', 42, 'Scale--Body-Fat-Analyzers-ngRrJ', NULL, 'Scale & Body Fat Analyzers', '2020-06-09 12:19:12', '2020-06-09 12:19:12'),
(59, 'Stethoscopes', 42, 'Stethoscopes-Xzowy', NULL, 'Stethoscopes', '2020-06-09 12:19:40', '2020-06-09 12:19:40'),
(60, 'Therapy Instruments', 42, 'Therapy-Instruments-nHrU0', NULL, 'Therapy Instruments', '2020-06-09 12:20:10', '2020-06-09 12:20:10'),
(61, 'Wheelchairs', 42, 'Wheelchairs-sOFGT', NULL, 'Wheelchairs', '2020-06-09 12:20:30', '2020-06-09 12:20:30'),
(62, 'Men\'s Care', 11, 'Mens-Care-JLbtP', NULL, 'Men\'s Care', '2020-06-09 12:37:48', '2020-06-09 12:37:48'),
(63, 'Sexual Wellness', 11, 'Sexual-Wellness-ST2LD', NULL, 'Sexual Wellness', '2020-06-09 12:38:19', '2020-06-09 12:38:34'),
(64, 'Bengali Books', 43, 'Bengali-Books-arx7z', NULL, 'Books & Stationery', '2020-06-10 03:15:34', '2020-06-10 03:15:34'),
(65, 'Books for Kids', 43, 'Books-for-Kids-Ytxao', NULL, 'Books for Kids', '2020-06-10 03:15:55', '2020-06-10 03:15:55'),
(66, 'English Books', 43, 'English-Books-W5b72', NULL, 'English Books', '2020-06-10 03:16:14', '2020-06-10 03:16:14'),
(67, 'Other Books', 43, 'Other-Books-WbGFy', NULL, 'Other Books', '2020-06-10 03:16:37', '2020-06-10 03:16:37'),
(68, 'Stationeries', 43, 'Stationeries-oNhjZ', NULL, 'Stationeries', '2020-06-10 03:17:07', '2020-06-10 03:17:07'),
(69, 'Text Books', 43, 'Text-Books-qj96L', NULL, 'Text Books', '2020-06-10 03:17:23', '2020-06-10 03:17:23'),
(70, 'Building Materials', 44, 'Building-Materials-UaXOd', NULL, 'Building Materials', '2020-06-11 07:15:58', '2020-06-11 07:15:58'),
(71, 'Electrical fittings', 44, 'Electrical-fittings-cecxI', NULL, 'Electrical fittings', '2020-06-11 07:16:44', '2020-06-11 07:16:44'),
(72, 'Hardware Fittings', 44, 'Hardware-Fittings-CDQhj', NULL, 'Hardware Fittings', '2020-06-11 07:17:04', '2020-06-11 07:17:04'),
(73, 'Industrial Accessories', 44, 'Industrial-Accessories-a9Kw7', NULL, 'Industrial Accessories', '2020-06-11 07:17:46', '2020-06-11 07:17:46'),
(74, 'Arches & Column', 16, 'Arches--Column-efnER', NULL, 'Arches & Column', '2020-06-11 07:49:43', '2020-06-11 07:50:20'),
(75, 'Art Paper', 16, 'Art-Paper-rkWfk', NULL, 'Art Paper', '2020-06-11 07:50:08', '2020-06-11 07:50:08'),
(76, 'Balloons', 16, 'Balloons-leUl4', NULL, 'Balloons', '2020-06-11 07:51:16', '2020-06-11 07:51:16'),
(77, 'Banners', 16, 'Banners-3MIYN', NULL, 'Banners', '2020-06-11 07:51:39', '2020-06-11 07:51:55'),
(78, 'Bubbles', 16, 'Bubbles-Nyffw', NULL, NULL, '2020-06-11 07:52:24', '2020-06-11 07:52:24'),
(79, 'Cakes', 16, 'Cakes-6QdHO', NULL, 'Cakes', '2020-06-11 07:52:44', '2020-06-11 07:52:44'),
(80, 'Candles', 16, 'Candles-xRfnY', NULL, 'Candles', '2020-06-11 07:53:13', '2020-06-11 07:53:13'),
(81, 'Ceiling Decoration', 16, 'Ceiling-Decoration-uZs8H', NULL, 'Ceiling Decoration', '2020-06-11 07:53:42', '2020-06-11 07:53:42'),
(82, 'Chocolates', 16, 'Chocolates-blnbQ', NULL, 'Chocolates', '2020-06-11 07:54:09', '2020-06-11 07:54:09'),
(83, 'Costumes', 16, 'Costumes-9jRxj', NULL, 'Costumes', '2020-06-11 07:54:37', '2020-06-11 07:54:37'),
(84, 'Tray', 16, 'Craft-Tools-ApiCk', NULL, 'Tray', '2020-06-11 07:55:06', '2020-06-11 07:56:11'),
(85, 'Craft Tools', 16, 'Craft-Tools-m9MEk', NULL, 'Craft Tools', '2020-06-11 07:55:06', '2020-06-11 07:55:06'),
(86, 'Fire Spray', 16, 'Fire-Spray-NGgLQ', NULL, 'Fire Spray', '2020-06-11 07:55:37', '2020-06-11 07:55:37'),
(87, 'Decoration Fabrics', 16, 'Decoration-Fabrics-1dNco', NULL, 'Decoration Fabrics', '2020-06-11 07:56:46', '2020-06-11 07:56:46'),
(88, 'Fireworks', 16, 'Fireworks-LfYCz', NULL, 'Fireworks', '2020-06-11 07:57:39', '2020-06-11 07:57:39'),
(89, 'Flower Made Jewellery', 16, 'Flower-Made-Jewellery-DP6zL', NULL, 'Flower Made Jewellery', '2020-06-11 07:58:29', '2020-06-11 07:58:29'),
(90, 'Flowers', 16, 'Flowers-tZHg2', NULL, 'Flowers', '2020-06-11 07:58:52', '2020-06-11 07:58:52'),
(91, 'Glue & Tape', 16, 'Glue--Tape-CdYkt', NULL, 'Glue & Tape', '2020-06-11 07:59:28', '2020-06-11 07:59:28'),
(92, 'Hard Board', 16, 'Hard-Board-BJnnj', NULL, 'Hard Board', '2020-06-11 07:59:57', '2020-06-11 07:59:57'),
(93, 'Notepads & Notebooks', 16, 'Notepads--Notebooks-YdMUN', NULL, 'Notepads & Notebooks', '2020-06-11 08:01:48', '2020-06-11 08:01:48'),
(94, 'Paints', 16, 'Paints-4bVCW', NULL, 'Paints', '2020-06-11 08:02:05', '2020-06-11 08:02:05'),
(95, 'Part Hats & Caps', 16, 'Part-Hats--Caps-zzRHj', NULL, 'Part Hats & Caps', '2020-06-11 08:02:29', '2020-06-11 08:02:29'),
(96, 'Party Lights & Paper Lanterns', 16, 'Party-Lights--Paper-Lanterns-lcJ4y', NULL, 'Party Lights & Paper Lanterns', '2020-06-11 08:03:10', '2020-06-11 08:03:10'),
(97, 'Party Plates & Glasses', 16, 'Party-Plates--Glasses-ASjEg', NULL, 'Party Plates & Glasses', '2020-06-11 08:16:36', '2020-06-11 08:16:36'),
(98, 'Party Snow & Spray', 16, 'Party-Snow--Spray-4yOz9', NULL, 'Party Snow & Spray', '2020-06-11 08:17:07', '2020-06-11 08:17:07'),
(99, 'Shola ( Cork Sheet)', 16, 'Shola--Cork-Sheet-deUfU', NULL, 'Shola ( Cork Sheet)', '2020-06-11 08:18:21', '2020-06-11 08:18:21'),
(100, 'Tablet cover & Napkins', 16, 'Tablet-cover--Napkins-kMWvM', NULL, 'Tablet cover & Napkins', '2020-06-11 08:18:33', '2020-06-11 08:18:33'),
(101, 'Wrapping Paper', 16, 'Wrapping-Paper-fOFDJ', NULL, 'Wrapping Paper', '2020-06-11 08:18:52', '2020-06-11 08:18:52'),
(102, 'Gift Card', 17, 'Gift-Card-PRHYN', NULL, 'Gift Card', '2020-06-11 08:22:42', '2020-06-11 08:22:42'),
(103, 'Cables', 5, 'Cables-l4mcD', NULL, 'Cables', '2020-06-11 08:23:54', '2020-06-11 08:23:54'),
(104, 'Electronic Scale', 5, 'Electronic-Scale-PeSCV', NULL, 'Cables', '2020-06-11 08:24:22', '2020-06-11 08:24:22'),
(105, 'Fans', 5, 'Fans-yoaKO', NULL, 'Fans', '2020-06-11 08:24:55', '2020-06-11 08:24:55'),
(106, 'Generators', 5, 'Generators-DrO1W', NULL, 'Generators', '2020-06-11 08:25:16', '2020-06-11 08:25:16'),
(107, 'Geyser', 5, 'Geyser-rwIjs', NULL, 'Geyser', '2020-06-11 08:25:35', '2020-06-11 08:25:35'),
(108, 'IPS & UPS', 5, 'IPS--UPS-Tw017', NULL, 'IPS & UPS', '2020-06-11 08:25:53', '2020-06-11 08:25:53'),
(109, 'Light Bulbs', 5, 'Light-Bulbs-0xRB2', NULL, 'Light Bulbs', '2020-06-11 08:26:09', '2020-06-11 08:26:09'),
(110, 'Rechargeable Lights & Fans', 5, 'Rechargeable-Lights--Fans-nSBrq', NULL, 'Rechargeable Lights & Fans', '2020-06-11 08:27:18', '2020-06-11 08:27:18'),
(111, 'Satellite Dish', 5, 'Satellite-Dish-szAS5', NULL, 'Satellite Dish', '2020-06-11 08:27:41', '2020-06-11 08:27:41'),
(112, 'Spot Lights', 5, 'Spot-Lights-CPPrS', NULL, 'Spot Lights', '2020-06-11 08:28:00', '2020-06-11 08:28:00'),
(113, 'Switches', 5, 'Switches-PTbdA', NULL, 'Switches', '2020-06-11 08:28:28', '2020-06-11 08:28:28'),
(114, 'Tube-lights', 5, 'Tube-lights-pVagh', NULL, 'Tube-lights', '2020-06-11 08:28:51', '2020-06-11 08:28:51'),
(115, 'Voltage Stabilizer', 5, 'Voltage-Stabilizer-TQRVQ', NULL, 'Voltage Stabilizer', '2020-06-11 08:29:12', '2020-06-11 08:29:12'),
(116, 'Accessories', 18, 'Accessories-oo3KJ', NULL, 'Accessories', '2020-06-11 11:37:48', '2020-06-11 11:37:48'),
(117, 'Audio', 18, 'Audio-qrErY', NULL, 'Audio', '2020-06-11 11:38:04', '2020-06-11 11:38:04'),
(118, 'Camera', 18, 'Camera-F9YkA', NULL, 'Camera', '2020-06-11 11:38:25', '2020-06-11 11:38:25'),
(119, 'Computer & Accessories', 18, 'Computer--Accessories-Ydz4H', NULL, 'Computer & Accessories', '2020-06-11 11:38:56', '2020-06-11 11:38:56'),
(120, 'Fans', 18, 'Fans-4ksFW', NULL, 'Fans', '2020-06-11 11:39:21', '2020-06-11 11:39:21'),
(121, 'Fax Machine', 18, 'Fax-Machine-7xMDt', NULL, 'Fax Machine', '2020-06-11 11:40:13', '2020-06-11 11:40:13'),
(122, 'Iron', 18, 'Iron-9xlzH', NULL, 'Iron', '2020-06-11 11:40:35', '2020-06-11 11:40:35'),
(123, 'Microphone', 18, 'Microphone-vAfJh', NULL, 'Microphone', '2020-06-11 11:41:04', '2020-06-11 11:41:04'),
(124, 'Note Counting Machine', 18, 'Note-Counting-Machine-LYPuZ', NULL, 'Note Counting Machine', '2020-06-11 11:41:34', '2020-06-11 11:41:34'),
(125, 'Play Station', 18, 'Play-Station-66Y7Z', NULL, 'Play Station', '2020-06-11 11:41:54', '2020-06-11 11:41:54'),
(126, 'Room Heater', 18, 'Room-Heater-1fzzO', NULL, 'Room Heater', '2020-06-11 11:42:17', '2020-06-11 11:42:17'),
(127, 'Television & Home Cinema', 18, 'Television--Home-Cinema-W51nC', NULL, 'Television & Home Cinema', '2020-06-11 11:42:53', '2020-06-11 11:42:53'),
(128, 'Agency', 19, 'Agency-e3uvD', NULL, 'Agency', '2020-06-11 13:29:59', '2020-06-11 13:29:59'),
(129, 'Audio & Visual', 19, 'Audio--Visual-n8hFj', NULL, 'Audio & Visual', '2020-06-11 13:30:24', '2020-06-11 13:30:24'),
(130, 'Billboard & Outdoor Media', 19, 'Billboard--Outdoor-Media-u7CZy', NULL, 'Billboard & Outdoor Media', '2020-06-11 13:31:03', '2020-06-11 13:31:03'),
(131, 'Broadcast', 19, 'Broadcast-G06gj', NULL, 'Broadcast', '2020-06-11 13:31:26', '2020-06-11 13:31:26'),
(132, 'Client Service', 19, 'Client-Service-sgX9P', NULL, 'Client Service', '2020-06-11 13:31:58', '2020-06-11 13:31:58'),
(133, 'Digital Media', 19, 'Digital-Media-4tl7U', NULL, 'Digital Media', '2020-06-11 13:32:18', '2020-06-11 13:32:18'),
(134, 'Event Management', 19, 'Event-Management-LrSDZ', NULL, 'Event Management', '2020-06-11 13:32:41', '2020-06-11 13:32:41'),
(135, 'Outsource Media', 19, 'Outsource-Media-8HKKi', NULL, 'Outsource Media', '2020-06-11 13:33:14', '2020-06-11 13:33:14'),
(136, 'Photography', 19, 'Photography-UChi9', NULL, 'Photography', '2020-06-11 13:33:34', '2020-06-11 13:33:34'),
(137, 'Printing Media', 19, 'Printing-Media-3Vabw', NULL, 'Printing Media', '2020-06-11 13:34:06', '2020-06-11 13:34:06'),
(138, 'Production Media', 19, 'Production-Media-LWLkR', NULL, 'Production Media', '2020-06-11 13:34:25', '2020-06-11 13:34:25'),
(139, 'Public Relation', 19, 'Public-Relation-LKaXG', NULL, NULL, '2020-06-11 13:34:42', '2020-06-11 13:34:42'),
(140, 'Research Media', 19, 'Research-Media-1Exaa', NULL, 'Research Media', '2020-06-11 13:35:05', '2020-06-11 13:35:05'),
(141, 'Telecast', 19, 'Telecast-76LKz', NULL, 'Telecast', '2020-06-11 13:35:24', '2020-06-11 13:35:24'),
(142, 'Mobile', 18, 'Mobile-6Eqje', 'Mobile', 'Mobile', '2020-06-12 06:50:53', '2020-06-12 06:50:53'),
(143, 'Fashion of Combo', 46, 'Apparel--Fashion-for-Kids-LXvzQ', NULL, 'Fashion of Combo', '2020-06-12 07:43:09', '2020-06-12 08:04:54'),
(144, 'Men\'s Ring', 46, 'Mens-Ring-EKdxn', NULL, 'Men\'s Ring', '2020-06-12 08:07:57', '2020-06-12 08:07:57'),
(145, 'Men\'s Shoes', 46, 'Mens-Shoes-hdjod', NULL, 'Men\'s Shoes', '2020-06-12 08:08:40', '2020-06-12 08:08:40'),
(146, 'Lingerie & Nightwear', 45, 'Lingerie--Nightwear-fbr6s', NULL, 'Lingerie & Nightwear', '2020-06-12 09:16:58', '2020-06-12 09:16:58'),
(147, 'Women\'s Apparel', 45, 'Womens-Apparel-nLnmk', NULL, 'Lingerie & Nightwear', '2020-06-12 09:17:22', '2020-06-12 09:17:22'),
(148, 'Women\'s Shoes', 45, 'Womens-Shoes-1BE8Q', NULL, 'Women\'s Shoes', '2020-06-12 09:18:03', '2020-06-12 09:18:03'),
(149, 'Women\'s Accessories', 45, 'Womens-Accessories-wyrkg', NULL, 'Women\'s Accessories', '2020-06-12 09:18:36', '2020-06-12 09:18:36'),
(150, 'Kids cloths', 21, 'Kids-cloths-anbjZ', NULL, 'Kids cloths', '2020-06-13 16:31:11', '2020-06-13 16:31:11'),
(151, 'Children full set', 21, 'Children-full-set-2aU2C', NULL, 'Children full set', '2020-06-13 16:47:53', '2020-06-13 16:47:53'),
(152, 'Children Accessories', 21, 'Children-Accessories-JFOfI', NULL, 'Children Accessories', '2020-06-13 16:48:21', '2020-06-13 16:48:21'),
(153, 'Kids Shoes', 21, 'Kids-Shoes-n4NTC', NULL, 'Kids Shoes', '2020-06-13 16:48:42', '2020-06-13 16:48:42'),
(154, 'Belts', 21, 'Belts-nF83B', NULL, 'Belts', '2020-06-13 16:49:22', '2020-06-13 16:49:22'),
(155, 'Watches', 21, 'Watches-uagcd', NULL, 'Watches', '2020-06-13 16:49:48', '2020-06-13 16:49:48'),
(156, 'Glasses', 21, 'Glasses-xOw5D', NULL, 'Glasses', '2020-06-13 16:50:14', '2020-06-13 16:50:14'),
(157, 'Gloves', 21, 'Gloves-Mo1aH', NULL, 'Gloves', '2020-06-13 16:51:14', '2020-06-13 16:51:14'),
(158, 'Hats  & Caps', 21, 'Hats---Caps-gaVRx', NULL, 'Hats  & Caps', '2020-06-13 16:52:22', '2020-06-13 16:52:22'),
(159, 'Kids Shoes', 21, 'Kids-Shoes-DdUdV', NULL, 'Kids Shoes', '2020-06-13 16:59:35', '2020-06-13 16:59:35'),
(160, 'Kids Bags', 21, 'Kids-Bags-cb869', NULL, 'Kids Bags', '2020-06-13 17:00:20', '2020-06-13 17:00:20'),
(161, 'Coffee Maker/ Warmer', 29, 'Coffee-Maker-Warmer-b1773', 'Coffee Maker/ Warmer', 'Coffee Maker/ Warmer', '2020-06-16 02:50:59', '2020-06-16 02:50:59'),
(162, 'Health Care & Pharmacy', 5, 'Health-Care--Pharmacy-7GTdl', 'Disinfecting fog machine', 'Health Care & Pharmacy', '2020-06-20 00:31:19', '2020-06-20 00:31:19'),
(163, 'Kids Food', 33, 'Kids-Food-x68qi', 'Kids Food', 'Kids Food', '2020-06-20 07:27:43', '2020-06-20 07:27:43'),
(164, 'Childcare Accessories', 33, 'Childcare-Accessories-w3T6O', 'Childcare Accessories', 'Childcare Accessories', '2020-06-20 07:28:12', '2020-06-20 07:28:12'),
(165, 'Kids cosmetics', 33, 'Kids-cosmetics-WqYXl', 'Kids cosmetics', 'Kids cosmetics', '2020-06-20 07:28:55', '2020-06-20 07:28:55'),
(166, 'Diapers', 33, 'Diapers-ix2xw', NULL, 'Diapers', '2020-06-20 07:29:16', '2020-06-20 07:29:16'),
(167, 'Furniture and bedding for Kids', 33, 'Furniture-and-bedding-for-Kids-C9YEC', NULL, 'Furniture and bedding for Kids', '2020-06-20 07:29:40', '2020-06-20 07:29:40'),
(168, 'Garments', 33, 'Garments-LvdU2', NULL, 'Garments', '2020-06-20 07:30:06', '2020-06-20 07:30:06'),
(169, 'Gift Items', 33, 'Gift-Items-VS77S', 'Gift Items', 'Gift Items', '2020-06-20 07:30:30', '2020-06-20 07:30:30'),
(170, 'Mother care', 33, 'Mother-care-bj7s4', 'Mother care', 'Mother care', '2020-06-20 07:30:52', '2020-06-20 07:30:52'),
(171, 'Shoes & Socks', 33, 'Shoes--Socks-KOJVq', 'Shoes & Socks', 'Shoes & Socks', '2020-06-20 07:31:40', '2020-06-20 07:31:40'),
(172, 'Books & Stationery', 33, 'Books--Stationery-NfHad', 'Books & Stationery', 'Books & Stationery', '2020-06-20 07:32:08', '2020-06-20 07:32:08'),
(173, 'Toys', 33, 'Toys-V4LK6', NULL, 'Toys', '2020-06-20 07:32:20', '2020-06-20 07:32:20'),
(174, 'Gardening Furniture', 20, 'Gardening-Furniture-NqBlD', 'Gardening Furniture', 'Gardening Furniture', '2020-06-20 07:35:35', '2020-06-20 07:35:35'),
(175, 'Home Furniture', 20, 'Home-Furniture-UaNSn', 'Home Furniture', 'Home Furniture', '2020-06-20 07:35:57', '2020-06-20 07:35:57'),
(176, 'Hospital Furniture', 20, 'Hospital-Furniture-Ds5sd', 'Hospital Furniture', 'Hospital Furniture', '2020-06-20 07:36:22', '2020-06-20 07:36:22'),
(177, 'Institutional Furniture', 20, 'Institutional-Furniture-zgWrB', 'Institutional Furniture', 'Institutional Furniture', '2020-06-20 07:36:49', '2020-06-20 07:36:49'),
(178, 'Office Furniture', 20, 'Office-Furniture-lapmy', 'Office Furniture', 'Office Furniture', '2020-06-20 07:37:15', '2020-06-20 07:37:15'),
(179, 'Glasses for Mens', 6, 'Glasses-for-Mens-4IywU', 'Glasses for Mens', 'Glasses for Mens', '2020-06-21 11:38:31', '2020-06-21 11:38:31'),
(180, 'Glasses for Womens', 6, 'Glasses-for-Womens-qX9Ru', 'Glasses for Womens', 'Glasses for Womens', '2020-06-21 11:39:05', '2020-06-21 11:39:05'),
(181, 'Glasses for Unisex', 6, 'Glasses-for-Unisex-yeZ3U', 'Glasses for Unisex', 'Glasses for Unisex', '2020-06-21 11:39:32', '2020-06-21 11:39:32'),
(182, 'Bakery', 22, 'Bakery-9VYuf', 'Bakery', 'Bakery', '2020-06-21 17:12:34', '2020-06-21 17:12:34'),
(183, 'Baking & Cooking', 22, 'Baking--Cooking-PraT3', 'Baking & Cooking', 'Baking & Cooking', '2020-06-21 17:13:08', '2020-06-21 17:13:08'),
(184, 'Beverage', 22, 'Beverage-oclpa', 'Beverage', 'Beverage', '2020-06-21 17:13:49', '2020-06-21 17:13:49'),
(185, 'Breakfast', 22, 'Breakfast-PhqrH', 'Breakfast', 'Breakfast', '2020-06-21 17:14:28', '2020-06-21 17:14:28'),
(186, 'Burmese Products', 22, 'Burmese-Products-bOQgb', 'Burmese Products', 'Burmese Products', '2020-06-21 17:15:22', '2020-06-21 17:15:22'),
(187, 'Candy & Chocolate', 22, 'Candy--Chocolate-jrNAw', 'Candy & Chocolate', 'Candy & Chocolate', '2020-06-21 17:16:14', '2020-06-21 17:16:14'),
(188, 'Canned, Dry & Package', 22, 'Canned-Dry--Package-suZJw', 'Canned, Dry & Package', 'Canned, Dry & Package', '2020-06-21 17:16:49', '2020-06-21 17:16:49'),
(189, 'Cooking Ingredients', 22, 'Cooking-Ingredients-2mfD9', 'Cooking Ingredients', 'Cooking Ingredients', '2020-06-21 17:17:20', '2020-06-21 17:17:20'),
(190, 'Dairy & Chilled', 22, 'Dairy--Chilled-qKU1m', 'Dairy & Chilled', 'Dairy & Chilled', '2020-06-21 17:17:50', '2020-06-21 17:17:50'),
(191, 'Food & Beverage', 22, 'Food--Beverage-JENVT', 'Dairy & Chilled', 'Dairy & Chilled', '2020-06-21 17:18:23', '2020-06-21 17:18:23'),
(192, 'Fresh Products', 22, 'Fresh-Products-dvZVy', 'Fresh Products', 'Fresh Products', '2020-06-21 17:18:55', '2020-06-21 17:18:55'),
(193, 'Frozen Products', 22, 'Frozen-Products-5OtSl', 'Frozen Products', 'Frozen Products', '2020-06-21 17:19:29', '2020-06-21 17:19:29'),
(194, 'House Keeping', 22, 'House-Keeping-lPhlK', 'House Keeping', 'House Keeping', '2020-06-21 17:19:58', '2020-06-21 17:19:58'),
(195, 'Laundry & Household', 22, 'Laundry--Household-d7tsa', 'Laundry & Household', 'Laundry & Household', '2020-06-21 17:20:28', '2020-06-21 17:20:28'),
(196, 'Other Groceries Accessories', 22, 'Other-Groceries-Accessories-SPHST', 'Other Groceries Accessories', 'Other Groceries Accessories', '2020-06-21 17:21:05', '2020-06-21 17:21:05'),
(197, 'Snacks', 22, 'Snacks-oiFEM', 'Snacks', 'Snacks', '2020-06-21 17:21:32', '2020-06-21 17:21:32'),
(198, 'Watches for men', 41, 'Watches-for-men-zYGcu', 'Watches for men', 'Watches for men', '2020-06-22 05:00:01', '2020-06-22 05:00:01'),
(199, 'Fresh Products', 47, 'Fresh-Products-x4HgJ', 'Fresh Products', 'Fresh Products', '2020-06-28 08:40:54', '2020-06-28 08:40:54'),
(200, 'Frozen Items', 47, 'Frozen-Items-timnx', 'Frozen Items', 'Frozen Items', '2020-06-28 08:41:28', '2020-06-28 08:41:28'),
(201, 'Handmade Accessories', 23, 'Handmade-Accessories-FkgRd', 'Handmade Accessories', 'Handmade Accessories', '2020-06-29 09:37:28', '2020-06-29 09:37:28'),
(202, 'Handmade art & Crafts', 23, 'Handmade-art--Crafts-Yfz0h', 'Handmade art & Crafts', 'Handmade art & Crafts', '2020-06-29 09:38:44', '2020-06-29 09:38:44'),
(203, 'Handmade Bag & Purses', 23, 'Handmade-Bag--Purses-EYVUJ', 'Handmade Bag & Purses', 'Handmade Bag & Purses', '2020-06-29 09:39:13', '2020-06-29 09:39:13'),
(204, 'Handmade Beauty Products', 23, 'Handmade-Beauty-Products-Io2VR', 'Handmade Beauty Products', 'Handmade Beauty Products', '2020-06-29 09:39:51', '2020-06-29 09:39:51'),
(205, 'Handmade Candle', 23, 'Handmade-Candle-DBjs4', 'Handmade Candle', 'Handmade Candle', '2020-06-29 09:40:21', '2020-06-29 09:40:21'),
(206, 'Handmade Ceramic & Clay', 23, 'Handmade-Ceramic--Clay-EgYdi', 'Handmade Ceramic & Clay', 'Handmade Ceramic & Clay', '2020-06-29 09:43:31', '2020-06-29 09:43:31'),
(207, 'Handmade Clothing', 23, 'Handmade-Clothing-7coU2', 'Handmade Clothing', 'Handmade Clothing', '2020-06-29 09:44:22', '2020-06-29 09:44:22'),
(208, 'Handmade Cookeries', 23, 'Handmade-Cookeries-WhitM', 'Handmade Cookeries', 'Handmade Cookeries', '2020-06-29 09:45:34', '2020-06-29 09:45:34'),
(209, 'Handmade Doll & Miniature', 23, 'Handmade-Doll--Miniature-6OkAh', 'Handmade Doll & Miniature', 'Handmade Doll & Miniature', '2020-06-29 09:46:15', '2020-06-29 09:46:15'),
(210, 'Handmade Foods', 23, 'Handmade-Foods-Il7MQ', 'Handmade Foods', 'Handmade Foods', '2020-06-29 09:47:03', '2020-06-29 09:47:03'),
(211, 'Handmade products for Babies', 23, 'Handmade-products-for-Babies-bPJds', 'Handmade products for Babies', 'Handmade products for Babies', '2020-06-29 09:52:08', '2020-06-29 09:52:08'),
(212, 'Handmade Furniture', 23, 'Handmade-Furniture-qS7Ve', 'Handmade Furniture', 'Handmade Furniture', '2020-06-29 09:52:39', '2020-06-29 09:52:39'),
(213, 'Handmade Glasswork', 23, 'Handmade-Glasswork-pVRi9', 'Handmade Glasswork', 'Handmade Glasswork', '2020-06-29 09:53:17', '2020-06-29 09:53:17'),
(214, 'Handmade Home Products', 23, 'Handmade-Home-Products-hIWjx', 'Handmade Home Products', 'Handmade Home Products', '2020-06-29 09:53:50', '2020-06-29 09:53:50'),
(215, 'Handmade Jewellery', 23, 'Handmade-Jewellery-7OKpq', 'Handmade Jewellery', 'Handmade Jewellery', '2020-06-29 09:54:22', '2020-06-29 09:54:22'),
(216, 'Handmade Needle Craft', 23, 'Handmade-Needle-Craft-6hD5h', 'Handmade Needle Craft', 'Handmade Needle Craft', '2020-06-29 09:54:49', '2020-06-29 09:54:49'),
(217, 'Handmade Paper Made products', 23, 'Handmade-Paper-Made-products-TjvIL', 'Handmade Paper Made products', 'Handmade Paper Made products', '2020-06-29 09:55:15', '2020-06-29 09:55:15'),
(218, 'Handmade Plants', 23, 'Handmade-Plants-ANnfJ', 'Handmade Plants', 'Handmade Plants', '2020-06-29 09:55:39', '2020-06-29 09:55:39'),
(219, 'Handmade Weddings products', 23, 'Handmade-Weddings-products-jraUY', 'Handmade Weddings products', 'Handmade Weddings products', '2020-06-29 09:56:12', '2020-06-29 09:56:12'),
(220, 'Agricultural Hand tools', 24, 'Agricultural-Hand-tools-2dMCx', 'Agricultural Hand tools', 'Agricultural Hand tools', '2020-06-29 09:58:14', '2020-06-29 09:58:14'),
(221, 'Animal Medicines', 24, 'Animal-Medicines-Gm8TT', 'Animal Medicines', 'Animal Medicines', '2020-06-29 09:58:54', '2020-06-29 09:58:54'),
(222, 'Aqua/Fish Feed', 24, 'AquaFish-Feed-ymPNM', 'Aqua/Fish Feed', 'Aqua/Fish Feed', '2020-06-29 09:59:27', '2020-06-29 09:59:27'),
(223, 'Crop Protection', 24, 'Crop-Protection-QQIxj', 'Crop Protection', 'Crop Protection', '2020-06-29 09:59:54', '2020-06-29 09:59:54'),
(224, 'Farm Animal Feed', 24, 'Farm-Animal-Feed-Yaq37', 'Farm Animal Feed', 'Farm Animal Feed', '2020-06-29 10:02:15', '2020-06-29 10:02:15'),
(225, 'Fertilizer', 24, 'Fertilizer-L5QL2', 'Fertilizer', 'Fertilizer', '2020-06-29 10:02:42', '2020-06-29 10:02:42'),
(226, 'Fertilizer Drill', 24, 'Fertilizer-Drill-m3tKs', 'Fertilizer Drill', 'Fertilizer Drill', '2020-06-29 10:03:21', '2020-06-29 10:03:21'),
(227, 'Fish Medicines', 24, 'Fish-Medicines-LQI6b', 'Fish Medicines', 'Fish Medicines', '2020-06-29 10:03:49', '2020-06-29 10:03:49'),
(228, 'Fishing Net', 24, 'Fishing-Net-TssKg', 'Fishing Net', 'Fishing Net', '2020-06-29 10:04:11', '2020-06-29 10:04:11'),
(229, 'Fruit Protection', 24, 'Fruit-Protection-yPQLI', 'Fruit Protection', 'Fruit Protection', '2020-07-03 16:16:27', '2020-07-03 16:16:27'),
(230, 'Grain Separator', 24, 'Grain-Separator-vdZxg', 'Grain Separator', 'Grain Separator', '2020-07-03 16:17:00', '2020-07-03 16:17:00'),
(231, 'Hand Sickle', 24, 'Hand-Sickle-L5k9B', 'Hand Sickle', 'Hand Sickle', '2020-07-03 16:17:42', '2020-07-03 16:17:42'),
(232, 'Harvester', 24, 'Harvester-IOCPU', 'Harvester', 'Harvester', '2020-07-03 16:18:15', '2020-07-03 16:18:15'),
(233, 'Insecticides', 24, 'Insecticides-aa9uN', 'Insecticides', 'Insecticides', '2020-07-03 16:18:41', '2020-07-03 16:18:41'),
(234, 'Irrigation Pump', 24, 'Irrigation-Pump-Op6sy', 'Irrigation Pump', 'Irrigation Pump', '2020-07-03 16:19:14', '2020-07-03 16:19:14'),
(235, 'Irrigation Tools', 24, 'Irrigation-Tools-9k3qC', 'Irrigation Tools', 'Irrigation Tools', '2020-07-03 16:20:05', '2020-07-03 16:20:05'),
(236, 'Machine Parts', 24, 'Machine-Parts-g8C6k', 'Machine Parts', 'Machine Parts', '2020-07-03 16:20:37', '2020-07-03 16:20:37'),
(237, 'Orchard Protection', 24, 'Orchard-Protection-PztsU', 'Orchard Protection', 'Orchard Protection', '2020-07-03 16:21:24', '2020-07-03 16:21:24'),
(238, 'Pick axe', 24, 'Pick-axe-9aFsg', 'Pickaxe', 'Pickaxe', '2020-07-03 16:22:05', '2020-07-03 16:22:05'),
(239, 'Ploughs', 24, 'Ploughs-E1nCZ', 'Ploughs', 'Ploughs', '2020-07-03 16:23:15', '2020-07-03 16:23:15'),
(240, 'Potato Planters', 24, 'Potato-Planters-geQi5', 'Potato Planters', 'Potato Planters', '2020-07-03 16:23:54', '2020-07-03 16:23:54'),
(241, 'Poultry Feed', 24, 'Poultry-Feed-p5VPF', 'Poultry Feed', 'Poultry Feed', '2020-07-03 16:24:20', '2020-07-03 16:24:20'),
(242, 'Poultry Medicines', 24, 'Poultry-Medicines-umgup', 'Poultry Medicines', 'Poultry Medicines', '2020-07-03 16:24:48', '2020-07-03 16:24:48'),
(243, 'Power Tillers', 24, 'Power-Tillers-MinYg', 'Power Tillers', 'Power Tillers', '2020-07-03 16:25:11', '2020-07-03 16:25:11'),
(244, 'Rice Grader', 24, 'Rice-Grader-7TczM', 'Rice Grader', 'Rice Grader', '2020-07-03 16:27:34', '2020-07-03 16:28:13'),
(245, 'Rice Transplater', 24, 'Rice-Transplater-5NWoQ', 'Rice Transplater', 'Rice Transplater', '2020-07-03 16:29:00', '2020-07-03 16:29:00'),
(246, 'Rotavator', 24, 'Rotavator-bOZSr', 'Rotavator', 'Rotavator', '2020-07-03 16:29:40', '2020-07-03 16:29:40'),
(247, 'Seeds Cleaning Machine', 24, 'Seeds-Cleaning-Machine-gGYoR', 'Seeds Cleaning Machine', 'Seeds Cleaning Machine', '2020-07-03 16:30:11', '2020-07-03 16:30:11'),
(248, 'Speed Drils', 24, 'Speed-Drils-QFiGQ', 'Speed Drils', 'Speed Drils', '2020-07-03 16:30:40', '2020-07-03 16:30:40'),
(249, 'Speed Grader', 24, 'Speed-Grader-aEnBi', 'Speed Grader', 'Speed Grader', '2020-07-03 16:31:00', '2020-07-03 16:31:00'),
(250, 'Seeding Tray', 24, 'Seeding-Tray-Wqdvf', 'Seeding Tray', 'Seeding Tray', '2020-07-03 16:33:25', '2020-07-03 16:33:25'),
(251, 'Seeds', 24, 'Seeds-cb5Be', 'Seeds', 'Seeds', '2020-07-03 16:36:27', '2020-07-03 16:36:27'),
(252, 'Sprayer', 24, 'Sprayer-3JxUr', 'Sprayer', 'Sprayer', '2020-07-03 16:40:46', '2020-07-03 16:40:46'),
(253, 'Tractor', 24, 'Tractor-Bousx', 'Tractor', 'Tractor', '2020-07-03 16:41:11', '2020-07-03 16:41:11'),
(254, 'Tree Nutrients', 24, 'Tree-Nutrients-Hc3oh', 'Tree Nutrients', 'Tree Nutrients', '2020-07-03 16:41:39', '2020-07-03 16:41:39'),
(255, 'Trolley', 24, 'Trolley-jAamk', 'Trolley', 'Trolley', '2020-07-03 16:42:03', '2020-07-03 16:42:03'),
(256, 'Medicines', 25, 'Medicines-nkPbC', 'Medicines', 'Medicines', '2020-07-03 16:42:53', '2020-07-03 16:42:53'),
(257, 'Blanket ( Kantha)', 26, 'Blanket--Kantha-AwJkz', 'Blanket ( Kantha)', 'Blanket ( Kantha)', '2020-07-03 17:42:50', '2020-07-03 17:42:50'),
(258, 'Cloth Bobin Remover', 26, 'Cloth-Bobin-Remover-yTjyL', 'Cloth Bobin Remover', 'Cloth Bobin Remover', '2020-07-03 17:43:29', '2020-07-03 17:43:29'),
(259, 'Dining Needs', 26, 'Dining-Needs-Zv3dP', 'Dining Needs', 'Dining Needs', '2020-07-03 17:43:56', '2020-07-03 17:43:56'),
(260, 'Electrical Fittings', 26, 'Electrical-Fittings-fYeng', 'Electrical Fittings', 'Electrical Fittings', '2020-07-03 17:44:32', '2020-07-03 17:44:32'),
(261, 'Furnishing', 26, 'Furnishing-xFZt1', 'Furnishing', 'Furnishing', '2020-07-03 17:45:10', '2020-07-03 17:45:10'),
(262, 'Furniture', 26, 'Furniture-hFxrm', 'Furniture', 'Furniture', '2020-07-03 17:46:23', '2020-07-03 17:46:23'),
(263, 'Home Decor', 26, 'Home-Decor-CYHwn', 'Home Decor', 'Home Decor', '2020-07-03 17:46:48', '2020-07-03 17:46:48'),
(264, 'Home Gardening', 26, 'Home-Gardening-ar7Su', 'Home Gardening', 'Home Gardening', '2020-07-03 17:47:45', '2020-07-03 17:47:45'),
(265, 'House Keeping', 26, 'House-Keeping-PY0a9', 'House Keeping', 'House Keeping', '2020-07-03 17:48:21', '2020-07-03 17:48:21'),
(266, 'Kitchen Needs', 26, 'Kitchen-Needs-VARU3', 'Kitchen Needs', 'Kitchen Needs', '2020-07-03 17:48:56', '2020-07-03 17:48:56'),
(267, 'Lamps & Lightnings', 26, 'Lamps--Lightnings-jmjux', 'Lamps & Lightnings', 'Lamps & Lightnings', '2020-07-03 17:49:49', '2020-07-03 17:49:49'),
(268, 'Garden Furniture', 10, 'Garden-Furniture-B6Mp5', 'Garden Furniture', 'Garden Furniture', '2020-07-03 17:49:51', '2020-07-04 01:40:04'),
(269, 'Religious Items', 26, 'Religious-Items-ivtZw', 'Religious Items', 'Religious Items', '2020-07-03 17:52:00', '2020-07-03 17:52:00'),
(270, 'Electronics and appliance', 26, 'Electronics-and-appliance-sOFeC', 'Electronics and appliance', 'Electronics and appliance', '2020-07-03 18:00:20', '2020-07-03 18:00:20'),
(271, 'Kitchen Appliance', 26, 'Kitchen-Appliance-sPt0Q', 'Kitchen Appliance', 'Kitchen Appliance', '2020-07-03 18:01:48', '2020-07-03 18:01:48'),
(272, 'Large Appliance', 26, 'Large-Appliance-1wNIe', 'Large Appliance', 'Large Appliance', '2020-07-03 18:03:46', '2020-07-03 18:03:46'),
(273, 'Small Appliance', 26, 'Small-Appliance-0TiQo', 'Small Appliance', 'Small Appliance', '2020-07-03 18:04:24', '2020-07-03 18:04:24'),
(274, 'Garden Furniture', 10, 'Garden-Furniture-l3TBj', 'Garden Furniture', 'Garden Furniture', '2020-07-04 08:21:05', '2020-07-04 08:21:05'),
(275, 'Gardening Machines', 10, 'Gardening-Machines-OpIEX', 'Gardening Machines', 'Gardening Machines', '2020-07-04 08:21:39', '2020-07-04 08:21:39'),
(276, 'Gardening Tools', 10, 'Gardening-Tools-yWI75', 'Gardening Tools', 'Gardening Tools', '2020-07-04 08:22:04', '2020-07-04 08:22:04'),
(277, 'Plants', 10, 'Plants-gZdna', 'Plants', 'Plants', '2020-07-04 08:22:29', '2020-07-04 08:22:29'),
(278, 'Seeds', 10, 'Seeds-K1ulw', 'Seeds', 'Seeds', '2020-07-04 08:23:00', '2020-07-04 08:23:00'),
(279, 'Watering Equipment', 10, 'Watering-Equipment-oes3x', 'Watering Equipment', 'Watering Equipment', '2020-07-04 08:23:38', '2020-07-04 08:23:38'),
(280, '3 Star Hotel', 48, '3-Star-Hotel-ZRegr', '3 Star Hotel', '3 Star Hotel', '2020-07-04 08:27:10', '2020-07-04 08:27:10'),
(281, '4 Star Hotel', 48, '4-Star-Hotel-ydwGB', '4 Star Hotel', '4 Star Hotel', '2020-07-04 08:27:34', '2020-07-04 08:27:34'),
(282, '5 Star Hotel', 48, '5-Star-Hotel-1gZxk', '5 Star Hotel', '5 Star Hotel', '2020-07-04 08:27:55', '2020-07-04 08:27:55'),
(283, 'Non Star Hotel', 48, 'Non-Star-Hotel-9DeBg', 'Non Star Hotel', 'Non Star Hotel', '2020-07-04 08:28:22', '2020-07-04 08:28:22'),
(284, 'Clubs', 48, 'Clubs-aYx33', 'Clubs', 'Clubs', '2020-07-04 08:28:41', '2020-07-04 08:28:41'),
(285, 'Resort Booking', 48, 'Resort-Booking-0AE5N', 'Resort Booking', 'Resort Booking', '2020-07-04 08:29:19', '2020-07-04 08:29:19'),
(286, 'Diamond', 28, 'Diamond-topkq', 'Diamond', 'Diamond', '2020-07-04 09:02:59', '2020-07-04 09:02:59'),
(287, 'Gold', 28, 'Gold-1jAUQ', 'Gold', 'Gold', '2020-07-04 09:03:20', '2020-07-04 09:03:20'),
(288, 'Gold Plated', 28, 'Gold-Plated-rBRmD', 'Gold Plated', 'Gold Plated', '2020-07-04 09:03:39', '2020-07-04 09:03:39'),
(289, 'Imitation/ Junk Jewellery', 28, 'Imitation-Junk-Jewellery-IGbuk', 'Imitation/ Junk Jewellery', 'Imitation/ Junk Jewellery', '2020-07-04 09:04:44', '2020-07-04 09:04:44'),
(290, 'Jewellery Box', 28, 'Jewellery-Box-Z57JK', 'Jewellery Box', 'Jewellery Box', '2020-07-04 09:05:14', '2020-07-04 09:05:14'),
(291, 'Men\'s Jewellery', 28, 'Mens-Jewellery-hTJV9', 'Men\'s Jewellery', 'Men\'s Jewellery', '2020-07-04 09:05:55', '2020-07-04 09:05:55'),
(292, 'Mixed', 28, 'Mixed-xKPJd', 'Mixed', 'Mixed', '2020-07-04 09:06:14', '2020-07-04 09:06:14'),
(293, 'Pearl', 28, 'Pearl-Qph3g', 'Pearl', 'Pearl', '2020-07-04 09:06:49', '2020-07-04 09:06:49'),
(294, 'Platinum', 28, 'Platinum-07UU1', 'Platinum', 'Platinum', '2020-07-04 09:07:20', '2020-07-04 09:07:20'),
(295, 'Silver', 28, 'Silver-0cZRv', 'Silver', 'Silver', '2020-07-04 09:07:41', '2020-07-04 09:07:41'),
(296, 'Stone', 28, 'Stone-EOtDv', 'Stone', 'Stone', '2020-07-04 09:08:02', '2020-07-04 09:08:02'),
(297, 'White Gold', 28, 'White-Gold-cHEui', 'White Gold', 'White Gold', '2020-07-04 09:08:21', '2020-07-04 09:08:21'),
(298, 'Cooking Brush', 29, 'Cooking-Brush-OQDFd', 'Cooking Brush', 'Cooking Brush', '2020-07-04 16:27:46', '2020-07-04 16:27:46'),
(299, 'Cookware', 29, 'Cookware-Ejhm1', 'Cookware', 'Cookware', '2020-07-04 16:28:19', '2020-07-04 16:28:19'),
(300, 'Dinnerware Loose', 29, 'Dinnerware-Loose-kjVGi', 'Dinnerware Loose', 'Dinnerware Loose', '2020-07-04 16:29:11', '2020-07-04 16:29:44'),
(301, 'Dinnerware sets', 29, 'Dinnerware-sets-dY7FB', 'Dinnerware sets', 'Dinnerware sets', '2020-07-04 16:30:09', '2020-07-04 16:30:09'),
(302, 'Drink Pots', 29, 'Drink-Pots-PXCxR', 'Drink Pots', 'Drink Pots', '2020-07-04 16:31:25', '2020-07-04 16:31:25'),
(303, 'Gas Stoves & Burners', 29, 'Gas-Stoves--Burners-aOKKm', 'Gas Stoves & Burners', 'Gas Stoves & Burners', '2020-07-04 16:32:14', '2020-07-04 16:32:14'),
(304, 'Grater', 29, 'Grater-YbVFk', 'Grater', 'Grater', '2020-07-04 16:32:57', '2020-07-04 16:32:57'),
(305, 'Hot Pot', 29, 'Hot-Pot-9Hfiu', 'Hot Pot', 'Hot Pot', '2020-07-04 16:33:15', '2020-07-04 16:33:15'),
(306, 'Knife', 29, 'Knife-LJbPR', 'Knife', 'Knife', '2020-07-04 16:33:34', '2020-07-04 16:33:34'),
(307, 'Outdoor BBQ', 29, 'Outdoor-BBQ-oENJl', 'Outdoor BBQ', 'Outdoor BBQ', '2020-07-04 16:34:01', '2020-07-04 16:34:01'),
(308, 'Serve-ware', 29, 'Serve-ware-068eL', 'Serve-ware', 'Serve-ware', '2020-07-04 16:34:45', '2020-07-04 16:34:45'),
(309, 'Spoons & Forks', 29, 'Spoons--Forks-QENvf', 'Spoons & Forks', 'Spoons & Forks', '2020-07-04 16:35:09', '2020-07-04 16:35:09'),
(310, 'Tea Pots', 29, 'Tea-Pots-BbgCY', 'Tea Pots', 'Tea Pots', '2020-07-04 16:35:32', '2020-07-04 16:35:32'),
(311, 'Tray', 29, 'Tray-FqS1Q', 'Tray', 'Tray', '2020-07-04 16:35:51', '2020-07-04 16:35:51'),
(312, 'Leather Accessories', 30, 'Leather-Accessories-hEy6C', 'Leather Accessories', 'Leather Accessories', '2020-07-04 16:36:53', '2020-07-04 16:36:53'),
(313, 'Leather Backpack', 30, 'Leather-Backpack-woSN1', 'Leather Backpack', 'Leather Backpack', '2020-07-04 16:37:27', '2020-07-04 16:37:27'),
(314, 'Leather Card holders', 30, 'Leather-Card-holders-Oqqvl', 'Leather Card holders', 'Leather Card holders', '2020-07-04 16:37:55', '2020-07-04 16:37:55'),
(315, 'Leather care', 30, 'Leather-care-Iq1Cd', 'Leather care', 'Leather care', '2020-07-04 16:38:23', '2020-07-04 16:38:23'),
(316, 'Leather Clutches', 30, 'Leather-Clutches-lfh1k', 'Leather Clutches', 'Leather Clutches', '2020-07-04 16:38:50', '2020-07-04 16:38:50'),
(317, 'Leather Cross body bags', 30, 'Leather-Cross-body-bags-QRDsF', 'Leather Cross body bags', 'Leather Cross body bags', '2020-07-04 16:39:11', '2020-07-04 16:39:11'),
(318, 'Leather footwear', 30, 'Leather-footwear-31V07', 'Leather footwear', 'Leather footwear', '2020-07-04 16:39:49', '2020-07-04 16:39:49'),
(319, 'Leather Handbag', 30, 'Leather-Handbag-ekrDJ', 'Leather Handbag', 'Leather Handbag', '2020-07-04 16:40:15', '2020-07-04 16:40:15'),
(320, 'Leather Jackets', 30, 'Leather-Jackets-bAdYQ', 'Leather Jackets', 'Leather Jackets', '2020-07-04 16:41:07', '2020-07-04 16:41:07'),
(321, 'Leather Ladies handbags', 30, 'Leather-Ladies-handbags-akAKl', 'Leather Ladies handbags', 'Leather Ladies handbags', '2020-07-04 16:41:44', '2020-07-04 16:41:44'),
(322, 'Leather purses', 30, 'Leather-purses-7f08C', 'Leather purses', 'Leather purses', '2020-07-04 16:42:22', '2020-07-04 16:42:22'),
(323, 'Leather shoulder bag', 30, 'Leather-shoulder-bag-hiF8j', 'Leather shoulder bag', 'Leather shoulder bag', '2020-07-04 17:06:43', '2020-07-04 17:06:43'),
(324, 'Leather Sofa', 30, 'Leather-Sofa-qvMZu', 'Leather Sofa', 'Leather Sofa', '2020-07-04 17:07:23', '2020-07-04 17:07:23'),
(325, 'Leather wallets', 30, 'Leather-wallets-8IJbg', 'Leather wallets', 'Leather wallets', '2020-07-04 17:07:49', '2020-07-04 17:07:49'),
(326, 'Leather Watch Bands', 30, 'Leather-Watch-Bands-zaOTf', 'Leather Watch Bands', 'Leather Watch Bands', '2020-07-04 17:08:35', '2020-07-04 17:08:35'),
(327, 'Air Blowing', 9, 'Air-Blowing-fDMLH', 'Air Blowing', 'Air Blowing', '2020-07-04 17:10:01', '2020-07-04 17:10:01'),
(328, 'Air Compressor', 9, 'Air-Compressor-U4Hsw', 'Air Compressor', 'Air Compressor', '2020-07-04 17:10:29', '2020-07-04 17:10:29'),
(329, 'Automotive Tools', 9, 'Automotive-Tools-9JHtI', 'Air Compressor', 'Air Compressor', '2020-07-04 17:10:55', '2020-07-04 17:10:55'),
(330, 'Bearing', 9, 'Bearing-iFZRI', 'Bearing', 'Bearing', '2020-07-04 17:20:58', '2020-07-04 17:20:58'),
(331, 'Blades', 9, 'Blades-GF3kG', 'Blades', 'Blades', '2020-07-04 17:23:43', '2020-07-04 17:23:43'),
(332, 'Cement Mixer', 9, 'Cement-Mixer-iTJH7', 'Cement Mixer', 'Cement Mixer', '2020-07-04 17:24:09', '2020-07-04 17:24:09'),
(333, 'China Saw', 9, 'China-Saw-V2kXN', 'China Saw', 'China Saw', '2020-07-04 17:24:48', '2020-07-04 17:24:48'),
(334, 'Chisels', 9, 'Chisels-y0nmb', 'Chisels', 'Chisels', '2020-07-04 17:25:13', '2020-07-04 17:25:13'),
(335, 'Clamps & Vices', 9, 'Clamps--Vices-7qBAM', 'Clamps & Vices', 'Clamps & Vices', '2020-07-04 17:25:44', '2020-07-04 17:25:44'),
(336, 'CNC Router', 9, 'CNC-Router-ULnGL', 'CNC Router', 'CNC Router', '2020-07-04 17:26:22', '2020-07-04 17:26:22'),
(337, 'Cordless Tools', 9, 'Cordless-Tools-tgdq2', 'Cordless Tools', 'Cordless Tools', '2020-07-04 17:27:17', '2020-07-04 17:27:17'),
(338, 'Cutting Tools', 9, 'Cutting-Tools-pcipl', 'Cutting Tools', 'Cutting Tools', '2020-07-04 17:28:02', '2020-07-04 17:28:02'),
(339, 'Detergent Mixer Machine', 9, 'Detergent-Mixer-Machine-ef8Gr', 'Detergent Mixer Machine', 'Detergent Mixer Machine', '2020-07-04 17:28:58', '2020-07-04 17:28:58'),
(340, 'Drill Machines', 9, 'Drill-Machines-kqP4p', 'Drill Machines', 'Drill Machines', '2020-07-04 17:29:36', '2020-07-04 17:29:36'),
(341, 'Forklift', 9, 'Forklift-n83x7', 'Forklift', 'Forklift', '2020-07-04 17:30:13', '2020-07-04 17:30:13'),
(342, 'Generators', 9, 'Generators-Sqpol', 'Generators', 'Generators', '2020-07-04 17:30:48', '2020-07-04 17:30:48'),
(343, 'GPS Tracker', 9, 'GPS-Tracker-ABgMa', 'GPS Tracker', 'GPS Tracker', '2020-07-04 17:31:18', '2020-07-04 17:31:18'),
(344, 'Grinding Machines', 9, 'Grinding-Machines-Tsl1y', 'Grinding Machines', 'Grinding Machines', '2020-07-04 17:32:14', '2020-07-04 17:32:14'),
(345, 'Hammers', 32, 'Hammers-lssBU', 'Hammers', 'Hammers', '2020-07-04 17:32:54', '2020-07-04 17:32:54'),
(346, 'Hand Blower Machine', 9, 'Hand-Blower-Machine-QJlCy', 'Hand Blower Machine', 'Hand Blower Machine', '2020-07-04 17:38:21', '2020-07-04 17:38:21'),
(347, 'Hand Tool Kit', 9, 'Hand-Tool-Kit-gbybV', 'Hand Tool Kit', 'Hand Tool Kit', '2020-07-04 17:38:48', '2020-07-04 17:38:48'),
(348, 'LAB equipment', 9, 'LAB-equipment-A44KU', 'LAB equipment', 'LAB equipment', '2020-07-04 17:39:23', '2020-07-04 17:39:23'),
(349, 'Laminating Machine', 9, 'Laminating-Machine-fH3ol', 'Laminating Machine', 'Laminating Machine', '2020-07-04 17:50:51', '2020-07-04 17:50:51'),
(350, 'Lift / Elevator', 9, 'Lift--Elevator-ruOi7', 'Lift / Elevator', 'Lift / Elevator', '2020-07-04 18:54:25', '2020-07-04 18:54:25'),
(351, 'Gardening Tools', 9, 'Gardening-Tools-ffrAt', 'Gardening Tools', 'Gardening Tools', '2020-07-05 01:11:30', '2020-07-05 01:11:30'),
(352, 'Lubrication tools', 9, 'Lubrication-tools-qqPpp', 'Lubrication tools', 'Lubrication tools', '2020-07-05 01:12:57', '2020-07-05 01:12:57'),
(353, 'Machine parts', 9, 'Machine-parts-adxTf', 'Machine parts', 'Machine parts', '2020-07-05 01:14:41', '2020-07-05 01:14:41'),
(354, 'Masonry Tools', 9, 'Masonry-Tools-YIJV7', 'Masonry Tools', 'Masonry Tools', '2020-07-05 01:18:50', '2020-07-05 01:18:50'),
(355, 'Measuring Tapes and staplers', 9, 'Measuring-Tapes-and-staplers-jjPMh', 'Measuring Tapes and staplers', 'Measuring Tapes and staplers', '2020-07-05 01:23:50', '2020-07-05 01:23:50'),
(356, 'One Time paper glass machine', 9, 'One-Time-paper-glass-machine-z7Bdc', 'One Time paper glass machine', 'One Time paper glass machine', '2020-07-05 01:24:39', '2020-07-05 01:24:39'),
(357, 'Paper Shredder', 9, 'Paper-Shredder-2Yx2M', 'Paper Shredder', 'Paper Shredder', '2020-07-05 01:25:48', '2020-07-05 01:25:48'),
(358, 'Photocopy Machine', 9, 'Photocopy-Machine-EN0R7', 'Photocopy Machine', 'Photocopy Machine', '2020-07-05 01:27:00', '2020-07-05 01:27:00'),
(359, 'Plate compactors', 9, 'Plate-compactors-hclvL', 'Plate compactors', 'Plate compactors', '2020-07-05 01:27:45', '2020-07-05 01:27:45'),
(360, 'Pliers', 9, 'Pliers-7GYnq', 'Pliers', 'Pliers', '2020-07-05 01:28:46', '2020-07-05 01:28:46'),
(361, 'Poultry Dressing', 9, 'Poultry-Dressing-xxdPn', 'Poultry Dressing', 'Poultry Dressing', '2020-07-05 01:30:27', '2020-07-05 01:30:27'),
(362, 'Plumbing Tools', 9, 'Plumbing-Tools-Z5HWB', 'Plumbing Tools', 'Plumbing Tools', '2020-07-05 01:31:10', '2020-07-05 01:31:10'),
(363, 'Pullers', 9, 'Pullers-JIT2R', 'Pullers', 'Pullers', '2020-07-05 01:31:43', '2020-07-05 01:31:43'),
(364, 'Saw Mill Machine', 9, 'Saw-Mill-Machine-BSChc', 'Saw Mill Machine', 'Saw Mill Machine', '2020-07-05 01:32:18', '2020-07-05 01:32:18'),
(365, 'Screwdrivers & Nutdrivers', 9, 'Screwdrivers--Nutdrivers-d85b2', 'Screwdrivers & Nutdrivers', 'Screwdrivers & Nutdrivers', '2020-07-05 01:33:48', '2020-07-05 01:33:48'),
(366, 'Sewing Machine', 9, 'Sewing-Machine-i6R7B', 'Sewing Machine', 'Sewing Machine', '2020-07-05 01:34:22', '2020-07-05 01:34:22'),
(367, 'Sockets', 9, 'Sockets-1KVFg', 'Sockets', 'Sockets', '2020-07-05 01:35:04', '2020-07-05 01:35:04'),
(368, 'Spiral Binding Machine', 9, 'Spiral-Binding-Machine-KE26E', 'Spiral Binding Machine', 'Spiral Binding Machine', '2020-07-05 01:35:44', '2020-07-05 01:35:44'),
(369, 'Tamping Rammer', 9, 'Tamping-Rammer-PUdDi', 'Tamping Rammer', 'Tamping Rammer', '2020-07-05 01:40:05', '2020-07-05 01:40:05'),
(370, 'Tractor', 9, 'Tractor-m25Hv', 'Tractor', 'Tractor', '2020-07-05 01:42:02', '2020-07-05 01:42:02'),
(371, 'Treadmill', 9, 'Treadmill-0BwQt', 'Treadmill', 'Treadmill', '2020-07-05 01:42:55', '2020-07-05 01:42:55'),
(372, 'Water Pump', 9, 'Water-Pump-5GFHh', 'Water Pump', 'Water Pump', '2020-07-05 01:43:37', '2020-07-05 01:43:37'),
(373, 'Water treatment plan', 9, 'Water-treatment-plan-JxlWq', 'Water treatment plan', 'Water treatment plan', '2020-07-05 01:45:00', '2020-07-05 01:45:00'),
(374, 'Welding Machines', 9, 'Welding-Machines-WPM0p', 'Welding Machines', 'Welding Machines', '2020-07-05 01:45:48', '2020-07-05 01:45:48'),
(375, 'Wrenches', 9, 'Wrenches-bEWVo', 'Wrenches', 'Wrenches', '2020-07-05 01:46:31', '2020-07-05 01:46:31'),
(376, 'Adhesive', 34, 'Adhesive-ak7WJ', 'Adhesive', 'Adhesive', '2020-07-05 01:52:07', '2020-07-05 01:52:07'),
(377, 'Aluminium Paint', 34, 'Aluminium-Paint-pdngw', 'Aluminium Paint', 'Aluminium Paint', '2020-07-05 01:52:47', '2020-07-05 01:52:47'),
(378, 'Art and Craft Paints', 34, 'Art-and-Craft-Paints-3lugl', 'Art and Craft Paints', 'Art and Craft Paints', '2020-07-05 01:53:41', '2020-07-05 01:53:41'),
(379, 'Distemper', 34, 'Distemper-RVyij', 'Distemper', 'Distemper', '2020-07-05 01:54:22', '2020-07-05 01:54:22'),
(380, 'Enamel', 34, 'Enamel-mW8RP', 'Enamel', 'Enamel', '2020-07-05 01:55:04', '2020-07-05 01:55:04'),
(381, 'Exterior Distemper', 34, 'Exterior-Distemper-gDoEX', 'Exterior Distemper', 'Exterior Distemper', '2020-07-05 01:56:07', '2020-07-05 01:56:07'),
(382, 'Exterior Emulsion', 34, 'Exterior-Emulsion-cHyrN', 'Exterior Emulsion', 'Exterior Emulsion', '2020-07-05 01:57:03', '2020-07-05 01:57:03'),
(383, 'Exterior wall  Putty', 34, 'Exterior-wall--Putty-edM6F', 'Exterior wall  Putty', 'Exterior wall  Putty', '2020-07-05 01:58:04', '2020-07-05 01:58:04'),
(384, 'Heat Resistant Paint', 34, 'Heat-Resistant-Paint-vOrdi', 'Heat Resistant Paint', 'Heat Resistant Paint', '2020-07-05 01:59:30', '2020-07-05 01:59:30'),
(385, 'Industrial Enamel', 34, 'Industrial-Enamel-hTQ1W', 'Industrial Enamel', 'Industrial Enamel', '2020-07-05 02:00:22', '2020-07-05 02:00:22'),
(386, 'Industrial paint', 34, 'Industrial-paint-oKF5L', 'Industrial paint', 'Industrial paint', '2020-07-05 02:01:33', '2020-07-05 02:01:33'),
(387, 'Industrial Red Oxide Primer', 34, 'Industrial-Red-Oxide-Primer-HHuRZ', 'Industrial Red Oxide Primer', 'Industrial Red Oxide Primer', '2020-07-05 02:02:25', '2020-07-05 02:02:25'),
(388, 'Interior Distemper', 34, 'Interior-Distemper-quQdJ', 'Interior Distemper', 'Interior Distemper', '2020-07-05 02:10:36', '2020-07-05 02:10:36'),
(389, 'Interior Emulsion', 34, 'Interior-Emulsion-4LuI8', 'Interior Emulsion', 'Interior Emulsion', '2020-07-05 02:11:52', '2020-07-05 02:11:52'),
(390, 'Metal Paints', 34, 'Metal-Paints-0K2hN', 'Metal Paints', 'Metal Paints', '2020-07-05 02:11:54', '2020-07-05 02:13:24'),
(391, 'Interior Wall putty', 34, 'Interior-Wall-putty-M9mAn', 'Interior Wall putty', 'Interior Wall putty', '2020-07-05 02:12:38', '2020-07-05 02:12:38'),
(392, 'Paint Supplement', 34, 'Paint-Supplement-3p54u', 'Paint Supplement', 'Paint Supplement', '2020-07-05 02:14:07', '2020-07-05 02:14:07'),
(393, 'Paper paint', 34, 'Paper-paint-NVFJJ', 'Paper paint', 'Paper paint', '2020-07-05 02:14:52', '2020-07-05 02:14:52'),
(394, 'Rad Lead Primer', 34, 'Rad-Lead-Primer-riIXf', 'Rad Lead Primer', 'Rad Lead Primer', '2020-07-05 02:15:44', '2020-07-05 02:15:44'),
(395, 'Wall Paints', 34, 'Wall-Paints-KhkCe', 'Wall Paints', 'Wall Paints', '2020-07-05 02:16:25', '2020-07-05 02:16:25'),
(396, 'Wall Sealer/ Primer', 34, 'Wall-Sealer-Primer-R0Btv', 'Wall Sealer/ Primer', 'Wall Sealer/ Primer', '2020-07-05 02:17:13', '2020-07-05 02:17:13'),
(397, 'Weather Coat', 34, 'Weather-Coat-VCUVy', 'Weather Coat', 'Weather Coat', '2020-07-05 02:18:00', '2020-07-05 02:18:00'),
(398, 'Wood Paints', 34, 'Wood-Paints-X8fBG', 'Wood Paints', 'Wood Paints', '2020-07-05 02:18:36', '2020-07-05 02:18:36'),
(399, 'Animals', 36, 'Animals-XTupY', 'Animals', 'Animals', '2020-07-05 07:26:31', '2020-07-05 07:26:31'),
(400, 'Aquarium', 36, 'Aquarium-ozNLT', 'Aquarium', 'Aquarium', '2020-07-05 07:26:59', '2020-07-05 07:26:59'),
(401, 'Birds', 36, 'Birds-YIGRT', 'Birds', 'Birds', '2020-07-05 07:27:21', '2020-07-05 07:27:21'),
(402, 'Cats', 36, 'Cats-0zBue', 'Cats', 'Cats', '2020-07-05 07:27:42', '2020-07-05 07:27:42'),
(403, 'Dogs', 36, 'Dogs-8qxBw', 'Dogs', 'Dogs', '2020-07-05 07:27:57', '2020-07-05 07:27:57');
INSERT INTO `sub_categories` (`id`, `name`, `category_id`, `slug`, `meta_title`, `meta_description`, `created_at`, `updated_at`) VALUES
(404, 'Fish', 36, 'Fish-8PTE3', 'Fish', 'Fish', '2020-07-05 07:28:15', '2020-07-05 07:28:15'),
(405, 'Pet Accessories', 36, 'Pet-Accessories-yz0Yi', 'Pet Accessories', 'Pet Accessories', '2020-07-05 07:28:39', '2020-07-05 07:28:39'),
(406, 'Pet Foods', 36, 'Pet-Foods-TPlAO', 'Pet Foods', 'Pet Foods', '2020-07-05 07:29:03', '2020-07-05 07:29:03'),
(407, 'Poultry  Suppliers', 36, 'Poultry--Suppliers-tyXfC', 'Poultry  Suppliers', 'Poultry  Suppliers', '2020-07-05 07:29:26', '2020-07-05 07:29:26'),
(408, 'Lemon Squeezer', 37, 'Lemon-Squeezer-y1BZt', 'Lemon Squeezer', 'Lemon Squeezer', '2020-07-05 07:30:57', '2020-07-05 07:30:57'),
(409, 'Peeler', 37, 'Peeler-NXNKk', 'Peeler', 'Peeler', '2020-07-05 07:31:20', '2020-07-05 07:31:20'),
(410, 'Plastic Basket', 37, 'Plastic-Basket-QQj6j', 'Plastic Basket', 'Plastic Basket', '2020-07-05 07:31:44', '2020-07-05 07:31:44'),
(411, 'Plastic Bowl', 37, 'Plastic-Bowl-kblKc', 'Plastic Bowl', 'Plastic Bowl', '2020-07-05 07:32:11', '2020-07-05 07:32:11'),
(412, 'Plastic Chairs', 37, 'Plastic-Chairs-pMOVn', 'Plastic Chair', 'Plastic Chair', '2020-07-05 07:32:36', '2020-07-05 07:32:36'),
(413, 'Plastic Chopping', 37, 'Plastic-Chopping-McOrd', 'Plastic Chopping', 'Plastic Chopping', '2020-07-05 07:32:54', '2020-07-05 07:32:54'),
(414, 'Plastic Food cover', 37, 'Plastic-Food-cover-UkogO', 'Plastic Food cover', 'Plastic Food cover', '2020-07-05 07:33:15', '2020-07-05 07:33:15'),
(415, 'Plastic Jug', 37, 'Plastic-Jug-ktbJD', 'Plastic Jug', 'Plastic Jug', '2020-07-05 07:33:41', '2020-07-05 07:33:41'),
(416, 'Plastic Laundry Clip & Basket', 37, 'Plastic-Laundry-Clip--Basket-JlyR3', 'Plastic Laundry Clip & Basket', 'Plastic Laundry Clip & Basket', '2020-07-05 07:34:12', '2020-07-05 07:34:12'),
(417, 'Plastic Water bottle', 37, 'Plastic-Water-bottle-rJBQl', 'Plastic Water bottle', 'Plastic Water bottle', '2020-07-05 07:34:47', '2020-07-05 07:34:47'),
(418, 'Plastic Mug', 37, 'Plastic-Mug-BSCm3', 'Plastic Mug', 'Plastic Mug', '2020-07-05 07:35:07', '2020-07-05 07:35:07'),
(419, 'Plastic Spice Jar', 37, 'Plastic-Spice-Jar-47r8i', 'Plastic Spice Jar', 'Plastic Spice Jar', '2020-07-05 07:35:30', '2020-07-05 07:35:30'),
(420, 'Plastic Storage Container', 37, 'Plastic-Storage-Container-yP4gQ', 'Plastic Storage Container', 'Plastic Storage Container', '2020-07-05 07:35:56', '2020-07-05 07:35:56'),
(421, 'Plastic Strainer Net', 37, 'Plastic-Strainer-Net-YWNGC', 'Plastic Strainer Net', 'Plastic Strainer Net', '2020-07-05 07:36:25', '2020-07-05 07:36:25'),
(422, 'Plastic Table', 37, 'Plastic-Table-d1ZTP', 'Plastic Table', 'Plastic Table', '2020-07-05 07:36:58', '2020-07-05 07:36:58'),
(423, 'Plastic Tiffin Box', 37, 'Plastic-Tiffin-Box-Flcl4', 'Plastic Tiffin Box', 'Plastic Tiffin Box', '2020-07-05 07:37:32', '2020-07-05 07:37:32'),
(424, 'Plastic waste Bin', 37, 'Plastic-waste-Bin-D7iJy', 'Plastic waste Bin', 'Plastic waste Bin', '2020-07-05 07:37:59', '2020-07-05 07:37:59'),
(425, 'Plastic Dust Pan', 37, 'Plastic-Dust-Pan-7LhlR', 'Plastic Dust Pan', 'Plastic Dust Pan', '2020-07-05 07:38:23', '2020-07-05 07:38:23'),
(426, 'Apartment', 38, 'Apartment-1MrvR', 'Apartment', 'Apartment', '2020-07-05 07:38:58', '2020-07-05 07:38:58'),
(427, 'Building', 38, 'Building-bo8vQ', 'Building', 'Building', '2020-07-05 07:39:18', '2020-07-05 07:39:18'),
(428, 'Commercial Space', 38, 'Commercial-Space-AWOZb', 'Commercial Space', 'Commercial Space', '2020-07-05 07:39:41', '2020-07-05 07:39:41'),
(429, 'Duplex House', 38, 'Duplex-House-rShLc', 'Duplex House', 'Duplex House', '2020-07-05 07:40:11', '2020-07-05 07:40:11'),
(430, 'Land', 38, 'Land-GDxjr', 'Land', 'Land', '2020-07-05 07:40:34', '2020-07-05 07:40:34'),
(431, 'Penthouse', 38, 'Penthouse-ESUOX', 'Penthouse', 'Penthouse', '2020-07-05 07:41:03', '2020-07-05 07:41:03'),
(432, 'Security System Set up', 39, 'Security-System-Set-up-0EDlr', 'Security System Set up', 'Security System Set up', '2020-07-05 07:44:12', '2020-07-05 07:44:12'),
(433, 'Banking & Finance Service', 39, 'Banking--Finance-Service-3OoPi', 'Banking & Finance Service', 'Banking & Finance Service', '2020-07-05 07:44:48', '2020-07-05 07:44:48'),
(434, 'Beauty Care Service', 39, 'Beauty-Care-Service-DTy7D', 'Beauty Care Service', 'Beauty Care Service', '2020-07-05 07:45:11', '2020-07-05 07:45:11'),
(435, 'Cash Card', 39, 'Cash-Card-rybWy', 'Cash Card', 'Cash Card', '2020-07-05 07:45:37', '2020-07-05 07:45:37'),
(436, 'Catering Service', 39, 'Catering-Service-tlai5', 'Catering Service', 'Catering Service', '2020-07-05 07:46:00', '2020-07-05 07:46:00'),
(437, 'Customized Blades', 9, 'Customized-Blades-CBP4m', 'Customized Blades', 'Customized Blades', '2020-07-05 07:47:00', '2020-07-05 07:47:00'),
(438, 'Day Care Centre', 39, 'Day-Care-Centre-FBUBg', 'Day Care Centre', 'Day Care Centre', '2020-07-05 07:47:25', '2020-07-05 07:47:25'),
(439, 'Domain & Hosting Service', 39, 'Domain--Hosting-Service-eq0xm', 'Domain & Hosting Service', 'Domain & Hosting Service', '2020-07-05 07:47:56', '2020-07-05 07:47:56'),
(440, 'Engineering Service', 39, 'Engineering-Service-LhSES', 'Engineering Service', 'Engineering Service', '2020-07-05 07:48:32', '2020-07-05 07:48:32'),
(441, 'Entertainment Management', 39, 'Entertainment-Management-gcOrl', 'Entertainment Management', 'Entertainment Management', '2020-07-05 07:48:55', '2020-07-05 07:48:55'),
(442, 'Hospital Pricing', 39, 'Hospital-Pricing-LthzA', 'Hospital Pricing', 'Hospital Pricing', '2020-07-05 07:49:16', '2020-07-05 07:49:16'),
(443, 'Interior Decoration', 39, 'Interior-Decoration-sC9uJ', 'Interior Decoration', 'Interior Decoration', '2020-07-05 07:49:36', '2020-07-05 07:49:36'),
(444, 'Labour / Workers', 39, 'Labour--Workers-75aUa', 'Labour / Workers', 'Labour / Workers', '2020-07-05 07:50:20', '2020-07-05 07:50:20'),
(445, 'Laundry Service', 39, 'Laundry-Service-AYKfj', 'Laundry Service', 'Laundry Service', '2020-07-05 07:50:48', '2020-07-05 07:50:48'),
(446, 'Law Service', 39, 'Law-Service-on6SV', 'Law Service', 'Law Service', '2020-07-05 07:51:08', '2020-07-05 07:51:08'),
(447, 'Maintenance & Repairing', 39, 'Maintenance--Repairing-aa1Xi', 'Maintenance & Repairing', 'Maintenance & Repairing', '2020-07-05 07:51:38', '2020-07-05 07:51:38'),
(448, 'Match Making Service', 39, 'Match-Making-Service-XQuyT', 'Match Making Service', 'Match Making Service', '2020-07-05 07:53:04', '2020-07-05 07:53:04'),
(449, 'Medical Help', 39, 'Medical-Help-mXIop', 'Medical Help', 'Medical Help', '2020-07-05 07:53:27', '2020-07-05 07:53:27'),
(450, 'Mobile Service', 39, 'Mobile-Service-l9GbN', 'Mobile Service', 'Mobile Service', '2020-07-05 07:53:42', '2020-07-05 07:53:42'),
(451, 'Network Service', 39, 'Network-Service-DRfsz', 'Network Service', 'Network Service', '2020-07-05 07:54:01', '2020-07-05 07:54:01'),
(452, 'Photocopy & Printing Service', 39, 'Photocopy--Printing-Service-LrvSd', 'Photocopy & Printing Service', 'Photocopy & Printing Service', '2020-07-05 07:54:31', '2020-07-05 07:54:31'),
(453, 'Rent', 39, 'Rent-Ku4D1', 'Rent', 'Rent', '2020-07-05 07:54:52', '2020-07-05 07:54:52'),
(454, 'Solar Panel', 39, 'Solar-Panel-1TVq9', 'Solar Panel', 'Solar Panel', '2020-07-05 07:55:23', '2020-07-05 07:55:23'),
(455, 'Studio Service', 39, 'Studio-Service-9y6bQ', 'Studio Service', 'Studio Service', '2020-07-05 07:55:49', '2020-07-05 07:55:49'),
(456, 'Studio Service', 39, 'Studio-Service-WwSHp', 'Studio Service', 'Studio Service', '2020-07-05 07:56:01', '2020-07-05 07:56:01'),
(457, 'Tailor Service', 39, 'Tailor-Service-huqTo', 'Tailor Service', 'Tailor Service', '2020-07-05 07:56:20', '2020-07-05 07:56:20'),
(458, 'Ticket', 39, 'Ticket-OFm4b', 'Ticket', 'Ticket', '2020-07-05 07:56:37', '2020-07-05 07:56:37'),
(459, 'Travel Service', 39, 'Travel-Service-43ssI', 'Travel Service', 'Travel Service', '2020-07-05 07:56:56', '2020-07-05 07:56:56'),
(460, 'Visa Consultancy', 39, 'Visa-Consultancy-E7X3S', 'Visa Consultancy', 'Visa Consultancy', '2020-07-05 07:57:23', '2020-07-05 07:58:25'),
(461, 'Tuition', 39, 'Tuition-2Adyb', 'Tuition', 'Tuition', '2020-07-05 07:57:49', '2020-07-05 07:57:49'),
(462, 'Web Designing', 39, 'Web-Designing-wgeLT', 'Web Designing', 'Web Designing', '2020-07-05 07:58:46', '2020-07-05 07:58:46'),
(463, 'Badminton', 8, 'Badminton-5UZwr', 'Badminton', 'Badminton', '2020-07-05 08:31:16', '2020-07-05 08:31:16'),
(464, 'Bags', 8, 'Bags-IOCUB', 'Bags', 'Bags', '2020-07-05 08:31:40', '2020-07-05 08:31:40'),
(465, 'Baseball', 8, 'Baseball-Z1rKz', 'Baseball', 'Baseball', '2020-07-05 08:32:01', '2020-07-05 08:32:01'),
(466, 'Basketball', 8, 'Basketball-IAUom', 'Basketball', 'Basketball', '2020-07-05 08:32:27', '2020-07-05 08:32:27'),
(467, 'Cricket', 8, 'Cricket-jqk5q', 'Cricket', 'Cricket', '2020-07-05 08:32:50', '2020-07-05 08:32:50'),
(468, 'Cycling', 8, 'Cycling-ntWHI', 'Cycling', 'Cycling', '2020-07-05 08:33:08', '2020-07-05 08:33:08'),
(469, 'Female', 8, 'Female-hfU25', 'Female', 'Female', '2020-07-05 08:33:43', '2020-07-05 08:36:13'),
(470, 'Fishing', 8, 'Fishing-8HSi3', 'Fishing', 'Fishing', '2020-07-05 08:34:25', '2020-07-05 08:34:25'),
(471, 'Fitness & Exercise', 8, 'Fitness--Exercise-v5joc', 'Fitness & Exercise', 'Fitness & Exercise', '2020-07-05 08:35:52', '2020-07-05 08:35:52'),
(472, 'Football', 8, 'Football-Nq5ac', 'Football', 'Football', '2020-07-05 08:36:47', '2020-07-05 08:36:47'),
(473, 'Golf', 8, 'Golf-bvKIL', 'Golf', 'Golf', '2020-07-05 08:37:08', '2020-07-05 08:37:08'),
(474, 'Hockey', 8, 'Hockey-WVQmK', 'Hockey', 'Hockey', '2020-07-05 08:37:27', '2020-07-05 08:37:27'),
(475, 'Indoor Games', 8, 'Indoor-Games-vxvxt', 'Indoor Games', 'Indoor Games', '2020-07-05 08:37:53', '2020-07-05 08:37:53'),
(476, 'Kids Sports Products', 8, 'Kids-Sports-Products-mg6bB', 'Kids Sports Products', 'Kids Sports Products', '2020-07-05 08:38:18', '2020-07-05 08:38:18'),
(477, 'Men\'s Sports Products', 8, 'Mens-Sports-Products-CR21v', 'Men\'s Sports Products', 'Men\'s Sports Products', '2020-07-05 08:39:07', '2020-07-05 08:39:07'),
(478, 'Running', 8, 'Running-p1OLC', 'Running', 'Running', '2020-07-05 08:39:25', '2020-07-05 08:39:25'),
(479, 'Sport Accessories', 8, 'Sport-Accessories-oKmsv', 'Sport Accessories', 'Sport Accessories', '2020-07-05 08:39:49', '2020-07-05 08:39:49'),
(480, 'Sports Nutrition', 8, 'Sports-Nutrition-4GNF5', 'Sports Nutrition', 'Sports Nutrition', '2020-07-05 08:40:21', '2020-07-05 08:40:21'),
(481, 'Swimming', 8, 'Swimming-fTikx', 'Swimming', 'Swimming', '2020-07-05 08:40:41', '2020-07-05 08:40:41'),
(482, 'Tennis', 8, 'Tennis-oCnXv', 'Tennis', 'Tennis', '2020-07-05 08:41:10', '2020-07-05 08:41:10'),
(483, 'Trampolines', 8, 'Trampolines-d7p82', 'Trampolines', 'Trampolines', '2020-07-05 08:41:29', '2020-07-05 08:41:29'),
(484, '3 Wheeler CNG', 7, '3-Wheeler-CNG-ktjOZ', '3 Wheeler CNG', '3 Wheeler CNG', '2020-07-05 15:05:52', '2020-07-05 15:05:52'),
(485, 'Automobiles Accessories', 8, 'Automobiles-Accessories-H30gt', 'Automobiles Accessories', 'Automobiles Accessories', '2020-07-05 15:06:30', '2020-07-05 15:06:30'),
(486, 'Battery', 7, 'Battery-NuMmY', 'Battery', 'Battery', '2020-07-05 15:06:50', '2020-07-05 15:06:50'),
(487, 'Bicycle Accessories', 7, 'Bicycle-Accessories-T8pxy', 'Bicycle Accessories', 'Bicycle Accessories', '2020-07-05 15:07:17', '2020-07-05 15:07:17'),
(488, 'Bus', 7, 'Bus-7cIoQ', 'Bus', 'Bus', '2020-07-05 15:07:41', '2020-07-05 15:07:41'),
(489, 'Car', 7, 'Car-hNFsU', 'Car', 'Car', '2020-07-05 15:08:08', '2020-07-05 15:08:08'),
(490, 'Covered Van', 7, 'Covered-Van-p32tP', 'Covered Van', 'Covered Van', '2020-07-05 15:08:36', '2020-07-05 15:08:36'),
(491, 'Cycle', 7, 'Cycle-UE6LM', 'Cycle', 'Cycle', '2020-07-05 15:08:54', '2020-07-05 15:08:54'),
(492, 'Heavy Vehicles', 7, 'Heavy-Vehicles-hzpMT', 'Heavy Vehicles', 'Heavy Vehicles', '2020-07-05 15:09:16', '2020-07-05 15:09:16'),
(493, 'Launch', 7, 'Launch-x9qdT', 'Launch', 'Launch', '2020-07-05 15:09:50', '2020-07-05 15:09:50'),
(494, 'Lubricants', 7, 'Lubricants-c9uxW', 'Lubricants', 'Lubricants', '2020-07-05 15:10:06', '2020-07-05 15:10:06'),
(495, 'Motor Bike & Scooter', 7, 'Motor-Bike--Scooter-08V7b', 'Motor Bike & Scooter', 'Motor Bike & Scooter', '2020-07-05 15:10:40', '2020-07-05 15:10:40'),
(496, 'Spare Parts', 7, 'Spare-Parts-7zzgG', 'Spare Parts', 'Spare Parts', '2020-07-05 15:11:02', '2020-07-05 15:11:02'),
(497, 'Truck', 7, 'Truck-jQQxa', 'Truck', 'Truck', '2020-07-05 15:11:24', '2020-07-05 15:11:24'),
(498, 'Tyre', 7, 'Tyre-npB2f', 'Tyre', 'Tyre', '2020-07-05 15:11:46', '2020-07-05 15:11:46'),
(499, 'Van', 7, 'Van-Esfxt', 'Van', 'Van', '2020-07-05 15:12:06', '2020-07-05 15:12:06'),
(500, 'Airplane & Parts', 7, 'Airplane--Parts-THEv8', 'Airplane & Parts', 'Airplane & Parts', '2020-07-05 15:13:10', '2020-07-05 15:13:10'),
(501, 'Helicopter & Parts', 7, 'Helicopter--Parts-YGxCT', 'Helicopter & Parts', 'Helicopter & Parts', '2020-07-05 15:13:38', '2020-07-05 15:13:38'),
(502, 'Alarm Clock', 41, 'Alarm-Clock-iqpqx', 'Alarm Clock', 'Alarm Clock', '2020-07-05 15:35:37', '2020-07-05 15:35:37'),
(503, 'Kids Watches', 41, 'Kids-Watches-CflKa', 'Kids Watches', 'Kids Watches', '2020-07-05 15:36:02', '2020-07-05 15:36:02'),
(504, 'Men\'S Watches', 41, 'MenS-Watches-OS2uz', 'Men\'S Watches', 'Men\'S Watches', '2020-07-05 15:36:30', '2020-07-05 15:36:30'),
(505, 'Smart watches', 41, 'Smart-watches-ry3CZ', 'Smart watches', 'Smart watches', '2020-07-05 15:37:20', '2020-07-05 15:37:20'),
(506, 'Smart Watches', 41, 'Smart-Watches-ieY8m', 'Smart Watches', 'Smart Watches', '2020-07-05 15:37:46', '2020-07-05 15:37:46'),
(507, 'Table Clock', 41, 'Table-Clock-buRJq', 'Table Clock', 'Table Clock', '2020-07-05 15:38:11', '2020-07-05 15:38:11'),
(508, 'Unisex Watches', 41, 'Unisex-Watches-hAe8z', 'Unisex Watches', 'Unisex Watches', '2020-07-05 15:38:31', '2020-07-05 15:38:31'),
(509, 'Wall Clock', 41, 'Wall-Clock-kRjCG', 'Wall Clock', 'Wall Clock', '2020-07-05 15:38:57', '2020-07-05 15:38:57'),
(510, 'Women\'s Watches', 41, 'Womens-Watches-YVJlO', 'Women\'s Watches', 'Women\'s Watches', '2020-07-05 15:39:23', '2020-07-05 15:39:23');

-- --------------------------------------------------------

--
-- Table structure for table `sub_sub_categories`
--

CREATE TABLE `sub_sub_categories` (
  `id` int(11) NOT NULL,
  `sub_category_id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sub_sub_categories`
--

INSERT INTO `sub_sub_categories` (`id`, `sub_category_id`, `name`, `slug`, `meta_title`, `meta_description`, `created_at`, `updated_at`) VALUES
(20, 13, 'Leather bags', 'Leather-bags-fmn3J', 'Leather bags', 'Leather bags', '2020-06-08 17:04:43', '2020-06-08 17:04:43'),
(21, 14, 'Wallets', 'Wallets-xiXvG', NULL, 'Wallets', '2020-06-09 10:33:17', '2020-06-09 10:33:17'),
(22, 13, 'Regular Backpack', 'Regular-Backpack-PFkiT', NULL, 'Regular Backpack', '2020-06-09 10:57:47', '2020-06-09 10:57:47'),
(23, 19, 'Leather Card holder', 'Leather-Card-holder-tzBJY', NULL, 'Leather Card holder', '2020-06-09 10:58:44', '2020-06-09 10:58:44'),
(24, 19, 'Regular Card Holder', 'Regular-Card-Holder-HgxWT', NULL, 'Regular Card Holder', '2020-06-09 10:59:33', '2020-06-09 10:59:33'),
(25, 21, 'Leather Cross body bags', 'Leather-Cross-body-bags-0CQi8', NULL, 'Leather Cross body bags', '2020-06-09 11:00:32', '2020-06-09 11:00:32'),
(26, 21, 'Regular Cross body bag', 'Regular-Cross-body-bag-DFiks', NULL, 'Regular Cross body bag', '2020-06-09 11:01:08', '2020-06-09 11:01:08'),
(27, 23, 'Leather Hand bags', 'Leather-Hand-bags-KVGYQ', NULL, 'Leather Hand bags', '2020-06-09 11:01:50', '2020-06-09 11:01:50'),
(28, 23, 'Regular Hand bags', 'Regular-Hand-bags-ZPJ0l', NULL, 'Regular Hand bags', '2020-06-09 11:02:18', '2020-06-09 11:02:18'),
(29, 27, 'Leather  Office Bag', 'Leather--Office-Bag-B9gq0', NULL, 'Leather  Office Bag', '2020-06-09 11:03:53', '2020-06-09 11:03:53'),
(30, 27, 'Regular Office Bag', 'Regular-Office-Bag-vIns5', NULL, 'Regular Office Bag', '2020-06-09 11:04:17', '2020-06-09 11:04:17'),
(31, 29, 'Leather Purses', 'Leather-Purses-IpEwx', NULL, 'Leather Purses', '2020-06-09 11:05:49', '2020-06-09 11:05:49'),
(32, 29, 'Regular Purses', 'Regular-Purses-hOzoc', NULL, 'Regular Purses', '2020-06-09 11:06:17', '2020-06-09 11:06:17'),
(33, 31, 'Leather Shoulder bags', 'Leather-Shoulder-bags-taKqt', NULL, 'Leather Shoulder bags', '2020-06-09 11:07:22', '2020-06-09 11:07:22'),
(34, 31, 'Regular Shoulder bags', 'Regular-Shoulder-bags-DW8XY', NULL, 'Regular Shoulder bags', '2020-06-09 11:07:50', '2020-06-09 11:07:50'),
(35, 14, 'Leather wallets', 'Leather-wallets-1imG4', NULL, 'Leather wallets', '2020-06-09 11:30:19', '2020-06-09 11:30:19'),
(36, 14, 'Regular wallets', 'Regular-wallets-dhNhq', NULL, 'Regular wallets', '2020-06-09 11:30:43', '2020-06-09 11:30:43'),
(37, 48, 'Blood Glucose Monitor', 'Blood-Glucose-Monitor-gv8fl', NULL, 'Blood Glucose Monitor', '2020-06-09 12:25:33', '2020-06-09 12:25:33'),
(38, 48, 'Blood Pressure Monitors', 'Blood-Pressure-Monitors-o1kax', NULL, 'Blood Pressure Monitors', '2020-06-09 12:26:42', '2020-06-09 12:26:42'),
(39, 48, 'Cholesterol Monitors', 'Cholesterol-Monitors-4lyG8', NULL, 'Cholesterol Monitors', '2020-06-09 12:30:50', '2020-06-09 12:30:50'),
(40, 48, 'Pulse Oximeters', 'Pulse-Oximeters-HXNI8', NULL, 'Pulse Oximeters', '2020-06-09 12:31:31', '2020-06-09 12:31:31'),
(41, 48, 'Stress Monitors', 'Stress-Monitors-BuKVh', NULL, 'Stress Monitors', '2020-06-09 12:32:38', '2020-06-09 12:32:38'),
(42, 48, 'Thermometers', 'Thermometers-diuCY', NULL, 'Thermometers', '2020-06-09 12:33:42', '2020-06-09 12:33:42'),
(43, 36, 'Acne Treatment', 'Acne-Treatment-xZn9t', NULL, 'Acne Treatment', '2020-06-09 12:40:30', '2020-06-09 12:40:30'),
(44, 36, 'Bath & Body Accessories', 'Bath--Body-Accessories-Ez5rm', NULL, 'Bath & Body Accessories', '2020-06-09 12:40:52', '2020-06-09 12:40:52'),
(45, 36, 'Body Massage Oils', 'Body-Massage-Oils-Svjdd', NULL, 'Body Massage Oils', '2020-06-09 12:42:26', '2020-06-09 12:42:26'),
(46, 36, 'Body Moisturizers', 'Body-Moisturizers-rQ7bT', NULL, 'Body Moisturizers', '2020-06-09 12:43:12', '2020-06-09 12:43:12'),
(47, 36, 'Body Scrubs', 'Body-Scrubs-lZkQi', NULL, 'Body Moisturizers', '2020-06-09 12:43:30', '2020-06-09 12:43:30'),
(48, 36, 'Body Soap& Shower Gels', 'Body-Soap-Shower-Gels-pl6zn', NULL, 'Body Soap& Shower Gels', '2020-06-09 12:43:53', '2020-06-09 12:43:53'),
(49, 36, 'Breast care', 'Breast-care-ocuC2', NULL, 'Breast care', '2020-06-09 12:44:18', '2020-06-09 12:44:18'),
(50, 36, 'Cream', 'Cream-8gwnt', NULL, 'Cream', '2020-06-09 12:45:20', '2020-06-09 12:45:20'),
(51, 36, 'Face Mask & Pack', 'Face-Mask--Pack-MeTBO', NULL, 'Face Mask & Pack', '2020-06-09 12:45:50', '2020-06-09 12:45:50'),
(52, 36, 'Face Wash', 'Face-Wash-i9l67', NULL, 'Face Wash', '2020-06-09 12:46:08', '2020-06-09 12:46:08'),
(53, 36, 'Foot Care', 'Foot-Care-EVoUH', NULL, 'Foot Care', '2020-06-09 12:46:32', '2020-06-09 12:46:32'),
(54, 36, 'Hand Care', 'Hand-Care-7y8Gt', NULL, 'Hand Care', '2020-06-09 12:46:45', '2020-06-09 12:46:45'),
(55, 36, 'Sun care for body', 'Sun-care-for-body-ekDT6', NULL, 'Sun care for body', '2020-06-09 12:48:40', '2020-06-09 12:48:40'),
(56, 36, 'Talcum Powder', 'Talcum-Powder-hfIck', NULL, 'Talcum Powder', '2020-06-09 12:49:19', '2020-06-09 12:49:19'),
(57, 36, 'Towel', 'Towel-y0Gus', NULL, 'Towel', '2020-06-09 12:49:41', '2020-06-09 12:49:41'),
(58, 37, 'Body slimming instruments', 'Body-slimming-instruments-WCgr3', NULL, 'Body slimming instruments', '2020-06-09 12:51:32', '2020-06-09 12:51:32'),
(59, 37, 'Foot Relief & Accessories', 'Foot-Relief--Accessories-z6CJy', NULL, 'Foot Relief & Accessories', '2020-06-09 12:52:28', '2020-06-09 12:52:28'),
(60, 37, 'Skin Care', 'Skin-Care-Q5PYb', NULL, 'Skin Care', '2020-06-09 12:52:52', '2020-06-09 12:52:52'),
(61, 39, 'Men\'s Perfume', 'Mens-Perfume-l5Nj4', NULL, 'Men\'s Perfume', '2020-06-09 12:55:45', '2020-06-09 12:55:45'),
(62, 39, 'Unisex Perfumes', 'Unisex-Perfumes-dSnhB', NULL, 'Unisex Perfumes', '2020-06-09 13:03:47', '2020-06-09 13:03:47'),
(63, 39, 'Women Perfumes', 'Women-Perfumes-HJc9L', NULL, 'Women Perfumes', '2020-06-09 13:04:14', '2020-06-09 13:04:14'),
(64, 41, 'Hair care Accessories', 'Hair-care-Accessories-CGGIG', NULL, 'Hair care Accessories', '2020-06-09 13:05:24', '2020-06-09 13:05:24'),
(65, 36, 'Hair Color', 'Hair-Color-ax1pc', NULL, 'Hair Color', '2020-06-09 13:05:51', '2020-06-09 13:07:27'),
(66, 36, 'Hair Gel', 'Hair-Gel-nG24O', NULL, 'Hair Gel', '2020-06-09 13:06:28', '2020-06-09 13:07:20'),
(67, 36, 'Hair Mask', 'Hair-Mask-AzKnG', NULL, 'Hair Mask', '2020-06-09 13:06:53', '2020-06-09 13:07:08'),
(68, 41, 'Hair Oils', 'Hair-Oils-4TVlc', NULL, 'Hair Oils', '2020-06-09 13:07:48', '2020-06-09 13:07:48'),
(69, 41, 'Hair Spray', 'Hair-Spray-hvLsx', NULL, 'Hair Spray', '2020-06-09 13:08:19', '2020-06-09 13:08:19'),
(70, 36, 'Hair styling Appliance', 'Hair-styling-Appliance-qHXi1', NULL, 'Hair styling Appliance', '2020-06-09 13:08:52', '2020-06-09 13:09:06'),
(71, 41, 'Hair Treatments', 'Hair-Treatments-6pVaa', NULL, 'Hair Treatments', '2020-06-09 13:09:28', '2020-06-09 13:09:28'),
(72, 41, 'Shampoo & Conditioner', 'Shampoo--Conditioner-vuFN4', NULL, 'Shampoo & Conditioner', '2020-06-09 13:09:59', '2020-06-09 13:09:59'),
(73, 41, 'Hair embellishment products', 'Hair-embellishment-products-8RQb6', NULL, 'Hair embellishment products', '2020-06-09 13:12:44', '2020-06-09 13:12:44'),
(74, 41, 'Hair Brushes & Combs', 'Hair-Brushes--Combs-TtNgV', NULL, 'Hair Brushes & Combs', '2020-06-09 13:20:06', '2020-06-09 13:20:06'),
(75, 41, 'Hair Removal', 'Hair-Removal-CSnV5', NULL, 'Hair Removal', '2020-06-09 13:20:41', '2020-06-09 13:20:41'),
(76, 41, 'Head Band', 'Head-Band-ombNL', NULL, 'Head Band', '2020-06-09 13:21:08', '2020-06-09 13:21:08'),
(77, 41, 'Wig, Hair & Extension', 'Wig-Hair--Extension-sKCRk', NULL, 'Wig, Hair & Extension', '2020-06-09 13:21:38', '2020-06-09 13:21:38'),
(78, 41, 'Curling Irons & wands', 'Curling-Irons--wands-1qMJy', NULL, 'Curling Irons & wands', '2020-06-09 13:24:03', '2020-06-09 13:24:03'),
(79, 41, 'Flat Irons', 'Flat-Irons-6NYvI', NULL, 'Flat Irons', '2020-06-09 13:24:35', '2020-06-09 13:24:35'),
(80, 41, 'Hair Dryers', 'Hair-Dryers-4AqTC', NULL, 'Flat Irons', '2020-06-09 13:25:07', '2020-06-09 13:25:07'),
(81, 41, 'Hair Styling Sets', 'Hair-Styling-Sets-zHIOX', NULL, 'Hair Styling Sets', '2020-06-09 13:25:38', '2020-06-09 13:25:38'),
(82, 41, 'Hair Straightening & Combs', 'Hair-Straightening--Combs-w3DRa', NULL, 'Hair Straightening & Combs', '2020-06-09 13:26:29', '2020-06-09 13:26:29'),
(83, 63, 'Condom', 'Condom-KpSVw', NULL, 'Condom', '2020-06-09 13:28:13', '2020-06-09 13:28:13'),
(84, 62, 'Men\'s care Accessories', 'Mens-care-Accessories-eVQhq', NULL, 'Men\'s care Accessories', '2020-06-09 13:29:51', '2020-06-09 13:29:51'),
(85, 62, 'Shaving& grooming', 'Shaving-grooming-D1NxJ', NULL, 'Shaving& grooming', '2020-06-09 13:30:31', '2020-06-09 13:30:31'),
(86, 62, 'Men\'s Skin Care', 'Mens-Skin-Care-Jwiv8', NULL, 'Men\'s Skin Care', '2020-06-09 13:30:59', '2020-06-09 13:30:59'),
(87, 42, 'Body Makeup', 'Body-Makeup-8aERl', NULL, 'Body Makeup', '2020-06-10 03:03:27', '2020-06-10 03:03:27'),
(88, 42, 'Eye Roll on', 'Eye-Roll-on-9wNgg', NULL, 'Eye Roll on', '2020-06-10 03:03:55', '2020-06-10 03:03:55'),
(89, 42, 'Eye beauty products', 'Eye-beauty-products-YwBur', NULL, 'Eye beauty products', '2020-06-10 03:05:20', '2020-06-10 03:05:20'),
(90, 42, 'Face Makeup', 'Face-Makeup-BjjC0', NULL, 'Face Makeup', '2020-06-10 03:07:29', '2020-06-10 03:07:29'),
(91, 42, 'Lips beauty products', 'Lips-beauty-products-x3czQ', NULL, 'Lips beauty products', '2020-06-10 03:08:03', '2020-06-10 03:08:03'),
(92, 42, 'Makeup accessories', 'Makeup-accessories-yWHs7', NULL, 'Makeup accessories', '2020-06-10 03:08:31', '2020-06-10 03:08:31'),
(93, 42, 'Makeup sets', 'Makeup-sets-pW3gR', NULL, 'Makeup sets', '2020-06-10 03:09:08', '2020-06-10 03:09:08'),
(94, 42, 'Makeup Removers', 'Makeup-Removers-b9BQO', NULL, 'Makeup Removers', '2020-06-10 03:09:40', '2020-06-10 03:09:40'),
(95, 42, 'Nails beauty products', 'Nails-beauty-products-Tc5vI', NULL, 'Nails beauty products', '2020-06-10 03:10:43', '2020-06-10 03:10:43'),
(96, 64, 'Travel relevant', 'Travel-relevant-yJnNq', NULL, 'Travel relevant', '2020-06-10 03:19:39', '2020-06-10 03:19:39'),
(97, 64, 'Bengali Translated book', 'Bengali-Translated-book-PvETm', NULL, 'Bengali Translated book', '2020-06-10 03:22:01', '2020-06-10 03:22:01'),
(98, 64, 'Arabic Bangla', 'Arabic-Bangla-twrn9', NULL, 'Arabic Bangla', '2020-06-10 03:22:32', '2020-06-10 03:22:32'),
(99, 64, 'Law and Judgment', 'Law-and-Judgment-9rl04', NULL, 'Law and Judgment', '2020-06-10 03:23:02', '2020-06-10 03:23:02'),
(100, 64, 'Motivational books', 'Motivational-books-CnPgF', NULL, 'Motivational books', '2020-06-10 03:23:33', '2020-06-10 03:23:33'),
(101, 64, 'History & Tradition', 'History--Tradition-bGtwQ', NULL, 'History & Tradition', '2020-06-10 03:24:07', '2020-06-10 03:24:07'),
(102, 64, 'Comics', 'Comics-XBQPC', NULL, 'Comics', '2020-06-10 03:24:29', '2020-06-10 03:24:29'),
(103, 64, 'Agriculture & Farmer', 'Agriculture--Farmer-yTPig', NULL, 'Agriculture & Farmer', '2020-06-10 03:25:26', '2020-06-10 03:25:26'),
(104, 64, 'Sports books', 'Sports-books-htAof', NULL, 'Sports books', '2020-06-10 03:25:54', '2020-06-10 03:25:54'),
(105, 64, 'Media & Journalism', 'Media--Journalism-S6uvJ', NULL, 'Media & Journalism', '2020-06-10 03:26:41', '2020-06-10 03:26:41'),
(106, 64, 'Story', 'Story-ZTWnL', NULL, 'Story', '2020-06-10 03:27:01', '2020-06-10 03:27:01'),
(107, 64, 'Novel', 'Novel-enTG1', NULL, 'Novel', '2020-06-10 03:27:39', '2020-06-10 03:27:39'),
(108, 64, 'Rhymes & Poems', 'Rhymes--Poems-O9axF', NULL, 'Rhymes & Poems', '2020-06-10 03:30:41', '2020-06-10 03:30:41'),
(109, 64, 'Biography', 'Biography-wdmRQ', NULL, 'Biography', '2020-06-10 03:32:00', '2020-06-10 03:32:00'),
(110, 64, 'Philosophy', 'Philosophy-sUXmY', NULL, 'Philosophy', '2020-06-10 03:32:56', '2020-06-10 03:32:56'),
(111, 64, 'Religious Books', 'Religious-Books-3OF0x', NULL, 'Religious Books', '2020-06-10 03:33:25', '2020-06-10 03:33:25'),
(112, 64, 'Drama books', 'Drama-books-9RbuO', NULL, 'Drama books', '2020-06-10 03:34:01', '2020-06-10 03:34:01'),
(113, 64, 'Nature and Environment', 'Nature-and-Environment-ihv1X', NULL, 'Nature and Environment', '2020-06-10 03:34:33', '2020-06-10 03:34:33'),
(114, 64, 'Western cultural Books', 'Western-cultural-Books-JBVFZ', NULL, 'Western cultural Books', '2020-06-10 03:35:20', '2020-06-10 03:35:20'),
(115, 64, 'Professional & Journal', 'Professional--Journal-HHrzJ', NULL, 'Professional & Journal', '2020-06-10 03:36:07', '2020-06-10 03:36:07'),
(116, 64, 'Essays & Articles', 'Essays--Articles-xc5rW', NULL, 'Essays & Articles', '2020-06-10 03:38:22', '2020-06-10 03:38:22'),
(117, 64, 'Flora & Fauna', 'Flora--Fauna-fJpGK', NULL, 'Flora & Fauna', '2020-06-10 03:38:56', '2020-06-10 03:38:56'),
(118, 64, 'Fashion & Beauty', 'Fashion--Beauty-moad6', NULL, 'Fashion & Beauty', '2020-06-10 03:39:32', '2020-06-10 03:39:32'),
(119, 64, 'Family relevant', 'Family-relevant-1kJ8z', NULL, 'Family relevant', '2020-06-10 03:40:09', '2020-06-10 03:40:09'),
(120, 64, 'Bangladesh & its history', 'Bangladesh--its-history-BBlVd', NULL, 'Bangladesh & its history', '2020-06-10 03:41:53', '2020-06-10 03:41:53'),
(121, 64, 'Miscellaneous', 'Miscellaneous-fknUu', NULL, 'Miscellaneous', '2020-06-10 03:42:32', '2020-06-10 03:42:32'),
(122, 64, 'Funny & Jokes', 'Funny--Jokes-Z6Qj0', NULL, 'Funny & Jokes', '2020-06-10 03:43:22', '2020-06-10 03:43:22'),
(123, 64, 'Business, invest & Economy', 'Business-invest--Economy-mYrOU', NULL, 'Business, invest & Economy', '2020-06-10 03:44:24', '2020-06-10 03:44:24'),
(124, 64, 'Liberation War', 'Liberation-War-JFHx3', NULL, 'Liberation War', '2020-06-10 03:44:55', '2020-06-10 03:44:55'),
(125, 64, 'Magazine', 'Magazine-qY9Ue', NULL, 'Magazine', '2020-06-10 03:45:19', '2020-06-10 03:45:19'),
(126, 64, 'Mystery, Ghostly & Thrillers', 'Mystery-Ghostly--Thrillers-g1AvF', NULL, 'Mystery, Ghostly & Thrillers', '2020-06-10 03:47:40', '2020-06-10 03:47:40'),
(127, 64, 'Politics', 'Politics-dBNip', NULL, 'Politics', '2020-06-10 03:48:26', '2020-06-10 03:48:26'),
(128, 64, 'Cooking, food & Nutrients', 'Cooking-food--Nutrients-yByLd', NULL, 'Cooking, food & Nutrients', '2020-06-10 03:49:49', '2020-06-10 03:49:49'),
(129, 64, 'Songs, Movie & Entertainments', 'Songs-Movie--Entertainments-vw4a2', NULL, 'Songs, Movie & Entertainments', '2020-06-10 03:50:41', '2020-06-10 03:50:41'),
(130, 64, 'Software & Multimedia', 'Software--Multimedia-6fHJ7', NULL, 'Software & Multimedia', '2020-06-10 03:51:15', '2020-06-10 03:51:15'),
(131, 64, 'Society, culture & civilization', 'Society-culture--civilization-kRmQo', NULL, 'Society, culture & civilization', '2020-06-10 03:52:09', '2020-06-10 03:52:09'),
(132, 64, 'Science Fiction', 'Science-Fiction-3wWbi', NULL, 'Science Fiction', '2020-06-10 03:52:44', '2020-06-10 03:52:44'),
(133, 64, 'Health, care & Diseases', 'Health-care--Diseases-fUy0B', NULL, 'Health, care & Diseases', '2020-06-10 03:53:38', '2020-06-10 03:54:40'),
(134, 65, 'Alphabet Set', 'Alphabet-Set-FCXzI', NULL, 'Alphabet Set', '2020-06-10 03:54:23', '2020-06-10 03:54:23'),
(135, 65, 'Learning & Education', 'Learning--Education-6sZ6f', NULL, 'Learning & Education', '2020-06-10 03:55:24', '2020-06-10 03:55:34'),
(136, 66, 'Fiction', 'Fiction-ZmjBp', NULL, 'Fiction', '2020-06-10 03:57:51', '2020-06-10 03:57:51'),
(137, 66, 'Non-Fiction', 'Non-Fiction-dFOqN', NULL, 'Non-Fiction', '2020-06-10 03:58:15', '2020-06-10 03:58:15'),
(138, 68, 'Art, craft & Paint', 'Art-craft--Paint-atAYG', NULL, 'Art, craft & Paint', '2020-06-10 03:59:20', '2020-06-10 03:59:20'),
(139, 68, 'Calculator', 'Calculator-wN35F', NULL, 'Calculator', '2020-06-10 03:59:41', '2020-06-10 03:59:41'),
(140, 68, 'Color Marker', 'Color-Marker-YB87L', NULL, 'Color Marker', '2020-06-10 04:00:00', '2020-06-10 04:07:51'),
(141, 68, 'Color Pencil', 'Color-Pencil-SGRvb', NULL, 'Color Pencil', '2020-06-10 04:00:21', '2020-06-10 04:00:21'),
(142, 68, 'Correction Fluid', 'Correction-Fluid-afBBN', NULL, 'Correction Fluid', '2020-06-10 04:01:00', '2020-06-10 04:01:00'),
(143, 68, 'Diary& Notepad', 'Diary-Notepad-NDCjS', NULL, 'Diary& Notepad', '2020-06-10 04:01:53', '2020-06-10 04:01:53'),
(144, 68, 'Envelope', 'Envelope-tuFH5', NULL, 'Envelope', '2020-06-10 04:02:41', '2020-06-10 04:02:41'),
(145, 68, 'Eraser', 'Eraser-aE8Ob', NULL, 'Eraser', '2020-06-10 04:03:03', '2020-06-10 04:03:03'),
(146, 68, 'Files & Folders', 'Files--Folders-kW6KY', NULL, 'Files & Folders', '2020-06-10 04:03:47', '2020-06-10 04:03:47'),
(147, 68, 'Geometry Box', 'Geometry-Box-ksJyH', NULL, 'Geometry Box', '2020-06-10 04:04:26', '2020-06-10 04:07:34'),
(148, 68, 'Glue& Tape', 'Glue-Tape-4tJUI', NULL, 'Glue& Tape', '2020-06-10 04:04:59', '2020-06-10 04:04:59'),
(149, 68, 'Magnifying Glass', 'Magnifying-Glass-dcK7U', NULL, 'Magnifying Glass', '2020-06-10 04:05:25', '2020-06-10 04:05:25'),
(150, 68, 'Card,pen & Paper Holder', 'Card--Paper-Holder-tPcsR', NULL, 'Card & Paper Holder', '2020-06-10 04:06:18', '2020-06-10 04:09:26'),
(151, 68, 'Paper', 'Paper-cWRYo', NULL, 'Paper', '2020-06-10 04:06:43', '2020-06-10 04:06:43'),
(152, 68, 'Pen', 'Pen-7P7Op', NULL, 'Pen', '2020-06-10 04:07:06', '2020-06-10 04:07:06'),
(153, 68, 'Pencil & Pencil Box', 'Pencil-tQAnh', NULL, 'Pencil & Pencil Box', '2020-06-10 04:08:44', '2020-06-10 04:10:32'),
(154, 68, 'Pin Remover', 'Pin-Remover-PCEs3', NULL, 'Pin Remover', '2020-06-10 04:10:04', '2020-06-10 04:10:04'),
(155, 68, 'Price Labeller', 'Price-Labeller-04snG', NULL, 'Price Labeller', '2020-06-10 04:11:22', '2020-06-10 04:11:22'),
(156, 68, 'Punch Machine', 'Punch-Machine-BL7EM', NULL, 'Punch Machine', '2020-06-10 04:12:18', '2020-06-10 04:12:18'),
(157, 68, 'Push Pin/Clip', 'Push-PinClip-BXG5u', NULL, 'Push Pin/Clip', '2020-06-10 04:12:42', '2020-06-10 04:15:33'),
(158, 68, 'Rular', 'Rular-5TOOo', NULL, 'Rular', '2020-06-10 04:13:20', '2020-06-10 04:13:20'),
(159, 68, 'Scientific & Medical Tools', 'Scientific--Medical-Tools-HcWSl', NULL, 'Scientific & Medical Tools', '2020-06-10 04:14:09', '2020-06-10 04:14:09'),
(160, 68, 'Sharpener', 'Sharpener-HAqCV', NULL, 'Sharpener', '2020-06-10 04:14:46', '2020-06-10 04:14:46'),
(161, 68, 'Stapler', 'Stapler-kVbS4', NULL, 'Stapler', '2020-06-10 04:15:12', '2020-06-10 04:15:24'),
(162, 68, 'Stationary Accessories', 'Stationary-Accessories-v12zI', NULL, 'Stationary Accessories', '2020-06-10 04:16:06', '2020-06-10 04:16:06'),
(163, 68, 'Toner Cartidge', 'Toner-Cartidge-xEqS9', NULL, 'Toner Cartidge', '2020-06-10 04:16:57', '2020-06-10 04:16:57'),
(164, 69, 'Bangla Medium Board books', 'Bangla-Medium-Boad-book-uas5a', NULL, 'Bangla Medium Board books', '2020-06-10 04:17:55', '2020-06-10 04:18:23'),
(165, 69, 'Bangla Medium College Books', 'Bangla-Medium-College-Books-57P5q', NULL, 'Bangla Medium College Books', '2020-06-10 04:19:17', '2020-06-10 04:19:28'),
(166, 69, 'Bangla Medium School books', 'Bangla-Medium-School-books-V5Ryx', NULL, 'Bangla Medium School books', '2020-06-10 04:19:55', '2020-06-10 04:20:37'),
(167, 69, 'BCS Books', 'BCS-Books-2tcN1', NULL, 'BCS Books', '2020-06-10 04:20:26', '2020-06-10 04:20:26'),
(168, 69, 'English Medium Books', 'English-Medium-Books-hoq25', NULL, 'English Medium Books', '2020-06-10 04:21:06', '2020-06-10 04:21:06'),
(169, 69, 'English Version Board Books', 'English-Version-Board-Books-0admb', NULL, 'English Version Board Books', '2020-06-10 04:22:34', '2020-06-10 04:22:45'),
(170, 69, 'Medical College books', 'Medical-College-books-hhQKQ', NULL, 'Medical College books', '2020-06-10 04:23:26', '2020-06-10 04:23:26'),
(171, 69, 'TOEFL, IELTS, GRE, GMAT', 'TOEFL-IELTS-GRE-GMAT-ddJwr', NULL, 'TOEFL, IELTS, GRE, GMAT', '2020-06-10 04:24:15', '2020-06-10 04:24:15'),
(172, 69, 'University Books', 'University-Books-nssvZ', NULL, 'University Books', '2020-06-10 04:25:20', '2020-06-10 04:25:20'),
(173, 69, 'Vocational Books', 'Vocational-Books-gQSA9', NULL, 'Vocational Books', '2020-06-10 04:25:56', '2020-06-10 04:25:56'),
(174, 67, 'Dictionary', 'Dictionary-hlg2l', NULL, 'Dictionary', '2020-06-10 04:27:43', '2020-06-10 04:27:43'),
(175, 70, 'Cement', 'Cement-0tUBZ', NULL, 'Cement', '2020-06-11 07:18:18', '2020-06-11 07:18:18'),
(176, 70, 'Concrete', 'Concrete-RPO1i', NULL, 'Concrete', '2020-06-11 07:18:38', '2020-06-11 07:18:38'),
(177, 70, 'Lime', 'Lime-8WfmY', NULL, 'Lime', '2020-06-11 07:18:52', '2020-06-11 07:18:52'),
(178, 70, 'Sanitary', 'Sanitary-xzLDG', NULL, 'Sanitary', '2020-06-11 07:19:13', '2020-06-11 07:19:13'),
(179, 70, 'Sealant/ Caulking', 'Sealant-Caulking-s3QDW', NULL, 'Sealant/ Caulking', '2020-06-11 07:19:56', '2020-06-11 07:19:56'),
(180, 70, 'Steel & Rod', 'Steel--Rod-vHq4v', NULL, 'Steel & Rod', '2020-06-11 07:20:25', '2020-06-11 07:20:25'),
(181, 70, 'Stucco', 'Stucco-pBHNf', NULL, 'Stucco', '2020-06-11 07:20:46', '2020-06-11 07:20:46'),
(182, 70, 'Tar', 'Tar-kRq9b', NULL, 'Tar', '2020-06-11 07:21:07', '2020-06-11 07:21:07'),
(183, 70, 'Tiles', 'Tiles-wAJL9', NULL, 'Tiles', '2020-06-11 07:21:26', '2020-06-11 07:21:26'),
(184, 71, 'Air Purifiers', 'Air-Purifiers-jltWu', NULL, 'Air Purifiers', '2020-06-11 07:22:06', '2020-06-11 07:22:06'),
(185, 71, 'Electrical  accessories', 'Electrical--accessories-iwf8j', NULL, 'Electrical  accessories', '2020-06-11 07:22:50', '2020-06-11 07:22:50'),
(186, 71, 'Fan', 'Fan-TLgI6', NULL, 'Fan', '2020-06-11 07:23:13', '2020-06-11 07:23:13'),
(187, 71, 'Geysers', 'Geysers-GpOEL', NULL, 'Geysers', '2020-06-11 07:23:37', '2020-06-11 07:23:37'),
(188, 71, 'Home Automation', 'Home-Automation-Ppi78', NULL, 'Home Automation', '2020-06-11 07:24:07', '2020-06-11 07:24:07'),
(189, 71, 'Light bulbs', 'Light-bulbs-AfoGS', NULL, 'Light bulbs', '2020-06-11 07:24:30', '2020-06-11 07:24:30'),
(190, 71, 'Light Bulb', 'Light-Bulb-sR3br', NULL, 'Light Bulb', '2020-06-11 07:24:55', '2020-06-11 07:24:55'),
(191, 71, 'Power Storage', 'Power-Storage-WqNTf', NULL, 'Power Storage', '2020-06-11 07:25:19', '2020-06-11 07:25:19'),
(192, 71, 'Room Heater', 'Room-Heater-2qmJG', NULL, 'Room Heater', '2020-06-11 07:25:37', '2020-06-11 07:25:37'),
(193, 72, 'Bath Fixtures', 'Bath-Fixtures-GRhR4', NULL, 'Bath Fixtures', '2020-06-11 07:29:03', '2020-06-11 07:29:03'),
(194, 72, 'Bath Storage', 'Bath-Storage-PiUJn', NULL, 'Bath Storage', '2020-06-11 07:42:11', '2020-06-11 07:42:11'),
(195, 72, 'Bathroom Accessories', 'Bathroom-Accessories-PgOw1', NULL, 'Bathroom Accessories', '2020-06-11 07:42:38', '2020-06-11 07:42:38'),
(196, 72, 'Bathroom Mirrors', 'Bathroom-Mirrors-MAYl7', NULL, 'Bathroom Mirrors', '2020-06-11 07:43:14', '2020-06-11 07:43:14'),
(197, 72, 'Door Hardware', 'Door-Hardware-0vCNs', NULL, 'Door Hardware', '2020-06-11 07:43:50', '2020-06-11 07:43:50'),
(198, 72, 'Tiles', 'Tiles-StJuJ', NULL, 'Tiles', '2020-06-11 07:44:42', '2020-06-11 07:44:42'),
(199, 70, 'Home Safety', 'Home-Safety-QmSs1', NULL, 'Home Safety', '2020-06-11 07:45:09', '2020-06-11 07:45:09'),
(200, 72, 'Kitchen Sinks', 'Kitchen-Sinks-AiZ7H', NULL, 'Kitchen Sinks', '2020-06-11 07:45:34', '2020-06-11 07:45:34'),
(201, 72, 'Sanitary Ware', 'Sanitary-Ware-ByLgs', NULL, 'Sanitary Ware', '2020-06-11 07:46:02', '2020-06-11 07:46:02'),
(202, 72, 'Showers', 'Showers-ZwucO', NULL, 'Showers', '2020-06-11 07:46:37', '2020-06-11 07:46:37'),
(203, 72, 'Step Ladders & Stools', 'Step-Ladders--Stools-Nc07m', NULL, 'Step Ladders & Stools', '2020-06-11 07:47:23', '2020-06-11 07:47:23'),
(204, 72, 'Tape & Faucets', 'Tape--Faucets-y33hx', NULL, 'Tape & Faucets', '2020-06-11 07:47:48', '2020-06-11 07:47:48'),
(205, 72, 'Other Tools & Equipment', 'Other-Tools--Equipment-5SuTc', NULL, 'Other Tools & Equipment', '2020-06-11 07:48:38', '2020-06-11 07:48:38'),
(206, 116, 'Batteries', 'Danish-ZxzJy', NULL, 'Batteries', '2020-06-11 08:20:08', '2020-06-11 11:43:28'),
(207, 116, 'Cables', 'Cabels-LGr0l', NULL, 'Cables', '2020-06-11 11:43:49', '2020-06-11 11:44:03'),
(208, 116, 'Charger', 'Charger-DhqWl', NULL, 'Charger', '2020-06-11 11:44:20', '2020-06-11 11:44:20'),
(209, 116, 'Digital Video Recorder', 'Digital-Video-Recorder-nQDVY', NULL, 'Digital Video Recorder', '2020-06-11 11:45:00', '2020-06-11 11:45:00'),
(210, 116, 'Headphones', 'Headphones-HHvAn', NULL, 'Headphones', '2020-06-11 11:46:10', '2020-06-11 11:46:10'),
(211, 116, 'Home Theater', 'Home-Theater-b0KDK', NULL, 'Home Theater', '2020-06-11 11:46:39', '2020-06-11 11:46:39'),
(212, 116, 'Mobile Phone', 'Mobile-Phone-NlyVA', NULL, 'Mobile Phone', '2020-06-11 11:47:08', '2020-06-11 11:47:08'),
(213, 116, 'MP3 Player', 'MP3-Player-w0LIc', NULL, 'MP3 Player', '2020-06-11 11:47:29', '2020-06-11 11:47:29'),
(214, 116, 'Projector', 'Projector-qcFFa', NULL, 'Projector', '2020-06-11 11:47:54', '2020-06-11 11:47:54'),
(215, 116, 'Memory card & Flash Drives', 'Memory-card--Flash-Drives-TqM4H', NULL, 'Memory card & Flash Drives', '2020-06-11 11:48:28', '2020-06-11 11:48:28'),
(216, 116, 'Power Bank', 'Power-Bank-PBV2E', NULL, 'Power Bank', '2020-06-11 11:49:31', '2020-06-11 11:49:31'),
(217, 116, 'Other Accessories', 'Other-Accessories-msMK5', NULL, 'Other Accessories', '2020-06-11 11:49:53', '2020-06-11 11:49:53'),
(218, 117, 'Audio System', 'Audio-System-0WNJm', NULL, 'Audio System', '2020-06-11 11:50:30', '2020-06-11 11:50:30'),
(219, 117, 'CD', 'CD-8crSV', NULL, 'CD', '2020-06-11 11:50:55', '2020-06-11 11:50:55'),
(220, 117, 'Headphones', 'Headphones-wSa4g', NULL, 'Headphones', '2020-06-11 11:52:10', '2020-06-11 11:52:10'),
(221, 117, 'Digital Video Recorder', 'Digital-Video-Recorder-xVbYI', NULL, 'Digital Video Recorder', '2020-06-11 11:52:35', '2020-06-11 11:52:35'),
(222, 117, 'High Resolution Audio', 'High-Resolution-Audio-FYJyN', NULL, 'High Resolution Audio', '2020-06-11 11:53:02', '2020-06-11 11:53:13'),
(223, 117, 'MP3 Player', 'MP3-Player-Bokkm', NULL, 'MP3 Player', '2020-06-11 11:54:06', '2020-06-11 11:54:06'),
(224, 117, 'MP3 Speaker', 'MP3-Speaker-IhUIa', NULL, 'MP3 Speaker', '2020-06-11 11:54:39', '2020-06-11 11:54:39'),
(225, 117, 'Musical Instruments', 'Musical-Instruments-nxGPa', NULL, 'Musical Instruments', '2020-06-11 11:55:03', '2020-06-11 11:55:03'),
(226, 117, 'Radios & Boomboxes', 'Radios--Boomboxes-aV6Iu', NULL, 'Radios & Boomboxes', '2020-06-11 11:55:34', '2020-06-11 11:55:34'),
(227, 117, 'Wireless Speaker', 'Wireless-Speaker-xAhqz', NULL, 'Wireless Speaker', '2020-06-11 11:56:07', '2020-06-11 11:56:07'),
(228, 118, 'Camera Accessories', 'Camera-Accessories-8EDq5', NULL, 'Camera Accessories', '2020-06-11 13:12:04', '2020-06-11 13:12:04'),
(229, 118, 'Digital Camera', 'Digital-Camera-JN2ty', NULL, 'Digital Camera', '2020-06-11 13:12:39', '2020-06-11 13:12:39'),
(230, 118, 'DSLR', 'DSLR-z8Kxo', NULL, 'DSLR', '2020-06-11 13:13:02', '2020-06-11 13:13:02'),
(231, 118, 'Handy Camera', 'Handy-Camera-x0EIL', NULL, 'Handy Camera', '2020-06-11 13:14:08', '2020-06-11 13:14:08'),
(232, 118, 'Lenses', 'Lenses-dawqq', NULL, 'Lenses', '2020-06-11 13:18:09', '2020-06-11 13:18:09'),
(233, 118, 'SLR', 'SLR-T2Zpu', NULL, 'SLR', '2020-06-11 13:18:28', '2020-06-11 13:18:28'),
(234, 118, 'Sports Camera', 'Sports-Camera-LDq4X', NULL, 'Sports Camera', '2020-06-11 13:19:06', '2020-06-11 13:19:06'),
(235, 118, 'Video Camera', 'Video-Camera-53HkU', NULL, 'Video Camera', '2020-06-11 13:19:28', '2020-06-11 13:19:28'),
(236, 119, 'Computer Accessories', 'Computer-Accessories-uXH6Z', NULL, 'Computer Accessories', '2020-06-11 13:20:26', '2020-06-11 13:20:26'),
(237, 119, 'Adapter', 'Adapter-HEbSX', NULL, 'Adapter', '2020-06-11 13:20:58', '2020-06-11 13:20:58'),
(238, 119, 'HDD/SSD', 'HDDSSD-AWEKh', NULL, 'HDD/SSD', '2020-06-11 13:21:27', '2020-06-11 13:21:27'),
(239, 119, 'Head Phones & Speaker', 'Head-Phones--Speaker-JYosP', NULL, 'Head Phones & Speaker', '2020-06-11 13:21:59', '2020-06-11 13:21:59'),
(240, 125, 'Gamepads & controllers', 'Gamepads--controllers-2LJrR', NULL, 'Game-pads & controllers', '2020-06-11 13:24:02', '2020-06-11 13:24:02'),
(241, 125, 'VR BOX', 'VR-BOX-2KPgx', NULL, 'VR BOX', '2020-06-11 13:24:32', '2020-06-11 13:24:32'),
(242, 127, 'Blue Ray Disc & DVD Players', 'Blue-Ray-Disc--DVD-Players-9OqKp', NULL, 'Blue Ray Disc & DVD Players', '2020-06-11 13:26:37', '2020-06-11 13:26:37'),
(243, 127, 'Home Theater & Sound Bars', 'Home-Theater--Sound-Bars-DkzQd', NULL, 'Home Theater & Sound Bars', '2020-06-11 13:27:37', '2020-06-11 13:27:37'),
(244, 127, 'Projectors', 'Projectors-0Hp0t', NULL, 'Projectors', '2020-06-11 13:28:01', '2020-06-11 13:28:01'),
(245, 130, 'Crest', 'Crest-75Azv', NULL, 'Crest', '2020-06-11 13:36:27', '2020-06-11 13:36:27'),
(246, 142, 'Mobile Phone', 'Mobile-Phone-hgKH1', 'Mobile Phone', 'Mobile Phone', '2020-06-12 06:51:33', '2020-06-12 06:51:33'),
(247, 119, 'Laptop', 'Laptop-Vmlpz', 'Laptop', 'Laptop', '2020-06-12 06:56:22', '2020-06-12 06:56:22'),
(248, 14, 'Men\'s Underwear', 'Mens-Underwear-Ah5XL', NULL, 'Men\'s Underwear', '2020-06-12 08:11:46', '2020-06-12 08:11:46'),
(249, 14, 'Men\'s Swimwear', 'Mens-Swimwear-44xkR', NULL, 'Men\'s Swimwear', '2020-06-12 08:12:24', '2020-06-12 08:12:24'),
(250, 14, 'Men\'s Nightwear', 'Mens-Nightwear-YZJCM', NULL, 'Men\'s Nightwear', '2020-06-12 08:12:52', '2020-06-12 08:12:52'),
(251, 143, 'Men\'s Apparel Set', 'Family-Set-of-Apparel-Tkbhl', NULL, 'Men\'s Apparel Set', '2020-06-12 08:16:08', '2020-06-12 08:18:57'),
(252, 15, 'Belts', 'Belts-ocnsF', NULL, 'Belts', '2020-06-12 08:20:39', '2020-06-12 08:20:39'),
(253, 15, 'Bracelets', 'Bracelets-kxbjN', NULL, 'Bracelets', '2020-06-12 08:21:18', '2020-06-12 08:21:18'),
(254, 15, 'Card Holder', 'Card-Holder-B0Sab', NULL, 'Card Holder', '2020-06-12 08:35:50', '2020-06-12 08:35:50'),
(255, 15, 'Cuff-link & Brooch', 'Cuff-link--Brooch-2I3XQ', NULL, 'Cuff-link & Brooch', '2020-06-12 08:37:15', '2020-06-12 08:37:15'),
(256, 15, 'Gents Watches', 'Gents-Watches-KiBGB', NULL, 'Gents Watches', '2020-06-12 08:37:58', '2020-06-12 08:37:58'),
(257, 15, 'Glasses for Men', 'Glasses-for-Men-l9TWW', NULL, 'Glasses for Men', '2020-06-12 08:39:58', '2020-06-12 08:39:58'),
(258, 15, 'Gloves for Men', 'Gloves-for-Men-xCs1C', NULL, 'Gloves for Men', '2020-06-12 08:40:23', '2020-06-12 08:40:23'),
(259, 15, 'Hats & Caps', 'Hats--Caps-zAtGK', NULL, 'Hats & Caps', '2020-06-12 08:40:49', '2020-06-12 08:40:49'),
(260, 15, 'Key Rings', 'Key-Rings-gR7sy', NULL, 'Key Rings', '2020-06-12 08:42:02', '2020-06-12 08:42:02'),
(261, 15, 'Men\'s Shoes', 'Mens-Shoes-jNUrs', NULL, 'Men\'s Shoes', '2020-06-12 08:42:26', '2020-06-12 08:42:26'),
(262, 15, 'Men\'s Jewellery', 'Mens-Jewellery-gNwev', NULL, 'Men\'s Jewellery', '2020-06-12 08:43:21', '2020-06-12 08:43:21'),
(263, 15, 'Office Bags for Men', 'Office-Bags-for-Men-v9CRg', NULL, 'Office Bags for Men', '2020-06-12 08:43:50', '2020-06-12 08:43:50'),
(264, 15, 'Pocket Square', 'Pocket-Square-PAXRZ', NULL, 'Pocket Square', '2020-06-12 08:45:30', '2020-06-12 08:45:30'),
(265, 15, 'Raincoat', 'Raincoat-Gx0B5', NULL, 'Raincoat', '2020-06-12 08:45:49', '2020-06-12 08:45:49'),
(266, 15, 'Scarf', 'Scarf-CmoTa', NULL, 'Scarf', '2020-06-12 08:46:42', '2020-06-12 08:46:42'),
(267, 15, 'Tie & Bow', 'Tie--Bow-FDq6z', NULL, 'Tie & Bow', '2020-06-12 08:47:10', '2020-06-12 08:47:10'),
(268, 15, 'Towel', 'Towel-F2kGF', NULL, 'Towel', '2020-06-12 08:47:36', '2020-06-12 08:47:36'),
(269, 15, 'Umbrellas', 'Umbrellas-IPXIU', NULL, 'Umbrellas', '2020-06-12 08:48:02', '2020-06-12 08:48:02'),
(270, 15, 'Wallets', 'Wallets-K0ThL', NULL, 'Wallets', '2020-06-12 08:48:40', '2020-06-12 08:48:40'),
(271, 143, 'Couple Dress', 'Couple-Dress-Cd8q5', NULL, 'Couple Dress', '2020-06-12 08:49:40', '2020-06-12 08:49:40'),
(272, 14, 'Family Set of Apparel', 'Family-Set-of-Apparel-pV0XN', NULL, 'Family Set of Apparel', '2020-06-12 08:50:37', '2020-06-12 08:50:37'),
(273, 14, 'Formal Wear', 'Formal-Wear-qBl7N', NULL, 'Formal Wear', '2020-06-12 08:51:11', '2020-06-12 08:51:11'),
(274, 14, 'Men\'s Winter Collection', 'Mens-Winter-Collection-dPLZ6', NULL, 'Men\'s Winter Collection', '2020-06-12 08:51:36', '2020-06-12 08:51:36'),
(275, 14, 'Men\'s Hoodies& Sweaters', 'Mens-Hoodies-Sweaters-p5RVF', NULL, 'Men\'s Hoodies& Sweaters', '2020-06-12 08:52:30', '2020-06-12 08:52:30'),
(276, 14, 'Men\'s Inner-wear', 'Mens-Inner-wear-ZBnl7', NULL, 'Men\'s Inner-wear', '2020-06-12 08:54:50', '2020-06-12 08:54:50'),
(277, 14, 'Men\'s Jackets & Coats', 'Mens-Jackets--Coats-k0skT', NULL, 'Men\'s Jackets & Coats', '2020-06-12 08:55:25', '2020-06-12 08:55:25'),
(278, 14, 'Men\'s Shocks', 'Mens-Shocks-mXiMI', NULL, 'Men\'s Shocks', '2020-06-12 08:55:52', '2020-06-12 08:55:52'),
(279, 14, 'Men\'s Sportswear', 'Mens-Sportswear-BBuxm', NULL, 'Men\'s Sportswear', '2020-06-12 08:57:04', '2020-06-12 08:57:04'),
(280, 14, 'Men\'s Swimwear', 'Mens-Swimwear-zaAUa', NULL, 'Men\'s Swimwear', '2020-06-12 08:57:44', '2020-06-12 08:57:44'),
(281, 14, 'Nightwear', 'Nightwear-bRnpG', NULL, 'Nightwear', '2020-06-12 08:58:40', '2020-06-12 08:58:40'),
(282, 14, 'Pants', 'Pants-0jQqN', NULL, 'Pants', '2020-06-12 08:58:56', '2020-06-12 08:58:56'),
(283, 14, 'Polo Shirts', 'Polo-Shirts-vsrck', NULL, 'Polo Shirts', '2020-06-12 08:59:24', '2020-06-12 08:59:24'),
(284, 14, 'Shirts', 'Shirts-yk2lB', NULL, 'Shirts', '2020-06-12 09:00:00', '2020-06-12 09:00:00'),
(285, 14, 'Shorts', 'Shorts-XfuRR', NULL, 'Shorts', '2020-06-12 09:00:15', '2020-06-12 09:00:15'),
(286, 14, 'Shocks', 'Shocks-WDNb1', NULL, 'Shocks', '2020-06-12 09:00:37', '2020-06-12 09:00:37'),
(287, 14, 'Suits', 'Suits-fJ0hH', NULL, 'Suits', '2020-06-12 09:01:24', '2020-06-12 09:01:24'),
(288, 14, 'Sweaters & Cardigans', 'Sweaters--Cardigans-4dKO4', NULL, 'Sweaters & Cardigans', '2020-06-12 09:06:20', '2020-06-12 09:06:20'),
(289, 14, 'T Shirts', 'T-Shirts-xSzat', NULL, 'T Shirts', '2020-06-12 09:06:41', '2020-06-12 09:06:41'),
(290, 14, 'Traditional Clothing', 'Shorts-jZE6B', NULL, 'Traditional Clothing', '2020-06-12 09:07:00', '2020-06-12 09:07:28'),
(291, 145, 'Formal Shoes', 'Formal-Shoes-17nfk', NULL, 'Formal Shoes', '2020-06-12 09:09:00', '2020-06-12 09:09:00'),
(292, 145, 'Khusa & Kolapuri', 'Khusa--Kolapuri-ax2i0', NULL, 'Khusa & Kolapuri', '2020-06-12 09:09:44', '2020-06-12 09:09:44'),
(293, 145, 'Loafers', 'Loafers-JQjtw', NULL, 'Loafers', '2020-06-12 09:10:10', '2020-06-12 09:10:10'),
(294, 145, 'Men\'s Boots', 'Mens-Boots-F3JIa', NULL, 'Men\'s Boots', '2020-06-12 09:10:40', '2020-06-12 09:10:40'),
(295, 145, 'Nagras for Men', 'Nagras-for-Men-SECQQ', NULL, 'Nagras for Men', '2020-06-12 09:11:09', '2020-06-12 09:11:09'),
(296, 145, 'Sandels', 'Sandels-HzxDu', NULL, 'Sandels', '2020-06-12 09:11:39', '2020-06-12 09:11:52'),
(297, 145, 'Shoe Care', 'Shoe-Care-3TzTU', NULL, 'Shoe Care', '2020-06-12 09:12:24', '2020-06-12 09:12:24'),
(298, 145, 'Shoes Accessories', 'Shoes-Accessories-V2jU4', NULL, 'Shoes Accessories', '2020-06-12 09:12:51', '2020-06-12 09:12:51'),
(299, 145, 'Sneakers', 'Sneakers-ZygvF', NULL, 'Sneakers', '2020-06-12 09:14:30', '2020-06-12 09:14:30'),
(300, 14, 'Punjabi', 'Punjabi-5vAf8', NULL, 'Punjabi', '2020-06-12 09:15:50', '2020-06-12 09:15:50'),
(301, 146, 'Body Shapers', 'Body-Shapers-IPjao', NULL, 'Body Shapers', '2020-06-12 11:29:14', '2020-06-12 11:29:14'),
(302, 146, 'Bra', 'Bra-NJyWb', NULL, 'Bra', '2020-06-12 11:30:22', '2020-06-12 11:30:22'),
(303, 146, 'Lingerie Sets', 'Lingerie-Sets-Ce4qL', NULL, 'Lingerie Sets', '2020-06-12 11:30:50', '2020-06-12 11:30:50'),
(304, 146, 'Nightwear', 'Nightwear-Wxmo1', NULL, 'Nightwear', '2020-06-12 11:38:11', '2020-06-12 11:38:11'),
(305, 146, 'Panties', 'Panties-OlfIl', NULL, 'Panties', '2020-06-12 11:39:58', '2020-06-12 11:39:58'),
(306, 146, 'Pajama', 'Pajama-S8vUQ', NULL, 'Pajama', '2020-06-12 11:40:54', '2020-06-12 11:40:54'),
(307, 149, 'Belts', 'Belts-pXtxw', NULL, 'Belts', '2020-06-12 11:41:32', '2020-06-12 11:41:32'),
(308, 149, 'Card Holder', 'Card-Holder-ycRHS', NULL, 'Card Holder', '2020-06-12 11:41:57', '2020-06-12 11:41:57'),
(309, 149, 'Bags', 'Bags-vtO5v', NULL, 'Bags', '2020-06-12 11:42:26', '2020-06-12 11:42:26'),
(310, 149, 'Glasses', 'Glasses-38JAM', NULL, 'Glasses', '2020-06-12 11:42:50', '2020-06-12 11:42:50'),
(311, 149, 'Gloves', 'Gloves-ZJ5Vz', NULL, 'Gloves', '2020-06-12 11:43:29', '2020-06-12 11:43:29'),
(312, 146, 'Hair beauty', 'Hair-beauty-0Ka4D', NULL, 'Hair beauty', '2020-06-12 11:43:56', '2020-06-12 11:43:56'),
(313, 149, 'Jewellery', 'Jewellery-UE16Y', NULL, 'Jewellery', '2020-06-12 11:45:04', '2020-06-12 11:45:04'),
(314, 149, 'Key Rings', 'Key-Rings-36Aec', NULL, 'Key Rings', '2020-06-12 11:45:34', '2020-06-12 11:45:34'),
(315, 149, 'Ladies Watches', 'Ladies-Watches-YkJZH', NULL, 'Ladies Watches', '2020-06-12 11:46:03', '2020-06-12 11:46:03'),
(316, 149, 'Purses', 'Purses-oH1Y7', NULL, 'Purses', '2020-06-12 11:46:58', '2020-06-12 11:46:58'),
(317, 149, 'Safety Pin', 'Safety-Pin-kjoeU', NULL, 'Safety Pin', '2020-06-12 11:47:27', '2020-06-12 11:47:27'),
(318, 149, 'Hijab & Scraves', 'Hijab--Scraves-AThkd', NULL, 'Hijab & Scraves', '2020-06-12 11:52:47', '2020-06-12 11:52:47'),
(319, 149, 'Towel', 'Towel-YpVrz', NULL, 'Towel', '2020-06-12 11:53:45', '2020-06-12 11:53:45'),
(320, 149, 'Umbrellas', 'Umbrellas-5bmOi', NULL, 'Umbrellas', '2020-06-12 11:54:25', '2020-06-12 11:54:25'),
(321, 149, 'Women\'s Wallet', 'Womens-Wallet-Zv4nQ', NULL, 'Women\'s Wallet', '2020-06-12 11:55:04', '2020-06-12 11:55:04'),
(322, 147, 'Blouse/ Blouse Pieces', 'Blouse-Blouse-Pieces-tKjZf', NULL, 'Blouse/ Blouse Pieces', '2020-06-12 11:56:09', '2020-06-12 11:56:09'),
(323, 147, 'Bridal Collection', 'Bridal-Collection-AeR92', NULL, 'Bridal Collection', '2020-06-12 11:59:17', '2020-06-12 11:59:17'),
(324, 147, 'Burkha/Abaya', 'BurkhaAbaya-9Ws3A', NULL, 'Burkha/Abaya', '2020-06-12 12:00:12', '2020-06-12 12:00:12'),
(325, 147, 'Capes & Shrugs', 'Capes--Shrugs-ydWdG', NULL, 'Capes & Shrugs', '2020-06-12 12:01:21', '2020-06-12 12:01:42'),
(326, 147, 'Couple Dresses', 'Couple-Dresses-L5eVD', NULL, 'Couple Dresses', '2020-06-13 00:14:24', '2020-06-13 00:14:24'),
(327, 147, 'Dupatta', 'Dupatta-1o3eC', NULL, 'Dupatta', '2020-06-13 00:14:46', '2020-06-13 00:14:46'),
(328, 147, 'Fabric for Women dress', 'Fabric-for-Women-dress-o3J8u', NULL, 'Fabric for Women dress', '2020-06-13 00:15:21', '2020-06-13 00:15:21'),
(329, 147, 'Fatua', 'Fatua-w7GYr', NULL, 'Fatua', '2020-06-13 00:15:38', '2020-06-13 00:15:38'),
(330, 147, 'Gowns', 'Gowns-O2Lwx', NULL, 'Gowns', '2020-06-13 00:16:07', '2020-06-13 00:16:07'),
(331, 147, 'Jumpsuits', 'Jumpsuits-12T7G', NULL, 'Jumpsuits', '2020-06-13 00:16:44', '2020-06-13 00:16:44'),
(332, 147, 'Ladies Shirts', 'Ladies-Shirts-0XsDR', NULL, 'Ladies Shirts', '2020-06-13 00:17:37', '2020-06-13 00:17:37'),
(333, 147, 'Kurti', 'Kurti-1ftqe', NULL, 'Kurti', '2020-06-13 00:18:13', '2020-06-13 00:18:13'),
(334, 147, 'Ladies T Shirts', 'Ladies-T-Shirts-JouAk', NULL, 'Ladies T Shirts', '2020-06-13 00:18:41', '2020-06-13 00:18:41'),
(335, 147, 'Ladies Tops', 'Ladies-Tops-khYec', NULL, 'Ladies Tops', '2020-06-13 00:19:11', '2020-06-13 00:19:11'),
(336, 147, 'Lahenga', 'Lahenga-wghsn', NULL, 'Lahenga', '2020-06-13 00:19:32', '2020-06-13 00:19:32'),
(337, 147, 'Lawn Dress', 'Lawn-Dress-sIjMh', NULL, 'Lawn Dress', '2020-06-13 00:19:56', '2020-06-13 00:19:56'),
(338, 147, 'Palazzo Pants', 'Palazzo-Pants-QQnyv', NULL, 'Palazzo Pants', '2020-06-13 00:20:21', '2020-06-13 00:20:21'),
(339, 147, 'Panjabi', 'Panjabi-fiwvx', NULL, 'Panjabi', '2020-06-13 00:20:39', '2020-06-13 00:20:39'),
(340, 147, 'Pants for Women', 'Pants-for-Women-75Qul', NULL, 'Pants for Women', '2020-06-13 00:21:14', '2020-06-13 00:21:14'),
(341, 147, 'Pregnancy & Maternity Dress', 'Pregnancy--Maternity-Dress-DedTs', NULL, 'Pregnancy & Maternity Dress', '2020-06-13 00:22:18', '2020-06-13 00:22:18'),
(342, 147, 'Salwar Kameez', 'Salwar-Kameez-4S1YO', NULL, 'Salwar Kameez', '2020-06-13 00:22:45', '2020-06-13 00:22:45'),
(343, 147, 'Saree', 'Saree-JquUL', NULL, 'Saree', '2020-06-13 00:23:04', '2020-06-13 00:23:04'),
(344, 147, 'Skirts', 'Skirts-ddQha', NULL, 'Skirts', '2020-06-13 00:23:21', '2020-06-13 00:24:10'),
(345, 146, 'Socks for Women', 'Shocks-for-Women-wgCSd', NULL, 'Socks for Women', '2020-06-13 00:23:50', '2020-06-13 00:24:42'),
(346, 147, 'Summer coat & Jacket', 'Summer-coat--Jacket-AHR6k', NULL, 'Summer coat & Jacket', '2020-06-13 11:15:10', '2020-06-13 11:15:10'),
(347, 147, 'Tunic', 'Tunic-tmdVY', NULL, 'Tunic', '2020-06-13 11:15:29', '2020-06-13 11:15:29'),
(348, 147, 'Uniforms', 'Uniforms-jUXJT', NULL, 'Uniforms', '2020-06-13 11:15:50', '2020-06-13 11:15:50'),
(349, 147, 'Unstitch Salwar Kameez', 'Unstitch-Salwar-Kameez-RuWqC', NULL, 'Unstitch Salwar Kameez', '2020-06-13 11:17:13', '2020-06-13 11:17:13'),
(350, 147, 'Women Winter Cloths', 'Women-Winter-Cloths-X2qyY', NULL, 'Women Winter Cloths', '2020-06-13 11:17:49', '2020-06-13 11:17:49'),
(351, 147, 'Yokes', 'Yokes-Crjvs', NULL, 'Yokes', '2020-06-13 11:18:17', '2020-06-13 11:18:17'),
(352, 148, 'Boots for Ladies', 'Boots-for-Ladies-YDDgk', NULL, 'Boots for Ladies', '2020-06-13 11:18:57', '2020-06-13 11:18:57'),
(353, 148, 'High Heel Shoes', 'High-Heel-Shoes-e8HGb', NULL, 'High Heels Shoes', '2020-06-13 11:19:31', '2020-06-13 11:21:13'),
(354, 148, 'Ladies Closed Toe shoes', 'Ladies-Closed-Toe-shoes-KAAZR', NULL, 'Ladies Closed Toe shoes', '2020-06-13 11:20:10', '2020-06-13 11:21:06'),
(355, 148, 'Ladies Flat Sandals', 'Ladies-Flat-Sandals-eE1xJ', NULL, 'Ladies Flat Sandals', '2020-06-13 11:20:54', '2020-06-13 11:20:54'),
(356, 148, 'Ladies Sneakers', 'Ladies-Sneakers-Zc14G', NULL, 'Ladies Sneakers', '2020-06-13 11:21:53', '2020-06-13 11:21:53'),
(357, 148, 'Ladies Sports shoes', 'Ladies-Sports-shoes-dOx45', NULL, 'Ladies Sports shoes', '2020-06-13 11:22:16', '2020-06-13 11:22:16'),
(358, 148, 'Ladies Nagras', 'Ladies-Nagras-VHu3E', NULL, 'Ladies Nagras', '2020-06-13 11:22:47', '2020-06-13 11:22:47'),
(359, 148, 'Shoe care', 'Shoe-care-h53gF', NULL, 'Shoe care', '2020-06-13 11:23:09', '2020-06-13 11:23:09'),
(360, 150, 'Kids Jackets', 'Kids-Jackets-6tbTr', NULL, 'Kids Jackets', '2020-06-13 16:32:06', '2020-06-13 16:32:06'),
(361, 150, 'Kids T-Shirts', 'Kids-T-Shirts-cJUQZ', NULL, 'Kids T-Shirts', '2020-06-13 16:32:35', '2020-06-13 16:33:31'),
(362, 150, 'Kids Trousers', 'Kids-Trousers-IB9Yk', NULL, 'Kids Trousers', '2020-06-13 16:33:19', '2020-06-13 16:33:19'),
(363, 150, 'Kids Suits', 'Kids-Suits-yxXqm', NULL, 'Kids Suits', '2020-06-13 16:34:08', '2020-06-13 16:34:08'),
(364, 150, 'Kids Nightwear', 'Kids-Nightwear-6pCvO', NULL, 'Kids Nightwear', '2020-06-13 16:34:42', '2020-06-13 16:34:42'),
(365, 150, 'Kids Sportswear', 'Kids-Sportswear-CSGhA', NULL, 'Kids Sportswear', '2020-06-13 16:37:13', '2020-06-13 16:37:13'),
(366, 150, 'Kids Swimwear', 'Kids-Swimwear-bXRY4', NULL, 'Kids Swimwear', '2020-06-13 16:39:09', '2020-06-13 16:39:09'),
(367, 43, 'Face Mask', 'Face-Mask-fXT3b', NULL, NULL, '2020-06-14 15:16:01', '2020-06-14 15:16:01'),
(368, 152, 'Kids shoes', 'Kids-shoes-YLtqB', NULL, 'Kids shoes', '2020-06-15 16:27:07', '2020-06-15 16:27:07'),
(369, 152, 'Kids Belts', 'Kids-Belts-pxI7E', NULL, 'Kids Belts', '2020-06-15 16:28:14', '2020-06-15 16:28:14'),
(370, 152, 'Kids Watches', 'Kids-Watches-iX1LL', NULL, 'Kids Watches', '2020-06-15 16:29:45', '2020-06-15 16:29:45'),
(371, 152, 'Kids Glasses', 'Kids-Glasses-pDfhp', NULL, 'Kids Glasses', '2020-06-15 16:54:18', '2020-06-15 16:54:18'),
(372, 161, 'Coffee hand mixer', 'Coffee-hand-mixer-HZE65', 'Coffee hand mixer', 'Coffee hand mixer', '2020-06-16 02:51:42', '2020-06-16 02:51:42'),
(373, 162, 'Health care machine', 'Health-care-machine-cbjCG', 'Health care machine', 'Health care machine', '2020-06-20 00:31:51', '2020-06-20 00:32:44'),
(374, 174, 'Camping Tent', 'Camping-Tent-FWDTo', 'Camping Tent', 'Camping Tent', '2020-06-20 07:38:17', '2020-06-20 07:38:17'),
(375, 174, 'Canopies & Umbrellas', 'Canopies--Umbrellas-cmQdJ', 'Canopies & Umbrellas', 'Canopies & Umbrellas', '2020-06-20 07:38:56', '2020-06-20 07:38:56'),
(376, 174, 'Chairs', 'Chairs-XY9c0', 'Chairs', 'Chairs', '2020-06-20 07:39:22', '2020-06-20 07:39:22'),
(377, 174, 'Dining Sets', 'Dining-Sets-jZovX', 'Dining Sets', 'Dining Sets', '2020-06-20 07:39:59', '2020-06-20 07:39:59'),
(378, 174, 'Lounges & Daybeds', 'Lounges--Daybeds-UodQW', 'Lounges & Daybeds', 'Lounges & Daybeds', '2020-06-20 07:40:27', '2020-06-20 07:40:27'),
(379, 174, 'Seating Sets', 'Seating-Sets-TZshb', 'Seating Sets', 'Seating Sets', '2020-06-20 07:40:48', '2020-06-20 07:40:48'),
(380, 174, 'Swing & Hammocks', 'Swing--Hammocks-ARFar', 'Swing & Hammocks', 'Swing & Hammocks', '2020-06-20 07:41:12', '2020-06-20 07:41:12'),
(381, 174, 'Tables', 'Tables-0wlFp', 'Tables', 'Tables', '2020-06-20 07:41:30', '2020-06-20 07:41:30'),
(382, 175, 'Bedroom Furniture', 'Bedroom-Furniture-xJWCX', 'Bedroom Furniture', 'Bedroom Furniture', '2020-06-20 07:42:17', '2020-06-20 07:42:17'),
(383, 175, 'Dining Furniture', 'Dining-Furniture-FoxQ0', 'Dining Furniture', 'Dining Furniture', '2020-06-20 07:42:45', '2020-06-20 07:42:45'),
(384, 175, 'Display/ Shelves', 'Display-Shelves-13jNR', 'Display/ Shelves', 'Display/ Shelves', '2020-06-20 07:43:16', '2020-06-20 07:43:16'),
(385, 175, 'Entertainment Sets Furniture', 'Entertainment-Sets-Furniture-GhY3I', 'Entertainment Sets Furniture', 'Entertainment Sets Furniture', '2020-06-20 07:44:10', '2020-06-20 07:44:10'),
(386, 175, 'Finishing Touch', 'Finishing-Touch-Rn3mY', 'Finishing Touch', 'Finishing Touch', '2020-06-20 07:44:40', '2020-06-20 07:44:40'),
(387, 175, 'Furniture Moving Strap', 'Furniture-Moving-Strap-YJc77', 'Furniture Moving Strap', 'Furniture Moving Strap', '2020-06-20 07:45:13', '2020-06-20 07:45:13'),
(388, 175, 'Kids Furniture', 'Kids-Furniture-l7AlS', 'Kids Furniture', 'Kids Furniture', '2020-06-20 07:45:36', '2020-06-20 07:45:36'),
(389, 175, 'Kitchen Furniture', 'Kitchen-Furniture-PEO5f', 'Kitchen Furniture', 'Kitchen Furniture', '2020-06-20 07:46:05', '2020-06-20 07:46:05'),
(390, 175, 'Living Furniture', 'Living-Furniture-5XgDU', 'Living Furniture', 'Living Furniture', '2020-06-20 07:46:26', '2020-06-20 07:46:26'),
(391, 175, 'Utility', 'Utility-7Rrvw', 'Utility', 'Utility', '2020-06-20 07:46:41', '2020-06-20 07:46:51'),
(392, 177, 'Classroom Chair', 'Classroom-Chair-wNUZT', 'Classroom Chair', 'Classroom Chair', '2020-06-20 07:47:31', '2020-06-20 07:47:31'),
(393, 177, 'Classroom Bench', 'Classroom-Bench-2TWVF', 'Classroom Bench', 'Classroom Bench', '2020-06-20 07:47:54', '2020-06-20 07:47:54'),
(394, 177, 'Classroom Table', 'Classroom-Table-YXo8P', 'Classroom Table', 'Classroom Table', '2020-06-20 07:48:23', '2020-06-20 07:48:23'),
(395, 178, 'Office Chair', 'Office-Chair-ECSaH', 'Office Chair', 'Office Chair', '2020-06-20 07:48:56', '2020-06-20 07:48:56'),
(396, 178, 'Office Living', 'Office-Living-bUOxD', 'Office Living', 'Office Living', '2020-06-20 07:49:17', '2020-06-20 07:49:17'),
(397, 178, 'Office Sofa', 'Office-Sofa-stK03', 'Office Sofa', 'Office Sofa', '2020-06-20 07:49:44', '2020-06-20 07:49:44'),
(398, 178, 'Office Storage', 'Office-Storage-aBTfF', 'Office Storage', 'Office Storage', '2020-06-20 07:50:07', '2020-06-20 07:50:07'),
(399, 178, 'Office Table', 'Office-Table-4p99Y', 'Office Table', 'Office Table', '2020-06-20 07:50:26', '2020-06-20 07:50:26'),
(400, 178, 'Reception Table', 'Reception-Table-907BS', 'Reception Table', 'Reception Table', '2020-06-20 07:50:53', '2020-06-20 07:50:53'),
(401, 178, 'Work Station', 'Work-Station-WaBA9', 'Work Station', 'Work Station', '2020-06-20 07:51:13', '2020-06-20 07:51:13'),
(402, 182, 'Bread', 'Bread-EN4bR', 'Bread', 'Bread', '2020-06-21 17:22:14', '2020-06-21 17:22:14'),
(403, 182, 'Breakfast & Treats', 'Breakfast--Treats-8P2Rc', 'Breakfast & Treats', 'Breakfast & Treats', '2020-06-21 17:22:50', '2020-06-21 17:22:50'),
(404, 182, 'Cake & Sweet Pies', 'Cake--Sweet-Pies-BJLhn', 'Cake & Sweet Pies', 'Cake & Sweet Pies', '2020-06-21 17:23:30', '2020-06-21 17:23:30'),
(405, 183, 'Condiment Dressing', 'Condiment-Dressing-YmL8j', 'Condiment Dressing', 'Condiment Dressing', '2020-06-21 17:24:21', '2020-06-21 17:24:21'),
(406, 183, 'Home Baking & Sugar', 'Home-Baking--Sugar-SoO2G', 'Home Baking & Sugar', 'Home Baking & Sugar', '2020-06-21 17:24:53', '2020-06-21 17:24:53'),
(407, 184, 'Coffee', 'Coffee-PlqL6', 'Coffee', 'Coffee', '2020-06-21 17:26:40', '2020-06-21 17:26:40'),
(408, 184, 'Energy Drink', 'Energy-Drink-Mt36D', 'Energy Drink', 'Energy Drink', '2020-06-21 17:27:08', '2020-06-21 17:27:08'),
(409, 184, 'Flavoring', 'Flavoring-mbk1f', 'Flavoring', 'Flavoring', '2020-06-21 17:28:32', '2020-06-21 17:28:32'),
(410, 184, 'Hot Chocolate & Nutrition', 'Hot-Chocolate-Snkob', 'Hot Chocolate & Nutrition', 'Hot Chocolate & Nutrition', '2020-06-21 17:29:05', '2020-06-21 17:30:29'),
(411, 184, 'Juice', 'Juice-XBDAf', 'Juice', 'Juice', '2020-06-21 17:30:12', '2020-06-21 17:30:12'),
(412, 184, 'Powdered Drink', 'Powdered-Drink-oAuQk', 'Powdered Drink', 'Powdered Drink', '2020-06-21 17:31:04', '2020-06-21 17:31:04'),
(413, 184, 'Soft Drinks', 'Soft-Drinks-rVVs7', 'Soft Drinks', 'Soft Drinks', '2020-06-21 17:31:38', '2020-06-21 17:31:38'),
(414, 184, 'Tea', 'Tea-7ct1y', 'Tea', 'Tea', '2020-06-21 17:32:04', '2020-06-21 17:32:04'),
(415, 184, 'Water', 'Water-lIzxx', 'Water', 'Water', '2020-06-21 17:32:29', '2020-06-21 17:32:29'),
(416, 185, 'Breakfast Cereals', 'Breakfast-Cereals-5T47c', 'Breakfast Cereals', 'Breakfast Cereals', '2020-06-21 17:33:15', '2020-06-21 17:33:15'),
(417, 185, 'Granola', 'Granola-BduNl', 'Granola', 'Granola', '2020-06-21 17:34:20', '2020-06-21 17:34:20'),
(418, 185, 'Honey', 'Honey-x2Nt4', 'Honey', 'Honey', '2020-06-21 17:34:53', '2020-06-21 17:34:53'),
(419, 185, 'Instant Breakfast', 'Instant-Breakfast-a7LsI', 'Instant Breakfast', 'Instant Breakfast', '2020-06-21 17:35:28', '2020-06-21 17:35:28'),
(420, 185, 'Jams', 'Jams-g9jel', 'Jams', 'Jams', '2020-06-21 17:36:30', '2020-06-21 17:36:30'),
(421, 185, 'Oat meals', 'Oat-meals-GbDer', 'Oat meals', 'Oat meals', '2020-06-21 17:38:05', '2020-06-21 17:38:05'),
(422, 185, 'Pancake & Waffle Mixes', 'Pancake--Waffle-Mixes-mp4nX', 'Pancake & Waffle Mixes', 'Pancake & Waffle Mixes', '2020-06-21 17:39:06', '2020-06-21 17:39:06'),
(423, 186, 'Burmese Chutney', 'Burmese-Chutney-X0Srd', 'Burmese Chutney', 'Burmese Chutney', '2020-06-21 17:42:30', '2020-06-21 17:42:30'),
(424, 186, 'Soap', 'Soap-oKw6X', 'Soap', 'Soap', '2020-06-21 17:43:14', '2020-06-21 17:43:14'),
(425, 186, 'Beauty Products', 'Beauty-Products-SqJax', 'Beauty Products', 'Beauty Products', '2020-06-21 17:43:43', '2020-06-21 17:43:43'),
(426, 186, 'Others Burmese Products', 'Others-Burmese-Products-mRp9K', 'Others Burmese Products', 'Others Burmese Products', '2020-06-21 17:44:19', '2020-06-21 17:44:19'),
(427, 187, 'Candy Assortments', 'Candy-Assortments-Ui2Yu', NULL, 'Candy Assortments', '2020-06-21 17:45:51', '2020-06-21 17:45:51'),
(428, 187, 'Caramel & Toffee', 'Caramel--Toffee-NyLqq', 'Caramel & Toffee', 'Caramel & Toffee', '2020-06-21 17:46:26', '2020-06-21 17:46:26'),
(429, 187, 'Chewing Gum & Mints', 'Chewing-Gum--Mints-do4NL', 'Chewing Gum & Mints', 'Chewing Gum & Mints', '2020-06-21 17:48:26', '2020-06-21 17:48:26');
INSERT INTO `sub_sub_categories` (`id`, `sub_category_id`, `name`, `slug`, `meta_title`, `meta_description`, `created_at`, `updated_at`) VALUES
(430, 187, 'Chocolate', 'Chocolate-3RZwB', 'Chocolate', 'Chocolate', '2020-06-21 17:49:06', '2020-06-21 17:49:06'),
(431, 187, 'Chocolate Bars', 'Chocolate-Bars-fsE9t', 'Chocolate Bars', 'Chocolate Bars', '2020-06-21 17:49:54', '2020-06-21 17:49:54'),
(432, 187, 'Festive Boxed', 'Festive-Boxed-wTry9', 'Festive Boxed', 'Festive Boxed', '2020-06-21 17:50:35', '2020-06-21 17:50:35'),
(433, 187, 'Gems', 'Gems-yGoem', 'Gems', 'Gems', '2020-06-21 17:51:04', '2020-06-21 17:51:04'),
(434, 187, 'Marshmallows', 'Marshmallows-zeHLf', 'Marshmallows', 'Marshmallows', '2020-06-21 17:51:38', '2020-06-21 17:51:38'),
(435, 187, 'Nuts & Fruits', 'Nuts--Fruits-NOYx8', 'Marshmallows', 'Marshmallows', '2020-06-21 17:53:04', '2020-06-21 17:53:04'),
(436, 188, 'Canned Foods', 'Canned-Foods-UL2Uz', 'Canned Foods', 'Canned Foods', '2020-06-21 18:52:57', '2020-06-21 18:52:57'),
(437, 188, 'Dry Food', 'Dry-Food-DzI6O', 'Dry Food', 'Dry Food', '2020-06-21 18:53:45', '2020-06-21 18:53:45'),
(438, 189, 'Cooking Oil & Ghee', 'Cooking-Oil--Ghee-kVKTQ', 'Cooking Oil & Ghee', 'Cooking Oil & Ghee', '2020-06-21 18:55:06', '2020-06-21 18:55:06'),
(439, 189, 'Psyllium Husk', 'Psyllium-Husk-iDsBq', 'Psyllium Husk', 'Psyllium Husk', '2020-06-21 18:55:49', '2020-06-21 18:55:49'),
(440, 189, 'Pulse & Chickpea', 'Pulse--Chickpea-bamSi', 'Psyllium Husk', 'Psyllium Husk', '2020-06-21 18:56:40', '2020-06-21 18:56:40'),
(441, 189, 'Rice', 'Rice-ZrIv8', 'Rice', 'Rice', '2020-06-21 18:57:56', '2020-06-21 18:57:56'),
(442, 189, 'Salt & Sugar', 'Salt--Sugar-h1AXc', 'Salt & Sugar', 'Salt & Sugar', '2020-06-21 18:58:41', '2020-06-21 18:58:41'),
(443, 189, 'Spices', 'Spices-rTjEg', 'Spices', 'Spices', '2020-06-21 18:59:12', '2020-06-21 18:59:12'),
(444, 189, 'Vinegar & Cooking Wine', 'Vinegar--Cooking-Wine-mpSRv', 'Vinegar & Cooking Wine', 'Vinegar & Cooking Wine', '2020-06-21 18:59:55', '2020-06-21 18:59:55'),
(445, 189, 'Wheat Flour, Flour & Suji', 'Wheat-Flour-Flour--Suji-rOoK9', 'Wheat Flour, Flour & Suji', 'Wheat Flour, Flour & Suji', '2020-06-21 19:00:36', '2020-06-21 19:00:36'),
(446, 190, 'Cheese', 'Cheese-mfXEY', 'Cheese', 'Cheese', '2020-06-21 19:01:47', '2020-06-21 19:01:47'),
(447, 190, 'Chilled Drinks', 'Chilled-Drinks-R9TbP', 'Chilled Drinks', 'Chilled Drinks', '2020-06-21 19:02:26', '2020-06-21 19:02:26'),
(448, 190, 'Condensed Milk', 'Condensed-Milk-0Sdk8', 'Condensed Milk', 'Condensed Milk', '2020-06-21 19:03:06', '2020-06-21 19:03:06'),
(449, 190, 'Milk', 'Milk-oVBeg', 'Milk', 'Milk', '2020-06-21 19:03:35', '2020-06-21 19:03:35'),
(450, 190, 'Sterilized Cream', 'Sterilized-Cream-gNtE8', 'Sterilized Cream', 'Sterilized Cream', '2020-06-21 19:04:21', '2020-06-21 19:04:21'),
(451, 190, 'Yogurt', 'Yogurt-8Jpcs', 'Yogurt', 'Yogurt', '2020-06-21 19:05:10', '2020-06-21 19:05:10'),
(452, 191, 'Fast Food', 'Fast-Food-wg3wu', 'Fast Food', 'Fast Food', '2020-06-21 19:07:11', '2020-06-21 19:07:11'),
(453, 191, 'Iftar items', 'Iftar-items-2ewyo', 'Iftar items', 'Iftar items', '2020-06-21 19:09:52', '2020-06-21 19:09:52'),
(454, 191, 'Sweet', 'Sweet-sbL7I', 'Sweet', 'Sweet', '2020-06-21 19:11:14', '2020-06-21 19:11:14'),
(455, 198, 'Smart Watch', 'Smart-Watch-jEneu', 'Smart Watch', 'Smart Watch', '2020-06-22 05:00:40', '2020-06-22 05:00:40'),
(456, 192, 'Fresh Vegetables', 'Fresh-Vegetables-YawUH', 'Fresh Vegetables', 'Fresh Vegetables', '2020-06-26 09:53:22', '2020-06-26 09:53:22'),
(457, 192, 'Fresh Fruit', 'Fresh-Fruit-E52p2', 'Fresh Fruit', 'Fresh Fruit', '2020-06-26 09:54:21', '2020-06-26 09:54:21'),
(458, 192, 'Mushrooms', 'Mushrooms-P2uBE', 'Mushrooms', 'Mushrooms', '2020-06-26 09:55:04', '2020-06-26 09:55:04'),
(459, 192, 'Salad', 'Salad-RXhUl', 'Salad', 'Salad', '2020-06-26 09:55:40', '2020-06-26 09:55:40'),
(460, 193, 'Convenience Food', 'Convenience-Food-ilS4k', 'Convenience Food', 'Convenience Food', '2020-06-26 10:04:30', '2020-06-26 10:04:30'),
(461, 193, 'Egg', 'Egg-PcVzr', 'Egg', 'Egg', '2020-06-26 10:05:08', '2020-06-26 10:05:08'),
(462, 193, 'Frozen Desserts', 'Frozen-Desserts-KKrbY', 'Frozen Desserts', 'Frozen Desserts', '2020-06-26 10:05:44', '2020-06-26 10:05:44'),
(463, 193, 'Ice Cream', 'Ice-Cream-0UmQk', 'Ice Cream', 'Ice Cream', '2020-06-26 10:11:05', '2020-06-26 10:11:05'),
(464, 193, 'Meat', 'Meat-3gM32', 'Meat', 'Meat', '2020-06-26 10:12:15', '2020-06-26 10:12:15'),
(465, 193, 'Fish', 'Fish-eqVzI', 'Fish', 'Fish', '2020-06-26 10:12:58', '2020-06-26 10:12:58'),
(466, 193, 'Mock Meat & Seafood', 'Mock-Meat--Seafood-g8swY', 'Mock Meat & Seafood', 'Mock Meat & Seafood', '2020-06-26 10:14:14', '2020-06-26 10:14:14'),
(467, 193, 'Other Frozen Foods', 'Other-Frozen-Foods-LV86l', 'Other Frozen Foods', 'Other Frozen Foods', '2020-06-26 10:15:22', '2020-06-26 10:15:22'),
(468, 195, 'Air Care', 'Air-Care-wPORN', 'Air Care', 'Air Care', '2020-06-26 10:17:00', '2020-06-26 10:17:00'),
(469, 195, 'Cleaning', 'Cleaning-jXQa9', 'Cleaning', 'Cleaning', '2020-06-26 10:17:35', '2020-06-26 10:17:35'),
(470, 195, 'Detergent', 'Detergent-KJaTw', 'Detergent', 'Detergent', '2020-06-26 10:18:32', '2020-06-26 10:18:32'),
(471, 195, 'Dish-washing', 'Dish-washing-fmsDC', 'Dish-washing', 'Dish-washing', '2020-06-26 10:21:05', '2020-06-26 10:21:05'),
(472, 195, 'Paper', 'Paper-z9x9H', 'Paper', 'Paper', '2020-06-26 10:21:38', '2020-06-26 10:21:38'),
(473, 195, 'Pest Control', 'Pest-Control-KHpXK', 'Pest Control', 'Pest Control', '2020-06-26 10:22:35', '2020-06-26 10:22:35'),
(474, 195, 'Sundries', 'Sundries-B314w', 'Sundries', 'Sundries', '2020-06-26 10:23:13', '2020-06-26 10:23:13'),
(475, 196, 'Charcoal', 'Charcoal-3FGp4', 'Charcoal', 'Charcoal', '2020-06-26 10:25:24', '2020-06-26 10:25:24'),
(476, 196, 'Foil Paper', 'Foil-Paper-nfjZ7', 'Foil Paper', 'Foil Paper', '2020-06-26 10:26:16', '2020-06-26 10:26:16'),
(477, 196, 'Shopping Bag', 'Shopping-Bag-6j6sS', 'Shopping Bag', 'Shopping Bag', '2020-06-26 10:26:57', '2020-06-26 10:26:57'),
(478, 197, 'Biscuit  & Cookies', 'Biscuit---Cookies-kNRC9', 'Biscuit  & Cookies', 'Biscuit  & Cookies', '2020-06-26 10:29:41', '2020-06-26 10:29:41'),
(479, 197, 'Bread sticks', 'Bread-sticks-CGw4B', 'Bread sticks', 'Bread sticks', '2020-06-26 10:31:49', '2020-06-26 10:31:49'),
(480, 197, 'Chips & Crisps', 'Chips--Crisps-O8ORG', 'Chips & Crisps', 'Chips & Crisps', '2020-06-26 10:33:25', '2020-06-26 10:33:25'),
(483, 199, 'Fish', 'Fish-auzYH', 'Fish', 'Fish', '2020-06-28 08:41:56', '2020-06-28 08:41:56'),
(484, 199, 'Meat', 'Meat-p3wxa', 'Meat', 'Meat', '2020-06-28 08:42:25', '2020-06-28 08:42:25'),
(485, 199, 'Chicken', 'Chicken-WupZO', 'Chicken', 'Chicken', '2020-06-28 08:42:49', '2020-06-28 08:42:49'),
(486, 197, 'Dips', 'Dips-m2S6v', 'Dips', 'Dips', '2020-06-29 07:01:42', '2020-06-29 07:01:42'),
(487, 197, 'Dried Fruit & Vegetable', 'Dried-Fruit--Vegetable-8FDvN', 'Dried Fruit & Vegetable', 'Dried Fruit & Vegetable', '2020-06-29 07:02:23', '2020-06-29 07:02:23'),
(488, 197, 'Indian Snacks', 'Indian-Snacks-Q6WFT', 'Indian Snacks', 'Indian Snacks', '2020-06-29 07:02:58', '2020-06-29 07:02:58'),
(489, 197, 'Mayonnaise & Butter', 'Mayonnaise--Butter-bGgar', 'Mayonnaise & Butter', 'Mayonnaise & Butter', '2020-06-29 07:03:41', '2020-06-29 07:03:41'),
(490, 197, 'Muri & Chira', 'Muri--Chira-z7szz', 'Muri & Chira', 'Muri & Chira', '2020-06-29 07:04:40', '2020-06-29 07:04:40'),
(491, 197, 'Noodles & Pasta', 'Noodles--Pasta-PC6Q0', 'Noodles & Pasta', 'Noodles & Pasta', '2020-06-29 07:05:06', '2020-06-29 07:05:06'),
(492, 197, 'Nuts', 'Nuts-hZmjX', 'Nuts', 'Nuts', '2020-06-29 07:05:34', '2020-06-29 07:05:34'),
(493, 197, 'Others Snacks', 'Others-Snacks-Waux5', 'Others Snacks', 'Others Snacks', '2020-06-29 07:06:18', '2020-06-29 07:06:18'),
(494, 197, 'Pan masala', 'Pan-masala-CHDe0', 'Pan masala', 'Pan masala', '2020-06-29 07:06:54', '2020-06-29 07:06:54'),
(495, 197, 'Popcorn', 'Popcorn-Z4htE', 'Popcorn', 'Popcorn', '2020-06-29 07:07:20', '2020-06-29 07:07:20'),
(496, 197, 'Pretzels', 'Pretzels-T79oL', 'Pretzels', 'Pretzels', '2020-06-29 07:07:48', '2020-06-29 07:07:48'),
(497, 197, 'Sauces & Pickles', 'Sauces--Pickles-pUSp3', 'Sauces & Pickles', 'Sauces & Pickles', '2020-06-29 07:08:28', '2020-06-29 07:08:28'),
(498, 197, 'Seaweed Laver', 'Seaweed-Laver-peE52', 'Seaweed Laver', 'Seaweed Laver', '2020-06-29 07:09:07', '2020-06-29 07:09:07'),
(499, 197, 'Shemal', 'Shemal-6YP61', 'Shemal', 'Shemal', '2020-06-29 07:09:39', '2020-06-29 07:09:39'),
(500, 197, 'Soups', 'Soups-8MARl', 'Soups', 'Soups', '2020-06-29 07:10:05', '2020-06-29 07:10:05'),
(501, 197, 'Wafers', 'Wafers-Tu9s3', 'Wafers', 'Wafers', '2020-06-29 07:10:30', '2020-06-29 07:10:30'),
(502, 269, 'Tasbih', 'Tasbih-ImbOI', 'Tasbih', 'Tasbih', '2020-07-04 01:37:45', '2020-07-04 01:37:45'),
(503, 267, 'Ceiling Lights', 'Ceiling-Lights-vuafd', 'Ceiling Lights', 'Ceiling Lights', '2020-07-04 01:38:42', '2020-07-04 02:10:18'),
(504, 267, 'Chandeliers', 'Chandeliers-gqHLr', 'Chandeliers', 'Chandeliers', '2020-07-04 02:11:50', '2020-07-04 02:11:50'),
(505, 267, 'Floor Lamps', 'Floor-Lamps-mt5tb', 'Floor Lamps', 'Floor Lamps', '2020-07-04 02:12:33', '2020-07-04 02:12:33'),
(506, 267, 'Hanging Lights', 'Hanging-Lights-4I1T2', 'Hanging Lights', 'Hanging Lights', '2020-07-04 02:13:47', '2020-07-04 02:13:47'),
(507, 267, 'Lanterns', 'Lanterns-mIynF', 'Lanterns', 'Lanterns', '2020-07-04 02:14:23', '2020-07-04 02:14:23'),
(508, 267, 'Light Bulbs', 'Light-Bulbs-70JGg', 'Lanterns', 'Lanterns', '2020-07-04 02:14:55', '2020-07-04 02:14:55'),
(509, 267, 'Outdoor Lighting', 'Outdoor-Lighting-M6oyQ', 'Outdoor Lighting', 'Outdoor Lighting', '2020-07-04 02:15:32', '2020-07-04 02:15:32'),
(510, 267, 'Sensor Light', 'Sensor-Light-OPllg', 'Sensor Light', 'Sensor Light', '2020-07-04 02:16:19', '2020-07-04 02:16:19'),
(511, 267, 'Study Lamps', 'Study-Lamps-L2QYq', 'Study Lamps', 'Study Lamps', '2020-07-04 02:16:55', '2020-07-04 02:16:55'),
(512, 267, 'Table Lamps', 'Table-Lamps-f0BM4', 'Table Lamps', 'Table Lamps', '2020-07-04 02:17:48', '2020-07-04 02:17:48'),
(513, 267, 'Tripod Lamps', 'Tripod-Lamps-fGE4u', 'Tripod Lamps', 'Tripod Lamps', '2020-07-04 02:18:40', '2020-07-04 02:18:40'),
(514, 267, 'Wall Lights', 'Wall-Lights-9LZlp', 'Wall Lights', 'Wall Lights', '2020-07-04 02:19:18', '2020-07-04 02:19:18'),
(515, 271, 'Ice Scoop', 'Ice-Scoop-kGOdW', 'Ice Scoop', 'Ice Scoop', '2020-07-04 02:20:01', '2020-07-04 02:20:01'),
(516, 271, 'Kitchen Organizer', 'Kitchen-Organizer-Dgh7T', 'Kitchen Organizer', 'Kitchen Organizer', '2020-07-04 02:20:58', '2020-07-04 02:20:58'),
(517, 266, 'Lemon Squzeer', 'Lemon-Squzeer-l9meb', 'Lemon Squzeer', 'Lemon Squzeer', '2020-07-04 02:21:46', '2020-07-04 02:21:46'),
(518, 266, 'Loosni', 'Loosni-PSvNz', 'Loosni', 'Loosni', '2020-07-04 02:23:27', '2020-07-04 02:23:27'),
(519, 271, 'Masaladani', 'Masaladani-onDkv', 'Masaladani', 'Masaladani', '2020-07-04 02:24:00', '2020-07-04 02:24:00'),
(520, 271, 'Oil Jar', 'Oil-Jar-6sXEb', 'Masaladani', 'Masaladani', '2020-07-04 02:24:34', '2020-07-04 02:24:34'),
(521, 266, 'Potato Chipper', 'Potato-Chipper-GFK3V', 'Potato Chipper', 'Potato Chipper', '2020-07-04 02:25:15', '2020-07-04 02:25:15'),
(522, 266, 'Scourer', 'Scourer-1i1Ff', 'Scourer', 'Scourer', '2020-07-04 02:25:50', '2020-07-04 02:25:50'),
(523, 259, 'Coaster', 'Coaster-OcfVg', 'Scourer', 'Scourer', '2020-07-04 02:26:53', '2020-07-04 02:26:53'),
(524, 259, 'Cutlery & Utensils', 'Cutlery--Utensils-scFQh', 'Cutlery & Utensils', 'Cutlery & Utensils', '2020-07-04 02:27:41', '2020-07-04 02:27:41'),
(525, 259, 'Napkin Holders', 'Napkin-Holders-M4LHf', 'Napkin Holders', 'Napkin Holders', '2020-07-04 02:28:20', '2020-07-04 02:29:54'),
(526, 259, 'Show Plates & Bowls', 'Show-Plates--Bowls-iRv9W', 'Show Plates & Bowls', 'Show Plates & Bowls', '2020-07-04 02:29:34', '2020-07-04 02:29:34'),
(527, 259, 'Spoon Set Stand', 'Spoon-Set-Stand-renNX', 'Spoon Set Stand', 'Spoon Set Stand', '2020-07-04 02:30:28', '2020-07-04 02:30:28'),
(528, 259, 'Table Cloth', 'Table-Cloth-C37pi', 'Table Cloth', 'Table Cloth', '2020-07-04 02:30:55', '2020-07-04 02:30:55'),
(529, 259, 'Table Mat & Runner', 'Table-Mat--Runner-AguS4', 'Table Mat & Runner', 'Table Mat & Runner', '2020-07-04 02:31:39', '2020-07-04 02:31:39'),
(530, 261, 'Bath Linen', 'Bath-Linen-5u5kp', 'Bath Linen', 'Bath Linen', '2020-07-04 07:09:33', '2020-07-04 07:09:33'),
(531, 261, 'Bed Sheets', 'Bed-Sheets-Rv0ds', 'Bed Sheets', 'Bed Sheets', '2020-07-04 07:10:06', '2020-07-04 07:10:06'),
(532, 261, 'Bedding', 'Bedding-sNM78', 'Bedding', 'Bedding', '2020-07-04 07:11:00', '2020-07-04 07:11:00'),
(533, 261, 'Bolsters', 'Bolsters-yHqs7', 'Bolsters', 'Bolsters', '2020-07-04 07:11:32', '2020-07-04 07:11:32'),
(534, 261, 'Carpet & Area Rugs', 'Carpet--Area-Rugs-PpWxO', 'Carpet & Area Rugs', 'Carpet & Area Rugs', '2020-07-04 07:12:16', '2020-07-04 07:12:16'),
(535, 261, 'Chair Pads', 'Chair-Pads-ylH3O', 'Chair Pads', 'Chair Pads', '2020-07-04 07:12:52', '2020-07-04 07:12:52'),
(536, 261, 'Curtains & Blinds', 'Curtains--Blinds-wnTmS', 'Curtains & Blinds', 'Curtains & Blinds', '2020-07-04 07:13:33', '2020-07-04 07:13:33'),
(537, 261, 'Cushions', 'Cushions-RMXRq', 'Cushions', 'Cushions', '2020-07-04 07:14:09', '2020-07-04 07:14:09'),
(538, 261, 'Divan Sets', 'Divan-Sets-h4OPA', 'Divan Sets', 'Divan Sets', '2020-07-04 07:14:53', '2020-07-04 07:14:53'),
(539, 261, 'Flooring', 'Flooring-odRbu', 'Flooring', 'Flooring', '2020-07-04 07:15:32', '2020-07-04 07:15:32'),
(540, 261, 'Mattresses', 'Mattresses-bHnVF', 'Mattresses', 'Mattresses', '2020-07-04 07:16:09', '2020-07-04 07:16:09'),
(541, 261, 'Pillows', 'Pillows-t8P1G', 'Pillows', 'Pillows', '2020-07-04 07:16:37', '2020-07-04 07:16:37'),
(542, 261, 'Towels', 'Towels-O3WlY', 'Towels', 'Towels', '2020-07-04 07:17:04', '2020-07-04 07:17:04'),
(543, 263, 'Art & Paintings', 'Art--Paintings-8tnIx', 'Art & Paintings', 'Art & Paintings', '2020-07-04 07:18:08', '2020-07-04 07:18:08'),
(544, 263, 'Candles & Tea Lights', 'Candles--Tea-Lights-wAVOY', 'Candles & Tea Lights', 'Candles & Tea Lights', '2020-07-04 07:18:46', '2020-07-04 07:18:46'),
(545, 263, 'Clocks', 'Clocks-FodLZ', 'Clocks', 'Clocks', '2020-07-04 07:19:12', '2020-07-04 07:19:12'),
(546, 263, 'Garden Decors', 'Garden-Decors-eeHCb', 'Garden Decors', 'Garden Decors', '2020-07-04 07:19:49', '2020-07-04 07:19:49'),
(547, 263, 'Home & Living Mirrors', 'Home--Living-Mirrors-fJcX1', 'Home & Living Mirrors', 'Home & Living Mirrors', '2020-07-04 07:20:28', '2020-07-04 07:20:28'),
(548, 263, 'Home Fragrances', 'Home-Fragrances-2kEIM', 'Home Fragrances', 'Home Fragrances', '2020-07-04 07:21:55', '2020-07-04 07:21:55'),
(549, 263, 'Interior Ceiling Decoration', 'Interior-Ceiling-Decoration-8h1Tt', 'Interior Ceiling Decoration', 'Interior Ceiling Decoration', '2020-07-04 07:22:39', '2020-07-04 07:22:39'),
(550, 263, 'Key Holders', 'Key-Holders-hJWsZ', 'Key Holders', 'Key Holders', '2020-07-04 07:23:31', '2020-07-04 07:23:31'),
(551, 263, 'Name Plates', 'Name-Plates-88Ovp', 'Name Plates', 'Name Plates', '2020-07-04 07:23:59', '2020-07-04 07:23:59'),
(552, 263, 'Pots & Planters', 'Pots--Planters-3ysHM', 'Pots & Planters', 'Pots & Planters', '2020-07-04 07:24:37', '2020-07-04 07:24:37'),
(553, 263, 'Screens & Dividers', 'Screens--Dividers-EeaqI', 'Screens & Dividers', 'Screens & Dividers', '2020-07-04 07:25:20', '2020-07-04 07:25:20'),
(554, 263, 'Showpieces', 'Showpieces-EVWuw', 'Showpieces', 'Showpieces', '2020-07-04 07:25:48', '2020-07-04 07:25:48'),
(555, 263, 'Vases & Flowers', 'Vases--Flowers-m3CvR', 'Vases & Flowers', 'Vases & Flowers', '2020-07-04 07:26:34', '2020-07-04 07:26:34'),
(556, 263, 'Wall Accents', 'Wall-Accents-jI0UX', 'Wall Accents', 'Wall Accents', '2020-07-04 07:27:29', '2020-07-04 07:27:29'),
(557, 263, 'Wall Art', 'Wall-Art-9jGte', 'Wall Art', 'Wall Art', '2020-07-04 07:30:52', '2020-07-04 07:30:52'),
(558, 263, 'Wall Shelves', 'Wall-Shelves-RoExp', 'Wall Shelves', 'Wall Shelves', '2020-07-04 07:31:21', '2020-07-04 07:31:21'),
(559, 263, 'Wallpapers', 'Wallpapers-cEZUU', 'Wallpapers', 'Wallpapers', '2020-07-04 07:32:31', '2020-07-04 07:32:31'),
(560, 265, 'Ash Trays', 'Ash-Trays-whplw', 'Ash Trays', 'Ash Trays', '2020-07-04 07:33:34', '2020-07-04 07:33:34'),
(561, 265, 'Cleaning', 'Cleaning-1izZZ', 'Cleaning', 'Cleaning', '2020-07-04 07:35:03', '2020-07-04 07:35:03'),
(562, 263, 'Cloth Dryers', 'Cloth-Dryers-Kkxne', 'Cloth Dryers', 'Cloth Dryers', '2020-07-04 07:35:31', '2020-07-04 07:35:31'),
(563, 265, 'Food Container', 'Food-Container-mPAUP', 'Food Container', 'Food Container', '2020-07-04 07:36:34', '2020-07-04 07:36:34'),
(564, 265, 'Glass Cleaner Wipers', 'Glass-Cleaner-Wipers-xxlxX', 'Glass Cleaner Wipers', 'Glass Cleaner Wipers', '2020-07-04 07:39:13', '2020-07-04 07:39:13'),
(565, 265, 'Home Organizers', 'Home-Organizers-GhJtn', 'Home Organizers', 'Home Organizers', '2020-07-04 07:39:55', '2020-07-04 07:39:55'),
(566, 265, 'Home Pest Control', 'Home-Pest-Control-GtdxY', 'Home Pest Control', 'Home Pest Control', '2020-07-04 07:40:33', '2020-07-04 07:40:33'),
(567, 265, 'Home Safety', 'Home-Safety-aXRxL', 'Home Safety', 'Home Safety', '2020-07-04 07:41:12', '2020-07-04 07:41:12'),
(568, 265, 'Home Storage', 'Home-Storage-hnzbb', 'Home Storage', 'Home Storage', '2020-07-04 07:41:40', '2020-07-04 07:41:40'),
(569, 265, 'Ironing', 'Ironing-443kq', 'Ironing', 'Ironing', '2020-07-04 07:42:14', '2020-07-04 07:42:14'),
(570, 265, 'Kitchen Storage', 'Kitchen-Storage-1LxgL', 'Kitchen Storage', 'Kitchen Storage', '2020-07-04 07:42:52', '2020-07-04 07:42:52'),
(571, 265, 'Laundry & Household', 'Laundry--Household-NYnvx', 'Laundry & Household', 'Laundry & Household', '2020-07-04 07:44:02', '2020-07-04 07:44:02'),
(572, 265, 'Lighters', 'Lighters-6uLAw', 'Lighters', 'Lighters', '2020-07-04 07:44:32', '2020-07-04 07:44:32'),
(573, 265, 'Mosquito Nets', 'Mosquito-Nets-AbGsC', 'Mosquito Nets', 'Mosquito Nets', '2020-07-04 07:45:07', '2020-07-04 07:45:07'),
(574, 265, 'Scissors', 'Scissors-FhDZH', 'Scissors', 'Scissors', '2020-07-04 07:45:44', '2020-07-04 07:45:44'),
(575, 265, 'Screwdrivers & Nut drivers', 'Screwdrivers--Nut-drivers-ceuwb', 'Screwdrivers & Nut drivers', 'Screwdrivers & Nut drivers', '2020-07-04 07:46:46', '2020-07-04 07:46:46'),
(576, 265, 'Sewing Accessories', 'Sewing-Accessories-nj1fU', 'Sewing Accessories', 'Sewing Accessories', '2020-07-04 07:47:23', '2020-07-04 07:47:23'),
(577, 265, 'Sewing Machine', 'Sewing-Machine-9QQKF', 'Sewing Machine', 'Sewing Machine', '2020-07-04 07:47:48', '2020-07-04 07:47:48'),
(578, 265, 'Shoe Racks', 'Shoe-Racks-XW2pd', 'Shoe Racks', 'Shoe Racks', '2020-07-04 07:48:19', '2020-07-04 07:48:19'),
(579, 265, 'Show Pieces', 'Show-Pieces-MAEp8', 'Show Pieces', 'Show Pieces', '2020-07-04 07:49:27', '2020-07-04 07:49:27'),
(580, 265, 'Soap Case', 'Soap-Case-EivTl', 'Soap Case', 'Soap Case', '2020-07-04 07:50:09', '2020-07-04 07:50:09'),
(581, 265, 'Step Ladders & Stools', 'Step-Ladders--Stools-pytCA', 'Step Ladders & Stools', 'Step Ladders & Stools', '2020-07-04 07:50:52', '2020-07-04 07:50:52'),
(582, 265, 'Tissue Box', 'Tissue-Box-6MkWx', 'Tissue Box', 'Tissue Box', '2020-07-04 07:51:20', '2020-07-04 07:51:20'),
(583, 265, 'Toilet Cleaners', 'Toilet-Cleaners-hNmaU', 'Toilet Cleaners', 'Toilet Cleaners', '2020-07-04 07:51:59', '2020-07-04 07:51:59'),
(584, 265, 'Umbrellas', 'Umbrellas-pYgXf', 'Umbrellas', 'Umbrellas', '2020-07-04 07:52:34', '2020-07-04 07:52:34'),
(585, 265, 'Weighing Scales', 'Weighing-Scales-ousFj', 'Weighing Scales', 'Weighing Scales', '2020-07-04 07:53:01', '2020-07-04 07:53:01'),
(586, 270, 'Laptop', 'Laptop-ePJfK', 'Laptop', 'Laptop', '2020-07-04 07:54:28', '2020-07-04 07:54:28'),
(587, 270, 'Mobile, Computer Electronics and accessories', 'Mobile-Computer-Electronics-and-accessories-hMyI0', 'Mobile, Computer Electronics and accessories', 'Mobile, Computer Electronics and accessories', '2020-07-04 07:55:43', '2020-07-04 07:55:43'),
(588, 270, 'Television', 'Television-5F69s', 'Television', 'Television', '2020-07-04 07:56:09', '2020-07-04 07:56:09'),
(589, 271, 'Air Fryer', 'Air-Fryer-Ndryq', 'Air Fryer', 'Air Fryer', '2020-07-04 07:57:09', '2020-07-04 07:57:09'),
(590, 266, 'BBQ Makers', 'BBQ-Makers-U0Wa1', 'BBQ Makers', 'BBQ Makers', '2020-07-04 07:58:03', '2020-07-04 07:58:03'),
(591, 266, 'Blender, Mixer & Grinder', 'Blender-Mixer--Grinder-k3VwR', 'Blender, Mixer & Grinder', 'Blender, Mixer & Grinder', '2020-07-04 07:58:52', '2020-07-04 07:58:52'),
(592, 266, 'Cake Maker', 'Cake-Maker-hiDq5', 'Cake Maker', 'Cake Maker', '2020-07-04 07:59:19', '2020-07-04 07:59:19'),
(593, 266, 'Coffee Maker', 'Coffee-Maker-uCKgB', 'Coffee Maker', 'Coffee Maker', '2020-07-04 07:59:50', '2020-07-04 07:59:50'),
(594, 271, 'Dishwasher', 'Dishwasher-cmS1G', 'Dishwasher', 'Dishwasher', '2020-07-04 08:00:26', '2020-07-04 08:00:26'),
(595, 271, 'Doi maker', 'Doi-maker-xSHO8', 'Doi maker', 'Doi maker', '2020-07-04 08:01:16', '2020-07-04 08:01:16'),
(596, 266, 'Electric Kettle', 'Electric-Kettle-fKlIr', 'Electric Kettle', 'Electric Kettle', '2020-07-04 08:01:52', '2020-07-04 08:01:52'),
(597, 271, 'Flask', 'Flask-P3aKG', 'Flask', 'Flask', '2020-07-04 08:02:21', '2020-07-04 08:02:21'),
(598, 266, 'Grills & Tandooris maker', 'Grills--Tandooris-maker-ue02Q', 'Grills & Tandooris maker', 'Grills & Tandooris maker', '2020-07-04 08:03:20', '2020-07-04 08:03:20'),
(599, 271, 'Ice maker', 'Ice-maker-tDaDq', 'Ice maker', 'Ice maker', '2020-07-04 08:04:06', '2020-07-04 08:04:06'),
(600, 271, 'Juice Maker', 'Juice-Maker-eOokv', 'Juice Maker', 'Juice Maker', '2020-07-04 08:04:34', '2020-07-04 08:04:34'),
(601, 271, 'Other Kitchen Accessories', 'Other-Kitchen-Accessories-6gtLX', 'Other Kitchen Accessories', 'Other Kitchen Accessories', '2020-07-04 08:05:10', '2020-07-04 08:05:10'),
(602, 271, 'Popcorn Maker', 'Popcorn-Maker-2PIKw', 'Popcorn Maker', 'Popcorn Maker', '2020-07-04 08:05:40', '2020-07-04 08:05:40'),
(603, 271, 'Pressure Cookers', 'Pressure-Cookers-wDjkf', 'Pressure Cookers', 'Pressure Cookers', '2020-07-04 08:06:11', '2020-07-04 08:06:11'),
(604, 266, 'Rice Cookers', 'Rice-Cookers-pALPV', 'Rice Cookers', 'Rice Cookers', '2020-07-04 08:06:50', '2020-07-04 08:06:50'),
(605, 266, 'Roti Maker', 'Roti-Maker-dUzl9', 'Roti Maker', 'Roti Maker', '2020-07-04 08:07:12', '2020-07-04 08:07:12'),
(606, 266, 'Sandwich Maker', 'Sandwich-Maker-LEvT3', 'Sandwich Maker', 'Sandwich Maker', '2020-07-04 08:07:47', '2020-07-04 08:07:47'),
(607, 266, 'Slicer & Steamers', 'Slicer--Steamers-wScgX', 'Slicer & Steamers', 'Slicer & Steamers', '2020-07-04 08:08:29', '2020-07-04 08:08:29'),
(608, 271, 'Toaster', 'Toaster-zSNqc', 'Toaster', 'Toaster', '2020-07-04 08:08:55', '2020-07-04 08:08:55'),
(609, 266, 'Water Purifiers', 'Water-Purifiers-GtXQ9', 'Water Purifiers', 'Water Purifiers', '2020-07-04 08:09:25', '2020-07-04 08:09:25'),
(610, 272, 'Air Condition', 'Air-Condition-aOfNA', 'Air Condition', 'Air Condition', '2020-07-04 08:10:26', '2020-07-04 08:10:26'),
(611, 272, 'Air Purifiers', 'Air-Purifiers-N3dQA', 'Air Purifiers', 'Air Purifiers', '2020-07-04 08:11:22', '2020-07-04 08:11:22'),
(612, 272, 'Frezzer', 'Frezzer-6tvC2', 'Frezzer', 'Frezzer', '2020-07-04 08:11:47', '2020-07-04 08:11:47'),
(613, 272, 'Geysers', 'Geysers-Vm98t', 'Geysers', 'Geysers', '2020-07-04 08:12:20', '2020-07-04 08:12:20'),
(614, 272, 'Hoods', 'Hoods-iz5YR', 'Hoods', 'Hoods', '2020-07-04 08:12:56', '2020-07-04 08:12:56'),
(615, 272, 'IPS & UPS', 'IPS--UPS-8OP6l', 'Hoods', 'Hoods', '2020-07-04 08:13:22', '2020-07-04 08:13:22'),
(616, 272, 'Oven', 'Oven-P9Rr5', 'Oven', 'Oven', '2020-07-04 08:13:48', '2020-07-04 08:13:48'),
(617, 272, 'Refrigerator', 'Refrigerator-youTF', 'Refrigerator', 'Refrigerator', '2020-07-04 08:14:29', '2020-07-04 08:14:29'),
(618, 272, 'Security Safe', 'Security-Safe-Ywg0o', 'Security Safe', 'Security Safe', '2020-07-04 08:15:14', '2020-07-04 08:15:14'),
(619, 272, 'Washing Machine', 'Washing-Machine-hsojb', 'Washing Machine', 'Washing Machine', '2020-07-04 08:15:41', '2020-07-04 08:15:41'),
(620, 273, 'Electronics and accessories', 'Electronics-and-accessories-CTaAZ', 'Electronics and accessories', 'Electronics and accessories', '2020-07-04 08:16:41', '2020-07-04 08:16:41'),
(621, 273, 'Electronics food Carrier', 'Electronics-food-Carrier-b9sFR', 'Electronics food Carrier', 'Electronics food Carrier', '2020-07-04 08:17:31', '2020-07-04 08:17:31'),
(622, 273, 'Irons', 'Irons-i6skn', 'Irons', 'Irons', '2020-07-04 08:17:59', '2020-07-04 08:17:59'),
(623, 273, 'Vacuum Cleaners', 'Vacuum-Cleaners-9Qbiq', 'Vacuum Cleaners', 'Vacuum Cleaners', '2020-07-04 08:18:43', '2020-07-04 08:18:43'),
(624, 273, 'Voltage Stabilizer', 'Voltage-Stabilizer-vqx99', 'Voltage Stabilizer', 'Voltage Stabilizer', '2020-07-04 08:19:17', '2020-07-04 08:19:17'),
(625, 273, 'Water Heater', 'Water-Heater-LAeW6', 'Water Heater', 'Water Heater', '2020-07-04 08:19:43', '2020-07-04 08:19:43'),
(626, 286, 'Anklet', 'Anklet-9Oitb', 'Anklet', 'Anklet', '2020-07-04 09:09:01', '2020-07-04 09:09:01'),
(627, 286, 'Bangles', 'Bangles-UIXO0', 'Bangles', 'Bangles', '2020-07-04 09:09:30', '2020-07-04 09:09:30'),
(628, 286, 'Bracelets', 'Bracelets-aCe7w', 'Bracelets', 'Bracelets', '2020-07-04 09:10:00', '2020-07-04 09:10:00'),
(629, 286, 'Earrings', 'Earrings-1foOb', 'Earrings', 'Earrings', '2020-07-04 09:10:21', '2020-07-04 09:10:21'),
(630, 286, 'Full Set', 'Full-Set-OU1yv', 'Full Set', 'Full Set', '2020-07-04 09:10:44', '2020-07-04 09:10:44'),
(631, 286, 'Locket', 'Locket-45bQo', 'Locket', 'Locket', '2020-07-04 09:11:02', '2020-07-04 09:11:02'),
(632, 286, 'Necklaces', 'Necklaces-iepmx', 'Necklaces', 'Necklaces', '2020-07-04 09:11:23', '2020-07-04 09:11:23'),
(633, 286, 'Nosepins', 'Nosepins-gSToZ', 'Nosepins', 'Nosepins', '2020-07-04 09:12:02', '2020-07-04 09:12:02'),
(634, 286, 'pendants Sets', 'pendants-Sets-NhcdU', 'pendants Sets', 'pendants Sets', '2020-07-04 09:12:32', '2020-07-04 09:12:32'),
(635, 286, 'Rings', 'Rings-pKWPY', 'Rings', 'Rings', '2020-07-04 09:13:07', '2020-07-04 09:13:07'),
(636, 286, 'Tanmaniya', 'Tanmaniya-8XVXN', 'Tanmaniya', 'Tanmaniya', '2020-07-04 09:13:36', '2020-07-04 09:13:36'),
(637, 287, 'Anklet', 'Anklet-xk0cn', 'Anklet', 'Anklet', '2020-07-04 09:14:13', '2020-07-04 09:14:13'),
(638, 287, 'Bangles', 'Bangles-6wtG6', 'Bangles', 'Bangles', '2020-07-04 09:14:51', '2020-07-04 09:14:51'),
(639, 287, 'Bracelets', 'Bracelets-4ZH6R', 'Bracelets', 'Bracelets', '2020-07-04 09:15:18', '2020-07-04 09:15:18'),
(640, 287, 'Chains', 'Chains-P7PB6', 'Chains', 'Chains', '2020-07-04 09:15:42', '2020-07-04 09:15:42'),
(641, 287, 'Earrings', 'Earrings-AwkyA', 'Earrings', 'Earrings', '2020-07-04 09:16:12', '2020-07-04 09:16:12'),
(642, 287, 'Full Set', 'Full-Set-vEY5Z', 'Full Set', 'Full Set', '2020-07-04 09:16:39', '2020-07-04 09:16:39'),
(643, 287, 'Gold Coin', 'Gold-Coin-Ab0bp', 'Gold Coin', 'Gold Coin', '2020-07-04 09:17:09', '2020-07-04 09:17:09'),
(644, 287, 'Necklaces', 'Necklaces-KOB43', 'Necklaces', 'Necklaces', '2020-07-04 09:17:36', '2020-07-04 09:17:36'),
(645, 287, 'Nosepins', 'Nosepins-2BhXC', 'Nosepins', 'Nosepins', '2020-07-04 09:18:01', '2020-07-04 09:18:01'),
(646, 287, 'Pendants Set', 'Pendants-Set-5SoXw', 'pendants Sets', 'Pendants Set', '2020-07-04 09:18:35', '2020-07-04 09:18:35'),
(647, 287, 'Rings', 'Rings-K0HR6', 'Rings', 'Rings', '2020-07-04 09:19:26', '2020-07-04 09:19:26'),
(648, 287, 'Tikli', 'Tikli-NUDKk', 'Tikli', 'Tikli', '2020-07-04 09:20:16', '2020-07-04 09:20:16'),
(649, 288, 'Anklet', 'Anklet-NLBBr', 'Anklet', 'Anklet', '2020-07-04 09:34:25', '2020-07-04 09:34:25'),
(650, 288, 'Bangles', 'Bangles-MutJr', 'Bangles', 'Bangles', '2020-07-04 09:34:47', '2020-07-04 09:34:47'),
(651, 288, 'Bracelets', 'Bracelets-88Kb4', 'Bracelets', 'Bracelets', '2020-07-04 09:35:04', '2020-07-04 09:35:04'),
(652, 288, 'Chains', 'Chains-N3JO2', 'Chains', 'Chains', '2020-07-04 09:35:25', '2020-07-04 09:35:25'),
(653, 288, 'Earrings', 'Earrings-cAmaC', 'Earrings', 'Earrings', '2020-07-04 09:35:52', '2020-07-04 09:35:52'),
(654, 288, 'Full set', 'Full-set-m0usg', 'Full Set', 'Full set', '2020-07-04 09:36:10', '2020-07-04 09:36:10'),
(655, 288, 'Necklaces', 'Necklaces-TIg1r', 'Necklaces', 'Necklaces', '2020-07-04 09:36:31', '2020-07-04 09:36:31'),
(656, 288, 'Nosepins', 'Nosepins-6P6CK', 'Nosepins', 'Nosepins', '2020-07-04 09:36:47', '2020-07-04 09:36:47'),
(657, 288, 'Pendants', 'Pendants-kaXtB', 'Pendants', 'Pendants', '2020-07-04 09:37:19', '2020-07-04 09:37:19'),
(658, 288, 'Rings', 'Rings-0vxeY', 'Rings', 'Rings', '2020-07-04 09:37:39', '2020-07-04 09:37:39'),
(659, 288, 'Tiklis', 'Tiklis-IhCHn', 'Tiklis', 'Tiklis', '2020-07-04 09:38:24', '2020-07-04 09:38:24'),
(660, 289, 'Anklet', 'Anklet-JD7mP', 'Anklet', 'Anklet', '2020-07-04 09:39:13', '2020-07-04 09:39:13'),
(661, 289, 'Bangles', 'Bangles-schNw', 'Bangles', 'Bangles', '2020-07-04 09:39:30', '2020-07-04 09:39:30'),
(662, 289, 'Bracelets', 'Bracelets-Y6f7w', 'Bracelets', 'Bracelets', '2020-07-04 09:39:51', '2020-07-04 09:39:51'),
(663, 289, 'Chains', 'Chains-xU4rU', 'Chains', 'Chains', '2020-07-04 09:40:08', '2020-07-04 09:40:08'),
(664, 289, 'Earrings', 'Earrings-jybQ8', 'Earrings', 'Earrings', '2020-07-04 09:40:31', '2020-07-04 09:40:31'),
(665, 289, 'Full set', 'Full-set-50gR9', 'Full Set', 'Full set', '2020-07-04 09:40:52', '2020-07-04 09:40:52'),
(666, 289, 'Necklaces', 'Necklaces-hFFSI', 'Necklaces', 'Necklaces', '2020-07-04 09:41:12', '2020-07-04 09:41:12'),
(667, 289, 'Nosepins', 'Nosepins-WGSMn', 'Nosepins', 'Nosepins', '2020-07-04 09:41:33', '2020-07-04 09:41:33'),
(668, 289, 'Pendants', 'Pendants-4kZgn', 'Pendants', 'Pendants', '2020-07-04 09:41:51', '2020-07-04 09:41:51'),
(669, 289, 'Rings', 'Rings-DVQTg', 'Rings', 'Rings', '2020-07-04 09:42:15', '2020-07-04 09:42:15'),
(670, 289, 'Tiklis', 'Tiklis-Di3Qf', 'Tiklis', 'Tiklis', '2020-07-04 09:42:33', '2020-07-04 09:42:33'),
(671, 292, 'Anklet', 'Anklet-zTUGv', 'Anklet', 'Anklet', '2020-07-04 09:43:46', '2020-07-04 09:43:46'),
(672, 292, 'Bangles', 'Bangles-BdZW3', 'Bangles', 'Bangles', '2020-07-04 09:45:28', '2020-07-04 09:45:28'),
(673, 292, 'Bracelets', 'Bracelets-Y1jq6', 'Bracelets', 'Bracelets', '2020-07-04 09:45:48', '2020-07-04 09:45:48'),
(674, 292, 'Chains', 'Chains-ZAsE1', 'Chains', 'Chains', '2020-07-04 09:46:36', '2020-07-04 09:46:36'),
(675, 292, 'Earrings', 'Earrings-kdrAp', 'Earrings', 'Earrings', '2020-07-04 09:47:04', '2020-07-04 09:47:04'),
(676, 292, 'Full set', 'Full-set-yMZWR', 'Full set', 'Full set', '2020-07-04 09:47:29', '2020-07-04 09:47:29'),
(677, 292, 'Necklaces', 'Necklaces-JqR3h', 'Necklaces', 'Necklaces', '2020-07-04 09:48:48', '2020-07-04 09:48:48'),
(678, 292, 'Nosepins', 'Nosepins-MJE84', 'Nosepins', 'Nosepins', '2020-07-04 09:49:12', '2020-07-04 09:49:12'),
(679, 292, 'Pendants', 'Pendants-ZcbGR', 'Pendants', 'Pendants', '2020-07-04 09:49:36', '2020-07-04 09:49:36'),
(680, 292, 'Rings', 'Rings-xlF5e', 'Rings', 'Rings', '2020-07-04 09:49:55', '2020-07-04 09:49:55'),
(681, 293, 'Anklet', 'Anklet-gJWnj', 'Anklet', 'Anklet', '2020-07-04 09:50:22', '2020-07-04 09:50:22'),
(682, 293, 'Bangles', 'Bangles-KK5Nh', 'Bangles', 'Bangles', '2020-07-04 09:50:43', '2020-07-04 09:50:43'),
(683, 293, 'Bracelets', 'Bracelets-Lb76C', 'Bracelets', 'Bracelets', '2020-07-04 09:51:13', '2020-07-04 09:51:13'),
(684, 293, 'Chains', 'Chains-sGwPn', 'Chains', 'Chains', '2020-07-04 09:51:34', '2020-07-04 09:51:34'),
(685, 293, 'Earrings', 'Earrings-vsMM0', 'Earrings', 'Earrings', '2020-07-04 09:51:54', '2020-07-04 09:51:54'),
(686, 293, 'Full set', 'Full-set-Iw6gs', 'Full set', 'Full set', '2020-07-04 09:52:17', '2020-07-04 09:52:17'),
(687, 293, 'Necklaces', 'Necklaces-veB05', 'Necklaces', 'Necklaces', '2020-07-04 09:52:33', '2020-07-04 09:52:33'),
(688, 293, 'Nosepins', 'Nosepins-Ld1tw', 'Nosepins', 'Nosepins', '2020-07-04 09:52:50', '2020-07-04 09:52:50'),
(689, 293, 'Pendants', 'Pendants-jGbSP', 'Pendants', 'Pendants', '2020-07-04 09:53:07', '2020-07-04 09:53:07'),
(690, 293, 'Rings', 'Rings-WBw3v', 'Rings', 'Rings', '2020-07-04 09:53:40', '2020-07-04 09:53:40'),
(691, 294, 'Anklet', 'Anklet-IWoxr', 'Anklet', 'Anklet', '2020-07-04 09:54:29', '2020-07-04 09:54:29'),
(692, 294, 'Bangles', 'Bangles-uzFKK', 'Bangles', 'Bangles', '2020-07-04 09:55:47', '2020-07-04 09:55:47'),
(693, 294, 'Bracelets', 'Bracelets-9BR1v', 'Bracelets', 'Bracelets', '2020-07-04 09:56:06', '2020-07-04 09:56:06'),
(694, 294, 'Chains', 'Chains-iV0hf', 'Chains', 'Chains', '2020-07-04 09:56:25', '2020-07-04 09:56:25'),
(695, 294, 'Earrings', 'Earrings-7DEBt', 'Earrings', 'Earrings', '2020-07-04 09:56:41', '2020-07-04 09:56:41'),
(696, 294, 'Full set', 'Full-set-l6oUT', 'Full set', 'Full set', '2020-07-04 09:57:01', '2020-07-04 09:57:01'),
(697, 294, 'Necklaces', 'Necklaces-F98OX', 'Necklaces', 'Necklaces', '2020-07-04 09:57:18', '2020-07-04 09:57:18'),
(698, 294, 'Nosepins', 'Nosepins-dpvmx', 'Nosepins', 'Nosepins', '2020-07-04 09:57:37', '2020-07-04 09:57:37'),
(699, 294, 'Pendants', 'Pendants-4JrkX', 'Pendants', 'Pendants', '2020-07-04 09:57:59', '2020-07-04 09:57:59'),
(700, 294, 'Rings', 'Rings-9qtNh', 'Rings', 'Rings', '2020-07-04 09:58:19', '2020-07-04 09:58:19'),
(701, 295, 'Anklet', 'Anklet-i3KOV', 'Anklet', 'Anklet', '2020-07-04 10:05:50', '2020-07-04 10:05:50'),
(702, 295, 'Bangles', 'Bangles-oFmu0', 'Bangles', 'Bangles', '2020-07-04 10:06:08', '2020-07-04 10:06:08'),
(703, 295, 'Bracelets', 'Bracelets-mRO5t', 'Bracelets', 'Bracelets', '2020-07-04 10:06:27', '2020-07-04 10:06:27'),
(704, 295, 'Chains', 'Chains-LGixv', 'Chains', 'Chains', '2020-07-04 10:06:44', '2020-07-04 10:06:44'),
(705, 295, 'Earrings', 'Earrings-UpP0n', 'Earrings', 'Earrings', '2020-07-04 10:07:02', '2020-07-04 10:07:02'),
(706, 295, 'Full set', 'Full-set-Z68cY', 'Full Set', 'Full set', '2020-07-04 10:07:23', '2020-07-04 10:07:23'),
(707, 295, 'Necklaces', 'Necklaces-YJS8P', 'Necklaces', 'Necklaces', '2020-07-04 10:07:42', '2020-07-04 10:07:42'),
(708, 295, 'Nosepins', 'Nosepins-HsrXq', 'Nosepins', 'Nosepins', '2020-07-04 10:08:04', '2020-07-04 10:08:04'),
(709, 295, 'Pendants', 'Pendants-JzHB8', 'pendants', 'Pendants', '2020-07-04 10:08:29', '2020-07-04 10:08:29'),
(710, 295, 'Rings', 'Rings-tbBc2', 'Rings', 'Rings', '2020-07-04 10:08:51', '2020-07-04 10:08:51'),
(711, 296, 'Anklet', 'Anklet-gg2Y1', 'Anklet', 'Anklet', '2020-07-04 10:09:12', '2020-07-04 10:09:12'),
(712, 296, 'Bangles', 'Bangles-NVElC', 'Bangles', 'Bangles', '2020-07-04 10:09:36', '2020-07-04 10:09:36'),
(713, 296, 'Bracelets', 'Bracelets-9UsIU', 'Bracelets', 'Bracelets', '2020-07-04 10:10:00', '2020-07-04 10:10:00'),
(714, 296, 'Chains', 'Chains-zwcsT', 'Chains', 'Chains', '2020-07-04 10:10:20', '2020-07-04 10:10:20'),
(715, 296, 'Earrings', 'Earrings-KpIEv', 'Earrings', 'Earrings', '2020-07-04 10:10:40', '2020-07-04 10:10:40'),
(716, 296, 'Full set', 'Full-set-w7Vzh', 'Full set', 'Full set', '2020-07-04 10:10:57', '2020-07-04 10:10:57'),
(717, 296, 'Necklaces', 'Necklaces-qH85h', 'Necklaces', 'Necklaces', '2020-07-04 10:11:15', '2020-07-04 10:11:15'),
(718, 296, 'Nosepins', 'Nosepins-nL4th', 'Nosepins', 'Nosepins', '2020-07-04 10:11:42', '2020-07-04 10:11:42'),
(719, 296, 'Pendants', 'Pendants-YUPsq', 'Pendants', 'Pendants', '2020-07-04 10:12:02', '2020-07-04 10:12:02'),
(720, 296, 'Rings', 'Rings-FJ4Vu', 'Rings', 'Rings', '2020-07-04 10:12:17', '2020-07-04 10:12:17'),
(721, 297, 'Anklet', 'Anklet-fsOWM', 'Anklet', 'Anklet', '2020-07-04 11:08:16', '2020-07-04 11:08:16'),
(722, 297, 'Bangles', 'Bangles-k5k9y', 'Bangles', 'Bangles', '2020-07-04 11:26:48', '2020-07-04 11:26:48'),
(723, 297, 'Bracelets', 'Bracelets-VPbbM', 'Bracelets', 'Bracelets', '2020-07-04 11:28:10', '2020-07-04 11:28:10'),
(724, 297, 'Chains', 'Chains-pMoc7', 'Chains', 'Chains', '2020-07-04 11:28:41', '2020-07-04 11:28:41'),
(725, 297, 'Earrings', 'Earrings-OYMMM', 'Earrings', 'Earrings', '2020-07-04 12:10:20', '2020-07-04 12:10:20'),
(726, 297, 'Full set', 'Full-set-IxtNj', 'Full Set', 'Full set', '2020-07-04 12:11:09', '2020-07-04 12:11:09'),
(727, 297, 'Necklaces', 'Necklaces-reRsw', 'Necklaces', 'Necklaces', '2020-07-04 12:11:37', '2020-07-04 12:11:37'),
(728, 297, 'Nosepins', 'Nosepins-0H5U6', 'Nosepins', 'Nosepins', '2020-07-04 12:12:03', '2020-07-04 12:12:03'),
(729, 297, 'Pendants', 'Pendants-zppJE', 'Pendants', 'Pendants', '2020-07-04 12:12:28', '2020-07-04 12:12:28'),
(730, 297, 'Rings', 'Rings-ErFmO', 'Rings', 'Rings', '2020-07-04 12:12:51', '2020-07-04 12:12:51'),
(731, 433, 'Bank', 'Bank-1BbFw', 'Bank', 'Bank', '2020-07-05 07:59:15', '2020-07-05 07:59:15'),
(732, 433, 'Financial Institutions', 'Financial-Institutions-HtciB', 'Financial Institutions', 'Financial Institutions', '2020-07-05 07:59:46', '2020-07-05 07:59:46'),
(733, 433, 'Insurance', 'Insurance-ktr2E', 'Insurance', 'Insurance', '2020-07-05 08:00:20', '2020-07-05 08:00:20'),
(734, 434, 'Beauty package', 'Beauty-package-a7G3u', 'Beauty package', 'Beauty package', '2020-07-05 08:01:10', '2020-07-05 08:01:10'),
(735, 434, 'Brightening Treatment', 'Brightening-Treatment-DbuDJ', 'Brightening Treatment', 'Brightening Treatment', '2020-07-05 08:01:38', '2020-07-05 08:01:38'),
(736, 434, 'Face Make Up Service', 'Face-Make-Up-Service-2DRc1', 'Face Make Up Service', 'Face Make Up Service', '2020-07-05 08:02:13', '2020-07-05 08:02:13'),
(737, 434, 'Facial Service', 'Facial-Service-Twk4L', 'Facial Service', 'Facial Service', '2020-07-05 08:02:36', '2020-07-05 08:02:36'),
(738, 434, 'Hair Color', 'Hair-Color-CJkPI', 'Hair Color', 'Hair Color', '2020-07-05 08:03:43', '2020-07-05 08:03:43'),
(739, 434, 'Hair Rebonding', 'Hair-Rebonding-9KRsI', 'Hair Rebonding', 'Hair Rebonding', '2020-07-05 08:04:12', '2020-07-05 08:04:12'),
(740, 434, 'Hair Treatment Service', 'Hair-Treatment-Service-yCT0K', 'Hair Treatment Service', 'Hair Treatment Service', '2020-07-05 08:04:49', '2020-07-05 08:04:49'),
(741, 434, 'Manicure/ Pedicure', 'Manicure-Pedicure-c2RcF', 'Manicure/ Pedicure', 'Manicure/ Pedicure', '2020-07-05 08:05:28', '2020-07-05 08:05:28'),
(742, 434, 'Mehendi service', 'Mehendi-service-WBit9', 'Mehendi service', 'Mehendi service', '2020-07-05 08:05:50', '2020-07-05 08:05:50'),
(743, 434, 'Party Makeover', 'Party-Makeover-TlNeo', 'Party Makeover', 'Party Makeover', '2020-07-05 08:06:29', '2020-07-05 08:06:29'),
(744, 432, 'Spa Facial Service', 'Spa-Facial-Service-pIIMP', 'Spa Facial Service', 'Spa Facial Service', '2020-07-05 08:06:54', '2020-07-05 08:06:54'),
(745, 434, 'Tattoo Service', 'Tattoo-Service-xDmS9', 'Tattoo Service', 'Tattoo Service', '2020-07-05 08:07:20', '2020-07-05 08:07:20'),
(746, 434, 'Waxing Service', 'Waxing-Service-Dbpz3', 'Waxing Service', 'Waxing Service', '2020-07-05 08:08:14', '2020-07-05 08:08:14'),
(747, 434, 'Wedding Makeover', 'Wedding-Makeover-npMCV', 'Wedding Makeover', 'Wedding Makeover', '2020-07-05 08:08:39', '2020-07-05 08:08:39'),
(748, 442, 'Ambulance Service', 'Ambulance-Service-sgNCM', 'Ambulance Service', 'Ambulance Service', '2020-07-05 08:09:45', '2020-07-05 08:09:45'),
(749, 442, 'Diagnostic Services', 'Diagnostic-Services-hJ9TQ', 'Diagnostic Services', 'Diagnostic Services', '2020-07-05 08:10:18', '2020-07-05 08:10:18'),
(750, 442, 'Doctor Visit Price', 'Doctor-Visit-Price-ieSzG', 'Doctor Visit Price', 'Doctor Visit Price', '2020-07-05 08:10:48', '2020-07-05 08:10:48'),
(751, 442, 'Hospital Admission', 'Hospital-Admission-uXh2g', 'Hospital Admission', 'Hospital Admission', '2020-07-05 08:11:15', '2020-07-05 08:11:15'),
(752, 443, 'Home', 'Home-hu5Ne', 'Home', 'Home', '2020-07-05 08:11:50', '2020-07-05 08:11:50'),
(753, 443, 'Office', 'Office-Ucsdw', 'Office', 'Office', '2020-07-05 08:12:15', '2020-07-05 08:12:15'),
(754, 443, 'Shop', 'Shop-4BPhF', 'Shop', 'Shop', '2020-07-05 08:12:44', '2020-07-05 08:12:44'),
(755, 447, 'Appliances Repair', 'Appliances-Repair-4iZbk', 'Appliances Repair', 'Appliances Repair', '2020-07-05 08:15:27', '2020-07-05 08:15:27'),
(756, 447, 'Gadget Repair', 'Gadget-Repair-mx8S5', 'Gadget Repair', 'Gadget Repair', '2020-07-05 08:16:05', '2020-07-05 08:16:05'),
(757, 447, 'Pest Control Service', 'Pest-Control-Service-6RF6E', 'Pest Control Service', 'Pest Control Service', '2020-07-05 08:16:28', '2020-07-05 08:16:28'),
(758, 447, 'Shifting & Renovation', 'Shifting--Renovation-qxWYS', 'Shifting & Renovation', 'Shifting & Renovation', '2020-07-05 08:16:56', '2020-07-05 08:16:56'),
(759, 449, 'Doctor Home Visit', 'Doctor-Home-Visit-7cRqX', 'Doctor Home Visit', 'Doctor Home Visit', '2020-07-05 08:18:19', '2020-07-05 08:18:19'),
(760, 449, 'Homeopathy Doctor', 'Homeopathy-Doctor-MC1rE', 'Homeopathy Doctor', 'Homeopathy Doctor', '2020-07-05 08:18:57', '2020-07-05 08:18:57'),
(761, 449, 'Medical Test Report Delivery', 'Medical-Test-Report-Delivery-ipoH4', 'Medical Test Report Delivery', 'Medical Test Report Delivery', '2020-07-05 08:19:30', '2020-07-05 08:19:30'),
(762, 449, 'Medical test Sample', 'Medical-test-Sample-3uKPC', 'Medical test Sample', 'Medical test Sample', '2020-07-05 08:20:04', '2020-07-05 08:20:04'),
(763, 449, 'Nursing Home Visit', 'Nursing-Home-Visit-rb9wT', 'Nursing Home Visit', 'Nursing Home Visit', '2020-07-05 08:20:36', '2020-07-05 08:20:36'),
(764, 451, 'Internet Connection', 'Internet-Connection-4Lahb', 'Internet Connection', 'Internet Connection', '2020-07-05 08:21:46', '2020-07-05 08:21:46'),
(765, 451, 'Satellite Dish', 'Satellite-Dish-VXXu0', 'Satellite Dish', 'Satellite Dish', '2020-07-05 08:22:21', '2020-07-05 08:22:21'),
(766, 451, 'Vehicle Tracking', 'Vehicle-Tracking-PXHqa', 'Vehicle Tracking', 'Vehicle Tracking', '2020-07-05 08:23:00', '2020-07-05 08:23:41'),
(767, 460, 'Academic', 'Academic-3uaxH', 'Academic', 'Academic', '2020-07-05 08:27:38', '2020-07-05 08:27:38'),
(768, 460, 'General', 'General-6opoP', 'General', 'General', '2020-07-05 08:28:05', '2020-07-05 08:28:05'),
(769, 463, 'Complete Set for Badminton', 'Complete-Set-for-Badminton-mjli6', 'Complete Set for Badminton', 'Complete Set for Badminton', '2020-07-05 08:42:30', '2020-07-05 08:42:30'),
(770, 463, 'Rackets', 'Rackets-4ZuQj', 'Rackets', 'Rackets', '2020-07-05 08:42:55', '2020-07-05 08:42:55'),
(771, 463, 'Racket Strings', 'Racket-Strings-Uxbfs', 'Racket Strings', 'Racket Strings', '2020-07-05 08:43:33', '2020-07-05 08:43:33'),
(772, 463, 'Shuttlecocks', 'Shuttlecocks-fzdDh', 'Shuttlecocks', 'Shuttlecocks', '2020-07-05 08:44:07', '2020-07-05 08:44:07'),
(773, 32, 'Boot Bags', 'Boot-Bags-R6gix', 'Boot Bags', 'Boot Bags', '2020-07-05 08:44:57', '2020-07-05 08:44:57'),
(774, 32, 'Gym bags & Gym-sacks', 'Gym-bags--Gym-sacks-ptuD4', 'Gym bags & Gym-sacks', 'Gym bags & Gym-sacks', '2020-07-05 08:45:32', '2020-07-05 08:45:32'),
(775, 32, 'Holdalls & Duffel Bags', 'Holdalls--Duffel-Bags-4Kktu', 'Holdalls & Duffel Bags', 'Holdalls & Duffel Bags', '2020-07-05 08:46:11', '2020-07-05 08:46:11'),
(776, 32, 'Messenger Bags', 'Messenger-Bags-GmWHW', 'Messenger Bags', 'Messenger Bags', '2020-07-05 08:46:33', '2020-07-05 08:46:33'),
(777, 32, 'Sports & Backpacks', 'Sports--Backpacks-nqRKR', 'Sports & Backpacks', 'Sports & Backpacks', '2020-07-05 08:47:05', '2020-07-05 08:47:05'),
(778, 32, 'Sports Luggage', 'Sports-Luggage-xvdwL', 'Sports Luggage', 'Sports Luggage', '2020-07-05 08:47:40', '2020-07-05 08:47:40'),
(779, 467, 'Cricket Ball', 'Cricket-Ball-Ejcoi', 'Cricket Ball', 'Cricket Ball', '2020-07-05 08:48:27', '2020-07-05 08:48:27'),
(780, 467, 'Cricket Bats', 'Cricket-Bats-pPQ8Z', 'Cricket Bats', 'Cricket Bats', '2020-07-05 08:48:58', '2020-07-05 08:48:58'),
(781, 467, 'Cricket clothing', 'Cricket-clothing-dNBio', 'Cricket clothing', 'Cricket clothing', '2020-07-05 08:49:35', '2020-07-05 08:49:35'),
(782, 467, 'Cricket Gloves', 'Cricket-Gloves-85Fr5', 'Cricket Gloves', 'Cricket Gloves', '2020-07-05 08:50:08', '2020-07-05 08:50:08'),
(783, 467, 'Cricket Shoes', 'Cricket-Shoes-iDtzg', 'Cricket Shoes', 'Cricket Shoes', '2020-07-05 08:50:35', '2020-07-05 08:50:35'),
(784, 467, 'Gears', 'Gears-27YaC', 'Gears', 'Gears', '2020-07-05 08:50:56', '2020-07-05 08:50:56'),
(785, 467, 'Junior Sets', 'Junior-Sets-A69zp', 'Junior Sets', 'Junior Sets', '2020-07-05 08:51:22', '2020-07-05 08:51:22'),
(786, 467, 'Kit Bags', 'Kit-Bags-Vs43z', 'Kit Bags', 'Kit Bags', '2020-07-05 08:51:45', '2020-07-05 08:51:45'),
(787, 467, 'Protective', 'Protective-Nzmfi', 'Protective', 'Protective', '2020-07-05 08:52:16', '2020-07-05 08:52:16'),
(788, 467, 'Full Set', 'Full-Set-clmLR', 'Full Set', 'Full Set', '2020-07-05 08:52:48', '2020-07-05 08:52:48'),
(789, 468, 'Cycle', 'Cycle-p7b1a', 'Cycle', 'Cycle', '2020-07-05 08:53:26', '2020-07-05 08:53:26'),
(790, 468, 'Cycle parts', 'Cycle-parts-vwnjV', 'Cycle parts', 'Cycle parts', '2020-07-05 08:53:51', '2020-07-05 08:53:51'),
(791, 468, 'Cycling Cloth', 'Cycling-Cloth-62j5J', 'Cycling Cloth', 'Cycling Cloth', '2020-07-05 08:54:31', '2020-07-05 08:54:31'),
(792, 469, 'Sports Clothing for Women', 'Sports-Clothing-for-Women-3g6I5', 'Sports Clothing for Women', 'Sports Clothing for Women', '2020-07-05 08:55:23', '2020-07-05 08:55:23'),
(793, 469, 'Sports Footwear for Women', 'Sports-Footwear-for-Women-UXEAT', 'Sports Footwear for Women', 'Sports Footwear for Women', '2020-07-05 08:55:52', '2020-07-05 08:55:52'),
(794, 472, 'Base Layer', 'Base-Layer-5r143', 'Base Layer', 'Base Layer', '2020-07-05 08:57:06', '2020-07-05 08:57:06'),
(795, 472, 'Boot Bags', 'Boot-Bags-0Dvgs', 'Boot Bags', 'Boot Bags', '2020-07-05 08:57:41', '2020-07-05 08:57:41'),
(796, 472, 'Football Jackets', 'Football-Jackets-umJ1a', 'Football Jackets', 'Football Jackets', '2020-07-05 08:58:10', '2020-07-05 08:58:10'),
(797, 472, 'Football Pumps', 'Football-Pumps-OiPhS', 'Football Pumps', 'Football Pumps', '2020-07-05 08:59:14', '2020-07-05 08:59:14'),
(798, 472, 'Footballs', 'Footballs-lPH1X', 'Footballs', 'Footballs', '2020-07-05 08:59:38', '2020-07-05 08:59:38'),
(799, 472, 'Goalkeeper Clothing', 'Goalkeeper-Clothing-BQk6v', 'Goalkeeper Clothing', 'Goalkeeper Clothing', '2020-07-05 09:00:32', '2020-07-05 09:00:32'),
(800, 472, 'Goalkeeper Gloves', 'Goalkeeper-Gloves-KpCPc', 'Goalkeeper Gloves', 'Goalkeeper Gloves', '2020-07-05 09:01:01', '2020-07-05 09:01:01'),
(801, 472, 'Jersey', 'Jersey-xEBK5', 'Jersey', 'Jersey', '2020-07-05 09:01:23', '2020-07-05 09:01:23'),
(802, 472, 'Shin Pads', 'Shin-Pads-uaiXq', 'Shin Pads', 'Shin Pads', '2020-07-05 09:01:55', '2020-07-05 09:01:55'),
(803, 472, 'Shorts', 'Shorts-NT9E1', 'Shorts', 'Shorts', '2020-07-05 09:02:21', '2020-07-05 09:02:21'),
(804, 472, 'Sports Socks', 'Sports-Socks-JYPQX', 'Sports Socks', 'Sports Socks', '2020-07-05 09:02:52', '2020-07-05 09:02:52'),
(805, 472, 'Track Suit bottoms', 'Track-Suit-bottoms-zxznS', 'Track Suit bottoms', 'Track Suit bottoms', '2020-07-05 09:03:27', '2020-07-05 09:03:27'),
(806, 472, 'Tracksuit', 'Tracksuit-0VeRY', 'Tracksuit', 'Tracksuit', '2020-07-05 09:03:56', '2020-07-05 09:03:56'),
(807, 475, 'Billiard', 'Billiard-3CQtX', 'Billiard', 'Billiard', '2020-07-05 09:09:06', '2020-07-05 09:09:06'),
(808, 475, 'Boxing Instruments', 'Boxing-Instruments-HtY8T', 'Boxing Instruments', 'Boxing Instruments', '2020-07-05 09:09:35', '2020-07-05 09:09:35'),
(809, 475, 'Chess', 'Chess-7MNii', 'Chess', 'Chess', '2020-07-05 09:10:05', '2020-07-05 09:10:05'),
(810, 475, 'Skates', 'Skates-A8Kmp', 'Skates', 'Skates', '2020-07-05 09:10:37', '2020-07-05 09:10:37'),
(811, 475, 'Snooker & Pool', 'Snooker--Pool-6Hamw', 'Snooker & Pool', 'Snooker & Pool', '2020-07-05 09:11:08', '2020-07-05 09:11:08'),
(812, 475, 'Table Tennis', 'Table-Tennis-PKIw2', 'Table Tennis', 'Table Tennis', '2020-07-05 09:11:42', '2020-07-05 09:11:42'),
(813, 475, 'Volleyball', 'Volleyball-a2Wv1', 'Volleyball', 'Volleyball', '2020-07-05 09:12:16', '2020-07-05 09:12:16'),
(814, 475, 'Water Sports', 'Water-Sports-7Jm1b', 'Water Sports', 'Water Sports', '2020-07-05 09:18:50', '2020-07-05 09:18:50'),
(815, 475, 'Yoga', 'Yoga-3GNXM', 'Yoga', 'Yoga', '2020-07-05 09:19:40', '2020-07-05 09:19:40'),
(816, 476, 'Sports Clothing for Kids', 'Sports-Clothing-for-Kids-9Chtn', 'Sports Clothing for Kids', 'Sports Clothing for Kids', '2020-07-05 09:30:53', '2020-07-05 09:30:53'),
(817, 476, 'Footwear for Kids', 'Footwear-for-Kids-YdfgR', 'Footwear for Kids', 'Footwear for Kids', '2020-07-05 09:31:54', '2020-07-05 09:31:54'),
(818, 477, 'Sports Clothing for Men', 'Sports-Clothing-for-Men-LDydo', 'Sports Clothing for Men', 'Sports Clothing for Men', '2020-07-05 09:38:41', '2020-07-05 09:38:41'),
(819, 477, 'Footwear For Men', 'Footwear-For-Men-JRvgx', 'Footwear For Men', 'Footwear For Men', '2020-07-05 09:39:24', '2020-07-05 09:39:24'),
(820, 478, 'Heart Rate Monitors', 'Heart-Rate-Monitors-vaiw1', 'Heart Rate Monitors', 'Heart Rate Monitors', '2020-07-05 14:50:20', '2020-07-05 14:50:20'),
(821, 478, 'Running Shoes', 'Running-Shoes-dKKy5', 'Running Shoes', 'Running Shoes', '2020-07-05 14:50:55', '2020-07-05 14:50:55'),
(822, 478, 'Water Packs & Bottles', 'Water-Packs--Bottles-rFmZY', 'Water Packs & Bottles', 'Water Packs & Bottles', '2020-07-05 14:51:27', '2020-07-05 14:51:27'),
(823, 479, 'Bags, Cases, Trolleys', 'Bags-Cases-Trolleys-9pxO1', 'Bags, Cases, Trolleys', 'Bags, Cases, Trolleys', '2020-07-05 14:52:15', '2020-07-05 14:53:33'),
(824, 479, 'Balls Shuttles', 'Balls-Shuttles-7nWvm', 'Balls Shuttles', 'Balls Shuttles', '2020-07-05 14:52:42', '2020-07-05 14:52:42'),
(825, 479, 'Body Protections', 'Body-Protections-kLuGm', 'Body Protections', 'Body Protections', '2020-07-05 14:53:19', '2020-07-05 14:53:19'),
(826, 479, 'Electronics and accessories', 'Electronics-and-accessories-osT6H', 'Electronics and accessories', 'Electronics and accessories', '2020-07-05 14:54:09', '2020-07-05 14:54:09'),
(827, 479, 'Gum Shields, Mouth-guards', 'Gum-Shields-Mouth-guards-FXwQB', 'Gum Shields, Mouth-guards', 'Gum Shields, Mouth-guards', '2020-07-05 14:54:51', '2020-07-05 14:54:51'),
(828, 479, 'Hats,Helmets & Heads', 'HatsHelmets--Heads-EXcn4', 'Hats,Helmets & Heads', 'Hats,Helmets & Heads', '2020-07-05 14:56:10', '2020-07-05 14:56:10'),
(829, 479, 'Headphones & Earphones', 'Headphones--Earphones-KK5xA', 'Headphones & Earphones', 'Headphones & Earphones', '2020-07-05 14:56:40', '2020-07-05 14:56:40'),
(830, 479, 'Nutrition', 'Nutrition-rqtl5', 'Nutrition', 'Nutrition', '2020-07-05 14:57:10', '2020-07-05 14:57:10'),
(831, 479, 'Rackets, Bats & Clubs', 'Rackets-Bats--Clubs-2jRfZ', 'Rackets, Bats & Clubs', 'Rackets, Bats & Clubs', '2020-07-05 14:57:54', '2020-07-05 14:57:54'),
(832, 479, 'Rope & Harness', 'Rope--Harness-vpH6T', 'Rope & Harness', 'Rope & Harness', '2020-07-05 14:58:35', '2020-07-05 14:58:35'),
(833, 479, 'Sports Gloves', 'Sports-Gloves-Cgc8a', 'Sports Gloves', 'Sports Gloves', '2020-07-05 14:59:21', '2020-07-05 14:59:21');
INSERT INTO `sub_sub_categories` (`id`, `sub_category_id`, `name`, `slug`, `meta_title`, `meta_description`, `created_at`, `updated_at`) VALUES
(834, 479, 'Shoe Accessories', 'Shoe-Accessories-KnNAI', 'Shoe Accessories', 'Shoe Accessories', '2020-07-05 14:59:48', '2020-07-05 14:59:48'),
(835, 479, 'Sports Towels & Sweatbands', 'Sports-Towels--Sweatbands-fkmRA', 'Sports Towels & Sweatbands', 'Sports Towels & Sweatbands', '2020-07-05 15:00:31', '2020-07-05 15:00:31'),
(836, 479, 'Training & Teams', 'Training--Teams-mSrDU', 'Training & Teams', 'Training & Teams', '2020-07-05 15:00:55', '2020-07-05 15:00:55'),
(837, 479, 'Trophies', 'Trophies-BjWI8', 'Trophies', 'Trophies', '2020-07-05 15:01:22', '2020-07-05 15:01:22'),
(838, 479, 'Water Bottles & Hydration', 'Water-Bottles--Hydration-TfNLQ', 'Water Bottles & Hydration', 'Water Bottles & Hydration', '2020-07-05 15:02:04', '2020-07-05 15:02:04'),
(839, 479, 'Weight & Resistance', 'Weight--Resistance-s793w', 'Weight & Resistance', 'Weight & Resistance', '2020-07-05 15:02:34', '2020-07-05 15:02:34'),
(840, 18, 'Kitchen Set', 'Kitchen-Set-j5s74', 'Kitchen Set', 'Kitchen Set', '2020-08-17 23:20:28', '2020-08-17 23:20:28'),
(841, 103, 'Cables', 'Cables-7LxFp', 'Cables', 'Cable', '2020-08-30 09:50:51', '2020-08-30 09:50:51'),
(842, 104, 'Electronic Scale', 'Electronic-Scale-cCO9C', 'Electronic Scale', 'Electronic Scale', '2020-08-30 09:51:17', '2020-08-30 09:51:17'),
(843, 105, 'Fans', 'Fans-AR3Ot', 'Fans', 'Fans', '2020-08-30 09:52:18', '2020-08-30 09:52:18'),
(844, 106, 'Generators', 'Generators-gYIQd', 'Generators', 'Generators', '2020-08-30 09:52:34', '2020-08-30 09:52:34'),
(845, 107, 'Geyser', 'Geyser-skVxk', 'Geyser', 'Geyser', '2020-08-30 09:52:48', '2020-08-30 09:53:10'),
(846, 108, 'IPS & UPS', 'IPS--UPS-2g1Ub', 'IPS & UPS', 'IPS & UPS', '2020-08-30 09:53:35', '2020-08-30 09:53:35'),
(847, 109, 'Light Bulbs', 'Light-Bulbs-J65sy', 'Light Bulbs', 'Light Bulbs', '2020-08-30 09:53:54', '2020-08-30 09:53:54'),
(848, 110, 'Rechargeable Lights & Fans', 'Rechargeable-Lights--Fans-WWmL5', 'Rechargeable Lights & Fans', 'Rechargeable Lights & Fans', '2020-08-30 09:54:08', '2020-08-30 09:54:08'),
(849, 111, 'Satellite Dish', 'Satellite-Dish-t9hMj', 'Satellite Dish', 'Satellite Dish', '2020-08-30 09:54:24', '2020-08-30 09:54:24'),
(850, 112, 'Spot Lights', 'Spot-Lights-UEcVs', 'Spot Lights', 'Spot Lights', '2020-08-30 09:54:45', '2020-08-30 09:54:45'),
(851, 113, 'Switches', 'Switches-6Fq6N', 'Switches', 'Switches', '2020-08-30 09:55:25', '2020-08-30 09:55:25'),
(852, 114, 'Tube-lights', 'Tube-lights-xi3Nh', 'Tube-lights', 'Tube-lights', '2020-08-30 09:55:42', '2020-08-30 09:55:42'),
(853, 115, 'Voltage Stabilizer', 'Voltage-Stabilizer-HYyPD', 'Voltage Stabilizer', 'Voltage Stabilizer', '2020-08-30 09:56:03', '2020-08-30 09:56:03'),
(854, 162, 'Health Care & Pharmacy', 'Health-Care--Pharmacy-fCJgG', 'Health Care & Pharmacy', 'Health Care & Pharmacy', '2020-08-30 09:56:18', '2020-08-30 09:56:18');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` int(11) NOT NULL,
  `code` int(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `details` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `files` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `status` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `viewed` int(1) NOT NULL DEFAULT 0,
  `client_viewed` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`id`, `code`, `user_id`, `subject`, `details`, `files`, `status`, `viewed`, `client_viewed`, `created_at`, `updated_at`) VALUES
(8, 10000058, 16, 'Welcome to the zianz', 'Check', NULL, 'solved', 1, 1, '2020-06-12 02:14:02', '2020-06-12 06:14:02');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_replies`
--

CREATE TABLE `ticket_replies` (
  `id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `reply` longtext COLLATE utf8_unicode_ci NOT NULL,
  `files` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ticket_replies`
--

INSERT INTO `ticket_replies` (`id`, `ticket_id`, `user_id`, `reply`, `files`, `created_at`, `updated_at`) VALUES
(8, 8, 12, 'Hi', NULL, '2020-06-08 17:14:39', '2020-06-08 17:14:39'),
(9, 8, 12, 'Greate', NULL, '2020-06-08 17:15:48', '2020-06-08 17:15:48');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `referred_by` int(11) DEFAULT NULL,
  `provider_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_type` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'customer',
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `new_email_verificiation_code` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_original` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postal_code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verification_code` int(50) DEFAULT NULL,
  `balance` double(8,2) NOT NULL DEFAULT 0.00,
  `referral_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_package_id` int(11) DEFAULT NULL,
  `remaining_uploads` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `referred_by`, `provider_id`, `user_type`, `name`, `email`, `email_verified_at`, `new_email_verificiation_code`, `password`, `remember_token`, `avatar`, `avatar_original`, `address`, `country`, `city`, `postal_code`, `phone`, `verification_code`, `balance`, `referral_code`, `customer_package_id`, `remaining_uploads`, `created_at`, `updated_at`) VALUES
(12, NULL, NULL, 'admin', 'Zianz E-Tail Market', 'ziauddin@zianz.com', '2020-05-31 22:05:50', NULL, '$2y$10$ryZ3iJMAt0Z5XMvyBoHHvuprGliCgL5IbYw2ry3.ysojM1c5nqK1W', '4PGD5N48YEwiwbtQQPUKvYV58Og9WxaygWSjE7KOYGk3xcIvqnL8VEFp5hA0', NULL, 'uploads/avatar/uQJiNzu8j2ubx9V32uMrK5d9xCH3LK9r9p72HM0l.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, 286.80, NULL, NULL, 0, '2020-05-31 22:14:50', '2020-09-06 16:37:39'),
(18, NULL, NULL, 'customer', 'Md. Nahid Hossain', 'hossainnahid37@yahoo.com', '2020-06-14 02:53:08', NULL, '$2y$10$gxpKWZ3zdC0WQyS0cFYXye.fJtMjXzi7o0gDIDrc9v7rLSb.SzCDu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, 0, '2020-06-14 02:51:12', '2020-06-14 02:53:08'),
(20, NULL, NULL, 'staff', 'Manager', 'manger@zianz.com', NULL, NULL, '$2y$10$qqW6vDJarYo/uy60Mof3w.4GOJZzjv2YHODvIaftUlV.gaJ5Zk/WG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '+881556865654', NULL, 0.00, NULL, NULL, 0, '2020-06-19 06:09:44', '2020-06-19 06:09:44'),
(21, NULL, NULL, 'customer', 'Sajib', 'sadhin142@gmail.com', '2020-06-26 01:51:29', NULL, '$2y$10$o6l9mSNYEnpV/9ELQm9wdOGXbjXBux/cUS/AIggn/IJHBce7zGieu', 'Ca1NcRxLbZX6HvzOhJJA3th0FeIx6aC4HXxJEaI38oL1WaKZd9uHxECAW6ea', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, 0, '2020-06-20 18:10:54', '2020-06-26 01:51:29'),
(26, NULL, NULL, 'seller', 'Arham enterprises', 'riyadkhan467@gmail.com', '2020-06-21 14:33:00', NULL, '$2y$10$istzVWs6ohVPAsCmUNIcRObVIDAib3z0R23WeEa7rSoNtsckf7ocG', 't9oMOEIpXUSrIZiC5JZycgzzXy5uIhwouQwbmUj2zbjMWvb2LqPJeGO45OLr', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, 0, '2020-06-21 14:29:57', '2020-06-21 14:33:00'),
(27, NULL, NULL, 'seller', 'Biotic Food', 'rubelah2016@gmail.com', '2020-06-21 21:30:07', NULL, '$2y$10$vXeXJ3AXbTnTavbkhkwf0elS9SJmv4mnUHJYeSE2QTxlnAOfEoDfa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, 0, '2020-06-21 21:14:53', '2020-06-21 21:30:07'),
(28, NULL, NULL, 'seller', 'Zianz Fish & Meat Shop', 'zarif.imtiaz@gmail.com', '2020-06-22 04:02:12', NULL, '$2y$10$SHIRmdt2Ohsanvi.Xjh3Qep8SiKrcgP2rUssc88THuURZ2azPWfWW', 'hCIBRwIR8ozLATzPU78FlySHRzJh8dHEOPLfyuS0H1hgW4Mv8J2AIZad7O19', NULL, 'uploads/5DPBL7YNThAVBPYs8j13YywJ7u10EtAv7ld7orX2.jpeg', '171/2/C West Kafrul, Sher-E-Bangla Nagar', 'BD', 'Dhaka', '1207', '8801629107087', NULL, 5000.00, NULL, NULL, 0, '2020-06-22 03:59:55', '2020-06-28 15:08:00'),
(30, NULL, '1148003045561230', 'customer', 'Rehana Islam', 'rehanaislam90@yahoo.com', '2020-06-22 22:06:17', NULL, NULL, 'YR9jrLzb5pb3XM5hfRYIjShb9v2W9wujMZ75KhROTl7hxwLtKV7pWUuisTdj', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, 0, '2020-06-22 22:21:17', '2020-06-22 22:21:17'),
(31, NULL, '111843598665007962859', 'customer', 'Atiqul Haque', 'atiq639@gmail.com', '2020-06-23 02:06:23', NULL, '$2y$10$ItDQM5dmyr0hyq5CS3wameoTzgItWMjJMYKw.QCTBuZtixK7vEzxe', 'AJ9Q4DT9CbcuIlfttIezgSSnIe1eCfyl43Eyh5OwBwf9exWm57DeK9DRxyRM', NULL, NULL, '49, Monipuri Para, Gate#2, Flat#A1,', 'BD', 'Dhaka', '1215', '+8801711566377', NULL, 0.00, NULL, NULL, 0, '2020-06-23 02:34:23', '2020-06-23 02:37:50'),
(32, NULL, '2898818693679022', 'customer', 'Mominul Hoque', 'medinet.ctg@gmail.com', '2020-06-23 10:06:36', NULL, '$2y$10$SY27vIfVzaI3dsm61KaiD.sJPbH8iDXFBCZ7BIknlm9ufoJS0BnWG', 'KjRqbpTXDwlO8jvdUR5zsGiAwDmC7XDJyMVkkuQ0NP9mg1vTbqdqGKrbQGh7', NULL, NULL, 'Medinet epic health care chittagong medical college main gate', 'BD', 'Chittagong', '4203', '01830774433', NULL, 0.00, NULL, NULL, 0, '2020-06-23 10:28:36', '2020-06-23 14:32:48'),
(33, NULL, '251452779488652', 'customer', 'Jihad Al Evan', NULL, '2020-06-23 14:06:06', NULL, NULL, 'O91q9Hp9sxzs7tPhrNGiBWUBvTLrDsuUteNTTc4fzvVIKinqeMja2tZ11sK9', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, 0, '2020-06-23 14:02:06', '2020-06-23 14:02:06'),
(35, NULL, '604579856824700', 'customer', 'Sumaiya Akter', 'najimalamser@gmail.com', '2020-06-24 06:06:28', NULL, NULL, '11pkiJHnvdIgtME9FJHVBM64nSIXlgQ62Dieo7o1eylzIAlKWRVMkTZS1s9e', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, 0, '2020-06-24 06:06:28', '2020-06-24 06:06:28'),
(36, NULL, NULL, 'seller', 'symon', 'sparkidea22@gmail.com', '2020-06-25 17:51:27', NULL, '$2y$10$7AUmGvbpMwtZsur0/ahDe.inrKHTMDA4lDfu//7QBbO/r1JGYo4De', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, 0, '2020-06-25 17:47:41', '2020-06-25 18:38:26'),
(37, NULL, NULL, 'seller', 'EHSANUL HAQUE', 'drehsanulbd@gmail.com', '2020-06-27 22:14:36', NULL, '$2y$10$CBRhmARoAckRAGj3IjUTEuWRXcVBRvRMaozQlsfJt03oRt.dq4SXC', NULL, NULL, 'uploads/LSD65d2pzuTzmYEyYnCuUYTwo0OtZAztC92ITYiq.jpeg', '218/7-a west kafrul', 'BD', 'Dhaka', '1207', '01761608077', NULL, 0.00, NULL, NULL, 0, '2020-06-27 22:10:28', '2020-07-04 17:18:58'),
(38, NULL, NULL, 'seller', 'Shopaz Estore', 'hasan4shakil@gmail.com', NULL, NULL, '$2y$10$.qnD3fknabKwJ0APBMMifOIyoZPkYaWY0B2oUmK8IBGGNJF4/uSP6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, 0, '2020-06-28 02:08:48', '2020-06-28 02:08:48'),
(39, NULL, NULL, 'seller', 'HuT MaSTeR', 'raselarisha@gmail.com', '2020-06-28 16:11:42', NULL, '$2y$10$tj80Cg/IWZfApMLSSpjwn.5cFVgk8uOppG.8CtA.po6ZoS/xJ1s9G', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, 0, '2020-06-28 16:03:32', '2020-06-28 16:11:42'),
(40, NULL, NULL, 'seller', 'Rupoboti', 'palash.twinklers@gmail.com', '2020-07-01 14:33:44', NULL, '$2y$10$u1YtuprKGoidH48J0vvR9u0L2ZkIbzYUNeymmSaFqJqhoydzHTjAi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, 0, '2020-07-01 14:25:21', '2020-07-01 14:33:44'),
(41, NULL, NULL, 'seller', 'TEEF', 'husaincpi09@gmail.com', '2020-07-08 20:26:01', NULL, '$2y$10$m8O2LD1XXOifWbA/l3bGyuTnTMT6okCMiDLXlfCnCf12zWDr2uYsO', NULL, NULL, 'uploads/teef.jpg', NULL, 'AF', NULL, NULL, NULL, NULL, 0.00, NULL, NULL, 0, '2020-07-07 21:07:34', '2020-07-29 13:15:06'),
(42, NULL, '3374053735991532', 'seller', 'Noor Alam Shikder Tipu', 'mdnooralamshikder@gmail.com', '2020-07-08 21:07:24', NULL, NULL, '6hO9LZg1s9tRnSE0sXdN8eazvXFzJjjYcberXIuwZG436M6rfljYOxQLblWw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, 0, '2020-07-08 21:33:24', '2020-07-08 21:37:11'),
(43, NULL, NULL, 'customer', 'Noman alam moon', NULL, NULL, NULL, '$2y$10$RMfCouSkr5rCVT6LOolPj.H49lzOZMRYEq6Gkrw5rkbCcXJO5g0Fm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '+88001838329002', NULL, 0.00, NULL, NULL, 0, '2020-07-08 22:31:05', '2020-07-08 22:31:05'),
(44, NULL, '109022141055350325578', 'customer', 'Wasikul Islam', 'wasikul.rimon@gmail.com', '2020-07-11 19:07:46', NULL, NULL, '9pOydumrFQji27Exf4WioiZXoYmhuLCUyKT39iHdIOE8gLTGDlzeJl62cj2T', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, 0, '2020-07-11 19:31:46', '2020-07-11 19:31:46'),
(47, NULL, NULL, 'seller', 'Zianz Fashion', 'zianz.com@gmail.com', NULL, NULL, '$2y$10$m869hAjiZIr.v9wU5w02deIGtVPNGgntzkznV4av4up6pGp1FINKa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, 0, '2020-07-15 20:43:40', '2020-07-15 20:43:40'),
(48, NULL, '10223878393853686', 'customer', 'Sajoyan Haque', 'fltomal08@gmail.com', '2020-07-17 14:07:34', NULL, NULL, 'mJH3PKt6yCApIfsVAQUixSu3LQkYfJbafbEiBJ5tqj9aAZP9k5dFl4OsP8xX', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, 0, '2020-07-17 14:02:34', '2020-07-17 14:02:34'),
(49, NULL, '679158626265853', 'customer', 'Hasib Billah', 'hasibbillah10@gmail.com', '2020-07-17 19:07:44', NULL, NULL, 'EEAJuutkJEV9njBD14l2le0ICp0V0xyuRuU23jbCdWDOnROFC5SDjrhoZeeH', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, 0, '2020-07-17 19:22:44', '2020-07-17 19:22:44'),
(50, NULL, '147649423574089', 'customer', 'Md Juel Md Juel', 'mjuel159@gmail.com', '2020-07-18 14:07:55', NULL, NULL, 'a6n9spK1ha3Z40Ok47jpYvwCo49ewWiguO51ixWArbapYcAko8UjSZyFjkO1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, 0, '2020-07-18 14:25:55', '2020-07-18 14:25:55'),
(51, NULL, '163161525279427', 'customer', 'Reyad Hasan', 'mahbubul@bestwaynationwide.com', '2020-07-18 19:07:28', NULL, NULL, 'CIiyfS8PEz9Rrg8tqgOrytuxRFVcp8YCu2nJTFSZV2AGLvxkzEKCnNYGGmYP', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, 0, '2020-07-18 19:06:28', '2020-07-18 19:06:28'),
(52, NULL, '325440101813933', 'customer', 'Nahin Iqbal', 'nahiniqubal@gmail.com', '2020-07-20 11:07:45', NULL, NULL, 'EqjhnyrfbJrRhIvEysAYxznsyqXDbFwWuiGcOl2mXO4oUExazyCu2OR7JWpi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, 0, '2020-07-20 11:09:45', '2020-07-20 11:09:45'),
(53, NULL, NULL, 'seller', 'Tiny Food Kitchen', 'sumaakterakon@gmail.com', '2020-08-17 23:09:05', NULL, '$2y$10$nzZ3E/C9W4KgNhkCxxlWnON8rJYa05XSfI/oolvAU/6cV1OtT8On.', NULL, NULL, NULL, '334/2', 'BD', NULL, NULL, '8801707485240', NULL, 0.00, NULL, NULL, 0, '2020-08-17 22:59:34', '2020-08-29 14:02:45'),
(54, NULL, NULL, 'seller', 'LIVE ONCE', 'jorici8616@accordmail.net', '2020-08-18 03:20:07', NULL, '$2y$10$CSihY8c599MEQuTgJU6l3emR6m2Ejv8rB.MQ/YAD6rrZG0aeDGtse', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0126685468', NULL, 0.00, NULL, NULL, 0, '2020-08-18 03:19:29', '2020-08-18 03:20:07'),
(55, NULL, '10150001654700269', 'customer', 'Donna Bowerssen', 'pydwuiwstb_1574354907@tfbnw.net', '2020-09-28 16:09:51', NULL, NULL, 'KQnqyr9mXPudMydf8INiiXiOp43YZ720DyryMObZ0ceaDjAWlC0eJmI7fwAn', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, 0, '2020-09-28 16:58:51', '2020-09-28 16:58:51');

-- --------------------------------------------------------

--
-- Table structure for table `wallets`
--

CREATE TABLE `wallets` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `payment_method` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payment_details` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `approval` int(1) NOT NULL DEFAULT 0,
  `offline_payment` int(1) NOT NULL DEFAULT 0,
  `reciept` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `wallets`
--

INSERT INTO `wallets` (`id`, `user_id`, `amount`, `payment_method`, `payment_details`, `approval`, `offline_payment`, `reciept`, `created_at`, `updated_at`) VALUES
(1, 16, 1000.00, 'sslcommerz', '{\"tran_id\":\"c74d97b01e\",\"val_id\":\"200606238331OTF0LRiIYIPBgL\",\"amount\":\"1000.00\",\"card_type\":\"VISA-Dutch Bangla\",\"store_amount\":\"975.00\",\"card_no\":\"432155XXXXXX7491\",\"bank_tran_id\":\"20060623833apLWZDhZ3N62NX4\",\"status\":\"VALID\",\"tran_date\":\"2020-06-06 02:38:29\",\"currency\":\"BDT\",\"card_issuer\":\"STANDARD CHARTERED BANK\",\"card_brand\":\"VISA\",\"card_issuer_country\":\"Bangladesh\",\"card_issuer_country_code\":\"BD\",\"store_id\":\"ziaan5ed684660fa09\",\"verify_sign\":\"79c2c4120f258e49df09abbc63e347ec\",\"verify_key\":\"amount,bank_tran_id,base_fair,card_brand,card_issuer,card_issuer_country,card_issuer_country_code,card_no,card_type,currency,currency_amount,currency_rate,currency_type,risk_level,risk_title,status,store_amount,store_id,tran_date,tran_id,val_id,value_a,value_b,value_c,value_d\",\"verify_sign_sha2\":\"f7ec45ea852e6c702b23ec9f26761cdba3f9e4b8a6a5c242ee5e962558eaec0b\",\"currency_type\":\"BDT\",\"currency_amount\":\"1000.00\",\"currency_rate\":\"1.0000\",\"base_fair\":\"0.00\",\"value_a\":null,\"value_b\":null,\"value_c\":null,\"value_d\":null,\"risk_level\":\"0\",\"risk_title\":\"Safe\"}', 0, 0, NULL, '2020-06-06 04:40:46', '2020-06-06 04:40:46'),
(2, 15, 10000.00, 'sslcommerz', '{\"tran_id\":\"9bf31c7ff0\",\"val_id\":\"200606239309L7MXDFflcvzVk5\",\"amount\":\"10000.00\",\"card_type\":\"VISA-Dutch Bangla\",\"store_amount\":\"9750.00\",\"card_no\":\"432155******3964\",\"bank_tran_id\":\"20060623930sph55ADTArZoHBu\",\"status\":\"VALID\",\"tran_date\":\"2020-06-06 02:39:26\",\"currency\":\"BDT\",\"card_issuer\":\"STANDARD CHARTERED BANK\",\"card_brand\":\"VISA\",\"card_issuer_country\":\"Bangladesh\",\"card_issuer_country_code\":\"BD\",\"store_id\":\"ziaan5ed684660fa09\",\"verify_sign\":\"64d5c0c23f0750d2d68e53f4b02aa5af\",\"verify_key\":\"amount,bank_tran_id,base_fair,card_brand,card_issuer,card_issuer_country,card_issuer_country_code,card_no,card_type,currency,currency_amount,currency_rate,currency_type,risk_level,risk_title,status,store_amount,store_id,tran_date,tran_id,val_id,value_a,value_b,value_c,value_d\",\"verify_sign_sha2\":\"c515df53863181052c412267baa1442b90afc0ed9501924dafb980aa02a0ce8c\",\"currency_type\":\"BDT\",\"currency_amount\":\"10000.00\",\"currency_rate\":\"1.0000\",\"base_fair\":\"0.00\",\"value_a\":null,\"value_b\":null,\"value_c\":null,\"value_d\":null,\"risk_level\":\"0\",\"risk_title\":\"Safe\"}', 0, 0, NULL, '2020-06-06 04:41:44', '2020-06-06 04:41:44');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `user_id`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 41, 71, '2020-07-29 21:17:07', '2020-07-29 21:17:07');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addons`
--
ALTER TABLE `addons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `affiliate_configs`
--
ALTER TABLE `affiliate_configs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `affiliate_options`
--
ALTER TABLE `affiliate_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `affiliate_payments`
--
ALTER TABLE `affiliate_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `affiliate_users`
--
ALTER TABLE `affiliate_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_settings`
--
ALTER TABLE `app_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_settings`
--
ALTER TABLE `business_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `club_points`
--
ALTER TABLE `club_points`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `club_point_details`
--
ALTER TABLE `club_point_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupon_usages`
--
ALTER TABLE `coupon_usages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_packages`
--
ALTER TABLE `customer_packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_products`
--
ALTER TABLE `customer_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flash_deals`
--
ALTER TABLE `flash_deals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flash_deal_products`
--
ALTER TABLE `flash_deal_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_categories`
--
ALTER TABLE `home_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `links`
--
ALTER TABLE `links`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manual_payment_methods`
--
ALTER TABLE `manual_payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `otp_configurations`
--
ALTER TABLE `otp_configurations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pickup_points`
--
ALTER TABLE `pickup_points`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `policies`
--
ALTER TABLE `policies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_stocks`
--
ALTER TABLE `product_stocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refund_requests`
--
ALTER TABLE `refund_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `searches`
--
ALTER TABLE `searches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sellers`
--
ALTER TABLE `sellers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seller_packages`
--
ALTER TABLE `seller_packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seller_withdraw_requests`
--
ALTER TABLE `seller_withdraw_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seo_settings`
--
ALTER TABLE `seo_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_category_id` (`category_id`);

--
-- Indexes for table `sub_sub_categories`
--
ALTER TABLE `sub_sub_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_sub_category_id` (`sub_category_id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_replies`
--
ALTER TABLE `ticket_replies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `wallets`
--
ALTER TABLE `wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addons`
--
ALTER TABLE `addons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `affiliate_configs`
--
ALTER TABLE `affiliate_configs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `affiliate_options`
--
ALTER TABLE `affiliate_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `affiliate_payments`
--
ALTER TABLE `affiliate_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `affiliate_users`
--
ALTER TABLE `affiliate_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `app_settings`
--
ALTER TABLE `app_settings`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `business_settings`
--
ALTER TABLE `business_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `club_points`
--
ALTER TABLE `club_points`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `club_point_details`
--
ALTER TABLE `club_point_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;

--
-- AUTO_INCREMENT for table `conversations`
--
ALTER TABLE `conversations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=297;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupon_usages`
--
ALTER TABLE `coupon_usages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `customer_packages`
--
ALTER TABLE `customer_packages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `customer_products`
--
ALTER TABLE `customer_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flash_deals`
--
ALTER TABLE `flash_deals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flash_deal_products`
--
ALTER TABLE `flash_deal_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `home_categories`
--
ALTER TABLE `home_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `links`
--
ALTER TABLE `links`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `manual_payment_methods`
--
ALTER TABLE `manual_payment_methods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `otp_configurations`
--
ALTER TABLE `otp_configurations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pickup_points`
--
ALTER TABLE `pickup_points`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `policies`
--
ALTER TABLE `policies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `product_stocks`
--
ALTER TABLE `product_stocks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `refund_requests`
--
ALTER TABLE `refund_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `searches`
--
ALTER TABLE `searches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sellers`
--
ALTER TABLE `sellers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `seller_packages`
--
ALTER TABLE `seller_packages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `seller_withdraw_requests`
--
ALTER TABLE `seller_withdraw_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `seo_settings`
--
ALTER TABLE `seo_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=511;

--
-- AUTO_INCREMENT for table `sub_sub_categories`
--
ALTER TABLE `sub_sub_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=855;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `ticket_replies`
--
ALTER TABLE `ticket_replies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `wallets`
--
ALTER TABLE `wallets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
