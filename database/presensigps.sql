-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 03, 2023 at 12:32 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `presensigps`
--

-- --------------------------------------------------------

--
-- Table structure for table `divisi`
--

CREATE TABLE `divisi` (
  `kode_divisi` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama_divisi` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `divisi`
--

INSERT INTO `divisi` (`kode_divisi`, `nama_divisi`) VALUES
('jabodetabek', 'jabodetabek'),
('jawa_barat', 'jawa barat'),
('jawa_tengah', 'jawa tengah'),
('jawa_timur', 'jawa timur');

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `nik` char(5) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nama_lengkap` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `jabatan` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `no_hp` varchar(13) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `remember_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `foto` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `kode_divisi` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `karyawan`
--

INSERT INTO `karyawan` (`nik`, `nama_lengkap`, `jabatan`, `no_hp`, `password`, `remember_token`, `foto`, `kode_divisi`) VALUES
('12345', 'zaki123', 'driver', '08123456789', '$2y$10$VUtpSPpcuq8n/NfsiPBsgu9yQ8r3Ab1dL9qtVV1dHXGXyIzTtF34G', NULL, '12345.png', 'jawa_barat'),
('6789', 'latip', 'driver', '08987654321', '$2y$10$VUtpSPpcuq8n/NfsiPBsgu9yQ8r3Ab1dL9qtVV1dHXGXyIzTtF34G', NULL, NULL, 'jawa_timur'),
('123', '123', 'driver', '081111111111', '$2y$10$VUtpSPpcuq8n/NfsiPBsgu9yQ8r3Ab1dL9qtVV1dHXGXyIzTtF34G', NULL, NULL, 'jabodetabek'),
('1112', 'citra', 'IT', '082222222', '$2y$10$VUtpSPpcuq8n/NfsiPBsgu9yQ8r3Ab1dL9qtVV1dHXGXyIzTtF34G', NULL, NULL, 'jawa_tengah'),
('1969', 'ibnu', 'manager', '08765682', '$2y$10$VUtpSPpcuq8n/NfsiPBsgu9yQ8r3Ab1dL9qtVV1dHXGXyIzTtF34G', NULL, NULL, 'jabodetabek'),
('12345', 'tes1', 'driver', '08123123123', '$2y$10$vfDhAOaRJsGmRldFotvtLOjCiYR9bsiz.dE7tDuvscScdIZu8/GLW', NULL, NULL, 'jabodetabek'),
('321', 'asdas', 'driver', '081231231', '$2y$10$YSyXg1s2kv53WVcNE.Gx.OwsMwtVZHUTAE8.eE.F7FtN7p9dB.fzO', NULL, NULL, 'jawa_tengah');

-- --------------------------------------------------------

--
-- Table structure for table `presensi`
--

CREATE TABLE `presensi` (
  `id` int DEFAULT NULL,
  `nik` char(5) COLLATE utf8mb4_general_ci NOT NULL,
  `tgl_presensi` date NOT NULL,
  `jam_in` time NOT NULL,
  `jam_out` time DEFAULT NULL,
  `foto_in` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `foto_out` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `lokasi_in` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `lokasi_out` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `keterangan_in` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `keterangan_out` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'zaki', '123@gmail.com', NULL, '$2y$10$VUtpSPpcuq8n/NfsiPBsgu9yQ8r3Ab1dL9qtVV1dHXGXyIzTtF34G', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `divisi`
--
ALTER TABLE `divisi`
  ADD PRIMARY KEY (`kode_divisi`);

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
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
