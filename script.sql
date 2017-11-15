USE [master]
GO
/****** Object:  Database [QLMamNon]    Script Date: 2017/11/13 16:39:55 ******/
CREATE DATABASE [QLMamNon]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLMamNon', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\QLMamNon.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QLMamNon_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\QLMamNon_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QLMamNon] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLMamNon].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLMamNon] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLMamNon] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLMamNon] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLMamNon] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLMamNon] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLMamNon] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLMamNon] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLMamNon] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLMamNon] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLMamNon] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLMamNon] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLMamNon] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLMamNon] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLMamNon] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLMamNon] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QLMamNon] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLMamNon] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLMamNon] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLMamNon] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLMamNon] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLMamNon] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLMamNon] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLMamNon] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLMamNon] SET  MULTI_USER 
GO
ALTER DATABASE [QLMamNon] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLMamNon] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLMamNon] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLMamNon] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QLMamNon] SET DELAYED_DURABILITY = DISABLED 
GO
USE [QLMamNon]
GO
/****** Object:  Table [dbo].[ChucVu]    Script Date: 2017/11/13 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChucVu](
	[MaChucVu] [nvarchar](50) NOT NULL,
	[TenChucVu] [nvarchar](50) NULL,
 CONSTRAINT [PK_ChucVu] PRIMARY KEY CLUSTERED 
(
	[MaChucVu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CT_DichVu_HocSinh]    Script Date: 2017/11/13 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_DichVu_HocSinh](
	[MaHocSinh] [int] NOT NULL,
	[MaDV] [int] NOT NULL,
	[NgayDK] [date] NULL,
	[GhiChu] [nvarchar](50) NULL,
 CONSTRAINT [PK_CT_DichVu_HocSinh] PRIMARY KEY CLUSTERED 
(
	[MaHocSinh] ASC,
	[MaDV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CT_NgayTheoDoi]    Script Date: 2017/11/13 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_NgayTheoDoi](
	[MaPhieuTheoDoi] [int] NOT NULL,
	[MaHocSinh] [int] NOT NULL,
	[DDVang] [bit] NULL,
	[DDAnSang] [bit] NULL,
	[DDAnTrua] [bit] NULL,
	[GhiChu] [nvarchar](50) NULL,
	[ChiPhi] [money] NULL,
 CONSTRAINT [PK_CT_NgayTheoDoi] PRIMARY KEY CLUSTERED 
(
	[MaPhieuTheoDoi] ASC,
	[MaHocSinh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DichVuNgoai]    Script Date: 2017/11/13 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DichVuNgoai](
	[MaDichVu] [int] IDENTITY(1,1) NOT NULL,
	[TenDV] [nvarchar](50) NULL,
	[ChiPhi] [money] NULL,
	[MoTa] [nvarchar](50) NULL,
 CONSTRAINT [PK_DichVuNgoai] PRIMARY KEY CLUSTERED 
(
	[MaDichVu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 2017/11/13 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHoaDon] [int] NOT NULL,
	[TenHoaDon] [nvarchar](50) NULL,
	[NgayGia0Dich] [date] NULL,
	[MaNhanVien] [nvarchar](50) NULL,
	[ThanhTien] [money] NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HocSinh]    Script Date: 2017/11/13 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HocSinh](
	[MaHocSinh] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](50) NOT NULL,
	[NgaySinh] [date] NULL,
	[GioiTinh] [nvarchar](5) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[TinhTrang] [nvarchar](50) NULL,
	[DanToc] [nvarchar](20) NULL,
	[DoiTuong] [nvarchar](50) NULL,
	[ChieuCao] [int] NULL,
	[CanNang] [int] NULL,
	[TenPhuHuynh] [nvarchar](50) NULL,
	[SoCmt] [nvarchar](50) NULL,
	[Sdt] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[NgaySinhPhuHuynh] [date] NULL,
	[GhiChu] [nvarchar](50) NULL,
	[MaLop] [nvarchar](50) NULL,
	[UserName] [nchar](10) NULL,
	[Password] [nchar](10) NULL,
	[TrangThai] [int] NULL CONSTRAINT [DF_HocSinh_TrangThai]  DEFAULT ((0)),
 CONSTRAINT [PK_HocSinh] PRIMARY KEY CLUSTERED 
(
	[MaHocSinh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiLop]    Script Date: 2017/11/13 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiLop](
	[MaLoaiLop] [nvarchar](50) NOT NULL,
	[TenLoaiLop] [nvarchar](50) NULL,
 CONSTRAINT [PK_LoaiLop] PRIMARY KEY CLUSTERED 
(
	[MaLoaiLop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Lop]    Script Date: 2017/11/13 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lop](
	[MaLop] [nvarchar](50) NOT NULL,
	[TenLop] [nvarchar](50) NULL,
	[MaLoaiLop] [nvarchar](50) NULL,
	[SiSo] [int] NULL,
 CONSTRAINT [PK_Lop] PRIMARY KEY CLUSTERED 
(
	[MaLop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 2017/11/13 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNhanVien] [nvarchar](50) NOT NULL,
	[TenNhanVien] [nvarchar](50) NULL,
	[MaChucVu] [nvarchar](50) NULL,
	[MaLop] [nvarchar](50) NULL,
	[UserName] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNhanVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhieuTheoDoi]    Script Date: 2017/11/13 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuTheoDoi](
	[MaPhieuTheoDoi] [int] IDENTITY(1,1) NOT NULL,
	[MaGiaoVien] [nvarchar](50) NOT NULL,
	[NgayTheoDoi] [date] NULL,
	[ChiPhiDuTinh] [money] NULL,
 CONSTRAINT [PK_PhieuTheoDoi_1] PRIMARY KEY CLUSTERED 
(
	[MaPhieuTheoDoi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhieuThu]    Script Date: 2017/11/13 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuThu](
	[Thang] [int] NULL,
	[Nam] [int] NULL,
	[MaHocSinh] [int] NOT NULL,
	[MaNhanVien] [nvarchar](50) NOT NULL,
	[SoNgayVang] [int] NULL,
	[SoNgayAnSang] [int] NULL,
	[SoNgayAnTrua] [int] NULL,
	[GhiChu] [nvarchar](50) NULL,
 CONSTRAINT [PK_PhieuThu] PRIMARY KEY CLUSTERED 
(
	[MaHocSinh] ASC,
	[MaNhanVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Quyen]    Script Date: 2017/11/13 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quyen](
	[MaQuyen] [nvarchar](50) NOT NULL,
	[MoTa] [nvarchar](50) NULL,
 CONSTRAINT [PK_Quyen] PRIMARY KEY CLUSTERED 
(
	[MaQuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Quyen_ChucVu]    Script Date: 2017/11/13 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quyen_ChucVu](
	[MaQuyen] [nvarchar](50) NOT NULL,
	[MaChucVu] [nvarchar](50) NOT NULL,
	[NgayTao] [date] NULL,
	[NguoiTao] [nvarchar](50) NULL,
 CONSTRAINT [PK_Quyen_ChucVu] PRIMARY KEY CLUSTERED 
(
	[MaQuyen] ASC,
	[MaChucVu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[ChucVu] ([MaChucVu], [TenChucVu]) VALUES (N'GVC', N'Giáo viên chính')
INSERT [dbo].[ChucVu] ([MaChucVu], [TenChucVu]) VALUES (N'GVP', N'Giáo viên phụ')
INSERT [dbo].[ChucVu] ([MaChucVu], [TenChucVu]) VALUES (N'KETOAN', N'kế toán')
INSERT [dbo].[ChucVu] ([MaChucVu], [TenChucVu]) VALUES (N'TONUOI', N'Tổ nuôi')
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (1, 1, 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (1, 2, 1, 0, NULL, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (1, 3, 1, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (1, 4, 1, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (1, 5, 1, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (1, 6, 1, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (2, 1, 1, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (2, 2, 1, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (2, 3, 1, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (2, 4, 1, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (2, 5, 1, 0, 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[DichVuNgoai] ON 

INSERT [dbo].[DichVuNgoai] ([MaDichVu], [TenDV], [ChiPhi], [MoTa]) VALUES (1, N'năng khiếu đá bóng', 30.0000, NULL)
INSERT [dbo].[DichVuNgoai] ([MaDichVu], [TenDV], [ChiPhi], [MoTa]) VALUES (2, N'học võ', 30.0000, NULL)
INSERT [dbo].[DichVuNgoai] ([MaDichVu], [TenDV], [ChiPhi], [MoTa]) VALUES (3, N'học vẽ', 30.0000, NULL)
INSERT [dbo].[DichVuNgoai] ([MaDichVu], [TenDV], [ChiPhi], [MoTa]) VALUES (4, N'học múa', 30.0000, NULL)
INSERT [dbo].[DichVuNgoai] ([MaDichVu], [TenDV], [ChiPhi], [MoTa]) VALUES (5, N'học thứ 7', 20.0000, NULL)
INSERT [dbo].[DichVuNgoai] ([MaDichVu], [TenDV], [ChiPhi], [MoTa]) VALUES (6, N'cơ sở vật chất', 40.0000, NULL)
INSERT [dbo].[DichVuNgoai] ([MaDichVu], [TenDV], [ChiPhi], [MoTa]) VALUES (7, N'xây dựng', 50.0000, NULL)
SET IDENTITY_INSERT [dbo].[DichVuNgoai] OFF
SET IDENTITY_INSERT [dbo].[HocSinh] ON 

INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [DanToc], [DoiTuong], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [UserName], [Password], [TrangThai]) VALUES (1, N'hung1', CAST(N'1994-01-12' AS Date), N'nam', N'abc', NULL, N'hjhhj', N'hjhj', NULL, NULL, N'jhjhj', N'121425457', N'612532615', N'hungth11b@gmail', CAST(N'1996-11-02' AS Date), NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [DanToc], [DoiTuong], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [UserName], [Password], [TrangThai]) VALUES (2, N'hung2', CAST(N'2017-12-31' AS Date), N'Nam', N'jkhkj', NULL, N'kjhjk', N'hkjh', NULL, NULL, N'kjhkj', N'87686', N'87687', N'hung@gd.com', CAST(N'2017-12-31' AS Date), NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [DanToc], [DoiTuong], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [UserName], [Password], [TrangThai]) VALUES (3, N'hung3', CAST(N'2017-12-31' AS Date), N'Nam', N'jkhkj', NULL, N'kjhjk', N'hkjh', NULL, NULL, N'kjhkj', N'87686', N'87687', N'hung@gd.com', CAST(N'2017-12-31' AS Date), NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [DanToc], [DoiTuong], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [UserName], [Password], [TrangThai]) VALUES (4, N'hung4', CAST(N'2017-12-31' AS Date), N'Nam', N'jkhkj', NULL, N'kjhjk', N'hkjh', NULL, NULL, N'kjhkj', N'87686', N'87687', N'hung@gd.com', CAST(N'2017-12-31' AS Date), NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [DanToc], [DoiTuong], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [UserName], [Password], [TrangThai]) VALUES (5, N'hung5', CAST(N'2017-12-31' AS Date), N'Nam', N'jkhkj', NULL, N'kjhjk', N'hkjh', NULL, NULL, N'kjhkj', N'87686', N'87687', N'hung@gd.com', CAST(N'2017-12-31' AS Date), NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [DanToc], [DoiTuong], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [UserName], [Password], [TrangThai]) VALUES (6, N'hung6', CAST(N'2017-12-31' AS Date), N'Nam', N'jkhkj', NULL, N'kjhjk', N'hkjh', NULL, NULL, N'kjhkj', N'87686', N'87687', N'hung@gd.com', CAST(N'2017-12-31' AS Date), NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [DanToc], [DoiTuong], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [UserName], [Password], [TrangThai]) VALUES (7, N'hung7', CAST(N'2017-12-31' AS Date), N'Nam', N'jkhkj', NULL, N'kjhjk', N'hkjh', NULL, NULL, N'kjhkj', N'87686', N'87687', N'hung@gd.com', CAST(N'2017-12-31' AS Date), NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [DanToc], [DoiTuong], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [UserName], [Password], [TrangThai]) VALUES (8, N'hung8', CAST(N'2017-12-31' AS Date), N'Nam', N'jkhkj', NULL, N'kjhjk', N'hkjh', NULL, NULL, N'kjhkj', N'87686', N'87687', N'hung@gd.com', CAST(N'2017-12-31' AS Date), NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [DanToc], [DoiTuong], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [UserName], [Password], [TrangThai]) VALUES (9, N'hung89', CAST(N'2017-12-31' AS Date), N'Nam', N'jkhkj', NULL, N'kjhjk', N'hkjh', NULL, NULL, N'kjhkj', N'87686', N'87687', N'hung@gd.com', CAST(N'2017-12-31' AS Date), NULL, NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[HocSinh] OFF
INSERT [dbo].[LoaiLop] ([MaLoaiLop], [TenLoaiLop]) VALUES (N'MTA', N'Lớp con học viện MTA')
INSERT [dbo].[LoaiLop] ([MaLoaiLop], [TenLoaiLop]) VALUES (N'NONE', N'Lớp khác')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaLoaiLop], [SiSo]) VALUES (N'BE', N'Mẫu giáo bé', N'NONE', 14)
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaLoaiLop], [SiSo]) VALUES (N'MGLA', N'Mẫu giáo lớn A', N'MTA', 14)
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaLoaiLop], [SiSo]) VALUES (N'MGLB', N'Mẫu giáo lớn B', N'NONE', 15)
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaLoaiLop], [SiSo]) VALUES (N'MGNA', N'Mẫu giáo nhỡ A', N'MTA', 14)
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaLoaiLop], [SiSo]) VALUES (N'MGNB', N'Mẫu giáo nhỡ B', N'NONE', 16)
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaLoaiLop], [SiSo]) VALUES (N'NHATREA', N'Lớp trẻ A ', N'MTA', 12)
INSERT [dbo].[Lop] ([MaLop], [TenLop], [MaLoaiLop], [SiSo]) VALUES (N'NHATREB', N'Lớp trẻ B ', N'NONE', 13)
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [MaChucVu], [MaLop], [UserName], [Password]) VALUES (N'GV1', N'Nguyễn Chính', N'GVC', N'BE', N'GV1', N'giaovien')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [MaChucVu], [MaLop], [UserName], [Password]) VALUES (N'GV10', N'giáo viên 10', N'GVC', N'MGNB', N'GV10', N'giaovien')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [MaChucVu], [MaLop], [UserName], [Password]) VALUES (N'GV11', N'giáo viên 11', N'GVP', N'MGNB', N'GV11', N'giaovien')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [MaChucVu], [MaLop], [UserName], [Password]) VALUES (N'GV12', N'giáo viên 12', N'GVC', N'NHATREA', N'GV12', N'giaovien')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [MaChucVu], [MaLop], [UserName], [Password]) VALUES (N'GV13', N'giáo viên13', N'GVP', N'NHATREA', N'GV13', N'giaovien')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [MaChucVu], [MaLop], [UserName], [Password]) VALUES (N'GV14', N'giáo viên14', N'GVC', N'NHATREB', N'GV14', N'giaovien')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [MaChucVu], [MaLop], [UserName], [Password]) VALUES (N'GV15', N'giáo viên15', N'GVP', N'NHATREB', N'GV15', N'giaovien')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [MaChucVu], [MaLop], [UserName], [Password]) VALUES (N'GV2', N'Nguyễn Phụ', N'GVP', N'BE', N'GV2', N'giaovien')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [MaChucVu], [MaLop], [UserName], [Password]) VALUES (N'GV3', N'Nguyễn Phụ Phụ', N'GVP', N'BE', N'GV3', N'giaovien')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [MaChucVu], [MaLop], [UserName], [Password]) VALUES (N'GV4', N'giáo viên 4', N'GVC', N'MGLA', N'GV4', N'giaovien')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [MaChucVu], [MaLop], [UserName], [Password]) VALUES (N'GV5', N'giáo viên 5', N'GVP', N'MGLA', N'GV5', N'giaovien')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [MaChucVu], [MaLop], [UserName], [Password]) VALUES (N'GV6', N'giáo viên 6', N'GVC', N'MGLB', N'GV6', N'giaovien')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [MaChucVu], [MaLop], [UserName], [Password]) VALUES (N'GV7', N'giáo viên 7', N'GVP', N'MGLB', N'GV7', N'giaovien')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [MaChucVu], [MaLop], [UserName], [Password]) VALUES (N'GV8', N'giáo viên 8', N'GVC', N'MGNA', N'GV8', N'giaovien')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [MaChucVu], [MaLop], [UserName], [Password]) VALUES (N'GV9', N'giáo viên 9', N'GVP', N'MGNA', N'GV9', N'giaovien')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [MaChucVu], [MaLop], [UserName], [Password]) VALUES (N'KT1', N'kế toán', N'KETOAN', NULL, N'KT1', N'ketoan')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [MaChucVu], [MaLop], [UserName], [Password]) VALUES (N'TN1', N'tổ nuôi', N'TONUOI', NULL, N'TN1', N'tonuoi')
SET IDENTITY_INSERT [dbo].[PhieuTheoDoi] ON 

INSERT [dbo].[PhieuTheoDoi] ([MaPhieuTheoDoi], [MaGiaoVien], [NgayTheoDoi], [ChiPhiDuTinh]) VALUES (1, N'GV1', CAST(N'2017-11-05' AS Date), 5.0000)
INSERT [dbo].[PhieuTheoDoi] ([MaPhieuTheoDoi], [MaGiaoVien], [NgayTheoDoi], [ChiPhiDuTinh]) VALUES (2, N'GV1', CAST(N'2017-05-06' AS Date), 5.0000)
SET IDENTITY_INSERT [dbo].[PhieuTheoDoi] OFF
ALTER TABLE [dbo].[CT_DichVu_HocSinh]  WITH CHECK ADD  CONSTRAINT [FK_CT_DichVu_HocSinh_DichVuNgoai] FOREIGN KEY([MaDV])
REFERENCES [dbo].[DichVuNgoai] ([MaDichVu])
GO
ALTER TABLE [dbo].[CT_DichVu_HocSinh] CHECK CONSTRAINT [FK_CT_DichVu_HocSinh_DichVuNgoai]
GO
ALTER TABLE [dbo].[CT_DichVu_HocSinh]  WITH CHECK ADD  CONSTRAINT [FK_CT_DichVu_HocSinh_HocSinh] FOREIGN KEY([MaHocSinh])
REFERENCES [dbo].[HocSinh] ([MaHocSinh])
GO
ALTER TABLE [dbo].[CT_DichVu_HocSinh] CHECK CONSTRAINT [FK_CT_DichVu_HocSinh_HocSinh]
GO
ALTER TABLE [dbo].[CT_NgayTheoDoi]  WITH CHECK ADD  CONSTRAINT [FK_CT_NgayTheoDoi_HocSinh] FOREIGN KEY([MaHocSinh])
REFERENCES [dbo].[HocSinh] ([MaHocSinh])
GO
ALTER TABLE [dbo].[CT_NgayTheoDoi] CHECK CONSTRAINT [FK_CT_NgayTheoDoi_HocSinh]
GO
ALTER TABLE [dbo].[CT_NgayTheoDoi]  WITH CHECK ADD  CONSTRAINT [FK_CT_NgayTheoDoi_PhieuTheoDoi] FOREIGN KEY([MaPhieuTheoDoi])
REFERENCES [dbo].[PhieuTheoDoi] ([MaPhieuTheoDoi])
GO
ALTER TABLE [dbo].[CT_NgayTheoDoi] CHECK CONSTRAINT [FK_CT_NgayTheoDoi_PhieuTheoDoi]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_NhanVien] FOREIGN KEY([MaNhanVien])
REFERENCES [dbo].[NhanVien] ([MaNhanVien])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_NhanVien]
GO
ALTER TABLE [dbo].[HocSinh]  WITH CHECK ADD  CONSTRAINT [FK_HocSinh_Lop1] FOREIGN KEY([MaLop])
REFERENCES [dbo].[Lop] ([MaLop])
GO
ALTER TABLE [dbo].[HocSinh] CHECK CONSTRAINT [FK_HocSinh_Lop1]
GO
ALTER TABLE [dbo].[Lop]  WITH CHECK ADD  CONSTRAINT [FK_Lop_LoaiLop] FOREIGN KEY([MaLoaiLop])
REFERENCES [dbo].[LoaiLop] ([MaLoaiLop])
GO
ALTER TABLE [dbo].[Lop] CHECK CONSTRAINT [FK_Lop_LoaiLop]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_ChucVu] FOREIGN KEY([MaChucVu])
REFERENCES [dbo].[ChucVu] ([MaChucVu])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_ChucVu]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_Lop] FOREIGN KEY([MaLop])
REFERENCES [dbo].[Lop] ([MaLop])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_Lop]
GO
ALTER TABLE [dbo].[PhieuTheoDoi]  WITH CHECK ADD  CONSTRAINT [FK_PhieuTheoDoi_NhanVien] FOREIGN KEY([MaGiaoVien])
REFERENCES [dbo].[NhanVien] ([MaNhanVien])
GO
ALTER TABLE [dbo].[PhieuTheoDoi] CHECK CONSTRAINT [FK_PhieuTheoDoi_NhanVien]
GO
ALTER TABLE [dbo].[PhieuThu]  WITH CHECK ADD  CONSTRAINT [FK_PhieuThu_HocSinh] FOREIGN KEY([MaHocSinh])
REFERENCES [dbo].[HocSinh] ([MaHocSinh])
GO
ALTER TABLE [dbo].[PhieuThu] CHECK CONSTRAINT [FK_PhieuThu_HocSinh]
GO
ALTER TABLE [dbo].[PhieuThu]  WITH CHECK ADD  CONSTRAINT [FK_PhieuThu_NhanVien] FOREIGN KEY([MaNhanVien])
REFERENCES [dbo].[NhanVien] ([MaNhanVien])
GO
ALTER TABLE [dbo].[PhieuThu] CHECK CONSTRAINT [FK_PhieuThu_NhanVien]
GO
ALTER TABLE [dbo].[Quyen_ChucVu]  WITH CHECK ADD  CONSTRAINT [FK_Quyen_ChucVu_ChucVu] FOREIGN KEY([MaChucVu])
REFERENCES [dbo].[ChucVu] ([MaChucVu])
GO
ALTER TABLE [dbo].[Quyen_ChucVu] CHECK CONSTRAINT [FK_Quyen_ChucVu_ChucVu]
GO
ALTER TABLE [dbo].[Quyen_ChucVu]  WITH CHECK ADD  CONSTRAINT [FK_Quyen_ChucVu_Quyen] FOREIGN KEY([MaQuyen])
REFERENCES [dbo].[Quyen] ([MaQuyen])
GO
ALTER TABLE [dbo].[Quyen_ChucVu] CHECK CONSTRAINT [FK_Quyen_ChucVu_Quyen]
GO
USE [master]
GO
ALTER DATABASE [QLMamNon] SET  READ_WRITE 
GO
