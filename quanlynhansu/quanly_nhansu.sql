-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 17, 2025 at 02:26 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quanly_nhansu`
--

-- --------------------------------------------------------

--
-- Table structure for table `bang_cap`
--

CREATE TABLE `bang_cap` (
  `id` int(11) NOT NULL,
  `ma_bang_cap` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ten_bang_cap` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ghi_chu` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nguoi_tao` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ngay_tao` datetime NOT NULL,
  `nguoi_sua` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ngay_sua` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `bang_cap`
--

INSERT INTO `bang_cap` (`id`, `ma_bang_cap`, `ten_bang_cap`, `ghi_chu`, `nguoi_tao`, `ngay_tao`, `nguoi_sua`, `ngay_sua`) VALUES
(0, 'MBC1569664716', 'Không', '', 'Đào Thanh Huy', '2025-03-17 16:58:36', 'Đào Thanh Huy', '2025-03-17 16:58:36'),
(1, 'MBC1569651987', 'Bằng cử nhân', '', 'Đào Thanh Huy', '2025-03-17 16:58:36', 'Đào Thanh Huy', '2025-03-17 16:58:36'),
(2, 'MBC1569652012', 'Bằng thạc sĩ', '', 'Đào Thanh Huy', '2025-03-17 16:58:36', 'Đào Thanh Huy', '2025-03-17 16:58:36'),
(3, 'MBC1569652035', 'Bằng tiến sĩ', '', 'Đào Thanh Huy', '2025-03-17 16:58:36', 'Đào Thanh Huy', '2025-03-17 16:58:36'),
(4, 'MBC1569652169', 'Cử nhân khoa học xã hội', '', 'Đào Thanh Huy', '2025-03-17 16:58:36', 'Đào Thanh Huy', '2025-03-17 16:58:36'),
(5, 'MBC1569652180', 'Cử nhân khoa học tự nhiên', '', 'Đào Thanh Huy', '2025-03-17 16:58:36', 'Đào Thanh Huy', '2025-03-17 16:58:36'),
(8, 'MBC1569652431', 'Cử nhân quản trị kinh doanh', '', 'Đào Thanh Huy', '2025-03-17 16:58:36', 'Đào Thanh Huy', '2025-03-17 16:58:36'),
(9, 'MBC1569652436', 'Cử nhân thương mại và quản trị', '', 'Đào Thanh Huy', '2025-03-17 16:58:36', 'Đào Thanh Huy', '2025-03-17 16:58:36'),
(10, 'MBC1569652441', 'Cử nhân kế toán', '', 'Đào Thanh Huy', '2025-03-17 16:58:36', 'Đào Thanh Huy', '2025-03-17 16:58:36'),
(11, 'MBC1569652448', 'Cử nhân luật', '', 'Đào Thanh Huy', '2025-03-17 16:58:36', 'Đào Thanh Huy', '2025-03-17 16:58:36'),
(12, 'MBC1569652456', 'Cử nhân ngành quản trị và chính sách công', '', 'Đào Thanh Huy', '2025-03-17 16:58:36', 'Đào Thanh Huy', '2025-03-17 16:58:36'),
(13, 'MBC1569652463', 'Thạc sĩ khoa học xã hội', '', 'Đào Thanh Huy', '2025-03-17 16:58:36', 'Đào Thanh Huy', '2025-03-17 16:58:36'),
(14, 'MBC1569652469', 'Thạc sĩ khoa học tự nhiên', '', 'Đào Thanh Huy', '2025-03-17 16:58:36', 'Đào Thanh Huy', '2025-03-17 16:58:36'),
(15, 'MBC1569652475', 'Thạc sĩ quản trị kinh doanh', '', 'Đào Thanh Huy', '2025-03-17 16:58:36', 'Đào Thanh Huy', '2025-03-17 16:58:36'),
(16, 'MBC1569652481', 'Thạc sĩ kế toán', '', 'Đào Thanh Huy', '2025-03-17 16:58:36', 'Đào Thanh Huy', '2025-03-17 16:58:36');

-- --------------------------------------------------------

--
-- Table structure for table `chinh_luong`
--

