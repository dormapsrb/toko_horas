-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 15, 2021 at 03:14 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbtoko_barang`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_barang` varchar(50) NOT NULL,
  `nama_barang` varchar(200) NOT NULL,
  `id_kategori` varchar(20) NOT NULL,
  `stok` int(11) NOT NULL,
  `berat` float NOT NULL,
  `harga` int(11) NOT NULL,
  `deskripsi` varchar(1000) NOT NULL,
  `gambar` varchar(200) NOT NULL,
  `deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id_barang`, `nama_barang`, `id_kategori`, `stok`, `berat`, `harga`, `deskripsi`, `gambar`, `deleted`) VALUES
('B-1', 'TV bekas murah LED TV LG 22\' inch', 'K-1', 1, 3, 925000, 'LED TV merk LG 22\' inch \r\nKondisi 90% mulus LIKE NEW\r\nKelengkapan :\r\n- Dus TV + Dus DVD\r\n- Kitab2 (Buku Panduan)\r\n- Adaptor / kabel \r\n- Remote\r\n', 'tv-1.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id_customer` varchar(20) NOT NULL,
  `nama_customer` varchar(100) NOT NULL,
  `jk_customer` enum('Laki-Laki','Perempuan') NOT NULL,
  `alamat_customer` varchar(200) NOT NULL,
  `email_customer` varchar(100) NOT NULL,
  `telp_customer` varchar(20) NOT NULL,
  `deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id_customer`, `nama_customer`, `jk_customer`, `alamat_customer`, `email_customer`, `telp_customer`, `deleted`) VALUES
('CUS-1', 'Abdallah Darussalam C.', 'Laki-Laki', 'Muharto', 'abda@polinema.ac.id', '08771', 0),
('CUS-2', 'Ilham Nuswantoro Aji', 'Laki-Laki', 'Pasuruan', 'iwonk@gmail.com', '0871', 0),
('CUS-3', 'Ermi Pristiyaningrum', 'Perempuan', 'Tulungagung', 'ermi@polinema.ac.id', '0877628498477', 0),
('CUS-4', 'Greggy Gianini F.', 'Laki-Laki', 'Malang', 'greggygf@gmail.com', '087759659653', 0),
('CUS-5', 'Hafizh Dias Ramadhan', 'Laki-Laki', 'Singosari', 'hafizh@polinema.ac.id', '08134784373', 0);

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` varchar(20) NOT NULL,
  `nama_kategori` varchar(50) NOT NULL,
  `deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`, `deleted`) VALUES
('K-1', 'Elektronik', 0);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` varchar(50) NOT NULL,
  `id_customer` varchar(20) NOT NULL,
  `id_barang` varchar(50) NOT NULL,
  `tgl_transaksi` datetime NOT NULL,
  `jumlah` int(11) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `id_customer`, `id_barang`, `tgl_transaksi`, `jumlah`, `total`) VALUES
('TR-1', 'CUS-4', 'BU-1', '2018-12-20 12:59:36', 1, 45000),
('TR-2', 'CUS-4', 'BU-2', '2018-12-20 23:36:42', 1, 150000),
('TR-3', 'CUS-4', 'BU-8', '2018-12-20 23:41:17', 1, 15000),
('TR-4', 'CUS-4', 'BU-5', '2018-12-20 23:41:17', 1, 16000),
('TR-5', 'CUS-4', 'BU-7', '2018-12-20 23:44:36', 1, 15000),
('TR-6', 'CUS-4', 'BU-8', '2018-12-20 23:44:36', 2, 30000),
('TR-7', 'CUS-4', 'BU-2', '2018-12-21 05:51:56', 1, 150000);

--
-- Triggers `transaksi`
--
DELIMITER $$
CREATE TRIGGER `kembalikan_barang` AFTER DELETE ON `transaksi` FOR EACH ROW BEGIN
	UPDATE barang SET stok=stok+OLD.jumlah WHERE id_barang=OLD.id_barang;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `tipe_user` enum('Customer','Admin') NOT NULL,
  `id_customer` varchar(20) DEFAULT NULL,
  `deleted` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `password`, `tipe_user`, `id_customer`, `deleted`) VALUES
('admin', 'admin', 'Admin', NULL, 0),
('greg', 'greg', 'Customer', 'CUS-4', 0),
('iwonk', 'iwonk', 'Customer', 'CUS-2', 0),
('abda', 'abda', 'Customer', 'CUS-1', 0),
('hafizh', 'hafizh', 'Customer', 'CUS-5', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`),
  ADD KEY `FK_barang_kategori` (`id_kategori`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id_customer`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD KEY `FK_transaksi_customer` (`id_customer`),
  ADD KEY `FK_transaksi_barang` (`id_barang`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD KEY `FK_user_customer` (`id_customer`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
