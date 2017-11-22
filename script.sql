USE [master]
GO
/****** Object:  Database [QLMamNon]    Script Date: 2017/11/22 17:15:39 ******/
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
/****** Object:  Table [dbo].[ChucVu]    Script Date: 2017/11/22 17:15:39 ******/
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
/****** Object:  Table [dbo].[CT_DichVu_HocSinh]    Script Date: 2017/11/22 17:15:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_DichVu_HocSinh](
	[MaHocSinh] [int] NOT NULL,
	[MaDV] [int] NOT NULL,
	[NgayDK] [date] NULL,
	[NgayHetHan] [date] NULL,
	[GhiChu] [nvarchar](50) NULL,
 CONSTRAINT [PK_CT_DichVu_HocSinh] PRIMARY KEY CLUSTERED 
(
	[MaHocSinh] ASC,
	[MaDV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CT_NgayTheoDoi]    Script Date: 2017/11/22 17:15:39 ******/
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
/****** Object:  Table [dbo].[DichVuNgoai]    Script Date: 2017/11/22 17:15:39 ******/
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
/****** Object:  Table [dbo].[HoaDon]    Script Date: 2017/11/22 17:15:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHoaDon] [int] NOT NULL,
	[TenHoaDon] [nvarchar](50) NULL,
	[NgayGiaoDich] [date] NULL,
	[MaNhanVien] [nvarchar](50) NULL,
	[ThanhTien] [money] NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HocSinh]    Script Date: 2017/11/22 17:15:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HocSinh](
	[MaHocSinh] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](50) NOT NULL,
	[NgaySinh] [date] NULL,
	[GioiTinh] [nvarchar](5) NULL,
	[DiaChi] [nvarchar](200) NULL,
	[TinhTrang] [nvarchar](50) NULL,
	[ChieuCao] [int] NULL,
	[CanNang] [int] NULL,
	[TenPhuHuynh] [nvarchar](50) NULL,
	[SoCmt] [nvarchar](50) NULL,
	[Sdt] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[NgaySinhPhuHuynh] [date] NULL,
	[GhiChu] [nvarchar](50) NULL,
	[MaLop] [nvarchar](50) NULL,
	[TrangThai] [int] NULL CONSTRAINT [DF_HocSinh_TrangThai]  DEFAULT ((0)),
 CONSTRAINT [PK_HocSinh] PRIMARY KEY CLUSTERED 
(
	[MaHocSinh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiLop]    Script Date: 2017/11/22 17:15:39 ******/
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
/****** Object:  Table [dbo].[Lop]    Script Date: 2017/11/22 17:15:39 ******/
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
/****** Object:  Table [dbo].[NhanVien]    Script Date: 2017/11/22 17:15:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNhanVien] [nvarchar](50) NOT NULL,
	[TenNhanVien] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](200) NULL,
	[Sdt] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[MaChucVu] [nvarchar](50) NULL,
	[MaLop] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNhanVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhieuTheoDoi]    Script Date: 2017/11/22 17:15:39 ******/
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
/****** Object:  Table [dbo].[PhieuThu]    Script Date: 2017/11/22 17:15:39 ******/
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
/****** Object:  Table [dbo].[Quyen]    Script Date: 2017/11/22 17:15:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quyen](
	[MaQuyen] [nvarchar](50) NOT NULL,
	[MoTa] [nvarchar](50) NULL,
	[ParentId] [nvarchar](50) NULL,
 CONSTRAINT [PK_Quyen] PRIMARY KEY CLUSTERED 
(
	[MaQuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Quyen_ChucVu]    Script Date: 2017/11/22 17:15:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quyen_ChucVu](
	[MaChucVu] [nvarchar](50) NOT NULL,
	[MaQuyen] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Quyen_ChucVu] PRIMARY KEY CLUSTERED 
(
	[MaQuyen] ASC,
	[MaChucVu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[ChucVu] ([MaChucVu], [TenChucVu]) VALUES (N'ADMIN', N'SupperAdmin')
INSERT [dbo].[ChucVu] ([MaChucVu], [TenChucVu]) VALUES (N'GVC', N'Giáo viên chính')
INSERT [dbo].[ChucVu] ([MaChucVu], [TenChucVu]) VALUES (N'GVP', N'Giáo viên phụ')
INSERT [dbo].[ChucVu] ([MaChucVu], [TenChucVu]) VALUES (N'KETOAN', N'kế toán')
INSERT [dbo].[ChucVu] ([MaChucVu], [TenChucVu]) VALUES (N'TONUOI', N'Tổ nuôi')
INSERT [dbo].[CT_DichVu_HocSinh] ([MaHocSinh], [MaDV], [NgayDK], [NgayHetHan], [GhiChu]) VALUES (1, 1, NULL, NULL, NULL)
INSERT [dbo].[CT_DichVu_HocSinh] ([MaHocSinh], [MaDV], [NgayDK], [NgayHetHan], [GhiChu]) VALUES (1, 2, NULL, NULL, NULL)
INSERT [dbo].[CT_DichVu_HocSinh] ([MaHocSinh], [MaDV], [NgayDK], [NgayHetHan], [GhiChu]) VALUES (2, 1, NULL, NULL, NULL)
INSERT [dbo].[CT_DichVu_HocSinh] ([MaHocSinh], [MaDV], [NgayDK], [NgayHetHan], [GhiChu]) VALUES (2, 2, NULL, NULL, NULL)
INSERT [dbo].[CT_DichVu_HocSinh] ([MaHocSinh], [MaDV], [NgayDK], [NgayHetHan], [GhiChu]) VALUES (2, 3, NULL, NULL, NULL)
INSERT [dbo].[CT_DichVu_HocSinh] ([MaHocSinh], [MaDV], [NgayDK], [NgayHetHan], [GhiChu]) VALUES (4, 1, NULL, NULL, NULL)
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

INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [TrangThai]) VALUES (1, N'hung1', CAST(N'1994-01-12' AS Date), N'nam', N'43 trần nhật duật, phường nam ngạn , thành phố thanh hóa', N'bé chăm chỉ học, sức khỏe tốt', 75, 30, N'Nguyễn Văn Thiên', N'173363724', N'01676983088', N'hungth11b@gmail', CAST(N'1996-11-02' AS Date), NULL, N'BE', 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [TrangThai]) VALUES (2, N'hung2', CAST(N'2017-12-31' AS Date), N'Nam', N'jkhkj', NULL, NULL, NULL, N'kjhkj', N'87686', N'87687', N'hung@gd.com', CAST(N'2017-12-31' AS Date), NULL, N'BE', 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [TrangThai]) VALUES (3, N'hung3', CAST(N'2017-12-31' AS Date), N'Nam', N'jkhkj', NULL, NULL, NULL, N'kjhkj', N'87686', N'87687', N'hung@gd.com', CAST(N'2017-12-31' AS Date), NULL, N'BE', 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [TrangThai]) VALUES (4, N'hung4', CAST(N'2017-12-31' AS Date), N'Nam', N'jkhkj', NULL, NULL, NULL, N'kjhkj', N'87686', N'87687', N'hung@gd.com', CAST(N'2017-12-31' AS Date), NULL, N'BE', 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [TrangThai]) VALUES (5, N'hung5', CAST(N'2017-12-31' AS Date), N'Nam', N'jkhkj', NULL, NULL, NULL, N'kjhkj', N'87686', N'87687', N'hung@gd.com', CAST(N'2017-12-31' AS Date), NULL, N'BE', 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [TrangThai]) VALUES (6, N'hung6', CAST(N'2017-12-31' AS Date), N'Nam', N'jkhkj', NULL, NULL, NULL, N'kjhkj', N'87686', N'87687', N'hung@gd.com', CAST(N'2017-12-31' AS Date), NULL, N'MGLA', 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [TrangThai]) VALUES (7, N'hung7', CAST(N'2017-12-31' AS Date), N'Nam', N'jkhkj', NULL, NULL, NULL, N'kjhkj', N'87686', N'87687', N'hung@gd.com', CAST(N'2017-12-31' AS Date), NULL, N'MGLA', 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [TrangThai]) VALUES (8, N'hung8', CAST(N'2017-12-31' AS Date), N'Nam', N'jkhkj', NULL, NULL, NULL, N'kjhkj', N'87686', N'87687', N'hung@gd.com', CAST(N'2017-12-31' AS Date), NULL, N'MGLA', 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [TrangThai]) VALUES (9, N'hung89', CAST(N'2017-12-31' AS Date), N'Nam', N'jkhkj', NULL, NULL, NULL, N'kjhkj', N'87686', N'87687', N'hung@gd.com', CAST(N'2017-12-31' AS Date), NULL, NULL, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [TrangThai]) VALUES (10, N'SDFSDFDS', CAST(N'2017-12-31' AS Date), N'Nam', N'WE', NULL, NULL, NULL, N'ƯEFWE', N'234234', N'01676983088', N'hugnth11b@gmail.com', CAST(N'2017-11-02' AS Date), NULL, NULL, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [TrangThai]) VALUES (11, N'zzzz', CAST(N'2017-11-02' AS Date), N'Nam', N'Zxax', NULL, NULL, NULL, N'ax', N'1221', N'01676983088', N'hung@gmaia.com', CAST(N'2017-11-17' AS Date), NULL, NULL, 0)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [TrangThai]) VALUES (12, N'zzzz', CAST(N'2017-11-09' AS Date), N'Nam', N'dfsdf', NULL, NULL, NULL, N'sdfsd', N'123123', N'0', NULL, CAST(N'2017-11-11' AS Date), NULL, NULL, 0)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [TrangThai]) VALUES (13, N'zzzz', CAST(N'2017-11-09' AS Date), N'Nam', N'dfsdf', NULL, NULL, NULL, N'sdfsd', N'123123', N'01676983088', N'hung@gmaia.com', CAST(N'2017-11-11' AS Date), NULL, NULL, 0)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [TrangThai]) VALUES (15, N'học sinh mới', CAST(N'2017-12-31' AS Date), N'Nam', N'adada', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0)
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
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'Admin', N'Admin', NULL, NULL, N'admin@gmail.com', N'ADMIN', NULL, N'123123')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'GV1', N'Nguyễn Chính', N'43 trần nhật duật, phường nam ngạn , thành phố thành hóa', N'01676983088', N'giaovien@gmail.com', N'GVC', N'BE', N'123123')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'GV10', N'giáo viên 10', NULL, NULL, N'giaovien10@gmail.com', N'GVC', N'MGNB', N'123123')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'GV11', N'giáo viên 11', NULL, NULL, NULL, N'GVP', N'MGNB', N'123123')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'GV12', N'giáo viên 12', NULL, NULL, NULL, N'GVC', N'NHATREA', N'123123')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'GV13', N'giáo viên13', NULL, NULL, NULL, N'GVP', N'NHATREA', N'123123')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'GV14', N'giáo viên14', NULL, NULL, NULL, N'GVC', N'NHATREB', N'123123')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'GV15', N'giáo viên15', NULL, NULL, NULL, N'GVP', N'NHATREB', N'123123')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'GV2', N'Nguyễn Phụ', NULL, NULL, NULL, N'GVP', N'BE', N'123123')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'GV3', N'Nguyễn Phụ Phụ', NULL, NULL, NULL, N'GVP', N'BE', N'123123')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'GV4', N'giáo viên 4', NULL, NULL, NULL, N'GVC', N'MGLA', N'123123')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'GV5', N'giáo viên 5', NULL, NULL, NULL, N'GVP', N'MGLA', N'123123')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'GV6', N'giáo viên 6', NULL, NULL, NULL, N'GVC', N'MGLB', N'123123')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'GV7', N'giáo viên 7', NULL, NULL, NULL, N'GVP', N'MGLB', N'123123')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'GV8', N'giáo viên 8', NULL, NULL, NULL, N'GVC', N'MGNA', N'123123')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'GV9', N'giáo viên 9', NULL, NULL, NULL, N'GVP', N'MGNA', N'123123')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'KT1', N'kế toán', NULL, NULL, N'ketoan@gmail.com', N'KETOAN', NULL, N'123123')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'TN1', N'tổ nuôi', NULL, NULL, N'tonuoi@gmail.com', N'TONUOI', NULL, N'123123')
SET IDENTITY_INSERT [dbo].[PhieuTheoDoi] ON 

INSERT [dbo].[PhieuTheoDoi] ([MaPhieuTheoDoi], [MaGiaoVien], [NgayTheoDoi], [ChiPhiDuTinh]) VALUES (1, N'GV1', CAST(N'2017-11-05' AS Date), 5.0000)
INSERT [dbo].[PhieuTheoDoi] ([MaPhieuTheoDoi], [MaGiaoVien], [NgayTheoDoi], [ChiPhiDuTinh]) VALUES (2, N'GV1', CAST(N'2017-05-06' AS Date), 5.0000)
INSERT [dbo].[PhieuTheoDoi] ([MaPhieuTheoDoi], [MaGiaoVien], [NgayTheoDoi], [ChiPhiDuTinh]) VALUES (3, N'GV1', CAST(N'2017-11-21' AS Date), 0.0000)
INSERT [dbo].[PhieuTheoDoi] ([MaPhieuTheoDoi], [MaGiaoVien], [NgayTheoDoi], [ChiPhiDuTinh]) VALUES (4, N'GV1', CAST(N'2017-11-21' AS Date), 0.0000)
INSERT [dbo].[PhieuTheoDoi] ([MaPhieuTheoDoi], [MaGiaoVien], [NgayTheoDoi], [ChiPhiDuTinh]) VALUES (5, N'GV1', CAST(N'2017-11-22' AS Date), 0.0000)
INSERT [dbo].[PhieuTheoDoi] ([MaPhieuTheoDoi], [MaGiaoVien], [NgayTheoDoi], [ChiPhiDuTinh]) VALUES (6, N'GV1', CAST(N'2017-11-22' AS Date), 0.0000)
INSERT [dbo].[PhieuTheoDoi] ([MaPhieuTheoDoi], [MaGiaoVien], [NgayTheoDoi], [ChiPhiDuTinh]) VALUES (7, N'GV1', CAST(N'2017-11-22' AS Date), 0.0000)
INSERT [dbo].[PhieuTheoDoi] ([MaPhieuTheoDoi], [MaGiaoVien], [NgayTheoDoi], [ChiPhiDuTinh]) VALUES (8, N'GV1', CAST(N'2017-11-22' AS Date), 0.0000)
INSERT [dbo].[PhieuTheoDoi] ([MaPhieuTheoDoi], [MaGiaoVien], [NgayTheoDoi], [ChiPhiDuTinh]) VALUES (9, N'Admin', CAST(N'2017-11-22' AS Date), 0.0000)
SET IDENTITY_INSERT [dbo].[PhieuTheoDoi] OFF
INSERT [dbo].[PhieuThu] ([Thang], [Nam], [MaHocSinh], [MaNhanVien], [SoNgayVang], [SoNgayAnSang], [SoNgayAnTrua], [GhiChu]) VALUES (11, 2017, 1, N'GV1', 3, 29, 29, NULL)
INSERT [dbo].[PhieuThu] ([Thang], [Nam], [MaHocSinh], [MaNhanVien], [SoNgayVang], [SoNgayAnSang], [SoNgayAnTrua], [GhiChu]) VALUES (11, 2017, 2, N'GV1', 4, 28, 28, NULL)
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'GiaoVien', N'Nghiệp vụ giáo viên', NULL)
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'GiaoVien-Index', N'Trang chủ giáo viên', N'GiaoVien')
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'GiaoVien-Partial_DanhSachHocSinh', N'Danh sách học sinh', N'GiaoVien')
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'GiaoVien-Partial_DiemDanhLop', N'Điểm danh', N'GiaoVien')
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'GiaoVien-Partial_ThongTinLop', N'Thông tin cơ bản lớp', N'GiaoVien')
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'HomeAdmin', N'Nghiệp vụ Admin', NULL)
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'HomeAdmin-Index', N'Trang chủ Admin', N'HomeAdmin')
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'HomeAdmin-PhanQuyenTheoChucVu', N'Phân quyền', N'HomeAdmin')
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'KeToan', N'Nghiệp vụ kế toán', NULL)
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'KeToan-Index', N'Trang chủ kế toán', N'KeToan')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'GVC', N'GiaoVien-Index')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'GVC', N'GiaoVien-Partial_DanhSachHocSinh')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'GVC', N'GiaoVien-Partial_DiemDanhLop')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'GVP', N'GiaoVien-Partial_DiemDanhLop')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'GVC', N'GiaoVien-Partial_ThongTinLop')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'GVC', N'HomeAdmin-Index')
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
/****** Object:  StoredProcedure [dbo].[getListHocSinhInfor]    Script Date: 2017/11/22 17:15:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getListHocSinhInfor]
AS
BEGIN
     select hs.MaHocSinh,hs.Ten as TenHocSinh,hs.NgaySinh,hs.GioiTinh,hs.DiaChi,hs.TinhTrang,hs.ChieuCao,hs.CanNang,hs.TenPhuHuynh,hs.NgaySinhPhuHuynh,hs.Sdt as SdtPhuHuynh,hs.Email as EmailPhuHuynh,hs.GhiChu,lp.MaLop,lp.TenLop,nv.TenNhanVien as TenGiaoVien,nv.Sdt as SdtGiaoVien,nv.Email as EmailGiaoVien,dv.TenDV,ct.NgayDK
from HocSinh hs inner join Lop lp
on hs.MaLop=lp.MaLop 
inner join NhanVien nv on lp.MaLop=nv.MaLop
inner join ChucVu cv on nv.MaChucVu=cv.MaChucVu
left join CT_DichVu_HocSinh ct on ct.MaHocSinh=hs.MaHocSinh
left join DichVuNgoai dv on dv.MaDichVu= ct.MaDV
and cv.MaChucVu='GVC'
and hs.TrangThai='1'
END
GO
USE [master]
GO
ALTER DATABASE [QLMamNon] SET  READ_WRITE 
GO
