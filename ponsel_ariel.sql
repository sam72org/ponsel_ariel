-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 18, 2020 at 12:46 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.0.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ponsel_ariel`
--

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ref_barang`
--

CREATE TABLE `ref_barang` (
  `id` int(10) NOT NULL,
  `kode_barcode` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kategori_id` tinyint(4) NOT NULL,
  `harga_beli` double NOT NULL,
  `harga_jual` double NOT NULL,
  `harga_nego` double NOT NULL,
  `stok` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ref_distributor`
--

CREATE TABLE `ref_distributor` (
  `id` tinyint(4) NOT NULL,
  `nama` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_hp` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ref_kategori`
--

CREATE TABLE `ref_kategori` (
  `id` smallint(4) NOT NULL,
  `kategori` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ref_operator_pulsa`
--

CREATE TABLE `ref_operator_pulsa` (
  `id` int(10) UNSIGNED NOT NULL,
  `operator` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ref_pelanggan`
--

CREATE TABLE `ref_pelanggan` (
  `id` tinyint(4) NOT NULL,
  `nama` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_hp` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ta_detail_pembelian`
--

CREATE TABLE `ta_detail_pembelian` (
  `id` int(10) NOT NULL,
  `no_pembelian` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `barang_id` int(10) NOT NULL,
  `qty` int(11) NOT NULL,
  `harga` double NOT NULL,
  `sub_total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ta_detail_penjualan`
--

CREATE TABLE `ta_detail_penjualan` (
  `id` int(10) NOT NULL,
  `ta_penjualan_id` int(10) NOT NULL,
  `no_penjualan` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `barang_id` int(10) NOT NULL,
  `qty` int(11) NOT NULL,
  `harga` double NOT NULL,
  `sub_total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ta_history_barang`
--

CREATE TABLE `ta_history_barang` (
  `id` int(11) NOT NULL,
  `barang_id` int(10) NOT NULL,
  `qty` smallint(6) NOT NULL,
  `stok` smallint(6) DEFAULT NULL,
  `tipe` varchar(10) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `no_transaksi` varchar(20) NOT NULL,
  `tanggal` date NOT NULL,
  `user_id` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ta_jasa`
--

CREATE TABLE `ta_jasa` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_hp` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `teknisi` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ket` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga` int(11) NOT NULL,
  `user_id` smallint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ta_pembelian`
--

CREATE TABLE `ta_pembelian` (
  `no_pembelian` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `distributor_id` tinyint(4) NOT NULL,
  `grand_total` double NOT NULL,
  `tanggal` date DEFAULT NULL,
  `user_id` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ta_penjualan`
--

CREATE TABLE `ta_penjualan` (
  `id` int(10) UNSIGNED NOT NULL,
  `no_penjualan` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pelanggan_id` tinyint(4) NOT NULL,
  `grand_total` double NOT NULL,
  `tgl_penjualan` date DEFAULT NULL,
  `tgl_jatuh_tempo` date DEFAULT NULL,
  `status_pembayaran` tinyint(1) DEFAULT NULL,
  `user_id` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ta_pulsa`
--

CREATE TABLE `ta_pulsa` (
  `id` int(10) UNSIGNED NOT NULL,
  `kategori` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `operator` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nominal` int(11) NOT NULL,
  `no_hp` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga` int(11) NOT NULL,
  `user_id` smallint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin', 'admin@gmail.com', '$2y$10$xrP7Oy9/tSeVytiGqtrD9ObhT5NYCxsm3lZ57anmuAwKgy6D9v0Hy', 'admin', 'JCSKq6DOLWW5H8MnDqWs7mztLbh17y9n36pIvYx2yCeqbKivNCow3xtERim1', '2020-02-17 13:55:07', '2020-02-17 13:55:07');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ref_barang`
--
ALTER TABLE `ref_barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ref_distributor`
--
ALTER TABLE `ref_distributor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ref_kategori`
--
ALTER TABLE `ref_kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ref_operator_pulsa`
--
ALTER TABLE `ref_operator_pulsa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ref_pelanggan`
--
ALTER TABLE `ref_pelanggan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ta_detail_pembelian`
--
ALTER TABLE `ta_detail_pembelian`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ta_detail_penjualan`
--
ALTER TABLE `ta_detail_penjualan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ta_history_barang`
--
ALTER TABLE `ta_history_barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ta_jasa`
--
ALTER TABLE `ta_jasa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ta_pembelian`
--
ALTER TABLE `ta_pembelian`
  ADD PRIMARY KEY (`no_pembelian`);

--
-- Indexes for table `ta_penjualan`
--
ALTER TABLE `ta_penjualan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ta_pulsa`
--
ALTER TABLE `ta_pulsa`
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
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ref_barang`
--
ALTER TABLE `ref_barang`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ref_distributor`
--
ALTER TABLE `ref_distributor`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ref_kategori`
--
ALTER TABLE `ref_kategori`
  MODIFY `id` smallint(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ref_operator_pulsa`
--
ALTER TABLE `ref_operator_pulsa`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ref_pelanggan`
--
ALTER TABLE `ref_pelanggan`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ta_detail_pembelian`
--
ALTER TABLE `ta_detail_pembelian`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ta_detail_penjualan`
--
ALTER TABLE `ta_detail_penjualan`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ta_history_barang`
--
ALTER TABLE `ta_history_barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ta_jasa`
--
ALTER TABLE `ta_jasa`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ta_penjualan`
--
ALTER TABLE `ta_penjualan`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ta_pulsa`
--
ALTER TABLE `ta_pulsa`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