CREATE TABLE `chinh_luong` (
  `id` int(11) NOT NULL,
  `nhanvien_id` int(11) NOT NULL,
  `so_qd` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ngay_ky_ket` datetime NOT NULL,
  `ngay_dieu_chinh` datetime NOT NULL,
  `heso_luong_cu` double NOT NULL,
  `heso_luong_moi` double NOT NULL,
  `nguoi_tao_id` int(11) NOT NULL,
  `ngay_tao` datetime NOT NULL,
  `nguoi_sua_id` int(11) NOT NULL,
  `ngay_sua` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chi_tiet_nhom`
--

CREATE TABLE `chi_tiet_nhom` (
  `id` int(11) NOT NULL,
  `ma_nhom` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `nhan_vien_id` int(11) NOT NULL,
  `nguoi_tao` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ngay_tao` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `chi_tiet_nhom`
--

INSERT INTO `chi_tiet_nhom` (`id`, `ma_nhom`, `nhan_vien_id`, `nguoi_tao`, `ngay_tao`) VALUES
(1, 'GRP1571110024', 11, 'ĐàoThanh Huy', '2025-03-17 16:58:36'),
(2, 'GRP1571110024', 10, 'ĐàoThanh Huy', '2025-03-17 16:58:36'),
(3, 'GRP1571110024', 5, 'ĐàoThanh Huy', '2025-03-17 16:58:36'),
(8, 'GRP1571110761', 5, 'ĐàoThanh Huy', '2025-03-17 16:58:36'),
(9, 'GRP1571110761', 4, 'ĐàoThanh Huy', '2025-03-17 16:58:36'),
(17, 'GRP1571110790', 11, 'ĐàoThanh Huy', '2025-03-17 16:58:36'),
(18, 'GRP1571110790', 13, 'ĐàoThanh Huy', '2025-03-17 16:58:36'),
(19, 'GRP1571110790', 3, 'ĐàoThanh Huy', '2025-03-17 16:58:36'),
(20, 'GRP1571110114', 10, 'ĐàoThanh Huy', '2025-03-17 16:58:36'),
(21, 'GRP1571110114', 5, 'ĐàoThanh Huy', '2025-03-17 16:58:36'),
(22, 'GRP1571110114', 3, 'ĐàoThanh Huy', '2025-03-17 16:58:36'),
(23, 'GRP1571110114', 8, 'ĐàoThanh Huy', '2025-03-17 16:58:36'),
(24, 'GRP1571110790', 8, 'ĐàoThanh Huy', '2025-03-17 16:58:36');

-- --------------------------------------------------------

--
-- Table structure for table `chuc_vu`
--

CREATE TABLE `chuc_vu` (
  `id` int(11) NOT NULL,
  `ma_chuc_vu` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ten_chuc_vu` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `luong_ngay` double NOT NULL,
  `ghi_chu` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nguoi_tao` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ngay_tao` datetime NOT NULL,
  `nguoi_sua` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ngay_sua` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `chuc_vu`
--

INSERT INTO `chuc_vu` (`id`, `ma_chuc_vu`, `ten_chuc_vu`, `luong_ngay`, `ghi_chu`, `nguoi_tao`, `ngay_tao`, `nguoi_sua`, `ngay_sua`) VALUES
(16, 'MCV1569203762', 'Phó giám đốc', 560000, '', 'Đào Thanh Huy', '2025-03-17 16:58:36', 'Đào Thanh Huy', '2025-03-17 16:58:36'),
(17, 'MCV1569203773', 'Giám đốc', 600000, '', 'Đào Thanh Huy', '2025-03-17 16:58:36', 'Đào Thanh Huy', '2025-03-17 16:58:36'),
(33, 'MCV1569204007', 'Nhân viên', 230000, '', 'Đào Thanh Huy', '2025-03-17 16:58:36', 'Đào Thanh Huy', '2025-03-17 16:58:36'),
(37, 'MCV1569985216', 'Trưởng phòng', 310000, '', 'Đào Thanh Huy', '2025-03-17 16:58:36', 'Đào Thanh Huy', '2025-03-17 16:58:36'),
(38, 'MCV1569985261', 'Phó phòng', 280000, '', 'Đào Thanh Huy', '2025-03-17 16:58:36', 'Đào Thanh Huy', '2025-03-17 16:58:36'),
(39, 'MCV1571105797', 'Marketing', 285000, '<p>Quảng b&aacute;, k&ecirc;u gọi kh&aacute;ch h&agrave;ng tham gia.</p>\r\n', 'Đào Thanh Huy', '2025-03-17 16:58:36', 'Đào Thanh Huy', '2025-03-17 16:58:36');

-- --------------------------------------------------------

--
-- Table structure for table `chuyen_mon`
--

CREATE TABLE `chuyen_mon` (
  `id` int(11) NOT NULL,
  `ma_chuyen_mon` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ten_chuyen_mon` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ghi_chu` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nguoi_tao` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ngay_tao` datetime NOT NULL,
  `nguoi_sua` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ngay_sua` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `chuyen_mon`
--

INSERT INTO `chuyen_mon` (`id`, `ma_chuyen_mon`, `ten_chuyen_mon`, `ghi_chu`, `nguoi_tao`, `ngay_tao`, `nguoi_sua`, `ngay_sua`) VALUES
(0, 'MCM1569664640', 'Không', '', 'Đào Thanh Huy', '2025-03-17 16:58:36', 'Đào Thanh Huy', '2025-03-17 16:58:36'),
(2, 'MCM1569208526', 'Kế toán', '', 'Đào Thanh Huy', '2025-03-17 16:58:36', 'Đào Thanh Huy', '2025-03-17 16:58:36'),
(3, 'MCM1569208539', 'Công nghệ thông tin', '', 'Đào Thanh Huy', '2025-03-17 16:58:36', 'Đào Thanh Huy', '2025-03-17 16:58:36'),
(4, 'MCM1569208553', 'Quản trị nhà hàng - khách sạn', '', 'Đào Thanh Huy', '2025-03-17 16:58:36', 'Đào Thanh Huy', '2025-03-17 16:58:36'),
(5, 'MCM1569208562', 'Tiếp tân', '', 'Đào Thanh Huy', '2025-03-17 16:58:36', 'Đào Thanh Huy', '2025-03-17 16:58:36'),
(6, 'MCM1569208577', 'Sale', '', 'Đào Thanh Huy', '2025-03-17 16:58:36', 'Đào Thanh Huy', '2025-03-17 16:58:36'),
(7, 'MCM1569208618', 'Hành chính văn phòng', '', 'Đào Thanh Huy', '2025-03-17 16:58:36', 'Đào Thanh Huy', '2025-03-17 16:58:36'),
(8, 'MCM1569208631', 'Quản lý chất lượng', '', 'Đào Thanh Huy', '2025-03-17 16:58:36', 'Đào Thanh Huy', '2025-03-17 16:58:36'),
(9, 'MCM1569208648', 'Thương mại điện tử', '', 'Đào Thanh Huy', '2025-03-17 16:58:36', 'Đào Thanh Huy', '2025-03-17 16:58:36'),
(10, 'MCM1569208673', 'Tài chính', '', 'Đào Thanh Huy', '2025-03-17 16:58:36', 'Đào Thanh Huy', '2025-03-17 16:58:36'),
(11, 'MCM1569208680', 'Quản lý', '', 'Đào Thanh Huy', '2025-03-17 16:58:36', 'Đào Thanh Huy', '2025-03-17 16:58:36'),
(12, 'MCM1569208698', 'Maketing', '', 'Đào Thanh Huy', '2025-03-17 16:58:36', 'Đào Thanh Huy', '2025-03-17 16:58:36'),
(13, 'MCM1569208705', 'Khởi nghiệp', '', 'Đào Thanh Huy', '2025-03-17 16:58:36', 'Đào Thanh Huy', '2025-03-17 16:58:36'),
(14, 'MCM1569208731', 'Quản lý nguồn nhân lực', '', 'Đào Thanh Huy', '2025-03-17 16:58:36', 'Đào Thanh Huy', '2025-03-17 16:58:36'),
(15, 'MCM1569208740', 'Kinh doanh', '', 'Đào Thanh Huy', '2025-03-17 16:58:36', 'Đào Thanh Huy', '2025-03-17 16:58:36'),
(16, 'MCM1569208758', 'Vận tải và hậu cần', '', 'Đào Thanh Huy', '2025-03-17 16:58:36', 'Đào Thanh Huy', '2025-03-17 16:58:36'),
(17, 'MCM1569208771', 'Kinh doanh', '', 'Đào Thanh Huy', '2025-03-17 16:58:36', 'Đào Thanh Huy', '2025-03-17 16:58:36'),
(18, 'MCM1569208782', 'Bán lẻ', '', 'Đào Thanh Huy', '2025-03-17 16:58:36', 'Đào Thanh Huy', '2025-03-17 16:58:36');

-- --------------------------------------------------------

--
-- Table structure for table `cong_tac`
--

CREATE TABLE `cong_tac` (
  `id` int(11) NOT NULL,
  `ma_cong_tac` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nhanvien_id` int(11) NOT NULL,
  `ngay_bat_dau` date NOT NULL,
  `ngay_ket_thuc` date NOT NULL,
  `dia_diem` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `muc_dich` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `ghi_chu` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `nguoi_tao` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ngay_tao` datetime NOT NULL,
  `nguoi_sua` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ngay_sua` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cong_tac`
--

INSERT INTO `cong_tac` (`id`, `ma_cong_tac`, `nhanvien_id`, `ngay_bat_dau`, `ngay_ket_thuc`, `dia_diem`, `muc_dich`, `ghi_chu`, `nguoi_tao`, `ngay_tao`, `nguoi_sua`, `ngay_sua`) VALUES
(3, 'MCT1570352254', 4, '2025-03-17', '2025-03-18', 'Phú Quốc', '<p>Khảo s&aacute;t t&igrave;nh h&igrave;nh c&aacute;c qu&aacute;n b&aacute;n hải sản ở Ph&uacute; Quốc</p>\r\n', '', 'Đào Thanh Huy', '2019-10-06 15:57:34', '', '0000-00-00 00:00:00'),
(5, 'MCT1570353978', 5, '2025-03-17', '2025-03-18', 'Cần Thơ', '<p>Đi chơi</p>\r\n', '', 'Đào Thanh Huy', '2019-10-06 16:26:18', 'Đào Thanh Huy', '2019-10-06 16:54:16'),
(6, 'MCT1571039527', 10, '2025-03-17', '2025-03-18', 'Phú Quốc', '<p>Đi chơi Vinpearl Land để t&igrave;m hiểu t&igrave;nh h&igrave;nh</p>\r\n', '', 'Đào Thanh Huy', '2019-10-14 14:52:07', '', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `dan_toc`
--

CREATE TABLE `dan_toc` (
  `id` int(11) NOT NULL,
  `ten_dan_toc` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `dan_toc`
--

INSERT INTO `dan_toc` (`id`, `ten_dan_toc`) VALUES
(1, 'Kinh'),
(2, 'Khơ-me'),
(3, 'Mường'),
(4, 'Thổ'),
(5, 'H\'Mông'),
(6, 'Ê-đê'),
(7, 'Bố Y'),
(8, 'Lào'),
(9, 'Tày'),
(10, 'Thái'),
(11, 'Nùng'),
(12, 'Khơ-mú'),
(13, 'M\'Nông'),
(14, 'Xơ Đăng'),
(15, 'Chăm'),
(16, 'Gia Rai'),
(17, 'Hoa'),
(18, 'Lô Lô'),
(19, 'Phù Lá');

-- --------------------------------------------------------

--
-- Table structure for table `khen_thuong_ky_luat`
--

CREATE TABLE `khen_thuong_ky_luat` (
  `id` int(11) NOT NULL,
  `ma_kt` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `so_qd` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ngay_qd` date NOT NULL,
  `nhanvien_id` int(11) NOT NULL,
  `ten_khen_thuong` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `loai_kt_id` int(11) NOT NULL,
  `hinh_thuc` tinyint(1) NOT NULL,
  `so_tien` double NOT NULL,
  `flag` tinyint(1) NOT NULL,
  `ghi_chu` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `nguoi_tao` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ngay_tao` datetime NOT NULL,
  `nguoi_sua` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ngay_sua` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `khen_thuong_ky_luat`
--

INSERT INTO `khen_thuong_ky_luat` (`id`, `ma_kt`, `so_qd`, `ngay_qd`, `nhanvien_id`, `ten_khen_thuong`, `loai_kt_id`, `hinh_thuc`, `so_tien`, `flag`, `ghi_chu`, `nguoi_tao`, `ngay_tao`, `nguoi_sua`, `ngay_sua`) VALUES
(1, 'MKT1571286726', 'DHK/1146', '2025-03-17', 5, 'Khen thưởng nhân viên năng động', 6, 0, 240000, 1, '<p>Thưởng trong th&aacute;ng</p>\r\n', 'Đào Thanh Huy', '2019-10-17 11:32:06', 'Đào Thanh Huy', '2019-10-18 10:33:44'),
(2, 'MKT1571286771', 'DHK/1145', '2025-03-18', 4, 'Khen thưởng nhân viên chăm chỉ', 7, 0, 400000, 1, '', 'Đào Thanh Huy', '2019-10-17 11:32:51', 'Đào Thanh Huy', '2019-10-18 10:33:31'),
(7, 'MKT1571365640', 'DHK/1143', '2025-03-17', 5, 'Khen thưởng nhân viên hiếu động', 7, 1, 360000, 1, '<p>Thưởng cho th&agrave;nh phần hiếu động</p>\r\n', 'Đào Thanh Huy', '2019-10-18 09:27:20', 'Đào Thanh Huy', '2019-10-18 10:32:44'),
(11, 'MKL1571369398', 'DKT/4421', '2025-03-15', 8, 'Nhân viên chậm chạp', 14, 1, 123000, 0, '<p>Cần c&acirc;n nhắc khi sử dụng nh&acirc;n vi&ecirc;n n&agrave;y.</p>\r\n', 'Đào Thanh Huy', '2019-10-18 10:29:58', 'Đào Thanh Huy', '2019-10-18 10:30:47');

-- --------------------------------------------------------

--
-- Table structure for table `loai_khen_thuong_ky_luat`
--

CREATE TABLE `loai_khen_thuong_ky_luat` (
  `id` int(11) NOT NULL,
  `ma_loai` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ten_loai` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ghi_chu` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `flag` tinyint(1) NOT NULL,
  `nguoi_tao` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ngay_tao` datetime NOT NULL,
  `nguoi_sua` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ngay_sua` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `loai_khen_thuong_ky_luat`
--

INSERT INTO `loai_khen_thuong_ky_luat` (`id`, `ma_loai`, `ten_loai`, `ghi_chu`, `flag`, `nguoi_tao`, `ngay_tao`, `nguoi_sua`, `ngay_sua`) VALUES
(5, 'LKT1571280354', 'Nhân viên đồng', '', 1, 'Đào Thanh Huy', '2025-03-18 09:45:54', 'Đào Thanh Huy', '2025-03-18 09:45:54'),
(6, 'LKT1571280364', 'Nhân viên bạc', '', 1, 'Đào Thanh Huy', '2025-03-18 09:45:54', 'Đào Thanh Huy', '2025-03-18 09:45:54'),
(7, 'LKT1571280370', 'Nhân viên vàng', '', 1, 'Đào Thanh Huy', '2025-03-18 09:45:54', 'Đào Thanh Huy', '2025-03-18 09:45:54'),
(8, 'LKT1571280376', 'Nhân viên kim cương', '', 1, 'Đào Thanh Huy', '2025-03-18 09:45:54', 'Đào Thanh Huy', '2025-03-18 09:45:54'),
(14, 'LKL1571366769', 'Nhân viên đi trễ', '<p>Nh&acirc;n vi&ecirc;n thường xuy&ecirc;n đi trễ</p>\r\n', 0, 'Đào Thanh Huy', '2025-03-18 09:45:54', 'Đào Thanh Huy', '2025-03-18 09:45:54'),
(15, 'LKL1571366807', 'Nhân viên nghỉ quá ngày cho phép', '<p>Nh&acirc;n vi&ecirc;n nghỉ tr&ecirc;n 20 ng&agrave;y/th&aacute;ng.</p>\r\n', 0, 'Đào Thanh Huy', '2025-03-18 09:45:54', 'Đào Thanh Huy', '2025-03-18 09:45:54'),
(19, 'LKL1571367774', 'Test', '', 0, 'Đào Thanh Huy', '2025-03-18 09:45:54', 'Đào Thanh Huy', '2025-03-18 09:45:54'),
(20, 'LKT1599471135', 'Doanh so cao', '<p>ok</p>\r\n', 1, 'Account Admin', '2025-03-18 09:45:54', 'Account Admin', '2025-03-18 09:45:54');

-- --------------------------------------------------------

--
-- Table structure for table `loai_nv`
--

CREATE TABLE `loai_nv` (
  `id` int(11) NOT NULL,
  `ma_loai_nv` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ten_loai_nv` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ghi_chu` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nguoi_tao` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ngay_tao` datetime NOT NULL,
  `nguoi_sua` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ngay_sua` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `loai_nv`
--

INSERT INTO `loai_nv` (`id`, `ma_loai_nv`, `ten_loai_nv`, `ghi_chu`, `nguoi_tao`, `ngay_tao`, `nguoi_sua`, `ngay_sua`) VALUES
(2, 'LNV1569654834', 'Nhân viên chính thức', '', 'Đào Thanh Huy', '2025-03-18 09:45:54', 'Đào Thanh Huy', '2025-03-18 09:45:54'),
(3, 'LNV1569654844', 'Nhân viên thực tập', '', 'Đào Thanh Huy', '2025-03-18 09:45:54', 'Đào Thanh Huy', '2025-03-18 09:45:54'),
(4, 'LNV1569654850', 'Nhân viên thời vụ', '', 'Đào Thanh Huy', '2025-03-18 09:45:54', 'Đào Thanh Huy', '2025-03-18 09:45:54');

-- --------------------------------------------------------

--
-- Table structure for table `luong`
--

CREATE TABLE `luong` (
  `id` int(11) NOT NULL,
  `ma_luong` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `nhanvien_id` int(11) NOT NULL,
  `luong_thang` double NOT NULL,
  `ngay_cong` int(11) NOT NULL,
  `phu_cap` double NOT NULL,
  `khoan_nop` double NOT NULL,
  `tam_ung` double NOT NULL,
  `thuc_lanh` double NOT NULL,
  `ngay_cham` date NOT NULL,
  `ghi_chu` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nguoi_tao_id` int(11) NOT NULL,
  `ngay_tao` datetime NOT NULL,
  `nguoi_sua_id` int(11) NOT NULL,
  `ngay_sua` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `luong`
--

INSERT INTO `luong` (`id`, `ma_luong`, `nhanvien_id`, `luong_thang`, `ngay_cong`, `phu_cap`, `khoan_nop`, `tam_ung`, `thuc_lanh`, `ngay_cham`, `ghi_chu`, `nguoi_tao_id`, `ngay_tao`, `nguoi_sua_id`, `ngay_sua`) VALUES
(3, 'ML1570075152', 10, 18600000, 28, 2260000, 1953000, 1500000, 17407000, '2025-03-18', '', 4, '2019-10-03 10:59:12', 4, '2019-10-03 10:59:12'),
(4, 'ML1570075175', 5, 5750000, 25, 0, 603750, 1500000, 3646250, '2025-03-18', '', 4, '2019-10-03 10:59:35', 4, '2019-10-03 10:59:35'),
(9, 'ML1570267241', 10, 19800000, 29, 2305000, 2079000, 0, 20026000, '2025-03-18', '', 4, '2019-10-05 16:20:41', 4, '2019-10-05 16:20:41'),
(10, 'ML1570267671', 10, 13800000, 23, 2035000, 1449000, 1200000, 13186000, '2025-03-18', '', 4, '2019-10-05 16:27:51', 4, '2019-10-05 16:27:51'),
(11, 'ML1570267847', 2, 8050000, 30, 1650000, 845250, 500000, 8354750, '2025-03-18', '', 4, '2019-10-05 16:30:47', 4, '2019-10-05 16:30:47'),
(12, 'ML1570267874', 2, 7590000, 29, 1605000, 796950, 0, 8398050, '2025-03-18', '', 4, '2019-10-05 16:31:14', 4, '2019-10-05 16:31:14'),
(13, 'ML1570355932', 8, 9240000, 29, 1805000, 970200, 1000000, 9074800, '2025-03-18', '<p>Nhận tiền mặt</p>\r\n', 12, '2019-10-06 16:58:52', 12, '2019-10-06 16:58:52'),
(15, 'ML1571390955', 8, 9800000, 30, 1850000, 1029000, 0, 10621000, '2025-03-18', '', 1, '2019-10-18 16:29:15', 1, '2019-10-18 16:29:15');

-- --------------------------------------------------------

--
-- Table structure for table `nhanvien`
--

CREATE TABLE `nhanvien` (
  `id` int(11) NOT NULL,
  `ma_nv` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `hinh_anh` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ten_nv` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `biet_danh` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `gioi_tinh` tinyint(1) NOT NULL,
  `ngay_sinh` date NOT NULL,
  `noi_sinh` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hon_nhan_id` int(11) NOT NULL,
  `so_cmnd` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `noi_cap_cmnd` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ngay_cap_cmnd` date NOT NULL,
  `nguyen_quan` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `quoc_tich_id` int(11) NOT NULL,
  `ton_giao_id` int(11) NOT NULL,
  `dan_toc_id` int(11) NOT NULL,
  `ho_khau` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tam_tru` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `loai_nv_id` int(11) NOT NULL,
  `trinh_do_id` int(11) NOT NULL,
  `chuyen_mon_id` int(11) NOT NULL,
  `bang_cap_id` int(11) NOT NULL,
  `phong_ban_id` int(11) NOT NULL,
  `chuc_vu_id` int(11) NOT NULL,
  `trang_thai` tinyint(1) NOT NULL,
  `nguoi_tao_id` int(11) NOT NULL,
  `ngay_tao` datetime NOT NULL,
  `nguoi_sua_id` int(11) NOT NULL,
  `ngay_sua` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `nhanvien`
--

INSERT INTO `nhanvien` (`id`, `ma_nv`, `hinh_anh`, `ten_nv`, `biet_danh`, `gioi_tinh`, `ngay_sinh`, `noi_sinh`, `hon_nhan_id`, `so_cmnd`, `noi_cap_cmnd`, `ngay_cap_cmnd`, `nguyen_quan`, `quoc_tich_id`, `ton_giao_id`, `dan_toc_id`, `ho_khau`, `tam_tru`, `loai_nv_id`, `trinh_do_id`, `chuyen_mon_id`, `bang_cap_id`, `phong_ban_id`, `chuc_vu_id`, `trang_thai`, `nguoi_tao_id`, `ngay_tao`, `nguoi_sua_id`, `ngay_sua`) VALUES
(2, 'MNV1569830976', '1569907877.jpg', 'Nguyễn Duy Sơn', 'Sơn Núi Đá', 1, '1994-12-19', 'Long Xuyên', 2, '371807766', 'Long Xuyên', '2016-09-30', 'Long Xuyên', 24, 0, 1, 'Long Xuyên', 'Rạch Giá - Kiên Giang', 2, 18, 2, 2, 22, 33, 0, 4, '2025-03-18 15:09:36', 1, '2025-03-18 15:09:36'),
(4, 'MNV1569833913', '1569833913.jpg', 'Nguyễn Phước Thanh', '', 1, '1984-09-12', 'Phú Quốc - Kiên Giang', 3, '567423431', 'Kiên Giang', '2002-04-23', 'Phú Quốc - Kiên Giang', 24, 0, 1, 'Phú Quốc - Kiên Giang', 'Phú Quốc - Kiên Giang', 2, 18, 15, 2, 20, 16, 1, 4, '2025-03-18 15:09:36', 4, '2025-03-18 15:09:36'),
(5, 'MNV1569834099', '1569907854.png', 'Trần Thị Bích Nhi', 'Nhi Kute', 0, '1997-02-12', 'Châu Thành - Kiên Giang', 1, '378623143', 'Kiên Giang', '2004-09-12', 'Châu Thành - Kiên Giang', 24, 1, 1, 'Châu Thành - Kiên Giang', 'Châu Thành - Kiên Giang', 4, 17, 5, 1, 21, 33, 1, 4, '2025-03-18 15:09:36', 4, '2025-03-18 15:09:36'),
(8, 'MNV1569835233', '1569835233.jpg', 'Trần Mai Phương', 'Phương Kòi', 0, '2000-12-09', 'Thốt Nốt - Cần Thơ', 2, '3718087777', 'Cà Mau', '2012-09-30', 'Cà Mau', 24, 0, 1, 'Cà Mau', 'Cà Mau', 3, 17, 5, 1, 20, 38, 1, 4, '2025-03-18 15:09:36', 4, '2025-03-18 15:09:36'),
(10, 'MNV1569905940', '1569907839.jpg', 'Nguyễn Minh Thông', 'Thông bác học', 1, '1980-12-04', 'Phú Quốc - Kiên Giang', 3, '3718087744', 'Phú Quốc -  Kiên Giang', '1997-04-02', 'Phú Quốc - Kiên Giang', 24, 3, 1, 'Phú Quốc - Kiên Giang', 'Phú Quốc - Kiên Giang', 2, 17, 14, 4, 20, 17, 1, 4, '2025-03-18 15:09:36', 4, '2025-03-18 15:09:36');

-- --------------------------------------------------------

--
-- Table structure for table `nhom`
--

CREATE TABLE `nhom` (
  `id` int(11) NOT NULL,
  `ma_nhom` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ten_nhom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mo_ta` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nguoi_tao` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ngay_tao` datetime NOT NULL,
  `nguoi_sua` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ngay_sua` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `nhom`
--

INSERT INTO `nhom` (`id`, `ma_nhom`, `ten_nhom`, `mo_ta`, `nguoi_tao`, `ngay_tao`, `nguoi_sua`, `ngay_sua`) VALUES
(1, 'GRP1571110024', 'Nhóm thu thập', '<p>Nh&oacute;m chuy&ecirc;n thu thập th&ocirc;ng tin kh&aacute;ch h&agrave;ng</p>\r\n', 'ĐàoThanh Huy', '2025-03-18 15:09:36', 'ĐàoThanh Huy', '2025-03-18 15:09:36'),
(2, 'GRP1571110114', 'Nhóm quản lý dự án', '<p>Thu thập, quản l&yacute; những dự &aacute;n mới, dự &aacute;n đang thực hiện</p>\r\n', 'ĐàoThanh Huy', '2025-03-18 15:09:36', 'ĐàoThanh Huy', '2025-03-18 15:09:36'),
(4, 'GRP1571110761', 'Nhóm đang công tác', '', 'ĐàoThanh Huy', '2025-03-18 15:09:36', '', '2025-03-18 15:09:36'),
(5, 'GRP1571110790', 'Nhóm tổ chức sự kiện', '', 'ĐàoThanh Huy', '2025-03-18 15:09:36', '', '2025-03-18 15:09:36');

-- --------------------------------------------------------

--
-- Table structure for table `phong_ban`
--

CREATE TABLE `phong_ban` (
  `id` int(11) NOT NULL,
  `ma_phong_ban` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ten_phong_ban` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ghi_chu` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nguoi_tao` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ngay_tao` datetime NOT NULL,
  `nguoi_sua` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ngay_sua` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `phong_ban`
--

INSERT INTO `phong_ban` (`id`, `ma_phong_ban`, `ten_phong_ban`, `ghi_chu`, `nguoi_tao`, `ngay_tao`, `nguoi_sua`, `ngay_sua`) VALUES
(20, 'MBP1569204111', 'Phòng tổ chức - hành chính', '', 'ĐàoThanh Huy', '2025-03-18 15:09:36', 'Đào Thanh Huy', '2025-03-18 15:09:36'),
(21, 'MBP1569204120', 'Phòng kinh doanh', '', 'ĐàoThanh Huy', '2025-03-18 15:09:36', 'ĐàoThanh Huy', '2025-03-18 15:09:36'),
(22, 'MBP1569204129', 'Phòng tài chính - kế toán', '', 'ĐàoThanh Huy', '2025-03-18 15:09:36', 'Đào Thanh Huy', '2025-03-18 15:09:36'),
(23, 'MBP1569204142', 'Văn phòng đại diện', '', 'ĐàoThanh Huy', '2025-03-18 15:09:36', 'ĐàoThanh Huy', '2025-03-18 15:09:36'),
(24, 'MBP1569204214', 'Phòng kinh tế - kỹ thuật', '', 'ĐàoThanh Huy', '2025-03-18 15:09:36', 'ĐàoThanh Huy', '2025-03-18 15:09:36'),
(25, 'MBP1569204303', 'Phòng kế hoạch - kinh doanh', '', 'ĐàoThanh Huy', '2025-03-18 15:09:36', 'ĐàoThanh Huy', '2025-03-18 15:09:36');

-- --------------------------------------------------------

--
-- Table structure for table `quoc_tich`
--

CREATE TABLE `quoc_tich` (
  `id` int(11) NOT NULL,
  `ten_quoc_tich` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `quoc_tich`
--

INSERT INTO `quoc_tich` (`id`, `ten_quoc_tich`) VALUES
(1, 'Danish'),
(2, 'Đan Mạch'),
(3, 'British / English'),
(4, 'Anh'),
(5, 'Estonian'),
(6, 'Estonia'),
(7, 'Finnish'),
(8, 'Phần Lan'),
(9, 'Icelandic'),
(10, 'Irish'),
(11, 'Ireland'),
(12, 'Latvian'),
(13, 'Latvia'),
(14, 'Lithuanian'),
(15, 'Norwegian'),
(16, 'Na Uy'),
(17, 'Canada'),
(18, 'Scotland'),
(19, 'Thụy Điển'),
(20, 'Tây Ban Nha'),
(21, 'Séc'),
(22, 'Ba Lan'),
(23, 'Mỹ'),
(24, 'Việt Nam'),
(25, 'Ấn Độ'),
(26, 'Trung Quốc'),
(27, 'Mông Cổ'),
(28, 'Triều Tiên'),
(29, 'Đài Loan'),
(30, 'Campuchia'),
(31, 'Indonesia'),
(32, 'Lào'),
(33, 'Philipin'),
(34, 'Thái Lan');

-- --------------------------------------------------------

--
-- Table structure for table `tai_khoan`
--

CREATE TABLE `tai_khoan` (
  `id` int(11) NOT NULL,
  `ho` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ten` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `hinh_anh` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `mat_khau` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `so_dt` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `quyen` tinyint(1) NOT NULL,
  `trang_thai` tinyint(1) NOT NULL,
  `truy_cap` int(11) NOT NULL,
  `ngay_tao` datetime NOT NULL,
  `ngay_sua` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tai_khoan`
--

INSERT INTO `tai_khoan` (`id`, `ho`, `ten`, `hinh_anh`, `email`, `mat_khau`, `so_dt`, `quyen`, `trang_thai`, `truy_cap`, `ngay_tao`, `ngay_sua`) VALUES
(1, 'Account', 'Admin', 'admin.png', 'admin@gmail.com', '25d55ad283aa400af464c76d713c07ad', '099999999999', 1, 1, 50, '2019-09-12 00:00:00', '2019-09-17 06:32:36'),
(2, 'Thái', 'Mỹ Tiên', '1568644813.jpg', 'ruakundor@gmail.com', '202cb962ac59075b964b07152d234b70', '099999999999', 1, 1, 19, '2019-09-16 21:15:00', '2019-09-20 18:07:30'),
(3, 'Nguyễn', 'Thị Bích Ngọc', '1568647601.jpg', 'thienhoang97@gmail.com', '202cb962ac59075b964b07152d234b70', '0932312994', 0, 1, 1, '2019-09-16 22:08:30', '2019-09-19 08:37:05'),
(11, 'Test', 'Test', '1568856833.jpg', 'nhanvien@gmail.com', '25d55ad283aa400af464c76d713c07ad', '1234567890', 0, 1, 7, '2019-09-19 08:09:19', '2019-09-19 08:45:36'),
(12, 'Nguyễn', 'Phúc Duy', 'admin.png', 'dthanhhuy1998@gmail.com', '202cb962ac59075b964b07152d234b70', '1234567890', 1, 1, 15, '2019-10-06 00:00:00', '2019-10-06 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tinh_trang_hon_nhan`
--

CREATE TABLE `tinh_trang_hon_nhan` (
  `id` int(11) NOT NULL,
  `ten_tinh_trang` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tinh_trang_hon_nhan`
--

INSERT INTO `tinh_trang_hon_nhan` (`id`, `ten_tinh_trang`) VALUES
(1, 'Độc thân'),
(2, 'Đính hôn'),
(3, 'Có gia đình'),
(4, 'Ly thân'),
(5, 'Ly hôn');

-- --------------------------------------------------------

--
-- Table structure for table `ton_giao`
--

CREATE TABLE `ton_giao` (
  `id` int(11) NOT NULL,
  `ten_ton_giao` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ton_giao`
--

INSERT INTO `ton_giao` (`id`, `ten_ton_giao`) VALUES
(0, 'Không'),
(1, 'Phật giáo'),
(2, 'Thiên chúa giáo'),
(3, 'Đạo tin lành'),
(4, 'Hồi giáo'),
(5, 'Do Thái giáo');

-- --------------------------------------------------------

--
-- Table structure for table `trinh_do`
--

CREATE TABLE `trinh_do` (
  `id` int(11) NOT NULL,
  `ma_trinh_do` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ten_trinh_do` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ghi_chu` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nguoi_tao` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ngay_tao` datetime NOT NULL,
  `nguoi_sua` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ngay_sua` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `trinh_do`
--

INSERT INTO `trinh_do` (`id`, `ma_trinh_do`, `ten_trinh_do`, `ghi_chu`, `nguoi_tao`, `ngay_tao`, `nguoi_sua`, `ngay_sua`) VALUES
(1, 'MTD1569206480', '1/12', '<p>Tr&igrave;nh độ lớp 1/12</p>\r\n', 'Thái Mỹ Tiên', '2025-03-18 15:09:36', 'Thái Mỹ Tiên', '2025-03-18 15:09:36'),
(2, 'MTD1569206546', '2/12', '<p>Tr&igrave;nh độ lớp 2/12</p>\r\n', 'Thái Mỹ Tiên', '2025-03-18 15:09:36', 'Thái Mỹ Tiên', '2025-03-18 15:09:36'),
(3, 'MTD1569206555', '3/12', '<p>Tr&igrave;nh độ lớp 3/12</p>\r\n', 'Thái Mỹ Tiên', '2025-03-18 15:09:36', 'Thái Mỹ Tiên', '2025-03-18 15:09:36'),
(4, 'MTD1569206570', '4/12', '<p>Tr&igrave;nh độ lớp 4/12</p>\r\n', 'Thái Mỹ Tiên', '2025-03-18 15:09:36', 'Thái Mỹ Tiên', '2025-03-18 15:09:36'),
(5, 'MTD1569206579', '5/12', '<p>Tr&igrave;nh độ lớp 5/12</p>\r\n', 'Thái Mỹ Tiên', '2025-03-18 15:09:36', 'Thái Mỹ Tiên', '2025-03-18 15:09:36'),
(6, 'MTD1569206590', '6/12', '<p>Tr&igrave;nh độ lớp 6/12</p>\r\n', 'Thái Mỹ Tiên', '2025-03-18 15:09:36', 'Thái Mỹ Tiên', '2025-03-18 15:09:36'),
(7, 'MTD1569206604', '7/12', '<p>Tr&igrave;nh độ lớp 7/12</p>\r\n', 'Thái Mỹ Tiên', '2025-03-18 15:09:36', 'Thái Mỹ Tiên', '2025-03-18 15:09:36'),
(8, 'MTD1569206616', '8/12', '<p>Tr&igrave;nh độ lớp 8/12</p>\r\n', 'Thái Mỹ Tiên', '2025-03-18 15:09:36', 'Thái Mỹ Tiên', '2025-03-18 15:09:36'),
(9, 'MTD1569206628', '9/12', '<p>Tr&igrave;nh độ lớp 9/12</p>\r\n', 'Thái Mỹ Tiên', '2025-03-18 15:09:36', 'Thái Mỹ Tiên', '2025-03-18 15:09:36'),
(10, 'MTD1569206638', '10/12', '<p>Tr&igrave;nh độ lớp 10/12</p>\r\n', 'Thái Mỹ Tiên', '2025-03-18 15:09:36', 'Thái Mỹ Tiên', '2025-03-18 15:09:36'),
(11, 'MTD1569206649', '11/12', '<p>Tr&igrave;nh độ lớp 11/12</p>\r\n', 'Thái Mỹ Tiên', '2025-03-18 15:09:36', 'Thái Mỹ Tiên', '2025-03-18 15:09:36'),
(12, 'MTD1569206662', '12/12', '<p>Tr&igrave;nh độ lớp 12/12</p>\r\n', 'Thái Mỹ Tiên', '2025-03-18 15:09:36', 'Đào Thanh Huy', '2025-03-18 15:09:36'),
(15, 'MTD1569651298', 'Trung cấp', '', 'Đào Thanh Huy', '2025-03-18 15:09:36', 'Đào Thanh Huy', '2025-03-18 15:09:36'),
(16, 'MTD1569651304', 'Cao đẳng', '', 'Đào Thanh Huy', '2025-03-18 15:09:36', 'Đào Thanh Huy', '2025-03-18 15:09:36'),
(17, 'MTD1569651310', 'Đại học', '', 'Đào Thanh Huy', '2025-03-18 15:09:36', 'Đào Thanh Huy', '2025-03-18 15:09:36'),
(18, 'MTD1569651317', 'Cao học', '', 'Đào Thanh Huy', '2025-03-18 15:09:36', 'Đào Thanh Huy', '2025-03-18 15:09:36');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bang_cap`
--
ALTER TABLE `bang_cap`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chinh_luong`
--
ALTER TABLE `chinh_luong`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nhanvien_id` (`nhanvien_id`);

--
-- Indexes for table `chi_tiet_nhom`
--
ALTER TABLE `chi_tiet_nhom`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chuc_vu`
--
ALTER TABLE `chuc_vu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chuyen_mon`
--
ALTER TABLE `chuyen_mon`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cong_tac`
--
ALTER TABLE `cong_tac`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nhanvien_id` (`nhanvien_id`);

--
-- Indexes for table `dan_toc`
--
ALTER TABLE `dan_toc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `khen_thuong_ky_luat`
--
ALTER TABLE `khen_thuong_ky_luat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `loai_kt_id` (`loai_kt_id`),
  ADD KEY `nhanvien_id` (`nhanvien_id`);

--
-- Indexes for table `loai_khen_thuong_ky_luat`
--
ALTER TABLE `loai_khen_thuong_ky_luat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loai_nv`
--
ALTER TABLE `loai_nv`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `luong`
--
ALTER TABLE `luong`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nhanvien_id` (`nhanvien_id`);

--
-- Indexes for table `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quoc_tich_id` (`quoc_tich_id`),
  ADD KEY `ton_giao_id` (`ton_giao_id`),
  ADD KEY `dan_toc_id` (`dan_toc_id`),
  ADD KEY `loai_nv_id` (`loai_nv_id`),
  ADD KEY `chuyen_mon_id` (`chuyen_mon_id`),
  ADD KEY `trinh_do_id` (`trinh_do_id`),
  ADD KEY `bang_cap_id` (`bang_cap_id`),
  ADD KEY `phong_ban_id` (`phong_ban_id`),
  ADD KEY `chuc_vu_id` (`chuc_vu_id`),
  ADD KEY `nguoi_tao_id` (`nguoi_tao_id`),
  ADD KEY `nguoi_sua_id` (`nguoi_sua_id`);

--
-- Indexes for table `nhom`
--
ALTER TABLE `nhom`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phong_ban`
--
ALTER TABLE `phong_ban`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quoc_tich`
--
ALTER TABLE `quoc_tich`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tai_khoan`
--
ALTER TABLE `tai_khoan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tinh_trang_hon_nhan`
--
ALTER TABLE `tinh_trang_hon_nhan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ton_giao`
--
ALTER TABLE `ton_giao`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trinh_do`
--
ALTER TABLE `trinh_do`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bang_cap`
--
ALTER TABLE `bang_cap`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `chinh_luong`
--
ALTER TABLE `chinh_luong`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chi_tiet_nhom`
--
ALTER TABLE `chi_tiet_nhom`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `chuc_vu`
--
ALTER TABLE `chuc_vu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `chuyen_mon`
--
ALTER TABLE `chuyen_mon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `cong_tac`
--
ALTER TABLE `cong_tac`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `dan_toc`
--
ALTER TABLE `dan_toc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `khen_thuong_ky_luat`
--
ALTER TABLE `khen_thuong_ky_luat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `loai_khen_thuong_ky_luat`
--
ALTER TABLE `loai_khen_thuong_ky_luat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `loai_nv`
--
ALTER TABLE `loai_nv`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `luong`
--
ALTER TABLE `luong`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `nhanvien`
--
ALTER TABLE `nhanvien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `nhom`
--
ALTER TABLE `nhom`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `phong_ban`
--
ALTER TABLE `phong_ban`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `quoc_tich`
--
ALTER TABLE `quoc_tich`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `tai_khoan`
--
ALTER TABLE `tai_khoan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tinh_trang_hon_nhan`
--
ALTER TABLE `tinh_trang_hon_nhan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ton_giao`
--
ALTER TABLE `ton_giao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `trinh_do`
--
ALTER TABLE `trinh_do`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chinh_luong`
--
ALTER TABLE `chinh_luong`
  ADD CONSTRAINT `chinh_luong_ibfk_1` FOREIGN KEY (`nhanvien_id`) REFERENCES `nhanvien` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cong_tac`
--
ALTER TABLE `cong_tac`
  ADD CONSTRAINT `cong_tac_ibfk_1` FOREIGN KEY (`nhanvien_id`) REFERENCES `nhanvien` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `khen_thuong_ky_luat`
--
ALTER TABLE `khen_thuong_ky_luat`
  ADD CONSTRAINT `khen_thuong_ky_luat_ibfk_1` FOREIGN KEY (`nhanvien_id`) REFERENCES `nhanvien` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `khen_thuong_ky_luat_ibfk_2` FOREIGN KEY (`loai_kt_id`) REFERENCES `loai_khen_thuong_ky_luat` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `luong`
--
ALTER TABLE `luong`
  ADD CONSTRAINT `luong_ibfk_1` FOREIGN KEY (`nhanvien_id`) REFERENCES `nhanvien` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD CONSTRAINT `nhanvien_ibfk_1` FOREIGN KEY (`quoc_tich_id`) REFERENCES `quoc_tich` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `nhanvien_ibfk_2` FOREIGN KEY (`ton_giao_id`) REFERENCES `ton_giao` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `nhanvien_ibfk_3` FOREIGN KEY (`dan_toc_id`) REFERENCES `dan_toc` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `nhanvien_ibfk_4` FOREIGN KEY (`loai_nv_id`) REFERENCES `loai_nv` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `nhanvien_ibfk_5` FOREIGN KEY (`trinh_do_id`) REFERENCES `trinh_do` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `nhanvien_ibfk_6` FOREIGN KEY (`chuyen_mon_id`) REFERENCES `chuyen_mon` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `nhanvien_ibfk_7` FOREIGN KEY (`bang_cap_id`) REFERENCES `bang_cap` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `nhanvien_ibfk_8` FOREIGN KEY (`phong_ban_id`) REFERENCES `phong_ban` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `nhanvien_ibfk_9` FOREIGN KEY (`chuc_vu_id`) REFERENCES `chuc_vu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
