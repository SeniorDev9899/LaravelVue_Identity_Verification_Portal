-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 31, 2022 at 11:51 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `identity_verification_prod`
--

-- --------------------------------------------------------

--
-- Table structure for table `avatars`
--

CREATE TABLE `avatars` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `avatars`
--

INSERT INTO `avatars` (`id`, `created_at`, `updated_at`, `user_id`, `name`, `path`) VALUES
(1, '2022-03-29 10:32:37', '2022-03-29 10:32:37', '9', '1648582357_Photo.jpeg', '/private/storage/app/public/uploads/1648582357_Photo.jpeg'),
(2, '2022-03-29 10:51:25', '2022-03-29 10:51:25', '10', '1648583485_Photo.jpeg', '/private/storage/app/public/uploads/1648583485_Photo.jpeg'),
(3, '2022-03-29 10:56:14', '2022-03-30 21:00:51', '1', '1648706451_profile_logo_.jpg', '/private/storage/app/public/uploads/1648706451_profile_logo_.jpg'),
(4, '2022-03-29 11:06:57', '2022-03-29 11:06:57', '11', '1648584417_Vladislav P.jpg', '/private/storage/app/public/uploads/1648584417_Vladislav P.jpg'),
(5, '2022-03-29 21:22:06', '2022-03-29 21:22:06', '13', '1648621326_Vladislav P.jpg', '/private/storage/app/public/uploads/1648621326_Vladislav P.jpg'),
(6, '2022-03-29 21:32:08', '2022-03-29 21:32:08', '14', '1648621928_Photo.jpeg', '/private/storage/app/public/uploads/1648621928_Photo.jpeg'),
(7, '2022-03-29 21:34:46', '2022-03-29 21:34:46', '16', '1648622086_profile_logo_SEVFK_ad7bc863acc50ad3b747c51c2f85b431.jpg', '/private/storage/app/public/uploads/1648622086_profile_logo_SEVFK_ad7bc863acc50ad3b747c51c2f85b431.jpg'),
(8, '2022-03-29 21:37:20', '2022-03-30 03:05:53', '17', '1648641953_profile_logo_ROALO_d9f9e833dfa2ab2cdeebd91393d9ea01.jpeg', '/private/storage/app/public/uploads/1648641953_profile_logo_ROALO_d9f9e833dfa2ab2cdeebd91393d9ea01.jpeg'),
(9, '2022-03-29 23:18:14', '2022-03-29 23:18:14', '18', '1648628294_myPicture1.PNG', '/private/storage/app/public/uploads/1648628294_myPicture1.PNG'),
(10, '2022-03-30 03:01:47', '2022-03-30 19:04:21', '19', '1648699461_85980370.jpg', '/private/storage/app/public/uploads/1648699461_85980370.jpg'),
(11, '2022-03-30 03:54:25', '2022-03-30 03:54:25', '25', '1648644865_Angely.jpg', '/private/storage/app/public/uploads/1648644865_Angely.jpg'),
(12, '2022-03-30 04:34:41', '2022-03-30 21:01:02', '26', '1648706462_myPicture6.PNG', '/private/storage/app/public/uploads/1648706462_myPicture6.PNG'),
(13, '2022-03-30 06:41:06', '2022-03-30 06:41:06', '30', '1648654866_Ashraf.png', '/private/storage/app/public/uploads/1648654866_Ashraf.png'),
(14, '2022-03-30 06:47:09', '2022-03-30 06:47:09', '31', '1648655229_avatar3.png', '/private/storage/app/public/uploads/1648655229_avatar3.png');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_05_13_060834_create_settings_table', 1),
(4, '2018_05_22_084901_create_todos_table', 1),
(5, '2022_03_28_120705_add_new_columns_to_users_table', 1),
(6, '2022_03_28_181458_create_avatars_table', 1),
(7, '2022_03_28_181645_add_user_id_to_avatars_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `option` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `todos`
--

CREATE TABLE `todos` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `completed` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'practitioner',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `picture` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '...',
  `id_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '...',
  `serial_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '...',
  `validity_period` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '...',
  `company` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '...',
  `region` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '...',
  `verification_result` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'nonactivated',
  `health_status` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'normal',
  `remark_information` longtext COLLATE utf8_unicode_ci NOT NULL DEFAULT '...'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `password`, `role`, `created_at`, `updated_at`, `gender`, `picture`, `id_number`, `serial_number`, `validity_period`, `company`, `region`, `verification_result`, `health_status`, `remark_information`) VALUES
