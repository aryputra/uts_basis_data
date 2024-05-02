-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 02 Bulan Mei 2024 pada 06.45
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `uts_toko_perhiasan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `berlian`
--

CREATE TABLE `berlian` (
  `Id_Berlian` int(11) NOT NULL,
  `Nama_Berlian` varchar(255) NOT NULL,
  `Karat` int(11) DEFAULT NULL,
  `Berat` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `berlian`
--

INSERT INTO `berlian` (`Id_Berlian`, `Nama_Berlian`, `Karat`, `Berat`) VALUES
(101, 'Koh-i-Noor', 54, 100.00),
(102, 'Cullinan', 530, 100.00),
(103, 'Hope', 45, 100.00),
(104, 'De Beers Centenary', 273, 100.00),
(105, 'Pink Star', 59, 100.00);

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer`
--

CREATE TABLE `customer` (
  `Id_Customer` int(11) NOT NULL,
  `Nama_Customer` varchar(255) NOT NULL,
  `Alamat` text DEFAULT NULL,
  `No_Telepon` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `customer`
--

INSERT INTO `customer` (`Id_Customer`, `Nama_Customer`, `Alamat`, `No_Telepon`) VALUES
(201, 'Bondra Kepiting', 'Jl Tukad Badung', '08123456789'),
(202, 'Nyoman Alpukat', 'Jl Tukad Pakerisan', '08123456788'),
(203, 'Ni Komang Elizabeth', 'Jl Tukad Mampet', '08123456787');

-- --------------------------------------------------------

--
-- Struktur dari tabel `perhiasan`
--

CREATE TABLE `perhiasan` (
  `Id_Perhiasan` int(11) NOT NULL,
  `Nama_Perhiasan` varchar(255) NOT NULL,
  `Deskripsi` text DEFAULT NULL,
  `Jenis_Perhiasan` enum('Kalung','Liontin','Cincin','Gelang') NOT NULL,
  `Bahan_Perhiasan` enum('Emas','Perak','Perunggu') NOT NULL,
  `Karat` int(11) DEFAULT NULL,
  `Berat` decimal(10,2) DEFAULT NULL,
  `Harga` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `perhiasan`
--

INSERT INTO `perhiasan` (`Id_Perhiasan`, `Nama_Perhiasan`, `Deskripsi`, `Jenis_Perhiasan`, `Bahan_Perhiasan`, `Karat`, `Berat`, `Harga`) VALUES
(301, 'Liontin Moon Eyes', '-', 'Liontin', 'Perak', 925, 3.00, 6999999.00),
(302, 'Kalung Bunga Matahari', '-', 'Kalung', 'Emas', 18, 4.00, 13999999.00),
(303, 'Cincin Eternity', '-', 'Cincin', 'Emas', 23, 9.00, 4999999.00),
(304, 'Gelang Infinity', '-', 'Gelang', 'Perak', 925, 5.00, 2999999.00),
(305, 'Liontin Angelic Dust', '-', 'Liontin', 'Emas', 21, 8.00, 21999999.00);

-- --------------------------------------------------------

--
-- Struktur dari tabel `perhiasan_berlian`
--

CREATE TABLE `perhiasan_berlian` (
  `Id_Perhiasan` int(11) NOT NULL,
  `Id_Berlian` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `perhiasan_berlian`
--

INSERT INTO `perhiasan_berlian` (`Id_Perhiasan`, `Id_Berlian`) VALUES
(303, 104),
(305, 103);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `Id_Transaksi` int(11) NOT NULL,
  `Id_Customer` int(11) NOT NULL,
  `Tanggal_Transaksi` date NOT NULL,
  `Jenis_Transaksi` enum('Penjualan','Pembelian') NOT NULL,
  `Total_Harga` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`Id_Transaksi`, `Id_Customer`, `Tanggal_Transaksi`, `Jenis_Transaksi`, `Total_Harga`) VALUES
(401, 203, '2024-05-01', 'Penjualan', 21999999.00),
(402, 201, '2024-05-01', 'Penjualan', 4999999.00);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi_detail`
--

CREATE TABLE `transaksi_detail` (
  `Id_Transaksi` int(11) NOT NULL,
  `Id_Perhiasan` int(11) NOT NULL,
  `Jumlah` int(11) NOT NULL,
  `Harga_Satuan` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `transaksi_detail`
--

INSERT INTO `transaksi_detail` (`Id_Transaksi`, `Id_Perhiasan`, `Jumlah`, `Harga_Satuan`) VALUES
(401, 305, 1, 21999999.00);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `view_customer_diskon`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `view_customer_diskon` (
`Id_Customer` int(11)
,`Nama_Customer` varchar(255)
,`Total_Pembelian` decimal(42,2)
);

-- --------------------------------------------------------

--
-- Struktur untuk view `view_customer_diskon`
--
DROP TABLE IF EXISTS `view_customer_diskon`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_customer_diskon`  AS SELECT `c`.`Id_Customer` AS `Id_Customer`, `c`.`Nama_Customer` AS `Nama_Customer`, sum(`td`.`Harga_Satuan` * `td`.`Jumlah`) AS `Total_Pembelian` FROM ((`customer` `c` join `transaksi` `t` on(`c`.`Id_Customer` = `t`.`Id_Customer`)) join `transaksi_detail` `td` on(`t`.`Id_Transaksi` = `td`.`Id_Transaksi`)) WHERE `t`.`Jenis_Transaksi` = 'Penjualan' GROUP BY `c`.`Id_Customer` HAVING sum(`td`.`Harga_Satuan` * `td`.`Jumlah`) > 10000000 ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `berlian`
--
ALTER TABLE `berlian`
  ADD PRIMARY KEY (`Id_Berlian`);

--
-- Indeks untuk tabel `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Id_Customer`);

--
-- Indeks untuk tabel `perhiasan`
--
ALTER TABLE `perhiasan`
  ADD PRIMARY KEY (`Id_Perhiasan`);

--
-- Indeks untuk tabel `perhiasan_berlian`
--
ALTER TABLE `perhiasan_berlian`
  ADD PRIMARY KEY (`Id_Perhiasan`,`Id_Berlian`),
  ADD KEY `Id_Berlian` (`Id_Berlian`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`Id_Transaksi`),
  ADD KEY `Id_Customer` (`Id_Customer`);

--
-- Indeks untuk tabel `transaksi_detail`
--
ALTER TABLE `transaksi_detail`
  ADD PRIMARY KEY (`Id_Transaksi`,`Id_Perhiasan`),
  ADD KEY `Id_Perhiasan` (`Id_Perhiasan`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `berlian`
--
ALTER TABLE `berlian`
  MODIFY `Id_Berlian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT untuk tabel `customer`
--
ALTER TABLE `customer`
  MODIFY `Id_Customer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=204;

--
-- AUTO_INCREMENT untuk tabel `perhiasan`
--
ALTER TABLE `perhiasan`
  MODIFY `Id_Perhiasan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=306;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `Id_Transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=403;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `perhiasan_berlian`
--
ALTER TABLE `perhiasan_berlian`
  ADD CONSTRAINT `perhiasan_berlian_ibfk_1` FOREIGN KEY (`Id_Perhiasan`) REFERENCES `perhiasan` (`Id_Perhiasan`),
  ADD CONSTRAINT `perhiasan_berlian_ibfk_2` FOREIGN KEY (`Id_Berlian`) REFERENCES `berlian` (`Id_Berlian`);

--
-- Ketidakleluasaan untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`Id_Customer`) REFERENCES `customer` (`Id_Customer`);

--
-- Ketidakleluasaan untuk tabel `transaksi_detail`
--
ALTER TABLE `transaksi_detail`
  ADD CONSTRAINT `transaksi_detail_ibfk_1` FOREIGN KEY (`Id_Transaksi`) REFERENCES `transaksi` (`Id_Transaksi`),
  ADD CONSTRAINT `transaksi_detail_ibfk_2` FOREIGN KEY (`Id_Perhiasan`) REFERENCES `perhiasan` (`Id_Perhiasan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
