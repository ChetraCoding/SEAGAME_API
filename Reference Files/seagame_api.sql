-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 16, 2023 at 01:48 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `seagame_api`
--

-- --------------------------------------------------------

--
-- Table structure for table `competitions`
--

CREATE TABLE `competitions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `time` time NOT NULL,
  `schedule_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `competitions`
--

INSERT INTO `competitions` (`id`, `time`, `schedule_id`, `created_at`, `updated_at`) VALUES
(1, '16:00:00', 1, '2023-05-13 15:57:26', '2023-05-13 15:57:26'),
(2, '19:00:00', 1, '2023-05-13 15:59:29', '2023-05-13 15:59:29'),
(3, '16:00:00', 2, '2023-05-13 16:00:04', '2023-05-13 16:03:50'),
(4, '19:00:00', 2, '2023-05-13 16:01:19', '2023-05-13 16:01:19'),
(5, '16:00:00', 3, '2023-05-14 07:25:13', '2023-05-14 07:25:13');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_05_12_015030_create_sports_table', 1),
(6, '2023_05_12_015216_create_stadia_table', 1),
(7, '2023_05_12_015242_create_zones_table', 1),
(8, '2023_05_13_015137_create_schedules_table', 1),
(9, '2023_05_14_015257_create_competitions_table', 1),
(10, '2023_05_14_015306_create_tickets_table', 1),
(11, '2023_05_14_121007_create_teams_table', 1),
(12, '2023_05_14_121030_create_team_competitions_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(225) NOT NULL,
  `date` date NOT NULL,
  `description` varchar(255) NOT NULL,
  `sport_id` bigint(20) UNSIGNED NOT NULL,
  `stadium_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `schedules`
--

INSERT INTO `schedules` (`id`, `name`, `date`, `description`, `sport_id`, `stadium_id`, `created_at`, `updated_at`) VALUES
(1, 'MEN\'S FOOTBALL U22 GROUP-B', '2023-05-17', 'This is description.', 1, 4, '2023-05-13 15:53:27', '2023-05-14 18:57:22'),
(2, 'MEN\'S FOOTBALL U22 GROUP-A', '2023-05-16', 'This is description.', 1, 1, '2023-05-13 15:53:53', '2023-05-13 15:53:53'),
(3, 'WOMEN\'S SWIMMING', '2023-05-18', 'This is description.', 4, 1, '2023-05-13 15:54:15', '2023-05-13 15:54:15');

-- --------------------------------------------------------

--
-- Table structure for table `sports`
--

CREATE TABLE `sports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sports`
--

INSERT INTO `sports` (`id`, `type`, `created_at`, `updated_at`) VALUES
(1, 'Football', '2023-05-13 15:35:13', '2023-05-14 18:56:15'),
(2, 'Volleyball', '2023-05-13 15:35:24', '2023-05-13 15:35:24'),
(3, 'Running', '2023-05-13 15:35:37', '2023-05-13 15:35:37'),
(4, 'Swimming', '2023-05-13 15:45:29', '2023-05-13 15:45:29'),
(5, 'Basketball', '2023-05-14 18:07:58', '2023-05-14 18:07:58');

-- --------------------------------------------------------

--
-- Table structure for table `stadia`
--

CREATE TABLE `stadia` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stadia`
--

INSERT INTO `stadia` (`id`, `name`, `address`, `created_at`, `updated_at`) VALUES
(1, 'Morodok Techo National Stadium', 'Ly, Yongphat St., Phnom Penh, Cambodia', '2023-05-13 15:38:02', '2023-05-13 15:38:02'),
(2, 'Olympic Stadium', 'Phnom Penh, Cambodia', '2023-05-13 15:38:51', '2023-05-13 15:38:51'),
(3, 'Visakha Stadium', 'Phnom Penh, Cambodia', '2023-05-13 15:39:23', '2023-05-13 15:39:23'),
(4, 'RSN Stadium', 'Phnom Penh, Cambodia', '2023-05-13 15:39:55', '2023-05-13 15:39:55');

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Cambodia', '2023-05-13 22:30:49', '2023-05-13 22:32:02'),
(2, 'Vietnam', '2023-05-13 22:31:15', '2023-05-13 22:32:09'),
(3, 'Thailand', '2023-05-13 22:32:40', '2023-05-13 22:32:40'),
(4, 'Philippenes', '2023-05-13 22:32:58', '2023-05-13 22:32:58'),
(6, 'Malaysia', '2023-05-13 22:33:57', '2023-05-13 22:33:57'),
(7, 'Indonesia', '2023-05-14 06:24:47', '2023-05-14 06:24:47'),
(8, 'Laos', '2023-05-14 06:28:41', '2023-05-14 07:17:06'),
(9, 'Myanmar', '2023-05-14 07:18:04', '2023-05-14 07:18:04'),
(10, 'Singapore', '2023-05-14 07:18:20', '2023-05-14 07:18:20'),
(11, 'Timor-Leste', '2023-05-14 07:19:21', '2023-05-14 07:19:21');

-- --------------------------------------------------------

--
-- Table structure for table `team_competitions`
--

CREATE TABLE `team_competitions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `competition_id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `team_competitions`
--

INSERT INTO `team_competitions` (`id`, `competition_id`, `team_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2023-05-14 06:23:31', '2023-05-14 06:23:31'),
(2, 1, 4, '2023-05-14 06:23:40', '2023-05-14 06:23:40'),
(3, 2, 6, '2023-05-14 06:25:42', '2023-05-14 06:25:42'),
(4, 2, 7, '2023-05-14 06:25:48', '2023-05-14 06:25:48'),
(5, 3, 2, '2023-05-14 06:26:53', '2023-05-14 06:26:53'),
(6, 3, 3, '2023-05-14 06:27:00', '2023-05-14 06:27:00'),
(7, 4, 8, '2023-05-14 06:29:02', '2023-05-14 06:29:02'),
(8, 4, 6, '2023-05-14 06:29:13', '2023-05-14 06:29:13'),
(9, 5, 1, '2023-05-14 07:27:13', '2023-05-14 07:27:13'),
(10, 5, 2, '2023-05-14 07:27:19', '2023-05-14 07:27:19'),
(11, 5, 3, '2023-05-14 07:27:24', '2023-05-14 07:27:24'),
(12, 5, 4, '2023-05-14 07:27:44', '2023-05-14 07:27:44'),
(13, 5, 6, '2023-05-14 07:32:56', '2023-05-14 07:32:56'),
(14, 5, 7, '2023-05-14 07:33:01', '2023-05-14 07:33:01'),
(15, 5, 8, '2023-05-14 07:33:05', '2023-05-14 07:33:05'),
(16, 5, 9, '2023-05-14 07:33:10', '2023-05-14 07:33:10'),
(17, 5, 10, '2023-05-14 07:33:16', '2023-05-14 07:33:16'),
(18, 5, 11, '2023-05-14 07:33:21', '2023-05-14 07:33:21');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `schedule_id` bigint(20) UNSIGNED NOT NULL,
  `zone_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`id`, `schedule_id`, `zone_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2023-05-14 07:00:34', '2023-05-14 07:00:34'),
(2, 1, 1, '2023-05-14 07:00:36', '2023-05-14 07:00:36'),
(3, 1, 2, '2023-05-14 07:00:46', '2023-05-14 07:00:46'),
(4, 1, 2, '2023-05-14 07:00:48', '2023-05-14 07:00:48'),
(5, 1, 2, '2023-05-14 07:00:51', '2023-05-14 07:00:51'),
(6, 2, 1, '2023-05-14 07:02:39', '2023-05-14 07:02:39'),
(7, 2, 1, '2023-05-14 07:02:41', '2023-05-14 07:02:41'),
(8, 2, 2, '2023-05-14 07:02:48', '2023-05-14 07:02:48'),
(10, 1, 2, '2023-05-14 18:52:36', '2023-05-14 18:53:57'),
(13, 1, 7, '2023-05-14 21:16:15', '2023-05-14 21:16:15'),
(14, 3, 1, '2023-05-14 21:20:32', '2023-05-14 21:20:32'),
(15, 3, 1, '2023-05-14 21:20:40', '2023-05-14 21:20:40'),
(16, 1, 7, '2023-05-15 05:37:32', '2023-05-15 05:37:32'),
(17, 2, 2, '2023-05-15 05:38:13', '2023-05-15 05:38:13');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `zones`
--

CREATE TABLE `zones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `numberOfTickets` int(11) NOT NULL,
  `stadium_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `zones`
--

INSERT INTO `zones` (`id`, `code`, `numberOfTickets`, `stadium_id`, `created_at`, `updated_at`) VALUES
(1, 'A', 2, 1, '2023-05-13 15:47:34', '2023-05-13 15:47:34'),
(2, 'B', 20000, 1, '2023-05-13 15:48:39', '2023-05-13 15:48:39'),
(3, 'A', 5000, 2, '2023-05-13 15:48:58', '2023-05-13 15:48:58'),
(4, 'B', 10000, 2, '2023-05-13 15:49:09', '2023-05-13 15:49:09'),
(5, 'F', 5000, 3, '2023-05-13 15:50:09', '2023-05-13 15:50:09'),
(6, 'H', 5000, 3, '2023-05-13 15:50:20', '2023-05-13 15:50:20'),
(7, 'C', 4000, 4, '2023-05-13 15:50:43', '2023-05-13 15:50:43'),
(8, 'D', 8000, 4, '2023-05-13 15:50:52', '2023-05-13 15:50:52');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `competitions`
--
ALTER TABLE `competitions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `competitions_schedule_id_foreign` (`schedule_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `schedules_sport_id_foreign` (`sport_id`),
  ADD KEY `schedules_stadium_id_foreign` (`stadium_id`);

--
-- Indexes for table `sports`
--
ALTER TABLE `sports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stadia`
--
ALTER TABLE `stadia`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `teams_name_unique` (`name`);

--
-- Indexes for table `team_competitions`
--
ALTER TABLE `team_competitions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `team_competitions_competition_id_foreign` (`competition_id`),
  ADD KEY `team_competitions_team_id_foreign` (`team_id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tickets_schedule_id_foreign` (`schedule_id`),
  ADD KEY `tickets_zone_id_foreign` (`zone_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `zones`
--
ALTER TABLE `zones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zones_stadium_id_foreign` (`stadium_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `competitions`
--
ALTER TABLE `competitions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sports`
--
ALTER TABLE `sports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `stadia`
--
ALTER TABLE `stadia`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `team_competitions`
--
ALTER TABLE `team_competitions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zones`
--
ALTER TABLE `zones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `competitions`
--
ALTER TABLE `competitions`
  ADD CONSTRAINT `competitions_schedule_id_foreign` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `schedules`
--
ALTER TABLE `schedules`
  ADD CONSTRAINT `schedules_sport_id_foreign` FOREIGN KEY (`sport_id`) REFERENCES `sports` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `schedules_stadium_id_foreign` FOREIGN KEY (`stadium_id`) REFERENCES `stadia` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `team_competitions`
--
ALTER TABLE `team_competitions`
  ADD CONSTRAINT `team_competitions_competition_id_foreign` FOREIGN KEY (`competition_id`) REFERENCES `competitions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `team_competitions_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_schedule_id_foreign` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tickets_zone_id_foreign` FOREIGN KEY (`zone_id`) REFERENCES `zones` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `zones`
--
ALTER TABLE `zones`
  ADD CONSTRAINT `zones_stadium_id_foreign` FOREIGN KEY (`stadium_id`) REFERENCES `stadia` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