(1, 'Alex', 'Rossi', 'AlexRossitha99@gmail.com', '$2y$10$Cl901ni4fGuKjIJeY3XOneiJvtKqEzwmplzV1x17X8wJrl0EfTIB6', 'admin', '2022-03-29 07:37:26', '2022-03-29 22:50:12', 'male', '...', '...', '...', '...', '...', '...', 'nonactivated', 'normal', '...'),
(13, 'Ivan', 'Petrovich', 'IvanPetrovich199899@gmail.com', '$2y$10$H4ooTwCALmsBv./llWYVre9Edw0F/UY57Cn8g0RcoE9PixUWtwFTW', 'practitioner', '2022-03-29 21:21:43', '2022-03-29 23:06:56', 'male', '...', '...', '...', '...', '...', '...', 'nonactivated', 'bad', '...'),
(14, 'Okcana', 'Deshura', 'oxankaorb@gmail.com', '$2y$10$n8kKSKjrgfJP1bAPINb2h.32eHwl6yv6B/3kI4voalComBf5fkH66', 'practitioner', '2022-03-29 21:25:21', '2022-03-29 21:25:21', 'female', '...', '...', '...', '...', '...', '...', 'nonactivated', 'good', '...'),
(16, 'Tenoch', 'Bush', 'tenochbush@gmail.com', '$2y$10$ZDT36ijaPimV2CfzYJYPzuGdIxii5Y2VeKXkmDnypmm0HCAbF3yJu', 'practitioner', '2022-03-29 21:34:28', '2022-03-29 21:34:28', 'male', '...', '...', '...', '...', '...', '...', 'nonactivated', 'normal', '...'),
(17, 'Anastasia', 'Dorisela', 'anastasia9899@gmail.com', '$2y$10$1h.PWMV9/aGCi64TOWE/S.9ECYAXobqVhTr0skTYCU15ubvg1Q9Ee', 'practitioner', '2022-03-29 21:37:05', '2022-03-29 22:48:06', 'female', '...', '...', '...', '...', '...', '...', 'nonactivated', 'good', '...'),
(18, 'Sergey', 'Petrov', 'sergeylee199585@gmail.com', '$2y$10$AVydFiWwbFNcGj2s2F7n7ePB9yVpcsaHXGR6b0T8zV9xTpF89ffX2', 'practitioner', '2022-03-29 23:17:58', '2022-03-29 23:21:07', 'male', '...', '...', '...', '...', '...', '...', 'nonactivated', 'bad', '...'),
(19, 'Alexandr', 'Oblask', 'Alexandr@gmail.com', '$2y$10$sADGMEQZbmAYDGecjkeqxeXT7c0mfW08DLr5QisvxQ9YSrEi44TPu', 'practitioner', '2022-03-30 01:30:48', '2022-03-30 01:30:48', 'male', '...', '...', '...', '...', '...', '...', 'nonactivated', 'normal', '...'),
(25, 'Olga', 'Angely', 'angelyolga@gmail.com', '$2y$10$7PO/QHYQgVhsXQjLFljbAuV6vSwUcud8bmLtfkJy3c21GknJMvm3S', 'regional_admin', '2022-03-30 03:52:51', '2022-03-30 03:52:51', 'female', '...', '...', '...', '...', '...', '...', 'nonactivated', 'normal', '...'),
(26, 'Jackson', 'Stark', 'jackson.stark@gmail.com', '$2y$10$IWIbf1fOsBCNzzRKFKqiqO2ZwOkekEbVvKsuilSXGFB3QzPSoYfd2', 'regional_admin', '2022-03-30 04:34:27', '2022-03-30 04:34:27', 'male', '...', '...', '...', '...', '...', '...', 'nonactivated', 'good', '...'),
(30, 'Reem', 'Ashraf', 'reem.ashraf@gmail.com', '$2y$10$eQzIk8CtBtF1bGwhEwJUdOVdCNCzEVHgCktuTNxwyPOtDUrAxWT26', 'regional_admin', '2022-03-30 06:40:51', '2022-03-30 06:40:51', 'female', '...', '...', '...', '...', '...', '...', 'nonactivated', 'normal', '...'),
(31, 'Nathalia', 'Indigo', 'natalia.indigo@gmail.com', '$2y$10$pF9UsM6ZkUhOzLgqY7chje291LDUpzkdiDBEDmrPA91JVGGpdAgs.', 'regional_admin', '2022-03-30 06:46:51', '2022-03-30 06:46:51', 'female', '...', '...', '...', '...', '...', '...', 'nonactivated', 'bad', '...');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `avatars`
--
ALTER TABLE `avatars`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `todos`
--
ALTER TABLE `todos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `avatars`
--
ALTER TABLE `avatars`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `todos`
--
ALTER TABLE `todos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
