-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 20 Jul 2020 pada 15.40
-- Versi Server: 10.1.25-MariaDB
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `penggajian_ta`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `absen`
--

CREATE TABLE `absen` (
  `id_absen` char(11) NOT NULL,
  `tgl_absen` date NOT NULL,
  `nama_karyawan` char(20) NOT NULL,
  `jumlah_masuk` int(10) NOT NULL,
  `jumlah_izin` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `absen`
--

INSERT INTO `absen` (`id_absen`, `tgl_absen`, `nama_karyawan`, `jumlah_masuk`, `jumlah_izin`) VALUES
('ABN001', '2020-05-30', 'Setio Rini', 30, 1),
('ABN002', '2020-05-31', 'edy bactiar', 20, 11),
('ABN003', '2020-05-31', 'Dessi Erina', 25, 6),
('ABN004', '2020-05-31', 'Dedi', 15, 16),
('ABN005', '2020-05-31', 'Ir. Syahrimal', 31, 0),
('ABN006', '2020-05-31', 'Julian zainuswir', 31, 0),
('ABN007', '2020-05-30', 'nasya', 30, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `bagian`
--

CREATE TABLE `bagian` (
  `id_bagian` char(10) NOT NULL,
  `nama_bagian` char(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `bagian`
--

INSERT INTO `bagian` (`id_bagian`, `nama_bagian`) VALUES
('BK001', 'Arlaini');

-- --------------------------------------------------------

--
-- Struktur dari tabel `gaji`
--

CREATE TABLE `gaji` (
  `no_gaji` char(11) NOT NULL,
  `tgl_gaji` date NOT NULL,
  `keterangan` char(50) NOT NULL,
  `absen` int(10) NOT NULL,
  `izin` int(10) NOT NULL,
  `uang_makan` int(8) NOT NULL,
  `lembur` int(8) NOT NULL,
  `uang_lembur` int(8) NOT NULL,
  `thr` int(15) NOT NULL,
  `ttl_gaji` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `gaji`
--

INSERT INTO `gaji` (`no_gaji`, `tgl_gaji`, `keterangan`, `absen`, `izin`, `uang_makan`, `lembur`, `uang_lembur`, `thr`, `ttl_gaji`) VALUES
('PP000001', '2020-06-30', 'Gaji Bulan juni', 30, 1, 1500000, 2, 200000, 0, 5700000),
('PP000002', '2020-06-30', 'Gaji Bulan juni', 20, 11, 1000000, 1, 100000, 0, 5100000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `gaji_detail`
--

CREATE TABLE `gaji_detail` (
  `no_gaji` char(11) NOT NULL,
  `nama_bagian` char(30) NOT NULL,
  `id_karyawan` char(30) NOT NULL,
  `kd_jabatan` char(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `gaji_detail`
--

INSERT INTO `gaji_detail` (`no_gaji`, `nama_bagian`, `id_karyawan`, `kd_jabatan`) VALUES
('PP000001', 'Arlaini', 'ABN001', 'Adm Penjualan'),
('PP000002', 'Arlaini', 'ABN002', 'Cashier');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jabatan`
--

CREATE TABLE `jabatan` (
  `kd_jabatan` char(30) NOT NULL,
  `nama_jabatan` char(50) NOT NULL,
  `gapok` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `jabatan`
--

INSERT INTO `jabatan` (`kd_jabatan`, `nama_jabatan`, `gapok`) VALUES
('Adm Gudang', 'Admin Gudang', 4000000),
('Adm Penjualan', 'Admin Penjualan', 4000000),
('Bg, Keuangan', 'Bagian Keuangan', 5000000),
('Cashier', 'Cashier', 4000000),
('Direktur', 'Direktur', 10000000),
('Dirut', 'Direktur Utama', 15000000),
('Diver', 'Driver', 4000000),
('hrd', 'human resource', 6000000),
('komisaris', 'Komisaris', 10000000),
('Mgr. Marketing', 'Manager Marketing', 8000000),
('Operator', 'Operator', 2500000),
('S. Marketing', 'Sales Marketing', 8000000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jurnal`
--

CREATE TABLE `jurnal` (
  `no_jurnal` varchar(30) NOT NULL,
  `no_gaji` varchar(30) NOT NULL,
  `tgl_transaksi` date NOT NULL,
  `debet` char(20) NOT NULL,
  `kredit` char(3) NOT NULL,
  `nominal` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `jurnal`
--

INSERT INTO `jurnal` (`no_jurnal`, `no_gaji`, `tgl_transaksi`, `debet`, `kredit`, `nominal`) VALUES
('JU000001', 'PP000001', '2020-06-30', 'B. Gaji', 'Kas', 5700000),
('JU000002', 'PP000002', '2020-06-30', 'B. Gaji', 'Kas', 5100000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jurnal_detail`
--

CREATE TABLE `jurnal_detail` (
  `no_jurnal` varchar(30) NOT NULL,
  `akun` char(10) NOT NULL,
  `debet` char(20) NOT NULL,
  `kredit` char(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `karyawan`
--

CREATE TABLE `karyawan` (
  `id_karyawan` char(10) NOT NULL,
  `no_ktp` char(20) NOT NULL,
  `nama_karyawan` char(30) NOT NULL,
  `alamat` char(50) NOT NULL,
  `no_hp` char(15) NOT NULL,
  `email` char(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `karyawan`
--

INSERT INTO `karyawan` (`id_karyawan`, `no_ktp`, `nama_karyawan`, `alamat`, `no_hp`, `email`) VALUES
('K0001', '8797676877896543', 'Setio Rini', 'Jl. Pembangunan 4 No 137 Kel. Petojo utara', '081212877989', 'Setiorini@gmail.com'),
('K0002', '1797676877098435', 'edy bactiar', 'Jl. Pembangunan 4 No 130 Kel. Petojo Selatan', '08127985678', 'edy@gmail.com'),
('K0003', '1879767687654543', 'Dessi Erina', 'Jl. manggis no 23 Jakbar', '08521287654', 'des89@ymail.com'),
('K0004', '1536478908764567', 'Dedi', 'Jl.Sawah Besar No.54 Jakput', '085809876787', 'dedi.mbi@gmail.com'),
('K0005', '1967865678735649', 'Ir. Syahrimal', 'Jl. pasar minggu no 34 Jakput', '082398997689', 'syahrimal@gmail.com'),
('K0006', '1856378115097890', 'Julian zainuswir', 'Jl.kebayoran No.98 Jakbar', '085367894567', 'julian.mbi@gmail.com'),
('K0007', '87837344622887473', 'nasya', 'jl warakas no 37 jakut', '085387768900', 'nasya.mbi@gmail.com');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` char(5) NOT NULL,
  `nm_user` char(20) NOT NULL,
  `hak_akses` char(8) NOT NULL,
  `pass` char(8) NOT NULL,
  `id` char(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `nm_user`, `hak_akses`, `pass`, `id`) VALUES
('USR01', 'USR01', 'Admin', '12345', 'USR01'),
('USR02', 'randy', 'Admin', '12345', 'USR02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absen`
--
ALTER TABLE `absen`
  ADD PRIMARY KEY (`id_absen`);

--
-- Indexes for table `bagian`
--
ALTER TABLE `bagian`
  ADD PRIMARY KEY (`id_bagian`);

--
-- Indexes for table `gaji`
--
ALTER TABLE `gaji`
  ADD PRIMARY KEY (`no_gaji`);

--
-- Indexes for table `gaji_detail`
--
ALTER TABLE `gaji_detail`
  ADD KEY `no_gaji` (`no_gaji`);

--
-- Indexes for table `jabatan`
--
ALTER TABLE `jabatan`
  ADD PRIMARY KEY (`kd_jabatan`);

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`id_karyawan`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `gaji_detail`
--
ALTER TABLE `gaji_detail`
  ADD CONSTRAINT `gaji_detail_ibfk_1` FOREIGN KEY (`no_gaji`) REFERENCES `gaji` (`no_gaji`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
