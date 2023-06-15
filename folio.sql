-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 15, 2023 at 05:41 PM
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
-- Database: `folio`
--

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `title` varchar(1000) NOT NULL,
  `slug` varchar(1000) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `url` varchar(1000) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `user_id`, `image`, `title`, `slug`, `status`, `url`, `description`, `created_at`, `updated_at`) VALUES
(3, 1, 'images/blogpost/QWd7iItEKI9v01q1.png', 'Laravel Guards', 'laravel-guards', 1, 'https://dev.to/gedons/customizing-authentication-in-laravel-building-a-custom-guard-5954', 'Customizing Authentication in Laravel: Building a Custom Guard', '2023-06-12 20:22:17', '2023-06-14 07:17:59'),
(4, 1, 'images/blogpost/kfcW9lvbd24z82Ec.png', 'Web Development Hosting', 'web-development-hosting', 1, 'https://dev.to/gedons/hosting-a-static-html-and-tailwind-css-website-using-surge-a-step-by-step-guide-3g4l', 'Hosting a Static HTML and Tailwind CSS Website Using Surge: A Step-by-Step Guide', '2023-06-12 20:23:09', '2023-06-14 07:12:58');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(1000) NOT NULL,
  `email` varchar(1000) NOT NULL,
  `message` varchar(1000) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `message`, `created_at`, `updated_at`) VALUES
(1, 'Gedoni Ani', 'gedoniani01@gmail.com', 'Test Again', '2023-06-15 09:09:26', '2023-06-15 09:09:26'),
(2, 'Basil Nneh', 'basilgreat61@gmail.com', 'Hello', '2023-06-15 09:11:13', '2023-06-15 09:11:13'),
(3, 'Gedoni Ani', 'gedoniani@gmail.com', 'Test', '2023-06-15 09:16:16', '2023-06-15 09:16:16'),
(4, 'Basil Nneh', 'basilgreat61@gmail.com', 'Test New Fixtures', '2023-06-15 10:56:56', '2023-06-15 10:56:56');

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
(7, '2014_10_12_000000_create_users_table', 1),
(8, '2014_10_12_100000_create_password_resets_table', 1),
(9, '2019_08_19_000000_create_failed_jobs_table', 1),
(10, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(11, '2023_06_09_090337_create_projects_table', 1),
(12, '2023_06_09_100202_create_blogs_table', 1),
(13, '2023_06_11_185638_add_url_to_projects_table', 2),
(14, '2023_06_12_060206_add_columns_to_blogs_table', 3),
(15, '2023_06_12_064511_add_url_to_blogs_table', 4),
(16, '2023_06_15_090735_create_contactmails_table', 5),
(17, '2023_06_15_095231_create_contacts_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(2, 'App\\Models\\User', 1, 'main', 'fe282f06f17c6f19ddc9925994809371732d56e2669f85bbbc717b7351e1549a', '[\"*\"]', '2023-06-12 03:15:49', '2023-06-11 15:40:56', '2023-06-12 03:15:49'),
(3, 'App\\Models\\User', 1, 'main', '9ab45dcfd06204c40dfb65bb8cc5d4857db55bba519f11b603f543ada03d75b8', '[\"*\"]', '2023-06-12 03:26:46', '2023-06-12 03:26:42', '2023-06-12 03:26:46'),
(4, 'App\\Models\\User', 1, 'main', '4d5408e8bfb5fd2aeb469d5935773eb76f462badfbf3617f7bde1435658565d1', '[\"*\"]', '2023-06-12 03:34:17', '2023-06-12 03:34:13', '2023-06-12 03:34:17'),
(5, 'App\\Models\\User', 1, 'main', '5b921f7bbf4ef5847c27c5107baea95605d91d94a3bc3f7121b93c1328c0aead', '[\"*\"]', '2023-06-12 03:40:25', '2023-06-12 03:40:22', '2023-06-12 03:40:25'),
(6, 'App\\Models\\User', 1, 'main', 'b6521d025d481eb44ed601e3502fbfd10ad2f2cd3f618dd95d7b12f9cfe3d69c', '[\"*\"]', '2023-06-12 03:56:37', '2023-06-12 03:42:24', '2023-06-12 03:56:37'),
(7, 'App\\Models\\User', 1, 'main', 'cd7db97c828e19145cff7ee63f60349faa30467dab486deaa95074722af54e63', '[\"*\"]', '2023-06-14 08:13:01', '2023-06-12 04:36:16', '2023-06-14 08:13:01'),
(8, 'App\\Models\\User', 1, 'main', 'f3280a9442b9409930ed351e6c8a2b665e773c5f1e0a296326fec154de1cbd8f', '[\"*\"]', '2023-06-15 12:56:27', '2023-06-15 10:37:48', '2023-06-15 12:56:27');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `title` varchar(1000) NOT NULL,
  `slug` varchar(1000) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `url` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `user_id`, `image`, `title`, `slug`, `status`, `description`, `created_at`, `updated_at`, `url`) VALUES
(5, 1, 'images/N4dEtFsYa9MHfkap.png', 'balance updated', 'balance-updated', 1, 'desc Updated', '2023-06-10 11:11:25', '2023-06-10 17:18:32', 'https://www.instagram.com/p/Ce324EWNr1A/?igshid=Ym...'),
(6, 1, 'images/LSa4dPzbiDpx9UUr.png', 'Test', 'test', 0, 'Description', '2023-06-10 17:15:34', '2023-06-10 17:15:34', 'https://www.instagram.com/p/Ce324EWNr1A/?igshid=Ym...'),
(7, 1, 'images/RiBenA4p2JMDxBhS.png', 'Lee', 'lee', 1, 'Le Description', '2023-06-11 13:19:55', '2023-06-12 02:56:23', 'https://www.instagram.com/p/Ce324EWNr1A/?igshid=Ym...'),
(9, 1, 'images/0Nmt2mC3nL46UWAv.png', 'Light Bulb', 'light-bulb', 0, 'Description', '2023-06-11 13:41:45', '2023-06-12 05:55:53', 'https://www.instagram.com/p/Ce324EWNr1A/?igshid=YmMyMTA2M2Y=');

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

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Gedoni Ani', 'gedoniani@gmail.com', NULL, '$2y$10$4ar3tgWrF/ra2PcGqK0AGumixz5z021OeKW1LZcOU1tC.EUJrCmaG', NULL, '2023-06-10 10:29:29', '2023-06-10 10:29:29');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
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
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
