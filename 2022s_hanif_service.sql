-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 22, 2022 at 07:34 AM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `2022s_hanif_service`
--

-- --------------------------------------------------------

--
-- Table structure for table `dataservice`
--

CREATE TABLE `dataservice` (
  `notransaksi` varchar(10) NOT NULL,
  `tgl` date NOT NULL,
  `barang` varchar(100) NOT NULL,
  `merk` varchar(100) NOT NULL,
  `jenis` varchar(100) NOT NULL,
  `namap` varchar(100) NOT NULL,
  `alamatp` text NOT NULL,
  `telpp` varchar(15) NOT NULL,
  `kerusakan` varchar(50) NOT NULL,
  `kondisibrg` varchar(100) NOT NULL,
  `garansi` date NOT NULL,
  `kerusakanbaru` varchar(100) NOT NULL,
  `metode` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dataservice`
--

INSERT INTO `dataservice` (`notransaksi`, `tgl`, `barang`, `merk`, `jenis`, `namap`, `alamatp`, `telpp`, `kerusakan`, `kondisibrg`, `garansi`, `kerusakanbaru`, `metode`) VALUES
('2022070240', '2022-07-02', 'Meca 6 Plus', 'DA Gaming', 'Mechanical Keyboard', 'Hariyanto', '-', '6282172614255', 'Double Input', 'Baik', '2022-07-04', 'Masalah Swtich error lagi', 'Langsung'),
('2022070248', '2022-07-01', 'PC Ryzen 3 2200g', 'AMD', 'PC', 'Mustika Ratu', 'BJM', '6289172314213', '2 Fan Depan tidak mutar', 'Baik', '2022-07-03', '', 'Langsung'),
('2022070500', '2022-07-05', 'Mechanical Keyboard DAXA', 'Rexus', 'Mechanical Keyboard', 'Hariyanto', '-', '6282172614255', 'Tombol ada yg tidak berfungsi', '', '0000-00-00', '', 'Booking'),
('2022070509', '2022-07-05', 'PC Intel Inside', 'Intel', 'PC', 'Hariyanto', '-', '6282172614255', 'Processor cepat panas', 'Baik', '2022-07-07', 'masih kumat', 'Langsung'),
('2022070517', '2022-07-05', 'Simbadda x8', 'Simbadda', 'Speaker', 'Hariyanto', '-', '6282172614255', 'Suara Bass Trable', 'Baik', '2022-07-07', 'Masih Sama, Rusak di Bagian Bass', 'Langsung'),
('2022070544', '2022-07-05', 'Speaker Warna Hijau Putih', 'F-Leco', 'Speaker', 'Mustika Ratu', 'BJM', '6289172314213', 'Suara Pecah', 'Baik', '2022-07-08', 'Masih Pecah', 'Langsung');

-- --------------------------------------------------------

--
-- Table structure for table `gaji`
--

CREATE TABLE `gaji` (
  `idgaji` int(5) NOT NULL,
  `id` int(5) NOT NULL,
  `idjabatan` int(5) NOT NULL,
  `tgl` date NOT NULL,
  `gajinya` float NOT NULL,
  `tunjangan` float NOT NULL,
  `total` float NOT NULL,
  `ket` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gaji`
--

INSERT INTO `gaji` (`idgaji`, `id`, `idjabatan`, `tgl`, `gajinya`, `tunjangan`, `total`, `ket`) VALUES
(4, 6, 2, '2022-07-02', 1600000, 0, 1600000, 'Masuk Full.'),
(5, 8, 3, '2022-06-01', 3000000, 100000, 3100000, 'Berhalangan Hadir 1hari.');

-- --------------------------------------------------------

--
-- Table structure for table `inventori`
--

CREATE TABLE `inventori` (
  `idinventori` int(2) NOT NULL,
  `namainven` varchar(50) NOT NULL,
  `merk` varchar(50) NOT NULL,
  `jenis` varchar(50) NOT NULL,
  `bahan` varchar(50) NOT NULL,
  `stok` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inventori`
--

INSERT INTO `inventori` (`idinventori`, `namainven`, `merk`, `jenis`, `bahan`, `stok`) VALUES
(5, 'Obeng Magnetic All in One', 'Handy', 'Obeng', 'Stainless Steel + Plastik', 1),
(6, 'Bardi Smart IP Camera CCTV 360 INDOOR', 'Bardi', 'CCTV', 'Besi', 4),
(7, 'Tang Rivet', 'Tekiro', 'Tang', 'Aluminium', 3),
(8, 'Lemari Kaca Susun Serbaguna 50x40x160 (P x L x T)', 'MOU', 'Etalase', 'Aluminium', 2),
(9, 'Etalase Kaca 1.5 Meter', 'Rajeg', 'Etalase', 'Aluminium', 2),
(10, 'LCD LED 19EN33', 'LG', 'Monitor', 'Stainless Steel + Plastik', 2);

-- --------------------------------------------------------

--
-- Table structure for table `inventorikeluar`
--

CREATE TABLE `inventorikeluar` (
  `idinventorikeluar` int(5) NOT NULL,
  `idinventori` int(2) NOT NULL,
  `id` int(11) NOT NULL,
  `tglkeluar` date NOT NULL,
  `catatan` text NOT NULL,
  `jumlah` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inventorikeluar`
--

INSERT INTO `inventorikeluar` (`idinventorikeluar`, `idinventori`, `id`, `tglkeluar`, `catatan`, `jumlah`) VALUES
(1, 10, 8, '2022-07-20', 'ha', 1);

--
-- Triggers `inventorikeluar`
--
DELIMITER $$
CREATE TRIGGER `gaKeluar` AFTER DELETE ON `inventorikeluar` FOR EACH ROW BEGIN 
	UPDATE inventori SET stok = stok + OLD.jumlah
    WHERE idinventori = OLD.idinventori;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `jadiKeluar` AFTER INSERT ON `inventorikeluar` FOR EACH ROW BEGIN 
	UPDATE inventori SET stok = stok - NEW.jumlah
    WHERE idinventori = NEW.idinventori;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `ubahKeluar` AFTER UPDATE ON `inventorikeluar` FOR EACH ROW BEGIN
	UPDATE inventori SET stok = stok + OLD.jumlah, 
                     stok = stok - NEW.jumlah 
    WHERE idinventori = NEW.idinventori;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `inventorimasuk`
--

CREATE TABLE `inventorimasuk` (
  `idinventorimasuk` int(5) NOT NULL,
  `idinventori` int(2) NOT NULL,
  `tgl` date NOT NULL,
  `ket` text NOT NULL,
  `jumlah` int(3) NOT NULL,
  `harga` float NOT NULL,
  `total` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inventorimasuk`
--

INSERT INTO `inventorimasuk` (`idinventorimasuk`, `idinventori`, `tgl`, `ket`, `jumlah`, `harga`, `total`) VALUES
(1, 6, '2022-07-02', '-', 4, 325000, 1300000),
(2, 9, '2022-07-02', '-', 3, 600000, 1800000),
(3, 8, '2022-07-04', '-', 2, 300000, 600000),
(4, 7, '2022-07-01', '-', 3, 15000, 45000),
(5, 5, '2022-07-03', '-', 2, 18000, 36000),
(7, 6, '2022-07-18', '-', 3, 200000, 600000),
(8, 10, '2022-07-20', '-', 2, 450000, 900000);

--
-- Triggers `inventorimasuk`
--
DELIMITER $$
CREATE TRIGGER `deleteMasuk` AFTER DELETE ON `inventorimasuk` FOR EACH ROW BEGIN 
	UPDATE inventori SET stok = stok - OLD.jumlah
    WHERE idinventori = OLD.idinventori;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `masukMasuk` AFTER INSERT ON `inventorimasuk` FOR EACH ROW BEGIN
	UPDATE inventori SET stok = stok + NEW.jumlah
    WHERE idinventori = NEW.idinventori;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `ubahMasuk` AFTER UPDATE ON `inventorimasuk` FOR EACH ROW BEGIN
	UPDATE inventori SET stok = stok - OLD.jumlah, 
                     stok = stok + NEW.jumlah 
    WHERE idinventori = NEW.idinventori;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `inventorirusak`
--

CREATE TABLE `inventorirusak` (
  `idinventorirusak` int(5) NOT NULL,
  `idinventori` int(2) NOT NULL,
  `id` int(11) NOT NULL,
  `tglrusak` date NOT NULL,
  `ket` text NOT NULL,
  `jumlah` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inventorirusak`
--

INSERT INTO `inventorirusak` (`idinventorirusak`, `idinventori`, `id`, `tglrusak`, `ket`, `jumlah`) VALUES
(1, 6, 8, '2022-07-02', 'Kamera tidak berfungsi', 1),
(2, 9, 8, '2022-07-01', 'Kaca Pecah', 1),
(3, 6, 8, '2022-07-18', 'kamera tidak berfungsi', 2),
(4, 5, 8, '2022-07-18', '-', 1);

--
-- Triggers `inventorirusak`
--
DELIMITER $$
CREATE TRIGGER `gaRusak` AFTER DELETE ON `inventorirusak` FOR EACH ROW BEGIN 
	UPDATE inventori SET stok = stok + OLD.jumlah
    WHERE idinventori = OLD.idinventori;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `jadiRusak` AFTER INSERT ON `inventorirusak` FOR EACH ROW BEGIN 
	UPDATE inventori SET stok = stok - NEW.jumlah
    WHERE idinventori = NEW.idinventori;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `ubahRusak` AFTER UPDATE ON `inventorirusak` FOR EACH ROW BEGIN
	UPDATE inventori SET stok = stok + OLD.jumlah, 
                     stok = stok - NEW.jumlah 
    WHERE idinventori = NEW.idinventori;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `jabatan`
--

CREATE TABLE `jabatan` (
  `idjabatan` int(5) NOT NULL,
  `jabatannya` varchar(100) NOT NULL,
  `gaji` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jabatan`
--

INSERT INTO `jabatan` (`idjabatan`, `jabatannya`, `gaji`) VALUES
(1, 'Teknisi Pemula', 1500000),
(2, 'Admin Pemula', 1600000),
(3, 'Teknisi Berpengalaman', 3000000),
(4, 'Admin Berpengalaman', 2900000);

-- --------------------------------------------------------

--
-- Table structure for table `proses`
--

CREATE TABLE `proses` (
  `idproses` int(5) NOT NULL,
  `notransaksi` varchar(10) NOT NULL,
  `id` int(5) NOT NULL,
  `waktu` datetime NOT NULL,
  `ket` varchar(100) NOT NULL,
  `biaya` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `proses`
--

INSERT INTO `proses` (`idproses`, `notransaksi`, `id`, `waktu`, `ket`, `biaya`) VALUES
(15, '2022070240', 8, '2022-07-02 15:35:00', 'Bongkar Keycaps', 0),
(16, '2022070240', 8, '2022-07-02 16:36:00', 'Cek Keycaps dan Switch', 0),
(17, '2022070240', 8, '2022-07-02 17:36:00', 'Solder PCB yang rusak', 50000),
(18, '2022070240', 8, '2022-07-02 18:38:00', 'Selesai', 0),
(19, '2022070240', 8, '2022-07-03 16:03:00', 'Cek Ulang', 0),
(20, '2022070240', 8, '2022-07-03 17:04:00', 'Solder Ulang PCB', 0),
(22, '2022070240', 8, '2022-07-03 20:06:00', 'Selesai', 0),
(23, '2022070248', 8, '2022-07-01 16:13:00', 'Bongkar PC terlebih dahulu.', 0),
(24, '2022070248', 8, '2022-07-01 17:14:00', 'Cek Kabel Fan yang bermasalah', 10000),
(25, '2022070248', 8, '2022-07-01 18:15:00', 'Oleh Minyak pada Fan', 10000),
(26, '2022070248', 8, '2022-07-01 20:15:00', 'Selesai', 10000),
(30, '2022070509', 1, '2022-07-05 22:09:00', 'Cek Kondisi Barang', 10000),
(31, '2022070509', 8, '2022-07-05 23:10:00', 'Selesai', 60000),
(33, '2022070544', 1, '2022-07-05 22:32:00', 'Cek Kabel', 10000),
(34, '2022070544', 8, '2022-07-05 23:33:00', 'Cek bagian dalam speaker', 20000),
(35, '2022070544', 8, '2022-07-06 22:33:00', 'Selesai', 20000),
(36, '2022070544', 8, '2022-07-06 22:39:00', 'Cek kembali kabel', 0),
(37, '2022070544', 8, '2022-07-06 22:41:00', 'Selesai', 0),
(38, '2022070517', 1, '2022-07-05 22:44:00', 'cek kabel speaker', 10000),
(39, '2022070517', 8, '2022-07-05 22:46:00', 'Bass sudah diperbaiki', 50000),
(40, '2022070517', 8, '2022-07-05 22:48:00', 'Selesai', 0),
(41, '2022070517', 8, '2022-07-05 23:47:00', 'cek kabel lagi', 0),
(42, '2022070517', 8, '2022-07-05 23:49:00', 'Selesai', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(5) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `username` varchar(10) NOT NULL,
  `password` varchar(10) NOT NULL,
  `jk` enum('Laki-Laki','Wanita') NOT NULL,
  `ttl` varchar(80) NOT NULL,
  `telp` varchar(15) NOT NULL,
  `alamat` text NOT NULL,
  `tugas` varchar(100) NOT NULL,
  `level` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `nama`, `username`, `password`, `jk`, `ttl`, `telp`, `alamat`, `tugas`, `level`) VALUES
(1, 'Admin', 'admin', 'admin', '', '', '', '', '', 'Admin'),
(3, 'Mustika Ratu', 'ratu', 'ratu', 'Wanita', 'BJM, 31 April 1995', '6289172314213', 'BJM', '', 'Pelanggan'),
(4, 'Nida', 'nida', 'nida', 'Wanita', 'betulbanar, 15 Mei 1999', '089666714255', 'hantu mariaban', 'CS', 'Karyawan'),
(5, 'Hariyanto', 'hariyanto', 'hariyanto', 'Laki-Laki', 'Bengkulu, 19 Desember 1998', '6282172614255', '-', '', 'Pelanggan'),
(6, 'Ace', 'ace', 'ace', 'Wanita', 'Seoul, 19 Januari 1992', '08888314764', '-', 'CS', 'Karyawan'),
(8, 'Yudi', 'yudi', 'yudi', 'Laki-Laki', 'Banjarbaru, 12 Agustus 2000', '089896716733', 'Banjarbaru', 'Service', 'Karyawan');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dataservice`
--
ALTER TABLE `dataservice`
  ADD PRIMARY KEY (`notransaksi`);

--
-- Indexes for table `gaji`
--
ALTER TABLE `gaji`
  ADD PRIMARY KEY (`idgaji`),
  ADD KEY `id` (`id`),
  ADD KEY `idjabatan` (`idjabatan`);

--
-- Indexes for table `inventori`
--
ALTER TABLE `inventori`
  ADD PRIMARY KEY (`idinventori`);

--
-- Indexes for table `inventorikeluar`
--
ALTER TABLE `inventorikeluar`
  ADD PRIMARY KEY (`idinventorikeluar`),
  ADD KEY `idinventori` (`idinventori`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `inventorimasuk`
--
ALTER TABLE `inventorimasuk`
  ADD PRIMARY KEY (`idinventorimasuk`),
  ADD KEY `idinventori` (`idinventori`);

--
-- Indexes for table `inventorirusak`
--
ALTER TABLE `inventorirusak`
  ADD PRIMARY KEY (`idinventorirusak`),
  ADD KEY `idinventori` (`idinventori`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `jabatan`
--
ALTER TABLE `jabatan`
  ADD PRIMARY KEY (`idjabatan`);

--
-- Indexes for table `proses`
--
ALTER TABLE `proses`
  ADD PRIMARY KEY (`idproses`),
  ADD KEY `notransaksi` (`notransaksi`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `gaji`
--
ALTER TABLE `gaji`
  MODIFY `idgaji` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `inventori`
--
ALTER TABLE `inventori`
  MODIFY `idinventori` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `inventorikeluar`
--
ALTER TABLE `inventorikeluar`
  MODIFY `idinventorikeluar` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `inventorimasuk`
--
ALTER TABLE `inventorimasuk`
  MODIFY `idinventorimasuk` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `inventorirusak`
--
ALTER TABLE `inventorirusak`
  MODIFY `idinventorirusak` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `jabatan`
--
ALTER TABLE `jabatan`
  MODIFY `idjabatan` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `proses`
--
ALTER TABLE `proses`
  MODIFY `idproses` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `gaji`
--
ALTER TABLE `gaji`
  ADD CONSTRAINT `gaji_ibfk_1` FOREIGN KEY (`idjabatan`) REFERENCES `jabatan` (`idjabatan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `gaji_ibfk_2` FOREIGN KEY (`id`) REFERENCES `user` (`id`);

--
-- Constraints for table `inventorimasuk`
--
ALTER TABLE `inventorimasuk`
  ADD CONSTRAINT `inventorimasuk_ibfk_1` FOREIGN KEY (`idinventori`) REFERENCES `inventori` (`idinventori`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `inventorirusak`
--
ALTER TABLE `inventorirusak`
  ADD CONSTRAINT `inventorirusak_ibfk_1` FOREIGN KEY (`idinventori`) REFERENCES `inventori` (`idinventori`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `proses`
--
ALTER TABLE `proses`
  ADD CONSTRAINT `proses_ibfk_1` FOREIGN KEY (`notransaksi`) REFERENCES `dataservice` (`notransaksi`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proses_ibfk_2` FOREIGN KEY (`id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
