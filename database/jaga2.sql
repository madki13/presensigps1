-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 03, 2023 at 08:09 AM
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
  `kode_divisi` char(3) COLLATE utf8mb4_general_ci NOT NULL,
  `nama_divisi` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `divisi`
--

INSERT INTO `divisi` (`kode_divisi`, `nama_divisi`) VALUES
('IT', 'Teknologi Informasi'),
('MJM', 'Manajemen'),
('MKT', 'Marketing');

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
  `kode_divisi` char(3) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `karyawan`
--

INSERT INTO `karyawan` (`nik`, `nama_lengkap`, `jabatan`, `no_hp`, `password`, `remember_token`, `foto`, `kode_divisi`) VALUES
('12345', 'zaki123', 'driver', '08123456789', '$2y$10$VUtpSPpcuq8n/NfsiPBsgu9yQ8r3Ab1dL9qtVV1dHXGXyIzTtF34G', NULL, '12345.png', 'IT'),
('6789', 'latip', 'driver', '08987654321', '$2y$10$VUtpSPpcuq8n/NfsiPBsgu9yQ8r3Ab1dL9qtVV1dHXGXyIzTtF34G', NULL, NULL, 'IT'),
('123', '123', 'driver', '081111111111', '$2y$10$VUtpSPpcuq8n/NfsiPBsgu9yQ8r3Ab1dL9qtVV1dHXGXyIzTtF34G', NULL, NULL, 'MKT'),
('1112', 'citra', 'IT', '082222222', '$2y$10$VUtpSPpcuq8n/NfsiPBsgu9yQ8r3Ab1dL9qtVV1dHXGXyIzTtF34G', NULL, NULL, 'IT');

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

--
-- Dumping data for table `presensi`
--

INSERT INTO `presensi` (`id`, `nik`, `tgl_presensi`, `jam_in`, `jam_out`, `foto_in`, `foto_out`, `lokasi_in`, `lokasi_out`, `keterangan_in`, `keterangan_out`) VALUES
(NULL, '12345', '2023-11-27', '18:27:38', '22:32:27', '12345-2023-11-27-18-27-38.png', '12345-2023-11-27-22-32-27.png', '-6.2193301,106.8384543', '-6.2193301,106.8384543', NULL, NULL),
(NULL, '12345', '2023-11-28', '11:48:38', '11:48:54', '12345-2023-11-28-11-48-38.png', '12345-2023-11-28-11-48-54.png', '-6.2801385,107.0121592', '-6.2801385,107.0121592', NULL, NULL),
(NULL, '12345', '2023-11-29', '13:18:31', '16:01:03', '12345-2023-11-29-13-18-31.png', '12345-2023-11-29-16-01-03.png', '-6.2801555,107.012161', '-6.2801489,107.0121645', NULL, NULL),
(NULL, '12345', '2023-12-01', '08:20:03', '08:28:02', '12345-2023-12-01-08-20-03.png', '12345-2023-12-01-08-28-02.png', '-6.2193256,106.8384605', '-6.2193299,106.838461', NULL, NULL),
(NULL, '123', '2023-12-01', '14:19:55', '14:20:06', '123-2023-12-01-14-19-55.png', '123-2023-12-01-14-20-06.png', '-6.2193276,106.8384609', '-6.2193276,106.8384609', NULL, NULL);

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
