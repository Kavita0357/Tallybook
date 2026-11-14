-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 12, 2026 at 08:12 PM
-- Server version: 11.4.13-MariaDB
-- PHP Version: 8.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bdtailordesk_dev_tailoring`
--

-- --------------------------------------------------------

--
-- Table structure for table `bulk_sms_logs`
--

CREATE TABLE `bulk_sms_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sms_log_id` bigint(20) UNSIGNED DEFAULT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `sender_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recipient_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Sent','failed','Scheduled','Pending') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Sent',
  `api_response` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `cost` decimal(8,2) DEFAULT NULL,
  `sent_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `bulk_sms_logs`
--

INSERT INTO `bulk_sms_logs` (`id`, `sms_log_id`, `business_id`, `created_by`, `sender_id`, `recipient_number`, `message`, `status`, `api_response`, `cost`, `sent_at`, `created_at`, `updated_at`) VALUES
(1, 6, 2, 2, '8809617624366', '01713569417', 'Test Message \r\n\r\nKhidamah Tailors', 'failed', '{\"response_code\":1006,\"success_message\":\"\",\"error_message\":\"Unsuccessfull!! Balance Validity Not Available in this hcsb Account\"}', 0.30, '2026-11-01 08:04:59', '2026-11-01 08:04:59', '2026-11-01 08:04:59'),
(2, 6, 2, 2, '8809617624366', '9909431333', 'Test Message \r\n\r\nKhidamah Tailors', 'failed', '{\"response_code\":1006,\"success_message\":\"\",\"error_message\":\"Unsuccessfull!! Balance Validity Not Available in this hcsb Account\"}', 0.30, '2026-11-01 08:04:59', '2026-11-01 08:04:59', '2026-11-01 08:04:59'),
(3, 6, 2, 2, '8809617624366', '01966310440', 'Test Message \r\n\r\nKhidamah Tailors', 'failed', '{\"response_code\":1006,\"success_message\":\"\",\"error_message\":\"Unsuccessfull!! Balance Validity Not Available in this hcsb Account\"}', 0.30, '2026-11-01 08:04:59', '2026-11-01 08:04:59', '2026-11-01 08:04:59'),
(4, 6, 2, 2, '8809617624366', '01793789382', 'Test Message \r\n\r\nKhidamah Tailors', 'failed', '{\"response_code\":1006,\"success_message\":\"\",\"error_message\":\"Unsuccessfull!! Balance Validity Not Available in this hcsb Account\"}', 0.30, '2026-11-01 08:04:59', '2026-11-01 08:04:59', '2026-11-01 08:04:59'),
(5, 6, 2, 2, '8809617624366', '09909409153', 'Test Message \r\n\r\nKhidamah Tailors', 'failed', '{\"response_code\":1006,\"success_message\":\"\",\"error_message\":\"Unsuccessfull!! Balance Validity Not Available in this hcsb Account\"}', 0.30, '2026-11-01 08:04:59', '2026-11-01 08:04:59', '2026-11-01 08:04:59'),
(6, 7, 2, 2, '8809617624366', '01713569417', 'Test Message \r\n\r\nKhidamah Tailors', 'failed', '{\"response_code\":1006,\"success_message\":\"\",\"error_message\":\"Unsuccessfull!! Balance Validity Not Available in this hcsb Account\"}', 0.30, '2026-11-01 08:05:09', '2026-11-01 08:05:09', '2026-11-01 08:05:09'),
(7, 7, 2, 2, '8809617624366', '9909431333', 'Test Message \r\n\r\nKhidamah Tailors', 'failed', '{\"response_code\":1006,\"success_message\":\"\",\"error_message\":\"Unsuccessfull!! Balance Validity Not Available in this hcsb Account\"}', 0.30, '2026-11-01 08:05:09', '2026-11-01 08:05:09', '2026-11-01 08:05:09'),
(8, 7, 2, 2, '8809617624366', '01966310440', 'Test Message \r\n\r\nKhidamah Tailors', 'failed', '{\"response_code\":1006,\"success_message\":\"\",\"error_message\":\"Unsuccessfull!! Balance Validity Not Available in this hcsb Account\"}', 0.30, '2026-11-01 08:05:09', '2026-11-01 08:05:09', '2026-11-01 08:05:09'),
(9, 7, 2, 2, '8809617624366', '01793789382', 'Test Message \r\n\r\nKhidamah Tailors', 'failed', '{\"response_code\":1006,\"success_message\":\"\",\"error_message\":\"Unsuccessfull!! Balance Validity Not Available in this hcsb Account\"}', 0.30, '2026-11-01 08:05:09', '2026-11-01 08:05:09', '2026-11-01 08:05:09'),
(10, 7, 2, 2, '8809617624366', '09909409153', 'Test Message \r\n\r\nKhidamah Tailors', 'failed', '{\"response_code\":1006,\"success_message\":\"\",\"error_message\":\"Unsuccessfull!! Balance Validity Not Available in this hcsb Account\"}', 0.30, '2026-11-01 08:05:09', '2026-11-01 08:05:09', '2026-11-01 08:05:09'),
(11, 8, 2, 2, '8809617624366', '01713569417', 'Test Message \r\n\r\nKhidamah Tailors', 'failed', '{\"response_code\":1006,\"success_message\":\"\",\"error_message\":\"Unsuccessfull!! Balance Validity Not Available in this hcsb Account\"}', 0.30, '2026-11-01 08:07:00', '2026-11-01 08:07:00', '2026-11-01 08:07:00'),
(12, 8, 2, 2, '8809617624366', '9909431333', 'Test Message \r\n\r\nKhidamah Tailors', 'failed', '{\"response_code\":1006,\"success_message\":\"\",\"error_message\":\"Unsuccessfull!! Balance Validity Not Available in this hcsb Account\"}', 0.30, '2026-11-01 08:07:00', '2026-11-01 08:07:00', '2026-11-01 08:07:00'),
(13, 8, 2, 2, '8809617624366', '01966310440', 'Test Message \r\n\r\nKhidamah Tailors', 'failed', '{\"response_code\":1006,\"success_message\":\"\",\"error_message\":\"Unsuccessfull!! Balance Validity Not Available in this hcsb Account\"}', 0.30, '2026-11-01 08:07:00', '2026-11-01 08:07:00', '2026-11-01 08:07:00'),
(14, 8, 2, 2, '8809617624366', '01793789382', 'Test Message \r\n\r\nKhidamah Tailors', 'failed', '{\"response_code\":1006,\"success_message\":\"\",\"error_message\":\"Unsuccessfull!! Balance Validity Not Available in this hcsb Account\"}', 0.30, '2026-11-01 08:07:00', '2026-11-01 08:07:00', '2026-11-01 08:07:00'),
(15, 8, 2, 2, '8809617624366', '09909409153', 'Test Message \r\n\r\nKhidamah Tailors', 'failed', '{\"response_code\":1006,\"success_message\":\"\",\"error_message\":\"Unsuccessfull!! Balance Validity Not Available in this hcsb Account\"}', 0.30, '2026-11-01 08:07:00', '2026-11-01 08:07:00', '2026-11-01 08:07:00'),
(16, 9, 2, 2, '8809617624366', '01713569417', 'Test Message \r\n\r\nKhidamah Tailors', 'Sent', '{\"response_code\":202,\"message_id\":19496680,\"success_message\":\"SMS Submitted Successfully 3\",\"error_message\":\"\"}', 0.30, '2026-11-01 08:11:05', '2026-11-01 08:11:05', '2026-11-01 08:11:05'),
(17, 9, 2, 2, '8809617624366', '9909431333', 'Test Message \r\n\r\nKhidamah Tailors', 'Sent', '{\"response_code\":202,\"message_id\":19496680,\"success_message\":\"SMS Submitted Successfully 3\",\"error_message\":\"\"}', 0.30, '2026-11-01 08:11:05', '2026-11-01 08:11:05', '2026-11-01 08:11:05'),
(18, 9, 2, 2, '8809617624366', '01966310440', 'Test Message \r\n\r\nKhidamah Tailors', 'Sent', '{\"response_code\":202,\"message_id\":19496680,\"success_message\":\"SMS Submitted Successfully 3\",\"error_message\":\"\"}', 0.30, '2026-11-01 08:11:05', '2026-11-01 08:11:05', '2026-11-01 08:11:05'),
(19, 9, 2, 2, '8809617624366', '01793789382', 'Test Message \r\n\r\nKhidamah Tailors', 'Sent', '{\"response_code\":202,\"message_id\":19496680,\"success_message\":\"SMS Submitted Successfully 3\",\"error_message\":\"\"}', 0.30, '2026-11-01 08:11:05', '2026-11-01 08:11:05', '2026-11-01 08:11:05'),
(20, 9, 2, 2, '8809617624366', '09909409153', 'Test Message \r\n\r\nKhidamah Tailors', 'Sent', '{\"response_code\":202,\"message_id\":19496680,\"success_message\":\"SMS Submitted Successfully 3\",\"error_message\":\"\"}', 0.30, '2026-11-01 08:11:06', '2026-11-01 08:11:06', '2026-11-01 08:11:06');

-- --------------------------------------------------------

--
-- Table structure for table `sms_logs`
--

CREATE TABLE `sms_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `sender_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `recipient_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('sent','failed','pending') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `sms_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_response` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `cost` decimal(8,2) DEFAULT NULL,
  `sent_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `sms_logs`
--

INSERT INTO `sms_logs` (`id`, `business_id`, `created_by`, `sender_id`, `recipient_number`, `message`, `status`, `sms_type`, `api_response`, `cost`, `sent_at`, `created_at`, `updated_at`) VALUES
(1, 2, 2, '8809617624366', '01713569417', 'Test', 'sent', 'Single', '{\"response_code\":202,\"message_id\":10710758,\"success_message\":\"SMS Submitted Successfully 1\",\"error_message\":\"\"}', 0.30, '2026-09-01 17:11:33', '2026-09-01 17:11:33', '2026-09-01 17:11:33'),
(2, 2, 2, '8809617624366', '01713569417', 'Test', '', 'Single', NULL, 0.30, '2026-09-01 17:12:29', '2026-09-01 17:12:29', '2026-09-01 17:12:29'),
(3, 2, 2, '8809617624366', '01713569417', 'Test', 'sent', 'Single', '{\"response_code\":202,\"message_id\":10718164,\"success_message\":\"SMS Submitted Successfully 1\",\"error_message\":\"\"}', 0.30, '2026-09-01 18:12:05', '2026-09-01 18:12:05', '2026-09-01 18:12:05'),
(4, 2, 2, '8809617624366', '01966310440', 'Assalamu Alaikum', 'sent', 'Single', '{\"response_code\":202,\"message_id\":14489974,\"success_message\":\"SMS Submitted Successfully 1\",\"error_message\":\"\"}', 0.30, '2026-09-27 13:00:25', '2026-09-27 13:00:25', '2026-09-27 13:00:25'),
(5, 2, 2, '8809617624366', '01713569417', 'Assalamu Alaikum', 'sent', 'Single', '{\"response_code\":202,\"message_id\":14490049,\"success_message\":\"SMS Submitted Successfully 1\",\"error_message\":\"\"}', 0.30, '2026-09-27 13:00:51', '2026-09-27 13:00:51', '2026-09-27 13:00:51'),
(6, 2, 2, '8809617624366', '01713569417,9909431333,01966310440,01793789382,09909409153', 'Test Message \r\n\r\nKhidamah Tailors', 'failed', 'Group', '{\"response_code\":1006,\"success_message\":\"\",\"error_message\":\"Unsuccessfull!! Balance Validity Not Available in this hcsb Account\"}', 0.30, '2026-11-01 08:04:59', '2026-11-01 08:04:59', '2026-11-01 08:04:59'),
(7, 2, 2, '8809617624366', '01713569417,9909431333,01966310440,01793789382,09909409153', 'Test Message \r\n\r\nKhidamah Tailors', 'failed', 'Group', '{\"response_code\":1006,\"success_message\":\"\",\"error_message\":\"Unsuccessfull!! Balance Validity Not Available in this hcsb Account\"}', 0.30, '2026-11-01 08:05:08', '2026-11-01 08:05:08', '2026-11-01 08:05:08'),
(8, 2, 2, '8809617624366', '01713569417,9909431333,01966310440,01793789382,09909409153', 'Test Message \r\n\r\nKhidamah Tailors', 'failed', 'Group', '{\"response_code\":1006,\"success_message\":\"\",\"error_message\":\"Unsuccessfull!! Balance Validity Not Available in this hcsb Account\"}', 0.30, '2026-11-01 08:07:00', '2026-11-01 08:07:00', '2026-11-01 08:07:00'),
(9, 2, 2, '8809617624366', '01713569417,9909431333,01966310440,01793789382,09909409153', 'Test Message \r\n\r\nKhidamah Tailors', 'sent', 'Group', '{\"response_code\":202,\"message_id\":19496680,\"success_message\":\"SMS Submitted Successfully 3\",\"error_message\":\"\"}', 1.50, '2026-11-01 08:11:05', '2026-11-01 08:11:05', '2026-11-01 08:11:05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bulk_sms_logs`
--
ALTER TABLE `bulk_sms_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bulk_sms_logs_sms_log_id_foreign` (`sms_log_id`),
  ADD KEY `bulk_sms_logs_business_id_foreign` (`business_id`),
  ADD KEY `bulk_sms_logs_created_by_foreign` (`created_by`);

--
-- Indexes for table `sms_logs`
--
ALTER TABLE `sms_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sms_logs_business_id_foreign` (`business_id`),
  ADD KEY `sms_logs_created_by_foreign` (`created_by`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bulk_sms_logs`
--
ALTER TABLE `bulk_sms_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `sms_logs`
--
ALTER TABLE `sms_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `sms_logs`
--
ALTER TABLE `sms_logs`
  ADD CONSTRAINT `sms_logs_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sms_logs_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
