-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 20, 2021 at 01:29 PM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `phpixie`
--

-- --------------------------------------------------------

--
-- Table structure for table `congviec`
--

DROP TABLE IF EXISTS `congviec`;
CREATE TABLE IF NOT EXISTS `congviec` (
  `MaCongViec` int(11) NOT NULL AUTO_INCREMENT,
  `TenCongViec` varchar(50) NOT NULL,
  `NoiDung` text NOT NULL,
  `NgayTao` date NOT NULL,
  `MaProject` int(11) NOT NULL,
  PRIMARY KEY (`MaCongViec`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `congviec`
--

INSERT INTO `congviec` (`MaCongViec`, `TenCongViec`, `NoiDung`, `NgayTao`, `MaProject`) VALUES
(1, 'Thiết kế banner', 'Thiết kế banner cho website mới của công ty', '2021-05-20', 1),
(3, 'Thiết kế layout cho website', 'Thiết kế layout với kích thước: xxx', '2021-05-19', 1),
(4, 'Chuẩn bị báo cáo tài chính quý', 'Tổng hợp bảng cân đối kế toán và các báo cáo liên quan', '2021-05-18', 2),
(5, 'Viết tin tuyển dụng nhân sự IT', 'Viết bài đăng các web tuyển dụng ', '2021-05-19', 3);

-- --------------------------------------------------------

--
-- Table structure for table `nhanvien`
--

DROP TABLE IF EXISTS `nhanvien`;
CREATE TABLE IF NOT EXISTS `nhanvien` (
  `MaNhanVien` int(11) NOT NULL AUTO_INCREMENT,
  `Password` int(11) NOT NULL,
  `MaPhongBan` int(11) NOT NULL,
  `DanhSachCongViec` varchar(500) NOT NULL,
  `Role` tinyint(1) NOT NULL,
  `TenNhanVien` varchar(50) NOT NULL,
  `DiaChi` varchar(50) NOT NULL,
  PRIMARY KEY (`MaNhanVien`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nhanvien`
--

INSERT INTO `nhanvien` (`MaNhanVien`, `Password`, `MaPhongBan`, `DanhSachCongViec`, `Role`, `TenNhanVien`, `DiaChi`) VALUES
(1, 111111, 1, '1 2 3', 0, 'Nguyễn Văn Minh', '123 Trường Chinh, Q. Tân Bình'),
(2, 111111, 2, '1 2 3 4', 0, 'Nguyễn Anh Tuấn', '567 Lê Văn Việt, Q. 9'),
(3, 111111, 1, '1 2 3', 0, 'Nguyễn Tiến Tùng', '123 Trường Sơn, Q. Bình Thạnh'),
(4, 111111, 5, '1 2 3 4', 0, 'Nguyễn Anh Tuấn', '567 Lê Văn Việt, Q. 9');

-- --------------------------------------------------------

--
-- Table structure for table `phancong`
--

DROP TABLE IF EXISTS `phancong`;
CREATE TABLE IF NOT EXISTS `phancong` (
  `MaCongViec` int(11) NOT NULL,
  `MaNhanVien` int(11) NOT NULL,
  `NgayGiao` date NOT NULL,
  `Deadline` date NOT NULL,
  `Status` varchar(50) NOT NULL,
  `MaQuanLy` int(11) NOT NULL,
  PRIMARY KEY (`MaNhanVien`,`MaCongViec`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `phancong`
--

INSERT INTO `phancong` (`MaCongViec`, `MaNhanVien`, `NgayGiao`, `Deadline`, `Status`, `MaQuanLy`) VALUES
(1, 1, '2021-05-14', '2021-05-31', 'In progress', 3),
(2, 3, '2021-05-17', '2021-05-26', 'In progress', 3);

-- --------------------------------------------------------

--
-- Table structure for table `phongban`
--

DROP TABLE IF EXISTS `phongban`;
CREATE TABLE IF NOT EXISTS `phongban` (
  `MaPhongBan` int(11) NOT NULL AUTO_INCREMENT,
  `TenPhongBan` varchar(50) NOT NULL,
  PRIMARY KEY (`MaPhongBan`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `phongban`
--

INSERT INTO `phongban` (`MaPhongBan`, `TenPhongBan`) VALUES
(1, 'Nhân Sự'),
(2, 'Marketing'),
(5, 'Kinh Doanh'),
(8, 'Kế Toán');

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
CREATE TABLE IF NOT EXISTS `project` (
  `MaProject` int(11) NOT NULL AUTO_INCREMENT,
  `MaQuanLy` int(11) NOT NULL,
  `TenProject` varchar(100) NOT NULL,
  `Status` tinyint(1) NOT NULL,
  PRIMARY KEY (`MaProject`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`MaProject`, `MaQuanLy`, `TenProject`, `Status`) VALUES
(1, 2, 'Đổi giao diện website công ty', 1),
(2, 3, 'Báo cáo kết quả kinh doanh quý', 1),
(3, 3, 'Tuyển thêm nhân sự bộ phận IT', 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
