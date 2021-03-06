USE [master]
GO
/****** Object:  Database [QLMamNon]    Script Date: 04/01/2018 12:37:38 SA ******/
CREATE DATABASE [QLMamNon]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLMamNon', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\QLMamNon.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QLMamNon_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\QLMamNon_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
/****** Object:  Table [dbo].[CT_DichVu_HocSinh]    Script Date: 04/01/2018 12:37:38 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CT_DichVu_HocSinh](
	[MaCT_DV_HS] [varchar](20) NOT NULL,
	[MaHocSinh] [varchar](20) NOT NULL,
	[MaDichVu] [varchar](20) NOT NULL,
	[ThangDangKy] [varchar](7) NOT NULL,
 CONSTRAINT [PK_CT_DichVu_HocSinh] PRIMARY KEY CLUSTERED 
(
	[MaCT_DV_HS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CT_NgayTheoDoi]    Script Date: 04/01/2018 12:37:38 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CT_NgayTheoDoi](
	[MaPhieuTheoDoi] [int] NOT NULL,
	[MaHocSinh] [varchar](20) NOT NULL,
	[DDVang] [bit] NOT NULL CONSTRAINT [DF_CT_NgayTheoDoi_DDVang]  DEFAULT ((0)),
	[DDAnSang] [bit] NOT NULL CONSTRAINT [DF_CT_NgayTheoDoi_DDAnSang]  DEFAULT ((0)),
	[DDAnTrua] [bit] NOT NULL CONSTRAINT [DF_CT_NgayTheoDoi_DDAnTrua]  DEFAULT ((0)),
	[GhiChu] [nvarchar](100) NULL,
	[ChiPhi] [money] NULL,
 CONSTRAINT [PK_CT_NgayTheoDoi] PRIMARY KEY CLUSTERED 
(
	[MaPhieuTheoDoi] ASC,
	[MaHocSinh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CT_PhieuThu_HocSinh]    Script Date: 04/01/2018 12:37:38 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CT_PhieuThu_HocSinh](
	[MaCT_PhieuThu_HocSinh] [varchar](20) NOT NULL,
	[TenLoaiPhi] [nvarchar](50) NULL,
	[SoLuong] [int] NULL,
	[ChiPhi] [money] NULL,
	[MaPhieuThu] [varchar](20) NULL,
 CONSTRAINT [PK_CT_PhieuThu_HocSinh] PRIMARY KEY CLUSTERED 
(
	[MaCT_PhieuThu_HocSinh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ChucVu]    Script Date: 04/01/2018 12:37:38 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChucVu](
	[MaChucVu] [varchar](20) NOT NULL,
	[TenChucVu] [nvarchar](50) NULL,
 CONSTRAINT [PK_ChucVu] PRIMARY KEY CLUSTERED 
(
	[MaChucVu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DichVuNgoai]    Script Date: 04/01/2018 12:37:38 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DichVuNgoai](
	[MaDichVu] [varchar](20) NOT NULL,
	[TenDV] [nvarchar](50) NOT NULL,
	[ChiPhi] [money] NULL CONSTRAINT [DF_DichVuNgoai_ChiPhi]  DEFAULT ((0)),
	[GhiChu] [nvarchar](100) NULL,
 CONSTRAINT [PK_DichVuNgoai] PRIMARY KEY CLUSTERED 
(
	[MaDichVu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HocPhi]    Script Date: 04/01/2018 12:37:38 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HocPhi](
	[MaHocPhi] [varchar](20) NOT NULL,
	[TenHocPhi] [nvarchar](50) NOT NULL,
	[ChiPhi] [money] NOT NULL CONSTRAINT [DF_HocPhi_ChiPhi]  DEFAULT ((0)),
	[GhiChu] [nvarchar](100) NULL,
	[LoaiHocphi] [varchar](20) NULL,
 CONSTRAINT [PK_HocPhi] PRIMARY KEY CLUSTERED 
(
	[MaHocPhi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HocSinh]    Script Date: 04/01/2018 12:37:38 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HocSinh](
	[MaHocSinh] [varchar](20) NOT NULL,
	[Ten] [nvarchar](50) NOT NULL,
	[NgaySinh] [date] NOT NULL,
	[GioiTinh] [nvarchar](5) NULL,
	[DiaChi] [nvarchar](200) NOT NULL,
	[TinhTrang] [nvarchar](50) NULL,
	[ChieuCao] [int] NULL,
	[CanNang] [int] NULL,
	[TenPhuHuynh] [nvarchar](50) NULL,
	[SoCmt] [nvarchar](50) NULL,
	[Sdt] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[NgaySinhPhuHuynh] [date] NULL,
	[GhiChu] [nvarchar](50) NULL,
	[MaLop] [varchar](20) NULL,
	[DoiTuongMTA] [bit] NULL CONSTRAINT [DF_HocSinh_DoiTuongMTA]  DEFAULT ((0)),
	[TrangThai] [bit] NULL CONSTRAINT [DF_HocSinh_TrangThai]  DEFAULT ((0)),
 CONSTRAINT [PK_HocSinh] PRIMARY KEY CLUSTERED 
(
	[MaHocSinh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoaiHocPhi]    Script Date: 04/01/2018 12:37:38 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoaiHocPhi](
	[MaLoai] [varchar](20) NOT NULL,
	[TenLoai] [nvarchar](50) NOT NULL,
	[GhiChu] [nvarchar](100) NULL,
 CONSTRAINT [PK_LoaiHocPhi] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Lop]    Script Date: 04/01/2018 12:37:38 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Lop](
	[MaLop] [varchar](20) NOT NULL,
	[TenLop] [nvarchar](50) NOT NULL,
	[GhiChu] [nvarchar](100) NULL,
	[SiSo] [int] NULL,
 CONSTRAINT [PK_Lop] PRIMARY KEY CLUSTERED 
(
	[MaLop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 04/01/2018 12:37:38 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNhanVien] [varchar](20) NOT NULL CONSTRAINT [DF_NhanVien_MaNhanVien]  DEFAULT ('DBO.AUTO_IDNhanVien'),
	[TenNhanVien] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](200) NULL,
	[Sdt] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[MaChucVu] [varchar](20) NULL,
	[MaLop] [varchar](20) NULL,
	[Password] [nvarchar](50) NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNhanVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PhieuChiTieu]    Script Date: 04/01/2018 12:37:38 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PhieuChiTieu](
	[MaPhieuChiTieu] [varchar](20) NOT NULL,
	[NgayTaoPhieu] [date] NULL,
	[MaNhanVien] [varchar](20) NOT NULL,
	[TenNguoiChi] [nvarchar](100) NOT NULL,
	[LyDo] [nvarchar](100) NULL,
	[ChiPhi] [money] NULL,
	[ChungTu] [nvarchar](50) NULL,
 CONSTRAINT [PK_PhieuChiTieu] PRIMARY KEY CLUSTERED 
(
	[MaPhieuChiTieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PhieuTheoDoi]    Script Date: 04/01/2018 12:37:38 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PhieuTheoDoi](
	[MaPhieuTheoDoi] [int] IDENTITY(1,1) NOT NULL,
	[MaGiaoVien] [varchar](20) NOT NULL,
	[NgayTheoDoi] [date] NOT NULL,
	[ChiPhiDuTinh] [money] NULL,
 CONSTRAINT [PK_PhieuTheoDoi_1] PRIMARY KEY CLUSTERED 
(
	[MaPhieuTheoDoi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PhieuThu]    Script Date: 04/01/2018 12:37:38 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PhieuThu](
	[MaPhieuThu] [varchar](20) NOT NULL,
	[NgayTaoPhieu] [varchar](7) NOT NULL,
	[MaHocSinh] [varchar](20) NOT NULL,
	[MaNhanVien] [varchar](20) NOT NULL,
	[GhiChu] [varchar](100) NULL,
 CONSTRAINT [PK_PhieuThu] PRIMARY KEY CLUSTERED 
(
	[MaPhieuThu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Quyen]    Script Date: 04/01/2018 12:37:38 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Quyen](
	[MaQuyen] [varchar](50) NOT NULL,
	[MoTa] [nvarchar](50) NULL,
	[ParentId] [nvarchar](50) NULL,
 CONSTRAINT [PK_Quyen] PRIMARY KEY CLUSTERED 
(
	[MaQuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Quyen_ChucVu]    Script Date: 04/01/2018 12:37:38 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Quyen_ChucVu](
	[MaChucVu] [varchar](20) NOT NULL,
	[MaQuyen] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Quyen_ChucVu] PRIMARY KEY CLUSTERED 
(
	[MaQuyen] ASC,
	[MaChucVu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[CT_DichVu_HocSinh] ([MaCT_DV_HS], [MaHocSinh], [MaDichVu], [ThangDangKy]) VALUES (N'CT_DV_HS-13EAF9', N'5', N'DV-506', N'12/2017')
INSERT [dbo].[CT_DichVu_HocSinh] ([MaCT_DV_HS], [MaHocSinh], [MaDichVu], [ThangDangKy]) VALUES (N'CT_DV_HS-1D9CAA', N'1', N'DV-506', N'12/2017')
INSERT [dbo].[CT_DichVu_HocSinh] ([MaCT_DV_HS], [MaHocSinh], [MaDichVu], [ThangDangKy]) VALUES (N'CT_DV_HS-22EF2C', N'2', N'DV-507', N'12/2017')
INSERT [dbo].[CT_DichVu_HocSinh] ([MaCT_DV_HS], [MaHocSinh], [MaDichVu], [ThangDangKy]) VALUES (N'CT_DV_HS-2347CE', N'1', N'DV-516', N'12/2017')
INSERT [dbo].[CT_DichVu_HocSinh] ([MaCT_DV_HS], [MaHocSinh], [MaDichVu], [ThangDangKy]) VALUES (N'CT_DV_HS-3C3B36', N'5', N'DV-516', N'12/2017')
INSERT [dbo].[CT_DichVu_HocSinh] ([MaCT_DV_HS], [MaHocSinh], [MaDichVu], [ThangDangKy]) VALUES (N'CT_DV_HS-4AF4A8', N'1', N'DV-506', N'01/2018')
INSERT [dbo].[CT_DichVu_HocSinh] ([MaCT_DV_HS], [MaHocSinh], [MaDichVu], [ThangDangKy]) VALUES (N'CT_DV_HS-581B98', N'2', N'DV-507', N'01/2018')
INSERT [dbo].[CT_DichVu_HocSinh] ([MaCT_DV_HS], [MaHocSinh], [MaDichVu], [ThangDangKy]) VALUES (N'CT_DV_HS-6B1141', N'2', N'DV-516', N'12/2017')
INSERT [dbo].[CT_DichVu_HocSinh] ([MaCT_DV_HS], [MaHocSinh], [MaDichVu], [ThangDangKy]) VALUES (N'CT_DV_HS-9563A2', N'1', N'DV-938', N'01/2018')
INSERT [dbo].[CT_DichVu_HocSinh] ([MaCT_DV_HS], [MaHocSinh], [MaDichVu], [ThangDangKy]) VALUES (N'CT_DV_HS-A1595F', N'2', N'DV-506', N'01/2018')
INSERT [dbo].[CT_DichVu_HocSinh] ([MaCT_DV_HS], [MaHocSinh], [MaDichVu], [ThangDangKy]) VALUES (N'CT_DV_HS-ACE313', N'111', N'DV-506', N'01/2018')
INSERT [dbo].[CT_DichVu_HocSinh] ([MaCT_DV_HS], [MaHocSinh], [MaDichVu], [ThangDangKy]) VALUES (N'CT_DV_HS-B7C532', N'111', N'DV-938', N'01/2018')
INSERT [dbo].[CT_DichVu_HocSinh] ([MaCT_DV_HS], [MaHocSinh], [MaDichVu], [ThangDangKy]) VALUES (N'CT_DV_HS-E1B09B', N'5', N'DV-507', N'12/2017')
INSERT [dbo].[CT_DichVu_HocSinh] ([MaCT_DV_HS], [MaHocSinh], [MaDichVu], [ThangDangKy]) VALUES (N'CT_DV_HS-E29A88', N'3', N'DV-507', N'12/2017')
INSERT [dbo].[CT_DichVu_HocSinh] ([MaCT_DV_HS], [MaHocSinh], [MaDichVu], [ThangDangKy]) VALUES (N'CT_DV_HS-E922E4', N'1', N'DV-507', N'12/2017')
INSERT [dbo].[CT_DichVu_HocSinh] ([MaCT_DV_HS], [MaHocSinh], [MaDichVu], [ThangDangKy]) VALUES (N'CT_DV_HS-F81C06', N'2', N'DV-506', N'12/2017')
INSERT [dbo].[CT_DichVu_HocSinh] ([MaCT_DV_HS], [MaHocSinh], [MaDichVu], [ThangDangKy]) VALUES (N'CT_DV_HS-FDB108', N'3', N'DV-506', N'12/2017')
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (66, N'1', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (66, N'2', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (66, N'3', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (66, N'4', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (66, N'5', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (66, N'ALFKI', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (66, N'ANATR', 0, 1, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (66, N'ANTON', 1, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (66, N'AROUT', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (66, N'BERGS', 0, 1, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (66, N'BLAUS', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (66, N'BLONP', 0, 1, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (66, N'HS-8CC', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (66, N'HS-ADF', 1, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (66, N'VINET', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (66, N'WANDK', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (66, N'WARTH', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (66, N'WELLI', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (66, N'WHITC', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (66, N'WILMK', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (66, N'WOLZA', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (67, N'1', 1, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (67, N'2', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (67, N'3', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (67, N'4', 0, 1, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (67, N'5', 1, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (67, N'ALFKI', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (67, N'ANATR', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (67, N'ANTON', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (67, N'AROUT', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (67, N'BERGS', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (67, N'BLAUS', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (67, N'BLONP', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (67, N'HS-8CC', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (67, N'HS-ADF', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (67, N'VINET', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (67, N'WANDK', 0, 1, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (67, N'WARTH', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (67, N'WELLI', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (67, N'WHITC', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (67, N'WILMK', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (67, N'WOLZA', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (68, N'1', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (68, N'2', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (68, N'3', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (68, N'4', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (68, N'5', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (68, N'ALFKI', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (68, N'ANATR', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (68, N'ANTON', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (68, N'AROUT', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (68, N'BERGS', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (68, N'BLAUS', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (68, N'BLONP', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (68, N'HS-8CC', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (68, N'HS-ADF', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (68, N'VINET', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (68, N'WANDK', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (68, N'WARTH', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (68, N'WELLI', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (68, N'WHITC', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (68, N'WILMK', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (68, N'WOLZA', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (69, N'1', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (69, N'2', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (69, N'3', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (69, N'4', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (69, N'5', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (69, N'ALFKI', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (69, N'ANATR', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (69, N'ANTON', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (69, N'AROUT', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (69, N'BERGS', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (69, N'BLAUS', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (69, N'BLONP', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (69, N'HS-8CC', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (69, N'HS-ADF', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (69, N'VINET', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (69, N'WANDK', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (69, N'WARTH', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (69, N'WELLI', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (69, N'WHITC', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (69, N'WILMK', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (69, N'WOLZA', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (70, N'1', 1, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (70, N'2', 1, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (70, N'3', 1, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (70, N'4', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (70, N'5', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (70, N'ALFKI', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (70, N'ANATR', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (70, N'ANTON', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (70, N'AROUT', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (70, N'BERGS', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (70, N'BLAUS', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (70, N'BLONP', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (70, N'HS-8CC', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (70, N'HS-ADF', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (70, N'VINET', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (70, N'WANDK', 0, 1, 1, NULL, NULL)
GO
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (70, N'WARTH', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (70, N'WELLI', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (70, N'WHITC', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (70, N'WILMK', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (70, N'WOLZA', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (71, N'1', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (71, N'2', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (71, N'3', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (71, N'4', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (71, N'5', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (71, N'ALFKI', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (71, N'ANATR', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (71, N'ANTON', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (71, N'AROUT', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (71, N'BERGS', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (71, N'BLAUS', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (71, N'BLONP', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (71, N'HS-8CC', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (71, N'HS-ADF', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (71, N'VINET', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (71, N'WANDK', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (71, N'WARTH', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (71, N'WELLI', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (71, N'WHITC', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (71, N'WILMK', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (71, N'WOLZA', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (72, N'1', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (72, N'2', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (72, N'3', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (72, N'4', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (72, N'5', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (72, N'ALFKI', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (72, N'ANATR', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (72, N'ANTON', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (72, N'AROUT', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (72, N'BERGS', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (72, N'BLAUS', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (72, N'BLONP', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (72, N'HS-8CC', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (72, N'HS-ADF', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (72, N'VINET', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (72, N'WANDK', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (72, N'WARTH', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (72, N'WELLI', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (72, N'WHITC', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (72, N'WILMK', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (72, N'WOLZA', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (73, N'1', 1, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (73, N'2', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (73, N'3', 1, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (73, N'4', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (73, N'5', 1, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (73, N'ALFKI', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (73, N'ANATR', 1, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (73, N'ANTON', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (73, N'AROUT', 1, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (73, N'BERGS', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (73, N'BLAUS', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (73, N'BLONP', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (73, N'HS-8CC', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (73, N'HS-ADF', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (73, N'VINET', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (73, N'WANDK', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (73, N'WARTH', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (73, N'WELLI', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (73, N'WHITC', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (73, N'WILMK', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (73, N'WOLZA', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (74, N'1', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (74, N'2', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (74, N'3', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (74, N'4', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (74, N'5', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (74, N'ALFKI', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (74, N'ANATR', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (74, N'ANTON', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (74, N'AROUT', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (74, N'BERGS', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (74, N'BLAUS', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (74, N'BLONP', 0, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (74, N'HS-8CC', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (74, N'HS-ADF', 0, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (74, N'VINET', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (74, N'WANDK', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (74, N'WARTH', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (74, N'WELLI', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (74, N'WHITC', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (74, N'WILMK', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (74, N'WOLZA', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (75, N'1', 1, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (75, N'2', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (75, N'3', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (75, N'4', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (75, N'5', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (75, N'ALFKI', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (75, N'ANATR', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (75, N'ANTON', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (75, N'AROUT', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (75, N'BERGS', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (75, N'BLAUS', 0, 0, 1, NULL, NULL)
GO
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (75, N'BLONP', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (75, N'HS-8CC', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (75, N'HS-ADF', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (75, N'VINET', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (75, N'WANDK', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (75, N'WARTH', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (75, N'WELLI', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (75, N'WHITC', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (75, N'WILMK', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (75, N'WOLZA', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (76, N'1', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (76, N'2', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (76, N'3', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (76, N'4', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (76, N'5', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (76, N'ALFKI', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (76, N'ANATR', 0, 1, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (76, N'ANTON', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (76, N'AROUT', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (76, N'BERGS', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (76, N'BLAUS', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (76, N'BLONP', 0, 1, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (76, N'HS-8CC', 0, 1, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (76, N'HS-ADF', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (76, N'VINET', 0, 1, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (76, N'WANDK', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (76, N'WARTH', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (76, N'WELLI', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (76, N'WHITC', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (76, N'WILMK', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (76, N'WOLZA', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (77, N'1', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (77, N'2', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (77, N'3', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (77, N'4', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (77, N'5', 0, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (77, N'ALFKI', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (77, N'ANATR', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (77, N'ANTON', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (77, N'AROUT', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (77, N'BERGS', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (77, N'BLAUS', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (77, N'BLONP', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (77, N'HS-8CC', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (77, N'HS-ADF', 0, 1, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (77, N'VINET', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (77, N'WANDK', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (77, N'WARTH', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (77, N'WELLI', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (77, N'WHITC', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (77, N'WILMK', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (77, N'WOLZA', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (78, N'1', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (78, N'2', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (78, N'3', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (78, N'4', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (78, N'5', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (78, N'ALFKI', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (78, N'ANATR', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (78, N'ANTON', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (78, N'AROUT', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (78, N'BERGS', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (78, N'BLAUS', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (78, N'BLONP', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (78, N'HS-8CC', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (78, N'HS-ADF', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (78, N'VINET', 1, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (78, N'WANDK', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (78, N'WARTH', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (78, N'WELLI', 1, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (78, N'WHITC', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (78, N'WILMK', 1, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (78, N'WOLZA', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (79, N'1', 1, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (79, N'2', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (79, N'3', 1, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (79, N'4', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (79, N'5', 1, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (79, N'ALFKI', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (79, N'ANATR', 1, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (79, N'ANTON', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (79, N'AROUT', 1, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (79, N'BERGS', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (79, N'BLAUS', 1, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (79, N'BLONP', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (79, N'HS-8CC', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (79, N'HS-ADF', 1, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (79, N'VINET', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (79, N'WANDK', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (79, N'WARTH', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (79, N'WELLI', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (79, N'WHITC', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (79, N'WILMK', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (79, N'WOLZA', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (80, N'1', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (80, N'2', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (80, N'3', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (80, N'4', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (80, N'5', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (80, N'ALFKI', 0, 1, 1, NULL, NULL)
GO
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (80, N'ANATR', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (80, N'ANTON', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (80, N'AROUT', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (80, N'BERGS', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (80, N'BLAUS', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (80, N'BLONP', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (80, N'HS-8CC', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (80, N'HS-ADF', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (80, N'VINET', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (80, N'WANDK', 0, 1, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (80, N'WARTH', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (80, N'WELLI', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (80, N'WHITC', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (80, N'WILMK', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (80, N'WOLZA', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (81, N'1', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (81, N'2', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (81, N'3', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (81, N'4', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (81, N'5', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (81, N'ALFKI', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (81, N'ANATR', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (81, N'ANTON', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (81, N'AROUT', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (81, N'BERGS', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (81, N'BLAUS', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (81, N'BLONP', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (81, N'HS-8CC', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (81, N'HS-ADF', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (81, N'VINET', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (81, N'WANDK', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (81, N'WARTH', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (81, N'WELLI', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (81, N'WHITC', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (81, N'WILMK', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (81, N'WOLZA', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (82, N'1', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (82, N'2', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (82, N'3', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (82, N'4', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (82, N'5', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (82, N'ALFKI', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (82, N'ANATR', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (82, N'ANTON', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (82, N'AROUT', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (82, N'BERGS', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (82, N'BLAUS', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (82, N'BLONP', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (82, N'HS-8CC', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (82, N'HS-ADF', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (82, N'VINET', 0, 1, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (82, N'WANDK', 0, 1, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (82, N'WARTH', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (82, N'WELLI', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (82, N'WHITC', 0, 1, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (82, N'WILMK', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (82, N'WOLZA', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (83, N'1', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (83, N'2', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (83, N'3', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (83, N'4', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (83, N'5', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (83, N'ALFKI', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (83, N'ANATR', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (83, N'ANTON', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (83, N'AROUT', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (83, N'BERGS', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (83, N'BLAUS', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (83, N'BLONP', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (83, N'HS-8CC', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (83, N'HS-ADF', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (83, N'VINET', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (83, N'WANDK', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (83, N'WARTH', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (83, N'WELLI', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (83, N'WHITC', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (83, N'WILMK', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (83, N'WOLZA', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (84, N'1', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (84, N'2', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (84, N'3', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (84, N'4', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (84, N'5', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (84, N'ALFKI', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (84, N'ANATR', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (84, N'ANTON', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (84, N'AROUT', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (84, N'BERGS', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (84, N'BLAUS', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (84, N'BLONP', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (84, N'HS-8CC', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (84, N'HS-ADF', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (84, N'VINET', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (84, N'WANDK', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (84, N'WARTH', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (84, N'WELLI', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (84, N'WHITC', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (84, N'WILMK', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (84, N'WOLZA', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (85, N'1', 1, 0, 0, NULL, NULL)
GO
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (85, N'2', 1, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (85, N'3', 1, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (85, N'4', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (85, N'5', 1, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (85, N'ALFKI', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (85, N'ANATR', 1, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (85, N'ANTON', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (85, N'AROUT', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (85, N'BERGS', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (85, N'BLAUS', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (85, N'BLONP', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (85, N'HS-8CC', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (85, N'HS-ADF', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (85, N'VINET', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (85, N'WANDK', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (85, N'WARTH', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (85, N'WELLI', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (85, N'WHITC', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (85, N'WILMK', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (85, N'WOLZA', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (86, N'1', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (86, N'2', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (86, N'3', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (86, N'4', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (86, N'5', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (86, N'ALFKI', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (86, N'ANATR', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (86, N'ANTON', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (86, N'AROUT', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (86, N'BERGS', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (86, N'BLAUS', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (86, N'BLONP', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (86, N'HS-8CC', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (86, N'HS-ADF', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (86, N'VINET', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (86, N'WANDK', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (86, N'WARTH', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (86, N'WELLI', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (86, N'WHITC', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (86, N'WILMK', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (86, N'WOLZA', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (87, N'1', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (87, N'2', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (87, N'3', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (87, N'4', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (87, N'5', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (87, N'ALFKI', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (87, N'ANATR', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (87, N'ANTON', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (87, N'AROUT', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (87, N'BERGS', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (87, N'BLAUS', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (87, N'BLONP', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (87, N'HS-8CC', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (87, N'HS-ADF', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (87, N'VINET', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (87, N'WANDK', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (87, N'WARTH', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (87, N'WELLI', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (87, N'WHITC', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (87, N'WILMK', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (87, N'WOLZA', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (88, N'1', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (88, N'2', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (88, N'3', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (88, N'4', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (88, N'5', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (88, N'ALFKI', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (88, N'ANATR', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (88, N'ANTON', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (88, N'AROUT', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (88, N'BERGS', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (88, N'BLAUS', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (88, N'BLONP', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (88, N'HS-8CC', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (88, N'HS-ADF', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (88, N'VINET', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (88, N'WANDK', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (88, N'WARTH', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (88, N'WELLI', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (88, N'WHITC', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (88, N'WILMK', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (88, N'WOLZA', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (89, N'1', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (89, N'2', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (89, N'3', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (89, N'4', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (89, N'5', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (89, N'ALFKI', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (89, N'ANATR', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (89, N'ANTON', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (89, N'AROUT', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (89, N'BERGS', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (89, N'BLAUS', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (89, N'BLONP', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (89, N'HS-8CC', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (89, N'HS-ADF', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (89, N'VINET', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (89, N'WANDK', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (89, N'WARTH', 0, 1, 1, NULL, NULL)
GO
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (89, N'WELLI', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (89, N'WHITC', 1, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (89, N'WILMK', 1, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (89, N'WOLZA', 1, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (90, N'1', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (90, N'2', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (90, N'3', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (90, N'4', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (90, N'5', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (90, N'ALFKI', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (90, N'ANATR', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (90, N'ANTON', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (90, N'AROUT', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (90, N'BERGS', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (90, N'BLAUS', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (90, N'BLONP', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (90, N'HS-8CC', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (90, N'HS-ADF', 1, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (90, N'VINET', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (90, N'WANDK', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (90, N'WARTH', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (90, N'WELLI', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (90, N'WHITC', 1, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (90, N'WILMK', 1, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (90, N'WOLZA', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (91, N'1', 0, 1, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (91, N'2', 0, 1, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (91, N'3', 0, 1, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (91, N'4', 0, 1, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (91, N'5', 1, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (91, N'ALFKI', 1, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (91, N'ANATR', 0, 1, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (91, N'ANTON', 1, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (91, N'AROUT', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (91, N'BERGS', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (91, N'BLAUS', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (91, N'BLONP', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (91, N'HS-8CC', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (91, N'HS-ADF', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (91, N'VINET', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (91, N'WANDK', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (91, N'WARTH', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (91, N'WELLI', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (91, N'WHITC', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (91, N'WILMK', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (91, N'WOLZA', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (92, N'1', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (92, N'2', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (92, N'3', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (92, N'4', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (92, N'5', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (92, N'ALFKI', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (92, N'ANATR', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (92, N'ANTON', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (92, N'AROUT', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (92, N'BERGS', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (92, N'BLAUS', 1, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (92, N'BLONP', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (92, N'HS-8CC', 1, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (92, N'HS-ADF', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (92, N'VINET', 1, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (92, N'WANDK', 1, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (92, N'WARTH', 1, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (92, N'WELLI', 1, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (92, N'WHITC', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (92, N'WILMK', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (92, N'WOLZA', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (93, N'1', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (93, N'2', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (93, N'3', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (93, N'4', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (93, N'5', 1, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (93, N'ALFKI', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (93, N'ANATR', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (93, N'ANTON', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (93, N'AROUT', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (93, N'BERGS', 1, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (93, N'BLAUS', 1, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (93, N'BLONP', 1, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (93, N'HS-8CC', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (93, N'HS-ADF', 1, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (93, N'VINET', 1, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (93, N'WANDK', 1, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (93, N'WARTH', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (93, N'WELLI', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (93, N'WHITC', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (93, N'WILMK', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (93, N'WOLZA', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (94, N'1', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (94, N'2', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (94, N'3', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (94, N'4', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (94, N'5', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (94, N'ALFKI', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (94, N'ANATR', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (94, N'ANTON', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (94, N'AROUT', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (94, N'BERGS', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (94, N'BLAUS', 1, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (94, N'BLONP', 1, 0, 0, NULL, NULL)
GO
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (94, N'HS-8CC', 1, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (94, N'HS-ADF', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (94, N'VINET', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (94, N'WANDK', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (94, N'WARTH', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (94, N'WELLI', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (94, N'WHITC', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (94, N'WILMK', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (94, N'WOLZA', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (95, N'1', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (95, N'2', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (95, N'3', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (95, N'4', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (95, N'5', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (95, N'ALFKI', 1, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (95, N'ANATR', 1, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (95, N'ANTON', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (95, N'AROUT', 1, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (95, N'BERGS', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (95, N'BLAUS', 1, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (95, N'BLONP', 1, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (95, N'HS-8CC', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (95, N'HS-ADF', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (95, N'VINET', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (95, N'WANDK', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (95, N'WARTH', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (95, N'WELLI', 1, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (95, N'WHITC', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (95, N'WILMK', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (95, N'WOLZA', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (96, N'1', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (96, N'2', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (96, N'3', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (96, N'4', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (96, N'5', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (96, N'ALFKI', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (96, N'ANATR', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (96, N'ANTON', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (96, N'AROUT', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (96, N'BERGS', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (96, N'BLAUS', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (96, N'BLONP', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (96, N'HS-8CC', 1, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (96, N'HS-ADF', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (96, N'VINET', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (96, N'WANDK', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (96, N'WARTH', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (96, N'WELLI', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (96, N'WHITC', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (96, N'WILMK', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (96, N'WOLZA', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_PhieuThu_HocSinh] ([MaCT_PhieuThu_HocSinh], [TenLoaiPhi], [SoLuong], [ChiPhi], [MaPhieuThu]) VALUES (N'Ct_pt_hs-0E9C', N'Học phí', 1, 300.0000, N'PhieuThu-ECA')
INSERT [dbo].[CT_PhieuThu_HocSinh] ([MaCT_PhieuThu_HocSinh], [TenLoaiPhi], [SoLuong], [ChiPhi], [MaPhieuThu]) VALUES (N'Ct_pt_hs-2127', N'Bán trú', 1, 50.0000, N'PhieuThu-ECA')
INSERT [dbo].[CT_PhieuThu_HocSinh] ([MaCT_PhieuThu_HocSinh], [TenLoaiPhi], [SoLuong], [ChiPhi], [MaPhieuThu]) VALUES (N'Ct_pt_hs-4DF7', N'Học phí', 1, 300.0000, NULL)
INSERT [dbo].[CT_PhieuThu_HocSinh] ([MaCT_PhieuThu_HocSinh], [TenLoaiPhi], [SoLuong], [ChiPhi], [MaPhieuThu]) VALUES (N'Ct_pt_hs-4EF2', N'Bán trú', 1, 50.0000, NULL)
INSERT [dbo].[CT_PhieuThu_HocSinh] ([MaCT_PhieuThu_HocSinh], [TenLoaiPhi], [SoLuong], [ChiPhi], [MaPhieuThu]) VALUES (N'Ct_pt_hs-6693', N'Môn tạo hình', 1, 100.0000, N'PhieuThu-ECA')
INSERT [dbo].[CT_PhieuThu_HocSinh] ([MaCT_PhieuThu_HocSinh], [TenLoaiPhi], [SoLuong], [ChiPhi], [MaPhieuThu]) VALUES (N'Ct_pt_hs-8A8F', N'Aerobic', 1, 100.0000, NULL)
INSERT [dbo].[CT_PhieuThu_HocSinh] ([MaCT_PhieuThu_HocSinh], [TenLoaiPhi], [SoLuong], [ChiPhi], [MaPhieuThu]) VALUES (N'Ct_pt_hs-97DD', N'Ăn trưa', 10, 15.0000, NULL)
INSERT [dbo].[CT_PhieuThu_HocSinh] ([MaCT_PhieuThu_HocSinh], [TenLoaiPhi], [SoLuong], [ChiPhi], [MaPhieuThu]) VALUES (N'Ct_pt_hs-ACBE', N'DD_Vắng', 2, 50.0000, N'PhieuThu-ECA')
INSERT [dbo].[CT_PhieuThu_HocSinh] ([MaCT_PhieuThu_HocSinh], [TenLoaiPhi], [SoLuong], [ChiPhi], [MaPhieuThu]) VALUES (N'Ct_pt_hs-B152', N'Ăn sáng', 10, 15.0000, NULL)
INSERT [dbo].[CT_PhieuThu_HocSinh] ([MaCT_PhieuThu_HocSinh], [TenLoaiPhi], [SoLuong], [ChiPhi], [MaPhieuThu]) VALUES (N'Ct_pt_hs-B379', N'DD_Ăn trưa', 28, 15.0000, N'PhieuThu-ECA')
INSERT [dbo].[CT_PhieuThu_HocSinh] ([MaCT_PhieuThu_HocSinh], [TenLoaiPhi], [SoLuong], [ChiPhi], [MaPhieuThu]) VALUES (N'Ct_pt_hs-BF2E', N'DD_Ăn sáng', 28, 15.0000, N'PhieuThu-ECA')
INSERT [dbo].[CT_PhieuThu_HocSinh] ([MaCT_PhieuThu_HocSinh], [TenLoaiPhi], [SoLuong], [ChiPhi], [MaPhieuThu]) VALUES (N'Ct_pt_hs-C340', N'Aerobic', 1, 100.0000, N'PhieuThu-ECA')
INSERT [dbo].[CT_PhieuThu_HocSinh] ([MaCT_PhieuThu_HocSinh], [TenLoaiPhi], [SoLuong], [ChiPhi], [MaPhieuThu]) VALUES (N'Ct_pt_hs-D762', N'Vắng', 4, 15.0000, NULL)
INSERT [dbo].[CT_PhieuThu_HocSinh] ([MaCT_PhieuThu_HocSinh], [TenLoaiPhi], [SoLuong], [ChiPhi], [MaPhieuThu]) VALUES (N'Ct_pt_hs-E2CF', N'Môn Vẽ', 1, 100.0000, N'PhieuThu-ECA')
INSERT [dbo].[CT_PhieuThu_HocSinh] ([MaCT_PhieuThu_HocSinh], [TenLoaiPhi], [SoLuong], [ChiPhi], [MaPhieuThu]) VALUES (N'Ct_pt_hs-F149', N'Môn Vẽ', 1, 100.0000, NULL)
INSERT [dbo].[ChucVu] ([MaChucVu], [TenChucVu]) VALUES (N'ADMIN', N'SupperAdmin')
INSERT [dbo].[ChucVu] ([MaChucVu], [TenChucVu]) VALUES (N'GVC', N'Giáo viên chính')
INSERT [dbo].[ChucVu] ([MaChucVu], [TenChucVu]) VALUES (N'GVP', N'Giáo viên phụ')
INSERT [dbo].[ChucVu] ([MaChucVu], [TenChucVu]) VALUES (N'KETOAN', N'kế toán')
INSERT [dbo].[ChucVu] ([MaChucVu], [TenChucVu]) VALUES (N'TONUOI', N'Tổ nuôi')
INSERT [dbo].[DichVuNgoai] ([MaDichVu], [TenDV], [ChiPhi], [GhiChu]) VALUES (N'DV-506', N'Môn Vẽ', 100.0000, N'Môn vẽ nghệ thuật, tăng khả năng sáng tạo..')
INSERT [dbo].[DichVuNgoai] ([MaDichVu], [TenDV], [ChiPhi], [GhiChu]) VALUES (N'DV-507', N'Aerobic', 100.0000, N'môn nghệ thuật aerobic')
INSERT [dbo].[DichVuNgoai] ([MaDichVu], [TenDV], [ChiPhi], [GhiChu]) VALUES (N'DV-516', N'Môn tạo hình', 100.0000, N'Môn tạo hình tăng khả năng sáng tạo và tư duy')
INSERT [dbo].[DichVuNgoai] ([MaDichVu], [TenDV], [ChiPhi], [GhiChu]) VALUES (N'DV-938', N'Học thêm thứ 7', 100.0000, N'Học bồi dưỡng thêm vào cuối tuần')
INSERT [dbo].[DichVuNgoai] ([MaDichVu], [TenDV], [ChiPhi], [GhiChu]) VALUES (N'DV-BCD', N'Môn tiếng Anh', 100.0000, N'bổ sung kiến thức môn tiếng anh')
INSERT [dbo].[HocPhi] ([MaHocPhi], [TenHocPhi], [ChiPhi], [GhiChu], [LoaiHocphi]) VALUES (N'DV-506', N'Môn Vẽ', 100.0000, N'Môn vẽ nghệ thuật, tăng khả năng sáng tạo..', N'LoaiHocPhi-472E')
INSERT [dbo].[HocPhi] ([MaHocPhi], [TenHocPhi], [ChiPhi], [GhiChu], [LoaiHocphi]) VALUES (N'DV-516', N'Môn tạo hình', 100.0000, N'Môn tạo hình tăng khả năng sáng tạo và tư duy', N'LoaiHocPhi-472E')
INSERT [dbo].[HocPhi] ([MaHocPhi], [TenHocPhi], [ChiPhi], [GhiChu], [LoaiHocphi]) VALUES (N'DV-938', N'Học thêm thứ 7', 100.0000, N'Học bồi dưỡng thêm vào cuối tuần', N'LoaiHocPhi-472E')
INSERT [dbo].[HocPhi] ([MaHocPhi], [TenHocPhi], [ChiPhi], [GhiChu], [LoaiHocphi]) VALUES (N'DV-BCD', N'Môn tiếng Anh', 100.0000, N'bổ sung kiến thức môn tiếng anh', N'LoaiHocPhi-472E')
INSERT [dbo].[HocPhi] ([MaHocPhi], [TenHocPhi], [ChiPhi], [GhiChu], [LoaiHocphi]) VALUES (N'HocPhi-373', N'Bán trú', 50.0000, N'Tiền bán trú', N'LoaiHocPhi-2FAA')
INSERT [dbo].[HocPhi] ([MaHocPhi], [TenHocPhi], [ChiPhi], [GhiChu], [LoaiHocphi]) VALUES (N'HocPhi-545', N'Tiền xây dựng', 200.0000, N'Phí xây dựng nhà trường đầu năm học', N'LoaiHocPhi-20D1')
INSERT [dbo].[HocPhi] ([MaHocPhi], [TenHocPhi], [ChiPhi], [GhiChu], [LoaiHocphi]) VALUES (N'HocPhi-B48', N'Cơ sở vật chất', 200.0000, N'xây dựng cơ sở vật chất đầu năm', N'LoaiHocPhi-20D1')
INSERT [dbo].[HocPhi] ([MaHocPhi], [TenHocPhi], [ChiPhi], [GhiChu], [LoaiHocphi]) VALUES (N'HocPhi-ED3', N'Học phí', 300.0000, N'Học phí theo từng tháng', N'LoaiHocPhi-2FAA')
INSERT [dbo].[HocPhi] ([MaHocPhi], [TenHocPhi], [ChiPhi], [GhiChu], [LoaiHocphi]) VALUES (N'Lop-06', N'âsas', 0.0000, N'âsas', NULL)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'1', N'Nguyễn A', CAST(N'1994-01-12' AS Date), N'Nam', N'43 trần nhật duật, phường nam ngạn , thành phố thanh hóa', N'học tập tốt, ngoan ngoan, nghe lời thầy cô', 75, 30, N'Nguyễn Cha A', N'173363724', N'01676983088', N'hungth11b@gmail', CAST(N'1966-11-02' AS Date), N'bé gầy và ăn ít, hay ho và ốm', N'BE', 0, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'111', N'John Hammond', CAST(N'1966-11-02' AS Date), N'Nam', N'43 trần nhật duật', N'tốt', 143, 45, N'hùng', N'123123123', N'167698388', N'hungth11b@gmail.com', CAST(N'1966-11-02' AS Date), N'bé gầy và ăn ít, hay ho và ốm', N'MGLA', 1, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'2', N'Nguyễn A1', CAST(N'2000-12-31' AS Date), N'Nam', N'43 trần nhật duật, phường nam ngạn , thành phố thanh hóa	', N'nghịch ngợm, lười ăn...', 160, 44, N'Nguyễn cha A1', N'173363724', N'1111111111', N'hung@gd.com', CAST(N'1966-12-31' AS Date), N'bé gầy và ăn ít, hay ho và ốm', N'BE', 0, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'3', N'Nguyễn A3', CAST(N'1994-12-31' AS Date), N'Nam', N'Hai bà trưng , hà nội', N'học tập tốt, ngoan ngoan, nghe lời thầy cô', 130, 34, N'Nguyễn Cha A2', N'177372321', N'01676983088', N'hung@gds.com', CAST(N'1996-12-31' AS Date), N'thích ăn rau củ', N'BE', 0, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'4', N'Nguyễn A4', CAST(N'1994-12-31' AS Date), N'Nam', N'Nguyễn ích khiêm', N'học tốt, ngon...', 130, 37, N'Nguyễn văn Dũng', N'87686', N'1231231231', N'hung@gd.com', CAST(N'1945-12-31' AS Date), N'thiếu cân, gầy', N'BE', 0, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'5', N'hung5', CAST(N'1999-12-31' AS Date), N'Nam', N'43 trần nhật duật, phường nam ngạn , thành phố thanh hóa', N'học tốt', 133, 40, N'Nguyễn văn Cha a', N'1212312312', N'1231231231', N'hung@gd.com', CAST(N'1956-12-31' AS Date), N'bé gầy và ăn ít, hay ho và ốm', N'BE', 0, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'6', N'hùng 6', CAST(N'1999-12-31' AS Date), N'Nam', N'43 trần nhật duật, phường nam ngạn , thành phố thanh hóa', N'tốt', 134, 43, N'nguyễn văn thiên a', N'87686', N'01676983088', N'hung@gd.com', CAST(N'1954-12-31' AS Date), N'không có j', N'MGLA', 0, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'7', N'hung7', CAST(N'2017-12-31' AS Date), N'Nam', N'43 trần nhật duật, phường nam ngạn , thành phố thanh hóa', N'Học giỏi', 134, 43, N'nguyễn văn thiên aa', N'87686', N'01676983088', N'hung@gd.com', CAST(N'2017-12-31' AS Date), N'lười ăn', N'MGLA', 0, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'ALFKI', N'Trần Thị Kim', CAST(N'2000-04-04' AS Date), N'Nam', N'Obere Str. 57', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Lê Đức ', N'173363724', N'0936-000-367', N'Kirkland@gmail.com', CAST(N'1990-04-04' AS Date), N'BE', N'BE', 1, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'ANATR', N'Nguyễn Ngọc ', CAST(N'2000-04-04' AS Date), N'Nam', N'Avda. de la Constitución 2222', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Hoàng Công', N'173363724', N'0903-877-987', N'Århus@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'BE', 1, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'ANTON', N'Nguyễn Hữu', CAST(N'2000-04-04' AS Date), N'Nam', N'Mataderos  2312', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Lê Viết Thanh ', N'173363724', N'0909-864-113', N'Lyon@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'BE', 1, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'AROUT', N'Ngyễn Thị Kim ', CAST(N'2000-04-04' AS Date), N'Nam', N'120 Hanover Sq.', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Lê Bá ', N'173363724', N'0979-783-678', N'Reims@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'BE', 1, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'BERGS', N'Vũ Hùng ', CAST(N'2000-04-04' AS Date), N'Nam', N'Berguvsvägen  8', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Trần Minh ', N'173363724', N'0903-706-885', N'Stuttgart@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'BE', 1, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'BLAUS', N'Đỗ Trọng ', CAST(N'2000-04-04' AS Date), N'Nam', N'Forsterstr. 57', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Lê Đức ', N'173363724', N'0909-270-099', N'Oulu@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'BE', 1, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'BLONP', N'Nguyễn Ngọc ', CAST(N'2000-04-04' AS Date), N'Nam', N'24, place Kléber', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Nguyễn Hoài ', N'173363724', N'0937-357-950', N'Resende@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'BE', 1, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'BOLID', N'Trịnh Việt', CAST(N'2000-04-04' AS Date), N'Nam', N'C/ Araquil, 67', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Lê Thị Ngọc', N'173363724', N'0982-900-971', N'Seattle@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'MGLA', 1, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'BONAP', N'Bùi Việt', CAST(N'2000-04-04' AS Date), N'Nam', N'12, rue des Bouchers', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Trương Quang ', N'173363724', N'0902-648-989', N'Helsinki@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'MGLA', 1, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'BOTTM', N'Trần Diệu ', CAST(N'2000-04-04' AS Date), N'Nam', N'23 Tsawassen Blvd.', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Đỗ Thành ', N'173363724', N'0986-028-108', N'Warszawa@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'MGNB', 1, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'BSBEV', N'Nguyễn Thị Hai ', CAST(N'2000-04-04' AS Date), N'Nam', N'Fauntleroy Circus', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Lê Văn ', N'173363724', N'0975-567-117', N'Kirkland@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'MGNB', 1, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'CACTU', N'Đổ Gioan', CAST(N'2000-04-04' AS Date), N'Nam', N'Cerrito 333', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Trần Quang ', N'173363724', N'0908-874-849', N'Århus@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'MGNB', 1, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'CENTC', N'Nguyễn Thị Diễm ', CAST(N'2000-04-04' AS Date), N'Nam', N'Sierras de Granada 9993', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Phạm Minh ', N'173363724', N'0913-835-675', N'Lyon@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'MGNB', 1, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'COMMI', N'Nguyễn Thái ', CAST(N'2000-04-04' AS Date), N'Nam', N'Av. dos Lusíadas, 23', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Đào Nguyên ', N'173363724', N'0907-686-962', N'Stuttgart@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'MGLA', 1, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'CONSH', N'Trần Viết ', CAST(N'2000-04-04' AS Date), N'Nam', N'Berkeley Gardens 12  Brewery', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Lê Công', N'173363724', N'0903-648-990', N'Oulu@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'MGLA', 1, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'CHOPS', N'Lâm Đức ', CAST(N'2000-04-04' AS Date), N'Nam', N'Hauptstr. 29', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Lưu ', N'173363724', N'0953-579-610', N'Reims@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'MGNB', 1, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'DRACD', N'Thái Thị Bích ', CAST(N'2000-04-04' AS Date), N'Nam', N'Walserweg 21', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Trương Tích ', N'173363724', N'0913-605-351', N'Resende@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'MGLA', 1, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'DUMON', N'Bùi Thị ', CAST(N'2000-04-04' AS Date), N'Nam', N'67, rue des Cinquante Otages', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Nguyễn Thị Thanh ', N'173363724', N'0936-000-367', N'Seattle@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'MGLA', 1, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'EASTC', N'Nguyễn Thế', CAST(N'2000-04-04' AS Date), N'Nam', N'35 King George', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Phan Thành ', N'173363724', N'0903-877-987', N'Helsinki@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'MGLB', 1, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'ERNSH', N'Hồ Nhật ', CAST(N'2000-04-04' AS Date), N'Nam', N'Kirchgasse 6', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Nguyễn Văn ', N'173363724', N'0909-864-113', N'Warszawa@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'MGLB', 1, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'FAMIA', N'Lê Văn ', CAST(N'2000-04-04' AS Date), N'Nam', N'Rua Orós, 92', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Trần Minh', N'173363724', N'0979-783-678', N'Kirkland@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'MGLB', 1, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'FISSA', N'Bùi Thị Minh ', CAST(N'2000-04-04' AS Date), N'Nam', N'C/ Moralzarzal, 86', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Phan Quang ', N'173363724', N'0903-706-885', N'Århus@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'MGLB', 1, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'FOLIG', N'Trịnh Thị Long ', CAST(N'2000-04-04' AS Date), N'Nam', N'184, chaussée de Tournai', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Huỳnh Ngọc ', N'173363724', N'0909-270-099', N'Lyon@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'MGLB', 1, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'FOLKO', N'Trần Hữu Trần', CAST(N'2000-04-04' AS Date), N'Nam', N'Åkergatan 24', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Lê Hữu ', N'173363724', N'0937-357-950', N'Reims@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'MGLB', 1, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'FRANK', N'Nguyễn Thúc Bội ', CAST(N'2000-04-04' AS Date), N'Nam', N'Berliner Platz 43', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Nguyễn Quang ', N'173363724', N'0982-900-971', N'Stuttgart@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'MGLB', 1, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'FRANR', N'Bùi Công', CAST(N'2000-04-04' AS Date), N'Nam', N'54, rue Royale', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Nguyễn Thành ', N'173363724', N'0902-648-989', N'Oulu@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'MGLB', 1, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'FRANS', N'Trần Thị ', CAST(N'2000-04-04' AS Date), N'Nam', N'Via Monte Bianco 34', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Phạm Gia ', N'173363724', N'0986-028-108', N'Resende@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'MGNA', 1, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'FURIB', N'Phạm Trà ', CAST(N'2000-04-04' AS Date), N'Nam', N'Jardim das rosas n. 32', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Nguyễn Thị ', N'173363724', N'0975-567-117', N'Seattle@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'MGNA', 1, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'GALED', N'Lê Bảo ', CAST(N'2000-04-04' AS Date), N'Nam', N'Rambla de Cataluña, 23', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Trần Minh ', N'173363724', N'0908-874-849', N'Helsinki@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'MGNA', 1, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'GODOS', N'Trần Thị Thùy ', CAST(N'2000-04-04' AS Date), N'Nam', N'C/ Romero, 33', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Cù Minh', N'173363724', N'0913-835-675', N'Warszawa@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'MGNA', 1, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'GOURL', N'Phan Đức ', CAST(N'2000-04-04' AS Date), N'Nam', N'Av. Brasil, 442', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Lưu Nhị ', N'173363724', N'0953-579-610', N'Kirkland@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'MGNA', 1, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'GREAL', N'Văn Thị ', CAST(N'2000-04-04' AS Date), N'Nam', N'2732 Baker Blvd.', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Lê Đức ', N'173363724', N'0907-686-962', N'Århus@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'NHATREA', 1, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'GROSR', N'Võ Phước', CAST(N'2000-04-04' AS Date), N'Nữ', N'5ª Ave. Los Palos Grandes', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Hoàng Công', N'173363724', N'0903-648-990', N'Lyon@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'NHATREA', 1, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'HANAR', N'Nguyễn Chi', CAST(N'2000-04-04' AS Date), N'Nữ', N'Rua do Paço, 67', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Lê Viết Thanh ', N'173363724', N'0913-605-351', N'Reims@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'NHATREA', 1, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'HILAA', N'Lê Thị ', CAST(N'2000-04-04' AS Date), N'Nữ', N'Carrera 22 con Ave.', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Lê Bá ', N'173363724', N'0936-000-367', N'Stuttgart@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'NHATREA', 1, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'HS-8CC', N'hung2', CAST(N'1999-12-31' AS Date), N'Nam', N'43 trần nhật duật, phường nam ngạn , thành phố thanh hóa', N'Học giỏi', 145, 43, N'nguyễn văn thiên', N'1212312312', N'01676983088', N'hung@gmaia.com', CAST(N'1977-11-01' AS Date), N'bé gầy và ăn ít, hay ho và ốm', N'BE', 0, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'HS-ADF', N'nguyễn thị lý', CAST(N'1994-12-31' AS Date), N'Nữ', N'43 trần quốc haonf', N'Học giỏi', 55, 36, N'Nguyễn dương', N'1212312312', N'12312312321', N'h1ugnth11b@gmail.com', CAST(N'1966-12-31' AS Date), N'học sinh mới', N'BE', 0, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'HS-BA8', N'Nguyễn bảo an', CAST(N'2000-12-31' AS Date), N'Nam', N'43 trần nhật duật, phường nam ngạn , thành phố thanh hóa', N'Học giỏi', 142, 43, N'nguyễn văn thu', N'1212312312', N'01676983088', N'hugnth11b@gmail.com', CAST(N'1978-12-31' AS Date), N'bé gầy và ăn ít, hay ho và ốm', N'MGLA', 0, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'HS-D1B', N'Nguyễn văn dũng', CAST(N'2000-12-31' AS Date), N'Nam', N'hà  nô', N'Học giỏi', 25, 22, N'nguyễn thuận', N'134232112', N'0167697312', N'dung@gmail.com', CAST(N'1966-12-31' AS Date), N'bé gầy và ăn ít, hay ho và ốm', N'MGLA', 1, 0)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'HUNGC', N'Lê Quang ', CAST(N'2000-04-04' AS Date), N'Nữ', N'City Center Plaza 516 Main St.', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Trần Minh ', N'173363724', N'0903-877-987', N'Oulu@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'NHATREA', 1, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'HUNGO', N'Lê Vũ ', CAST(N'2000-04-04' AS Date), N'Nữ', N'8 Johnstown Road', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Lê Đức ', N'173363724', N'0909-864-113', N'Resende@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'NHATREA', 1, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'ISLAT', N'Bùi Mỹ', CAST(N'2000-04-04' AS Date), N'Nữ', N'Garden House Crowther Way', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Nguyễn Hoài ', N'173363724', N'0979-783-678', N'Seattle@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'NHATREB', 1, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'KOENE', N'Dương Kim Thế ', CAST(N'2000-04-04' AS Date), N'Nữ', N'Maubelstr. 90', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Lê Thị Ngọc', N'173363724', N'0903-706-885', N'Helsinki@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'NHATREB', 1, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'LACOR', N'Nguyễn Thị Thu ', CAST(N'2000-04-04' AS Date), N'Nữ', N'67, avenue de l''Europe', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Trương Quang ', N'173363724', N'0909-270-099', N'Warszawa@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'NHATREB', 1, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'LAMAI', N'Trần Thị Ý', CAST(N'2000-04-04' AS Date), N'Nữ', N'1 rue Alsace-Lorraine', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Đỗ Thành ', N'173363724', N'0937-357-950', N'Kirkland@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'NHATREB', 1, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'LAUGB', N'Đòan Ngọc ', CAST(N'2000-04-04' AS Date), N'Nữ', N'1900 Oak St.', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Lê Văn ', N'173363724', N'0982-900-971', N'Århus@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'NHATREB', 1, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'LAZYK', N'Võ Đình', CAST(N'2000-04-04' AS Date), N'Nữ', N'12 Orchestra Terrace', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Trần Quang ', N'173363724', N'0902-648-989', N'Lyon@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'NHATREB', 1, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'LEHMS', N'Hà Văn ', CAST(N'2000-04-04' AS Date), N'Nữ', N'Magazinweg 7', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Phạm Minh ', N'173363724', N'0986-028-108', N'Reims@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'NHATREB', 1, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'LETSS', N'Lê Văn', CAST(N'2000-04-04' AS Date), N'Nữ', N'87 Polk St. Suite 5', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Lưu ', N'173363724', N'0975-567-117', N'Stuttgart@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'NHATREB', 1, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'LILAS', N'Lê Thị Thanh ', CAST(N'2000-04-04' AS Date), N'Nữ', N'Carrera 52 con Ave', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Đào Nguyên ', N'173363724', N'0908-874-849', N'Oulu@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'NHATREB', 0, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'LINOD', N'Nguyễn Văn ', CAST(N'2000-04-04' AS Date), N'Nữ', N'Ave. 5 de Mayo Porlamar', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Lê Công', N'173363724', N'0913-835-675', N'Resende@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'NHATREB', 0, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'LONEP', N'Lê Văn ', CAST(N'2000-04-04' AS Date), N'Nữ', N'89 Chiaroscuro Rd.', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Trương Tích ', N'173363724', N'0953-579-610', N'Seattle@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'NHATREB', 0, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'MAGAA', N'Trần Văn ', CAST(N'2000-04-04' AS Date), N'Nữ', N'Via Ludovico il Moro 22', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Nguyễn Thị Thanh ', N'173363724', N'0907-686-962', N'Helsinki@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'NHATREA', 0, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'MAISD', N'Nguyễn Hòang Mỹ', CAST(N'2000-04-04' AS Date), N'Nữ', N'Rue Joseph-Bens 532', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Phan Thành ', N'173363724', N'0903-648-990', N'Warszawa@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'NHATREA', 0, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'MEREP', N'Lợi Minh ', CAST(N'2000-04-04' AS Date), N'Nữ', N'43 rue St. Laurent', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Nguyễn Văn ', N'173363724', N'0913-605-351', N'Kirkland@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'NHATREA', 0, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'MORGK', N'Đinh Văn', CAST(N'2000-04-04' AS Date), N'Nữ', N'Heerstr. 22', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Trần Minh', N'173363724', N'0936-000-367', N'Århus@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'NHATREA', 0, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'NORTS', N'Nguyễn Thị Anh', CAST(N'2000-04-04' AS Date), N'Nữ', N'South House 300 Queensbridge', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Phan Quang ', N'173363724', N'0903-877-987', N'Lyon@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'NHATREA', 0, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'OCEAN', N'Nguyễn Văn ', CAST(N'2000-04-04' AS Date), N'Nữ', N'Moncada 8585 Piso 20-A', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Huỳnh Ngọc ', N'173363724', N'0909-864-113', N'Reims@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'MGNB', 0, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'OLDWO', N'Thái Thị Xuân', CAST(N'2000-04-04' AS Date), N'Nữ', N'2743 Bering St.', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Lê Hữu ', N'173363724', N'0979-783-678', N'Stuttgart@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'MGNB', 0, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'OTTIK', N'Đỗ Phú Trần ', CAST(N'2000-04-04' AS Date), N'Nữ', N'Mehrheimerstr. 369', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Nguyễn Quang ', N'173363724', N'0903-706-885', N'Oulu@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'MGNB', 0, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'PARIS', N'Phạm Ngọc', CAST(N'2000-04-04' AS Date), N'Nữ', N'265, boulevard Charonne', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Nguyễn Thành ', N'173363724', N'0909-270-099', N'Resende@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'MGNB', 0, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'PERIC', N'Tưởng Minh ', CAST(N'2000-04-04' AS Date), N'Nữ', N'Calle Dr. Jorge Cash 321', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Phạm Gia ', N'173363724', N'0937-357-950', N'Seattle@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'MGNA', 0, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'PICCO', N'Nguyễn Thị Thu ', CAST(N'2000-04-04' AS Date), N'Nữ', N'Geislweg 14', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Nguyễn Thị ', N'173363724', N'0982-900-971', N'Helsinki@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'MGNA', 0, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'PRINI', N'Nguyễn Thị', CAST(N'2000-04-04' AS Date), N'Nữ', N'Estrada da saúde n. 58', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Trần Minh ', N'173363724', N'0902-648-989', N'Warszawa@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'MGNA', 0, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'QUEDE', N'Hoàng Cẩm', CAST(N'2000-04-04' AS Date), N'Nữ', N'Rua da Panificadora, 12', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Cù Minh', N'173363724', N'0986-028-108', N'Kirkland@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'MGNA', 0, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'QUEEN', N'Tôn Thất', CAST(N'2000-04-04' AS Date), N'Nữ', N'Alameda dos Canàrios, 891', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Lưu Nhị ', N'173363724', N'0975-567-117', N'Århus@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'MGNA', 0, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'QUICK', N'Võ Thị Ngọc ', CAST(N'2000-04-04' AS Date), N'Nữ', N'Taucherstraße 10', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Lê Đức ', N'173363724', N'0908-874-849', N'Lyon@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'MGNA', 0, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'RANCH', N'Lê Đình ', CAST(N'2000-04-04' AS Date), N'Nữ', N'Av. del Libertador 900', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Hoàng Công', N'173363724', N'0913-835-675', N'Reims@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'MGNB', 0, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'RATTC', N'Phan Ngọc ', CAST(N'2000-04-04' AS Date), N'Nữ', N'2817 Milton Dr.', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Lê Viết Thanh ', N'173363724', N'0953-579-610', N'Stuttgart@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'MGLB', 0, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'REGGC', N'Hùynh Ngọc Thành ', CAST(N'2000-04-04' AS Date), N'Nữ', N'Strada Provinciale 124', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Lê Bá ', N'173363724', N'0907-686-962', N'Oulu@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'MGLB', 0, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'RICAR', N'Nguyễn Xuân ', CAST(N'2000-04-04' AS Date), N'Nữ', N'Av. Copacabana, 267', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Trần Minh ', N'173363724', N'0903-648-990', N'Resende@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'MGLB', 0, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'RICSU', N'Trương Anh ', CAST(N'2000-04-04' AS Date), N'Nữ', N'Grenzacherweg 237', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Lê Đức ', N'173363724', N'0913-605-351', N'Seattle@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'MGLB', 0, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'ROMEY', N'Bành Quốc', CAST(N'2000-04-04' AS Date), N'Nữ', N'Gran Vía, 1', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Nguyễn Hoài ', N'173363724', N'0979-783-678', N'Helsinki@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'MGLB', 0, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'SANTG', N'Trần Quốc', CAST(N'2000-04-04' AS Date), N'Nữ', N'Erling Skakkes gate 78', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Lê Thị Ngọc', N'173363724', N'0903-706-885', N'Warszawa@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'MGLB', 0, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'SAVEA', N'Trần Mạnh', CAST(N'2000-04-04' AS Date), N'Nữ', N'187 Suffolk Ln.', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Trương Quang ', N'173363724', N'0909-270-099', N'Kirkland@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'MGLB', 0, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'SEVES', N'Nguyễn Thị Uyên', CAST(N'2000-04-04' AS Date), N'Nữ', N'90 Wadhurst Rd.', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Đỗ Thành ', N'173363724', N'0937-357-950', N'Århus@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'MGLB', 0, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'SIMOB', N'Mai Lê Thúy ', CAST(N'2000-04-04' AS Date), N'Nữ', N'Vinbæltet 34', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Lê Văn ', N'173363724', N'0982-900-971', N'Lyon@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'MGLB', 0, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'SPECD', N'Lê Thị  Hạnh', CAST(N'2000-04-04' AS Date), N'Nữ', N'25, rue Lauriston', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Trần Quang ', N'173363724', N'0902-648-989', N'Reims@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'MGLB', 0, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'SPLIR', N'Trương Thị Thanh ', CAST(N'2000-04-04' AS Date), N'Nữ', N'P.O. Box 555', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Phạm Minh ', N'173363724', N'0986-028-108', N'Stuttgart@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'MGLA', 0, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'SUPRD', N'Cao Thị Hòang ', CAST(N'2000-04-04' AS Date), N'Nữ', N'Boulevard Tirou, 255', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Lưu ', N'173363724', N'0975-567-117', N'Oulu@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'MGLB', 0, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'TOMSP', N'Nguyễn Thị Uyên ', CAST(N'2000-04-04' AS Date), N'Nữ', N'Luisenstr. 48', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Trương Tích ', N'173363724', N'0953-579-610', N'Helsinki@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'MGLA', 0, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'TORTU', N'Lê Quang ', CAST(N'2000-04-04' AS Date), N'Nữ', N'Avda. Azteca 123', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Nguyễn Thị Thanh ', N'173363724', N'0907-686-962', N'Warszawa@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'MGLA', 0, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'THEBI', N'Trần Viết ', CAST(N'2000-04-04' AS Date), N'Nữ', N'89 Jefferson Way Suite 2', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Đào Nguyên ', N'173363724', N'0908-874-849', N'Resende@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'MGLB', 0, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'THECR', N'Lê Thị ', CAST(N'2000-04-04' AS Date), N'Nữ', N'55 Grizzly Peak Rd.', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Lê Công', N'173363724', N'0913-835-675', N'Seattle@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'MGLA', 0, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'TRADH', N'Nguyễn Hoàng Mỹ ', CAST(N'2000-04-04' AS Date), N'Nữ', N'Av. Inês de Castro, 414', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Phan Thành ', N'173363724', N'0903-648-990', N'Kirkland@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'MGLA', 0, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'TRAIH', N'Bùi Mỹ ', CAST(N'2000-04-04' AS Date), N'Nữ', N'722 DaVinci Blvd.', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Nguyễn Văn ', N'173363724', N'0913-605-351', N'Århus@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'MGLA', 0, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'VAFFE', N'Nguyễn Xuân ', CAST(N'2000-04-04' AS Date), N'Nữ', N'Smagsloget 45', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Trần Minh', N'173363724', N'0908-874-849', N'Lyon@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'MGNB', 0, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'VICTE', N'Thái Thị Bích ', CAST(N'2000-04-04' AS Date), N'Nữ', N'2, rue du Commerce', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Phan Quang ', N'173363724', N'0913-835-675', N'Reims@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'MGNB', 0, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'VINET', N'Nguyễn Thị Kim ', CAST(N'2000-04-04' AS Date), N'Nữ', N'59 rue de l''Abbaye', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Huỳnh Ngọc ', N'173363724', N'0953-579-610', N'Stuttgart@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'BE', 0, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'WANDK', N'Nguyễn Thị Anh ', CAST(N'2000-04-04' AS Date), N'Nữ', N'Adenauerallee 900', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Lê Hữu ', N'173363724', N'0907-686-962', N'Oulu@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'BE', 0, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'WARTH', N'Nguyễn Thị Diễm ', CAST(N'2000-04-04' AS Date), N'Nữ', N'Torikatu 38', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Nguyễn Quang ', N'173363724', N'0903-648-990', N'Resende@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'BE', 0, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'WELLI', N'Đỗ Gioan ', CAST(N'2000-04-04' AS Date), N'Nữ', N'Rua do Mercado, 12', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Nguyễn Thành ', N'173363724', N'0913-605-351', N'Seattle@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'BE', 0, 1)
GO
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'WHITC', N'Lê Bảo', CAST(N'2000-04-04' AS Date), N'Nữ', N'305 - 14th Ave. S. Suite 3B', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Phạm Gia ', N'173363724', N'0907-686-962', N'Helsinki@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'BE', 0, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'WILMK', N'Lâm Đức ', CAST(N'2000-04-04' AS Date), N'Nữ', N'Keskuskatu 45', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Nguyễn Thị ', N'173363724', N'0903-648-990', N'Warszawa@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'BE', 0, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [DoiTuongMTA], [TrangThai]) VALUES (N'WOLZA', N'Tôn Thất ', CAST(N'2000-04-04' AS Date), N'Nữ', N'ul. Filtrowa 68', N'Học tốt, chăm ngoan, nghe lời thầy cô', 134, 40, N'Trần Minh ', N'173363724', N'0913-605-351', N'Warszawa@gmail.com', CAST(N'1990-04-04' AS Date), N'Chưa có ghi chú', N'BE', 0, 1)
INSERT [dbo].[LoaiHocPhi] ([MaLoai], [TenLoai], [GhiChu]) VALUES (N'LoaiHocPhi-20D1', N'Học phí đầu năm', N'Các khoản bắt buộc đóng đầu năm học, như tiền xây dựng, cơ sở vật chất')
INSERT [dbo].[LoaiHocPhi] ([MaLoai], [TenLoai], [GhiChu]) VALUES (N'LoaiHocPhi-2FAA', N'Đóng theo tháng', N'Các khoản bắt buộc đóng theo tháng, như học phí, đồ dùng cá nhân ...')
INSERT [dbo].[LoaiHocPhi] ([MaLoai], [TenLoai], [GhiChu]) VALUES (N'LoaiHocPhi-472E', N'Đóng theo nguyện vọng phụ huynh', N'Các khoản phụ thuộc vào sự đồng ý của các bậc phụ huynh, như học thêm, dịch vụ xã hội')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [GhiChu], [SiSo]) VALUES (N'BE', N'Mẫu giáo bé', N'Các bé từ 25-36 tháng tuổi', 20)
INSERT [dbo].[Lop] ([MaLop], [TenLop], [GhiChu], [SiSo]) VALUES (N'MGLA', N'Mẫu giáo lớn A', N'Các bé từ 4-5 tuổi', 25)
INSERT [dbo].[Lop] ([MaLop], [TenLop], [GhiChu], [SiSo]) VALUES (N'MGLB', N'Mẫu giáo lớn B', N'Các bé từ 4-5 tuổi', 25)
INSERT [dbo].[Lop] ([MaLop], [TenLop], [GhiChu], [SiSo]) VALUES (N'MGNA', N'Mẫu giáo nhỡ A', N'Các bé từ 3-4 tuổi', 27)
INSERT [dbo].[Lop] ([MaLop], [TenLop], [GhiChu], [SiSo]) VALUES (N'MGNB', N'Mẫu giáo nhỡ B', N'Các bé từ 3-4 tuổi', 29)
INSERT [dbo].[Lop] ([MaLop], [TenLop], [GhiChu], [SiSo]) VALUES (N'NHATREA', N'Lớp trẻ A ', N'Các bé từ 2-3 tuổi', 26)
INSERT [dbo].[Lop] ([MaLop], [TenLop], [GhiChu], [SiSo]) VALUES (N'NHATREB', N'Lớp trẻ B ', N'Các bé từ 2-3 tuổi', 23)
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'Admin', N'Admin', NULL, N'01676983088', N'admin@gmail.com', N'ADMIN', NULL, N'123123')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'GV1', N'Nguyễn Chính', N'43 trần nhật duật, phường nam ngạn , thành phố thành hóa ', N'01676983088 ', N'giaovien@gmail.com', N'GVC', N'BE', N'123123')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'GV10', N'giáo viên 10', N'43 trần nhật duật, phường nam ngạn , thành phố thành hóa', N'01676983088', N'', N'GVC', N'MGNB', N'123123')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'GV11', N'giáo viên 11', N'43 trần nhật duật, phường nam ngạn , thành phố thành hóa', N'01676983088', N'giaovienphunhob@gmail.com', N'GVP', N'MGNB', N'123123')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'GV12', N'giáo viên 12', N'43 trần nhật duật, phường nam ngạn , thành phố thành hóa', N'01676983088', N'', N'GVC', N'NHATREA', N'123123')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'GV13', N'giáo viên13', N'43 trần nhật duật, phường nam ngạn , thành phố thành hóa', N'01676983088', N'', N'GVP', N'NHATREA', N'123123')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'GV14', N'giáo viên14', N'43 trần nhật duật, phường nam ngạn , thành phố thành hóa', N'01676983088', N'', N'GVC', N'NHATREB', N'123123')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'GV15', N'giáo viên15', N'43 trần nhật duật, phường nam ngạn , thành phố thành hóa', N'01676983088', N'', N'GVP', N'NHATREB', N'123123')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'GV2', N'Nguyễn Phụ', N'43 trần nhật duật, phường nam ngạn , thành phố thành hóa', N'01676983088', N'giaovienphu@gmail.com', N'GVP', N'BE', N'123123')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'GV3', N'Nguyễn Phụ Phụ', N'43 trần nhật duật, phường nam ngạn , thành phố thành hóa', N'01676983088', N'', N'GVP', N'BE', N'123123')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'GV4', N'giáo viên 4', N'43 trần nhật duật, phường nam ngạn , thành phố thành hóa', N'01676983088', N'', N'GVC', N'MGLA', N'123123')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'GV5', N'giáo viên 5', N'43 trần nhật duật, phường nam ngạn , thành phố thành hóa', N'01676983088', N'', N'GVP', N'MGLA', N'123123')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'GV6', N'giáo viên 6', N'43 trần nhật duật, phường nam ngạn , thành phố thành hóa', N'01676983088', N'', N'GVC', N'MGLB', N'123123')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'GV7', N'giáo viên 7', N'43 trần nhật duật, phường nam ngạn , thành phố thành hóa', N'01676983088', N'', N'GVP', N'MGLB', N'123123')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'GV8', N'giáo viên 8', N'43 trần nhật duật, phường nam ngạn , thành phố thành hóa', N'01676983088', N'', N'GVC', N'MGNA', N'123123')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'GV9', N'giáo viên 9', N'43 trần nhật duật, phường nam ngạn , thành phố thành hóa', N'01676983088', N'', N'GVP', N'MGNA', N'123123')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'KT1', N'kế toán', N'43 trần nhật duật, phường nam ngạn , thành phố thành hóa', N'01676983088', N'ketoan@gmail.com', N'KETOAN', NULL, N'123123')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'NV18AC', N'nguyễn minh hiếu', N'43 trần nhật duật, phường nam ngạn , thành phố thành hóa', N'01676983088', N'', N'KETOAN', NULL, N'123123')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'NV-637', NULL, N'sd', N'sdf', N'sdfdsf', N'GVC', NULL, N'sdf')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'NV-EFD', N'ádasd', N'hà nội', N'01676983088', N'hung@gmaia.com', N'TONUOI', N'MGLA', N'123123')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'TN1', N'tổ nuôi', N'43 trần nhật duật, phường nam ngạn , thành phố thành hóa', N'01676983088', N'tonuoi@gmail.com', N'TONUOI', NULL, N'123123')
INSERT [dbo].[PhieuChiTieu] ([MaPhieuChiTieu], [NgayTaoPhieu], [MaNhanVien], [TenNguoiChi], [LyDo], [ChiPhi], [ChungTu]) VALUES (N'1', CAST(N'1994-03-03' AS Date), N'Admin', N'ádasd', N'ádasd', 23.0000, N'ád')
INSERT [dbo].[PhieuChiTieu] ([MaPhieuChiTieu], [NgayTaoPhieu], [MaNhanVien], [TenNguoiChi], [LyDo], [ChiPhi], [ChungTu]) VALUES (N'ChiTieu-3071', NULL, N'KT1', N'qưdas', N'ád', 23.0000, NULL)
INSERT [dbo].[PhieuChiTieu] ([MaPhieuChiTieu], [NgayTaoPhieu], [MaNhanVien], [TenNguoiChi], [LyDo], [ChiPhi], [ChungTu]) VALUES (N'ChiTieu-3D76', CAST(N'1994-03-03' AS Date), N'KT1', N'sd', N'asd', 2.0000, NULL)
INSERT [dbo].[PhieuChiTieu] ([MaPhieuChiTieu], [NgayTaoPhieu], [MaNhanVien], [TenNguoiChi], [LyDo], [ChiPhi], [ChungTu]) VALUES (N'ChiTieu-96D4', NULL, N'Admin', N'asd', N'asd', 2.0000, NULL)
INSERT [dbo].[PhieuChiTieu] ([MaPhieuChiTieu], [NgayTaoPhieu], [MaNhanVien], [TenNguoiChi], [LyDo], [ChiPhi], [ChungTu]) VALUES (N'ChiTieu-979F', NULL, N'Admin', N'ÁD', N'ÁDASD', 2.0000, NULL)
INSERT [dbo].[PhieuChiTieu] ([MaPhieuChiTieu], [NgayTaoPhieu], [MaNhanVien], [TenNguoiChi], [LyDo], [ChiPhi], [ChungTu]) VALUES (N'ChiTieu-E840', NULL, N'KT1', N'asd', N'asd', 2.0000, NULL)
SET IDENTITY_INSERT [dbo].[PhieuTheoDoi] ON 

INSERT [dbo].[PhieuTheoDoi] ([MaPhieuTheoDoi], [MaGiaoVien], [NgayTheoDoi], [ChiPhiDuTinh]) VALUES (66, N'GV1', CAST(N'2017-12-30' AS Date), NULL)
INSERT [dbo].[PhieuTheoDoi] ([MaPhieuTheoDoi], [MaGiaoVien], [NgayTheoDoi], [ChiPhiDuTinh]) VALUES (67, N'GV1', CAST(N'2017-12-01' AS Date), NULL)
INSERT [dbo].[PhieuTheoDoi] ([MaPhieuTheoDoi], [MaGiaoVien], [NgayTheoDoi], [ChiPhiDuTinh]) VALUES (68, N'GV1', CAST(N'2017-12-02' AS Date), NULL)
INSERT [dbo].[PhieuTheoDoi] ([MaPhieuTheoDoi], [MaGiaoVien], [NgayTheoDoi], [ChiPhiDuTinh]) VALUES (69, N'GV1', CAST(N'2017-12-03' AS Date), NULL)
INSERT [dbo].[PhieuTheoDoi] ([MaPhieuTheoDoi], [MaGiaoVien], [NgayTheoDoi], [ChiPhiDuTinh]) VALUES (70, N'GV1', CAST(N'2017-12-04' AS Date), NULL)
INSERT [dbo].[PhieuTheoDoi] ([MaPhieuTheoDoi], [MaGiaoVien], [NgayTheoDoi], [ChiPhiDuTinh]) VALUES (71, N'GV1', CAST(N'2017-12-05' AS Date), NULL)
INSERT [dbo].[PhieuTheoDoi] ([MaPhieuTheoDoi], [MaGiaoVien], [NgayTheoDoi], [ChiPhiDuTinh]) VALUES (72, N'GV1', CAST(N'2017-12-06' AS Date), NULL)
INSERT [dbo].[PhieuTheoDoi] ([MaPhieuTheoDoi], [MaGiaoVien], [NgayTheoDoi], [ChiPhiDuTinh]) VALUES (73, N'GV1', CAST(N'2017-12-07' AS Date), NULL)
INSERT [dbo].[PhieuTheoDoi] ([MaPhieuTheoDoi], [MaGiaoVien], [NgayTheoDoi], [ChiPhiDuTinh]) VALUES (74, N'GV1', CAST(N'2017-12-08' AS Date), NULL)
INSERT [dbo].[PhieuTheoDoi] ([MaPhieuTheoDoi], [MaGiaoVien], [NgayTheoDoi], [ChiPhiDuTinh]) VALUES (75, N'GV1', CAST(N'2017-12-09' AS Date), NULL)
INSERT [dbo].[PhieuTheoDoi] ([MaPhieuTheoDoi], [MaGiaoVien], [NgayTheoDoi], [ChiPhiDuTinh]) VALUES (76, N'GV1', CAST(N'2017-12-10' AS Date), NULL)
INSERT [dbo].[PhieuTheoDoi] ([MaPhieuTheoDoi], [MaGiaoVien], [NgayTheoDoi], [ChiPhiDuTinh]) VALUES (77, N'GV1', CAST(N'2017-12-11' AS Date), NULL)
INSERT [dbo].[PhieuTheoDoi] ([MaPhieuTheoDoi], [MaGiaoVien], [NgayTheoDoi], [ChiPhiDuTinh]) VALUES (78, N'GV1', CAST(N'2017-12-12' AS Date), NULL)
INSERT [dbo].[PhieuTheoDoi] ([MaPhieuTheoDoi], [MaGiaoVien], [NgayTheoDoi], [ChiPhiDuTinh]) VALUES (79, N'GV1', CAST(N'2017-12-13' AS Date), NULL)
INSERT [dbo].[PhieuTheoDoi] ([MaPhieuTheoDoi], [MaGiaoVien], [NgayTheoDoi], [ChiPhiDuTinh]) VALUES (80, N'GV1', CAST(N'2017-12-14' AS Date), NULL)
INSERT [dbo].[PhieuTheoDoi] ([MaPhieuTheoDoi], [MaGiaoVien], [NgayTheoDoi], [ChiPhiDuTinh]) VALUES (81, N'GV1', CAST(N'2017-12-15' AS Date), NULL)
INSERT [dbo].[PhieuTheoDoi] ([MaPhieuTheoDoi], [MaGiaoVien], [NgayTheoDoi], [ChiPhiDuTinh]) VALUES (82, N'GV1', CAST(N'2017-12-16' AS Date), NULL)
INSERT [dbo].[PhieuTheoDoi] ([MaPhieuTheoDoi], [MaGiaoVien], [NgayTheoDoi], [ChiPhiDuTinh]) VALUES (83, N'GV1', CAST(N'2017-12-17' AS Date), NULL)
INSERT [dbo].[PhieuTheoDoi] ([MaPhieuTheoDoi], [MaGiaoVien], [NgayTheoDoi], [ChiPhiDuTinh]) VALUES (84, N'GV1', CAST(N'2017-12-18' AS Date), NULL)
INSERT [dbo].[PhieuTheoDoi] ([MaPhieuTheoDoi], [MaGiaoVien], [NgayTheoDoi], [ChiPhiDuTinh]) VALUES (85, N'GV1', CAST(N'2017-12-19' AS Date), NULL)
INSERT [dbo].[PhieuTheoDoi] ([MaPhieuTheoDoi], [MaGiaoVien], [NgayTheoDoi], [ChiPhiDuTinh]) VALUES (86, N'GV1', CAST(N'2017-12-20' AS Date), NULL)
INSERT [dbo].[PhieuTheoDoi] ([MaPhieuTheoDoi], [MaGiaoVien], [NgayTheoDoi], [ChiPhiDuTinh]) VALUES (87, N'GV1', CAST(N'2017-12-21' AS Date), NULL)
INSERT [dbo].[PhieuTheoDoi] ([MaPhieuTheoDoi], [MaGiaoVien], [NgayTheoDoi], [ChiPhiDuTinh]) VALUES (88, N'GV1', CAST(N'2017-12-22' AS Date), NULL)
INSERT [dbo].[PhieuTheoDoi] ([MaPhieuTheoDoi], [MaGiaoVien], [NgayTheoDoi], [ChiPhiDuTinh]) VALUES (89, N'GV1', CAST(N'2017-12-23' AS Date), NULL)
INSERT [dbo].[PhieuTheoDoi] ([MaPhieuTheoDoi], [MaGiaoVien], [NgayTheoDoi], [ChiPhiDuTinh]) VALUES (90, N'GV1', CAST(N'2017-12-24' AS Date), NULL)
INSERT [dbo].[PhieuTheoDoi] ([MaPhieuTheoDoi], [MaGiaoVien], [NgayTheoDoi], [ChiPhiDuTinh]) VALUES (91, N'GV1', CAST(N'2017-12-25' AS Date), NULL)
INSERT [dbo].[PhieuTheoDoi] ([MaPhieuTheoDoi], [MaGiaoVien], [NgayTheoDoi], [ChiPhiDuTinh]) VALUES (92, N'GV1', CAST(N'2017-12-26' AS Date), NULL)
INSERT [dbo].[PhieuTheoDoi] ([MaPhieuTheoDoi], [MaGiaoVien], [NgayTheoDoi], [ChiPhiDuTinh]) VALUES (93, N'GV1', CAST(N'2017-12-27' AS Date), NULL)
INSERT [dbo].[PhieuTheoDoi] ([MaPhieuTheoDoi], [MaGiaoVien], [NgayTheoDoi], [ChiPhiDuTinh]) VALUES (94, N'GV1', CAST(N'2017-12-28' AS Date), NULL)
INSERT [dbo].[PhieuTheoDoi] ([MaPhieuTheoDoi], [MaGiaoVien], [NgayTheoDoi], [ChiPhiDuTinh]) VALUES (95, N'GV1', CAST(N'2017-12-29' AS Date), NULL)
INSERT [dbo].[PhieuTheoDoi] ([MaPhieuTheoDoi], [MaGiaoVien], [NgayTheoDoi], [ChiPhiDuTinh]) VALUES (96, N'GV1', CAST(N'2017-12-31' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[PhieuTheoDoi] OFF
INSERT [dbo].[PhieuThu] ([MaPhieuThu], [NgayTaoPhieu], [MaHocSinh], [MaNhanVien], [GhiChu]) VALUES (N'PhieuThu-938', N'12/2017', N'1', N'KT1', NULL)
INSERT [dbo].[PhieuThu] ([MaPhieuThu], [NgayTaoPhieu], [MaHocSinh], [MaNhanVien], [GhiChu]) VALUES (N'PhieuThu-ECA', N'12/2017', N'2', N'Admin', NULL)
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'GiaoVien', N'Nghiệp vụ giáo viên', NULL)
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'GiaoVien-DiemDanh', N'Giáo viên điển danh', N'GiaoVien')
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'GiaoVien-Index', N'Xem trang chủ giáo viên', N'GiaoVien')
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'GiaoVien-Partial_DanhSachHocSinh', N'GiaoVien xem danh sách học sinh', N'GiaoVien')
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'GiaoVien-Partial_DiemDanhLop', N'Hiển thi điểm danh', N'GiaoVien')
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'HocPhi', N'Quản lý học phí', NULL)
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'HocPhi-AddHocPhi', N'Thêm mới học phí', N'HocPhi')
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'HocPhi-AddLoaiHocPhi', N'Thêm mới loại học phí', N'HocPhi')
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'HocPhi-DeleteHocPhi', N'Xóa học phí', N'HocPhi')
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'HocPhi-DeleteLoaiHocPhi', N'Xóa loại học phí', N'HocPhi')
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'HocPhi-Index', N'Xem trang chủ quản lý học phí', N'HocPhi')
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'HocPhi-UpdateHocPhi', N'Sửa học phí', N'HocPhi')
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'HocPhi-UpdateLoaiHocPhi', N'Sửa loại học phí', N'HocPhi')
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'HocSinh', N'Quản lý học sinh', NULL)
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'HocSinh-Add', N'Thêm mới học sinh', N'HocSinh')
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'HocSinh-Delete', N'Xóa học sinh', N'HocSinh')
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'HocSinh-Detail', N'Xem chi tiết học sinh', N'HocSinh')
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'HocSinh-Index', N'Xem trang chủ quản lý học sinh', N'HocSinh')
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'HocSinh-Update', N'Sửa học sinh', N'HocSinh')
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'HomeAdmin', N'Nghiệp vụ Admin', NULL)
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'HomeAdmin-Index', N'Xem trang chủ quản trị', N'HomeAdmin')
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'HomeAdmin-PhanQuyenTheoChucVu', N'Xem phân quyền chức vụ', N'HomeAdmin')
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'HomeAdmin-Save', N'Cập nhật,chỉnh sửa quyền', N'HomeAdmin')
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'KeToan', N'Nghiệp vụ kế toán', NULL)
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'KeToan-DanhSachHocSinh', N'Xem danh sách học sinh', N'KeToan')
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'KeToan-HocPhiHocSinh', N'Xem học phí học sinh', N'KeToan')
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'KeToan-Index', N'Xem trang chủ kế toán', N'KeToan')
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'KeToan-Partial_CT_HocPhi', N'Chi tiết học phí học sinh', N'KeToan')
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'Lop', N'Quản lý lớp', NULL)
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'Lop-Add', N'Thêm mới lớp', N'Lop')
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'Lop-Delete', N'Xóa lớp', N'Lop')
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'Lop-Detail', N'Xem chi tiết lớp', N'Lop')
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'Lop-Index', N'Xem trang quản lý lớp', N'Lop')
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'Lop-Update', N'Sửa lớp', N'Lop')
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'NhanVien', N'Quản lý nhân viên', NULL)
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'NhanVien-Add', N'Thêm mới nhân viên', N'NhanVien')
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'NhanVien-Delete', N'Xóa nhân viên', N'NhanVien')
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'NhanVien-Detail', N'Xem chi tiết nhân viên', N'NhanVien')
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'NhanVien-Index', N'Xem trang quản lý nhân viên', N'NhanVien')
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'NhanVien-Update', N'Sửa nhân viên', N'NhanVien')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'GVC', N'GiaoVien-DiemDanh')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'GVC', N'GiaoVien-Index')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'GVP', N'GiaoVien-Index')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'GVC', N'GiaoVien-Partial_DanhSachHocSinh')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'GVP', N'GiaoVien-Partial_DanhSachHocSinh')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'GVC', N'GiaoVien-Partial_DiemDanhLop')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'GVP', N'GiaoVien-Partial_DiemDanhLop')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'GVC', N'HocPhi-Index')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'GVP', N'HocPhi-Index')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'GVC', N'HocSinh-Detail')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'GVP', N'HocSinh-Detail')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'KETOAN', N'HocSinh-Detail')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'GVC', N'HocSinh-Index')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'GVP', N'HocSinh-Index')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'KETOAN', N'HocSinh-Index')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'GVC', N'HomeAdmin-Index')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'GVP', N'HomeAdmin-Index')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'KETOAN', N'HomeAdmin-Index')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'GVC', N'HomeAdmin-PhanQuyenTheoChucVu')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'GVP', N'HomeAdmin-PhanQuyenTheoChucVu')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'KETOAN', N'HomeAdmin-PhanQuyenTheoChucVu')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'KETOAN', N'KeToan-DanhSachHocSinh')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'KETOAN', N'KeToan-HocPhiHocSinh')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'KETOAN', N'KeToan-Index')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'KETOAN', N'KeToan-Partial_CT_HocPhi')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'GVC', N'Lop-Detail')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'GVP', N'Lop-Detail')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'KETOAN', N'Lop-Detail')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'GVC', N'Lop-Index')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'GVP', N'Lop-Index')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'KETOAN', N'Lop-Index')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'GVC', N'NhanVien-Detail')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'GVP', N'NhanVien-Detail')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'KETOAN', N'NhanVien-Detail')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'GVC', N'NhanVien-Index')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'GVP', N'NhanVien-Index')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'KETOAN', N'NhanVien-Index')
ALTER TABLE [dbo].[CT_DichVu_HocSinh]  WITH CHECK ADD  CONSTRAINT [FK_CT_DichVu_HocSinh_DichVuNgoai] FOREIGN KEY([MaDichVu])
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
ALTER TABLE [dbo].[CT_PhieuThu_HocSinh]  WITH CHECK ADD  CONSTRAINT [FK_CT_PhieuThu_HocSinh_PhieuThu1] FOREIGN KEY([MaPhieuThu])
REFERENCES [dbo].[PhieuThu] ([MaPhieuThu])
GO
ALTER TABLE [dbo].[CT_PhieuThu_HocSinh] CHECK CONSTRAINT [FK_CT_PhieuThu_HocSinh_PhieuThu1]
GO
ALTER TABLE [dbo].[HocPhi]  WITH CHECK ADD  CONSTRAINT [FK_HocPhi_LoaiHocPhi] FOREIGN KEY([LoaiHocphi])
REFERENCES [dbo].[LoaiHocPhi] ([MaLoai])
GO
ALTER TABLE [dbo].[HocPhi] CHECK CONSTRAINT [FK_HocPhi_LoaiHocPhi]
GO
ALTER TABLE [dbo].[HocSinh]  WITH NOCHECK ADD  CONSTRAINT [FK_HocSinh_Lop1] FOREIGN KEY([MaLop])
REFERENCES [dbo].[Lop] ([MaLop])
GO
ALTER TABLE [dbo].[HocSinh] CHECK CONSTRAINT [FK_HocSinh_Lop1]
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
ALTER TABLE [dbo].[PhieuChiTieu]  WITH CHECK ADD  CONSTRAINT [FK_PhieuChiTieu_NhanVien] FOREIGN KEY([MaNhanVien])
REFERENCES [dbo].[NhanVien] ([MaNhanVien])
GO
ALTER TABLE [dbo].[PhieuChiTieu] CHECK CONSTRAINT [FK_PhieuChiTieu_NhanVien]
GO
ALTER TABLE [dbo].[PhieuTheoDoi]  WITH CHECK ADD  CONSTRAINT [FK_PhieuTheoDoi_NhanVien] FOREIGN KEY([MaGiaoVien])
REFERENCES [dbo].[NhanVien] ([MaNhanVien])
GO
ALTER TABLE [dbo].[PhieuTheoDoi] CHECK CONSTRAINT [FK_PhieuTheoDoi_NhanVien]
GO
ALTER TABLE [dbo].[PhieuThu]  WITH CHECK ADD  CONSTRAINT [FK_PhieuThu_HocSinh1] FOREIGN KEY([MaHocSinh])
REFERENCES [dbo].[HocSinh] ([MaHocSinh])
GO
ALTER TABLE [dbo].[PhieuThu] CHECK CONSTRAINT [FK_PhieuThu_HocSinh1]
GO
ALTER TABLE [dbo].[PhieuThu]  WITH CHECK ADD  CONSTRAINT [FK_PhieuThu_NhanVien1] FOREIGN KEY([MaNhanVien])
REFERENCES [dbo].[NhanVien] ([MaNhanVien])
GO
ALTER TABLE [dbo].[PhieuThu] CHECK CONSTRAINT [FK_PhieuThu_NhanVien1]
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
/****** Object:  StoredProcedure [dbo].[DeleteChucVu]    Script Date: 04/01/2018 12:37:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
create PROCEDURE [dbo].[DeleteChucVu]
@MaChucVu varchar(20)
as
BEGIN
	delete from ChucVu where MaChucVu=@MaChucVu
END


GO
/****** Object:  StoredProcedure [dbo].[DeleteDichVuNgoai]    Script Date: 04/01/2018 12:37:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create Procedure [dbo].[DeleteDichVuNgoai]
(    
@MaDichVu varchar(20) 
)    
as     
Begin    
 Delete FROM DichVuNgoai where MaDichVu=@MaDichVu

End  



GO
/****** Object:  StoredProcedure [dbo].[DeleteHocPhi]    Script Date: 04/01/2018 12:37:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create Procedure [dbo].[DeleteHocPhi]
(    
@MaHocPhi varchar(20) 
)    
as     
Begin    
 Delete FROM HocPhi where MaHocPhi=@MaHocPhi

End  



GO
/****** Object:  StoredProcedure [dbo].[DeleteHocSinh]    Script Date: 04/01/2018 12:37:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[DeleteHocSinh]
@MaHocSinh varchar(20)    
as     

Begin
if(exists(select MaHocSinh from HocSinh where MaHocSinh=@MaHocSinh and TrangThai=0))
	begin
		Delete FROM HocSinh where MaHocSinh=@MaHocSinh		
	end
else
	begin
		update HocSinh set TrangThai=0 where MaHocSinh=@MaHocSinh
	end
End  


GO
/****** Object:  StoredProcedure [dbo].[DeleteLoaiHocPhi]    Script Date: 04/01/2018 12:37:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create Procedure [dbo].[DeleteLoaiHocPhi]
(    
@MaLoai varchar(20) 
)    
as     
Begin    
 Delete FROM LoaiHocPhi where MaLoai=@MaLoai

End  



GO
/****** Object:  StoredProcedure [dbo].[DeleteLop]    Script Date: 04/01/2018 12:37:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create Procedure [dbo].[DeleteLop]
(    
@MaLop varchar(20) 
)    
as     
Begin    
 Delete FROM Lop where MaLop=@MaLop   

End  



GO
/****** Object:  StoredProcedure [dbo].[DeleteNhanVien]    Script Date: 04/01/2018 12:37:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Delete Employee  
Create Procedure [dbo].[DeleteNhanVien]
(    
@MaNhanVien varchar(20) 
)    
as     
Begin    
 Delete NhanVien where MaNhanVien=@MaNhanVien;
End  



GO
/****** Object:  StoredProcedure [dbo].[DeletePhieuChiTieu]    Script Date: 04/01/2018 12:37:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create Procedure [dbo].[DeletePhieuChiTieu]
(    
@MaPhieuChiTieu varchar(20) 
)    
as     
Begin    
 Delete FROM PhieuChiTieu where MaPhieuChiTieu=@MaPhieuChiTieu

End  



GO
/****** Object:  StoredProcedure [dbo].[DiemDanhProc]    Script Date: 04/01/2018 12:37:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DiemDanhProc]
	@MaGiaoVien varchar(20),
	@NgayTheoDoi date,
	@MaHocSinh varchar(20),
	@ddVang bit,
	@ddAnSang bit,
	@ddAnTrua bit
AS
BEGIN
DECLARE	@maPhieuTheoDoi int

		if not exists( select * from PhieuTheoDoi ptd where MaGiaoVien=@MaGiaoVien and NgayTheoDoi=@NgayTheoDoi)
			begin
				insert into PhieuTheoDoi(MaGiaoVien,NgayTheoDoi) values (@MaGiaoVien,@NgayTheoDoi)
				
				set @maPhieuTheoDoi=( select MaPhieuTheoDoi from PhieuTheoDoi WHERE MaGiaoVien=@MaGiaoVien AND NgayTheoDoi=@NgayTheoDoi)
				insert into CT_NgayTheoDoi(MaPhieuTheoDoi, MaHocSinh, DDVang, DDAnSang,DDAnTrua) values (@maPhieuTheoDoi,@MaHocSinh,@ddVang,@ddAnSang,@ddAnTrua)	
			end
		else
			begin
				set @maPhieuTheoDoi=( select ptd.MaPhieuTheoDoi from PhieuTheoDoi ptd where MaGiaoVien=@MaGiaoVien and NgayTheoDoi=@NgayTheoDoi)
				if not exists (select * from CT_NgayTheoDoi where MaPhieuTheoDoi=@maPhieuTheoDoi and MaHocSinh=@MaHocSinh)
					begin
						insert into CT_NgayTheoDoi(MaPhieuTheoDoi, MaHocSinh, DDVang, DDAnSang,DDAnTrua) values (@maPhieuTheoDoi,@MaHocSinh,@ddVang,@ddAnSang,@ddAnTrua)	
					end
				else
					begin
						UPDATE CT_NgayTheoDoi
						SET DDVang=@ddVang,DDAnSang=@ddAnSang,DDAnTrua=@ddAnTrua
						WHERE MaPhieuTheoDoi=@maPhieuTheoDoi and MaHocSinh=@MaHocSinh
					end
			end
end	


GO
/****** Object:  StoredProcedure [dbo].[FindHocSinhInfor]    Script Date: 04/01/2018 12:37:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[FindHocSinhInfor]
(
@id varchar(20)
)
as
BEGIN
	select hs.MaHocSinh,hs.Ten as TenHocSinh,hs.NgaySinh,hs.GioiTinh,hs.DiaChi,hs.TinhTrang,hs.ChieuCao,hs.CanNang,hs.TenPhuHuynh,hs.NgaySinhPhuHuynh,hs.Sdt as SdtPhuHuynh,hs.Email as EmailPhuHuynh,hs.GhiChu,lp.MaLop,lp.TenLop,nv.TenNhanVien as TenGiaoVien,nv.Sdt as SdtGiaoVien,nv.Email as EmailGiaoVien  
                                from HocSinh hs inner join Lop lp on hs.MaLop = lp.MaLop  
                                inner join NhanVien nv on lp.MaLop = nv.MaLop  
                                inner join ChucVu cv on nv.MaChucVu = cv.MaChucVu  
                                and (cv.MaChucVu = 'GVC' or cv.MaChucVu='GVP') and hs.TrangThai = '1' and hs.MaHocSinh=@id								
END


GO
/****** Object:  StoredProcedure [dbo].[Get_Infor_TheoDoi]    Script Date: 04/01/2018 12:37:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[Get_Infor_TheoDoi]
	@MaHocSinh varchar(20),
	@date varchar(7)
AS
BEGIN	
	DECLARE @startDateString varchar(10);
	DECLARE @startDate date;
	DECLARE @endDate date;	
	set @startDateString='01/'+@date
	set @startDate=(SELECT convert(date, @startDateString, 103))
	set @endDate = DATEADD(month, 1, @startDate)

	begin
		WITH newtbl AS (
					select ct.*
					from PhieuTheoDoi ptd inner join CT_NgayTheoDoi ct on ptd.MaPhieuTheoDoi=ct.MaPhieuTheoDoi
					where ptd.NgayTheoDoi < @endDate  AND ptd.NgayTheoDoi >= @startDate
						and ct.MaHocSinh=@MaHocSinh
					)
		SELECT @date as NgayTaoPhieu,newtbl.MaHocSinh as MaHocSinh,(select COUNT(*) from newtbl where newtbl.DDVang=1) as SoNgayVang,(select COUNT(*) from newtbl where newtbl.DDAnSang=1) as SoNgayAnSang,(select COUNT(*) from newtbl where newtbl.DDAnTrua=1) as SoNgayAnTrua,0 as ChiPhi
		FROM  newtbl
		group by newtbl.MaHocSinh
	end
	
END
GO
/****** Object:  StoredProcedure [dbo].[getAll_CT_NgayTheoDoi]    Script Date: 04/01/2018 12:37:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[getAll_CT_NgayTheoDoi]
(
	@MaGiaoVien varchar(20),
	@NgayTheoDoi date
)
as
BEGIN
	select ct.* from PhieuTheoDoi ptd inner join CT_NgayTheoDoi ct on ptd.MaPhieuTheoDoi = ct.MaPhieuTheoDoi 
                where ptd.MaGiaoVien = @MaGiaoVien and ptd.NgayTheoDoi = @NgayTheoDoi	
END


GO
/****** Object:  StoredProcedure [dbo].[getAllChucVu]    Script Date: 04/01/2018 12:37:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[getAllChucVu]

as
BEGIN
	SELECT * FROM ChucVu
END


GO
/****** Object:  StoredProcedure [dbo].[getAllDichVuNgoai]    Script Date: 04/01/2018 12:37:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[getAllDichVuNgoai]
as
BEGIN
	SELECT * FROM DichVuNgoai
END


GO
/****** Object:  StoredProcedure [dbo].[getAllhocPhi]    Script Date: 04/01/2018 12:37:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[getAllhocPhi]
as
BEGIN
	SELECT * FROM HocPhi
END


GO
/****** Object:  StoredProcedure [dbo].[GetAllHocSinh]    Script Date: 04/01/2018 12:37:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[GetAllHocSinh]
as
BEGIN
	SELECT * FROM HocSinh where TrangThai=1
END


GO
/****** Object:  StoredProcedure [dbo].[GetAllHocSinhDis]    Script Date: 04/01/2018 12:37:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[GetAllHocSinhDis]
as
BEGIN
	SELECT * FROM HocSinh where TrangThai=0
END


GO
/****** Object:  StoredProcedure [dbo].[GetAllHocSinhForIdGiaoVien]    Script Date: 04/01/2018 12:37:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[GetAllHocSinhForIdGiaoVien]
(
@id varchar(20)
)
as
BEGIN
	select hs.MaHocSinh,hs.Ten,hs.NgaySinh,hs.GioiTinh,hs.DiaChi,hs.TinhTrang,hs.ChieuCao,hs.CanNang,hs.TenPhuHuynh,hs.SoCmt,hs.Sdt,hs.Email,hs.NgaySinhPhuHuynh,hs.GhiChu,hs.MaLop 
                                from(select lp.* 
                                    from NhanVien nv inner join ChucVu cv on nv.MaChucVu = cv.MaChucVu 
                                    inner join Lop lp on nv.MaLop = lp.MaLop 
                                    and (cv.MaChucVu = 'GVC' or cv.MaChucVu='GVP') and nv.MaNhanVien = @id) as lopNew inner join HocSinh hs on hs.MaLop = lopNew.MaLop;
END


GO
/****** Object:  StoredProcedure [dbo].[getAllloaiHocPhi]    Script Date: 04/01/2018 12:37:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[getAllloaiHocPhi]
as
BEGIN
	SELECT * FROM LoaiHocPhi
END


GO
/****** Object:  StoredProcedure [dbo].[getAllLop]    Script Date: 04/01/2018 12:37:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[getAllLop]

as
BEGIN
	SELECT * FROM Lop				
END


GO
/****** Object:  StoredProcedure [dbo].[GetAllNhanVien]    Script Date: 04/01/2018 12:37:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAllNhanVien]
as
BEGIN
	SELECT * FROM NhanVien where MaNhanVien!='Admin'
END


GO
/****** Object:  StoredProcedure [dbo].[getAllPhieuChiTieu]    Script Date: 04/01/2018 12:37:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[getAllPhieuChiTieu]
as
BEGIN
	SELECT * FROM PhieuChiTieu
END


GO
/****** Object:  StoredProcedure [dbo].[getChucVuForId]    Script Date: 04/01/2018 12:37:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[getChucVuForId]

@MaChucVu varchar(20)='',
@TenChucVu varchar(20)=''


as
BEGIN
	SELECT * FROM ChucVu where (MaChucVu=@MaChucVu or @MaChucVu='') and (TenChucVu=@TenChucVu OR @TenChucVu='')	
END


GO
/****** Object:  StoredProcedure [dbo].[getHocPhiDauNam]    Script Date: 04/01/2018 12:37:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[getHocPhiDauNam]
as
BEGIN
	select hp.* from HocPhi hp inner join LoaiHocPhi lhp on hp.LoaiHocphi=lhp.MaLoai and lhp.MaLoai='LoaiHocPhi-20D1'
END


GO
/****** Object:  StoredProcedure [dbo].[getHocPhiThang]    Script Date: 04/01/2018 12:37:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[getHocPhiThang]
as
BEGIN
	select hp.* from HocPhi hp inner join LoaiHocPhi lhp on hp.LoaiHocphi=lhp.MaLoai and lhp.MaLoai='LoaiHocPhi-2FAA'
END


GO
/****** Object:  StoredProcedure [dbo].[GetHocSinhForId]    Script Date: 04/01/2018 12:37:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[GetHocSinhForId]
(
@id varchar(20)
)
as
BEGIN
	SELECT * FROM HocSinh where MaHocSinh=@id
END


GO
/****** Object:  StoredProcedure [dbo].[getListDichVuNgoai_HocSinh]    Script Date: 04/01/2018 12:37:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[getListDichVuNgoai_HocSinh]
(
	@MaHocSinh varchar(20),
	@Thang varchar(7)
)
as
BEGIN
	select dv.* from DichVuNgoai dv inner join CT_DichVu_HocSinh ct on dv.MaDichVu = ct.MaDichVu  
                inner join HocSinh hs on hs.MaHocSinh = ct.MaHocSinh where hs.MaHocSinh = @MaHocSinh and ct.ThangDangKy = @Thang
END


GO
/****** Object:  StoredProcedure [dbo].[getLopForIdGiaoVien]    Script Date: 04/01/2018 12:37:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[getLopForIdGiaoVien]
	@id varchar(20)
AS
BEGIN
	(select lp.* from Lop lp 
						inner join NhanVien nv1 on nv1.MaLop=lp.MaLop 
						and (nv1.MaChucVu='GVC' or nv1.MaChucVu='GVP') 
						and nv1.MaNhanVien=@id)
END


GO
/****** Object:  StoredProcedure [dbo].[GetNhanVien]    Script Date: 04/01/2018 12:37:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[GetNhanVien]

@MaNhanVien varchar(20)='',
@TenNhanVien varchar(20)='',
@DiaChi nvarchar(100)='',
@Sdt nvarchar(20)='',
@Email nvarchar(50)='',
@MaChucVu varchar(20)='',
@MaLop varchar(20)=''
as
BEGIN
	SELECT * FROM NhanVien where (MaNhanVien=@MaNhanVien or @MaNhanVien='')and (TenNhanVien like @TenNhanVien or @TenNhanVien='')
	and (DiaChi=@DiaChi or @DiaChi='') and (Sdt=@Sdt or @Sdt='') and(MaChucVu=@MaChucVu or @MaChucVu='') and (MaLop=@MaLop or @MaLop='')
END

GO
/****** Object:  StoredProcedure [dbo].[getNhanVienLogin]    Script Date: 04/01/2018 12:37:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[getNhanVienLogin]
(
	@email nvarchar(50),
	@password nvarchar(50)
)
as
BEGIN
	SELECT * FROM NhanVien where Email=@email and Password=@password
END


GO
/****** Object:  StoredProcedure [dbo].[GetPhieuThu]    Script Date: 04/01/2018 12:37:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetPhieuThu]
	@MaHocSinh varchar(20),
	@date varchar(7)
AS
BEGIN	
	select * from PhieuThu where MaHocSinh=@MaHocSinh and @date=NgayTaoPhieu
	
END
GO
/****** Object:  StoredProcedure [dbo].[GetPhieuThuForIdHocSinh]    Script Date: 04/01/2018 12:37:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetPhieuThuForIdHocSinh]
	@MaHocSinh varchar(20),
	@MaNhanVien varchar(20),
	@date varchar(7)
AS
BEGIN	
	DECLARE @startDateString varchar(10);
	DECLARE @startDate date;
	DECLARE @endDate date;	
	set @startDateString='01/'+@date
	set @startDate=(SELECT convert(date, @startDateString, 103))
	set @endDate = DATEADD(month, 1, @startDate)

	begin
		WITH newtbl AS (
					select ct.*
					from PhieuTheoDoi ptd inner join CT_NgayTheoDoi ct on ptd.MaPhieuTheoDoi=ct.MaPhieuTheoDoi
					where ptd.NgayTheoDoi < @endDate  AND ptd.NgayTheoDoi >= @startDate
						and ct.MaHocSinh=@MaHocSinh
					)
		SELECT @date as NgayTaoPhieu,newtbl.MaHocSinh as MaHocSinh,@MaNhanVien as MaNhanVien,(select COUNT(*) from newtbl where newtbl.DDVang=1) as SoNgayVang,(select COUNT(*) from newtbl where newtbl.DDAnSang=1) as SoNgayAnSang,(select COUNT(*) from newtbl where newtbl.DDAnTrua=1) as SoNgayAnTrua,0 as ChiPhi
		FROM  newtbl
		group by newtbl.MaHocSinh
	end
	
END

GO
/****** Object:  StoredProcedure [dbo].[Insert_Ct_phieuThu_hocSinh]    Script Date: 04/01/2018 12:37:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Insert_Ct_phieuThu_hocSinh]
	@MaCT_PhieuThu_HocSinh varchar(20),
	@TenLoaiPhi nvarchar(50),
	@SoLuong int,
	@ChiPhi money,
	@MaPhieuThu varchar(20)
AS
BEGIN
	insert into CT_PhieuThu_HocSinh 
	values(@MaCT_PhieuThu_HocSinh,@TenLoaiPhi,@SoLuong,@ChiPhi,@MaPhieuThu)
END


GO
/****** Object:  StoredProcedure [dbo].[InsertChucVu]    Script Date: 04/01/2018 12:37:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[InsertChucVu]

@MaChucVu varchar(20),
@TenChucVu varchar(20)
as
BEGIN
	insert into ChucVu values(@MaChucVu,@TenChucVu)
END


GO
/****** Object:  StoredProcedure [dbo].[InsertDichVu_HocSinh]    Script Date: 04/01/2018 12:37:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[InsertDichVu_HocSinh]
(    
@MaCT_DV_HS varchar(20),    
@MaDichVu varchar(20),    
@MaHocSinh varchar(50),   
@thang varchar(7)
)    
As    
Begin
	if(not exists (select MaCT_DV_HS from CT_DichVu_HocSinh where MaDichVu=@MaDichVu and MaHocSinh=@MaHocSinh and ThangDangKy=@thang))
	begin
		Insert into CT_DichVu_HocSinh(MaCT_DV_HS,MaDichVu,MaHocSinh,ThangDangKy) values(@MaCT_DV_HS,@MaDichVu,@MaHocSinh,@thang);
	end
End  
  

GO
/****** Object:  StoredProcedure [dbo].[InsertPhieuThu]    Script Date: 04/01/2018 12:37:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertPhieuThu]
	@MaPhieuThu varchar(20),
	@NgayTaoPhieu varchar(7),
	@MaHocSinh varchar(20),
	@MaNhanVien varchar(20),
	@GhiChu varchar(100)
AS
BEGIN
	insert into PhieuThu values(@MaPhieuThu,@NgayTaoPhieu,@MaHocSinh,@MaNhanVien,@GhiChu)
END


GO
/****** Object:  StoredProcedure [dbo].[InsertUpdateDichVuNgoai]    Script Date: 04/01/2018 12:37:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[InsertUpdateDichVuNgoai]
(    
@MaDichVu varchar(20),    
@TenDV nvarchar(50),   
@ChiPhi money,
@GhiChu nvarchar(100),
@Action varchar(10)
)    
As    
Begin    
if @Action='Insert'
Begin    
 Insert into DichVuNgoai(MaDichVu,TenDV,ChiPhi,GhiChu) values(@MaDichVu,@TenDV,@ChiPhi,@GhiChu);
End    
if @Action='Update'    
Begin    
 Update DichVuNgoai set TenDV=@TenDV,ChiPhi=@ChiPhi,GhiChu=@GhiChu where MaDichVu=@MaDichVu    
End    
End  
  

GO
/****** Object:  StoredProcedure [dbo].[InsertUpdateHocPhi]    Script Date: 04/01/2018 12:37:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[InsertUpdateHocPhi]
(    
@MaHocPhi varchar(20),    
@TenHocPhi nvarchar(50),   
@ChiPhi money,  
@GhiChu nvarchar(50),   
@LoaiHocPhi varchar(20) ,
@Action varchar(10)
)    
As    
Begin    
if @Action='Insert'
Begin    
 Insert into HocPhi(MaHocPhi,TenHocPhi,ChiPhi,GhiChu,LoaiHocphi) values(@MaHocPhi,@TenHocPhi,@ChiPhi,@GhiChu,@LoaiHocPhi);    
End    
if @Action='Update'    
Begin    
 Update HocPhi set TenHocPhi=@TenHocPhi,ChiPhi=@ChiPhi,GhiChu=@GhiChu,LoaiHocPhi=@LoaiHocPhi where MaHocPhi=@MaHocPhi    
End    
End  
  

GO
/****** Object:  StoredProcedure [dbo].[InsertUpdateHocSinh]    Script Date: 04/01/2018 12:37:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[InsertUpdateHocSinh]
(    
	@MaHocSinh   varchar(20)     ,
	@Ten   nvarchar (50)    ,
	@NgaySinh   date     ,
	@GioiTinh   nvarchar (5)  ,
	@DiaChi   nvarchar (200)    ,
	@TinhTrang   nvarchar (50)  ,
	@ChieuCao   int   ,
	@CanNang   int   ,
	@TenPhuHuynh   nvarchar (50)  ,
	@SoCmt   nvarchar (50)  ,
	@Sdt   nvarchar (50)  ,
	@Email   nvarchar (50)  ,
	@NgaySinhPhuHuynh   date   ,
	@GhiChu   nvarchar (50)  ,
	@MaLop   varchar (20)  ,
	@DoiTuongMta bit,
	@TrangThai   bit    ,
	@Action varchar(10)
)    
As    
Begin    
if @Action='Insert'
Begin    
 Insert into HocSinh(MaHocSinh,Ten, NgaySinh, GioiTinh , DiaChi , TinhTrang , ChieuCao , CanNang , TenPhuHuynh , SoCmt , Sdt , Email , NgaySinhPhuHuynh , GhiChu , MaLop ,DoiTuongMta, TrangThai) values(@MaHocSinh,@Ten, @NgaySinh, @GioiTinh , @DiaChi , @TinhTrang , @ChieuCao , @CanNang , @TenPhuHuynh , @SoCmt , @Sdt , @Email , @NgaySinhPhuHuynh , @GhiChu , @MaLop ,@DoiTuongMta, @TrangThai);    
End    
if @Action='Update'    
Begin    
 Update HocSinh set Ten=@Ten,NgaySinh=@NgaySinh,GioiTinh=@GioiTinh,DiaChi=@DiaChi,TinhTrang=@TinhTrang,ChieuCao=@ChieuCao,CanNang=@CanNang,TenPhuHuynh=@TenPhuHuynh,SoCmt=@SoCmt,Sdt=@Sdt,Email=@Email,NgaySinhPhuHuynh=@NgaySinhPhuHuynh,GhiChu=@GhiChu,MaLop=@MaLop,DoiTuongMta=@DoiTuongMta,TrangThai=@TrangThai
  where MaHocSinh=@MaHocSinh    
End      
End  
  

GO
/****** Object:  StoredProcedure [dbo].[InsertUpdateLoaiHocPhi]    Script Date: 04/01/2018 12:37:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[InsertUpdateLoaiHocPhi]
(    
@MaLoai varchar(20),    
@TenLoai nvarchar(50),   
@GhiChu nvarchar(100),
@Action varchar(10)
)    
As    
Begin    
if @Action='Insert'
Begin    
 Insert into LoaiHocPhi(MaLoai,TenLoai,GhiChu) values(@MaLoai,@TenLoai,@GhiChu);    
End    
if @Action='Update'    
Begin    
 Update LoaiHocPhi set TenLoai=@TenLoai,GhiChu=@GhiChu where MaLoai=@MaLoai    
End    
End  
  

GO
/****** Object:  StoredProcedure [dbo].[InsertUpdateLop]    Script Date: 04/01/2018 12:37:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[InsertUpdateLop]
(    
@MaLop varchar(20),    
@TenLop nvarchar(50),   
@GhiChu nvarchar(50),  
@SiSo int,    
@Action varchar(10)
)    
As    
Begin    
if @Action='Insert'
Begin    
 Insert into Lop(MaLop,TenLop,GhiChu,SiSo) values(@MaLop,@TenLop,@GhiChu,@SiSo);    
End    
if @Action='Update'    
Begin    
 Update Lop set TenLop=@TenLop,GhiChu=@GhiChu,SiSo=@SiSo where MaLop=@MaLop    
End    
End  
  

GO
/****** Object:  StoredProcedure [dbo].[InsertUpdateNhanVien]    Script Date: 04/01/2018 12:37:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[InsertUpdateNhanVien]
(    
@MaNhanVien varchar(20),    
@TenNhanVien nvarchar(50),    
@DiaChi nvarchar(200),    
@Sdt nvarchar(50),    
@Email nvarchar(50),    
@MaChucVu varchar(10),
@MaLop varchar(20),
@Password nvarchar(50),
@Action varchar(10)
)    
As    
Begin
if(@MaChucVu!='GVC' and @MaChucVu !='GVP')
	begin
		set @MaLop=null
	end	
if @Action='Insert'
Begin  	
	Insert into NhanVien(MaNhanVien,TenNhanVien,DiaChi,Sdt,Email,MaChucVu,MaLop,Password) values(@MaNhanVien,@TenNhanVien,@DiaChi,@Sdt,@Email,@MaChucVu,@MaLop,@Password);    			
End    
if @Action='Update'    
Begin    
 Update NhanVien set TenNhanVien=@TenNhanVien,DiaChi=@DiaChi,Sdt=@Sdt,Email=@Email,MaChucVu=@MaChucVu,MaLop=@MaLop,Password=@Password where MaNhanVien=@MaNhanVien    
End      
End  
  

GO
/****** Object:  StoredProcedure [dbo].[InsertUpdatePhieuChiTieu]    Script Date: 04/01/2018 12:37:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[InsertUpdatePhieuChiTieu]
(    
@MaPhieuChiTieu varchar(20),    
@NgayTaoPhieu date,   
@MaNhanVien varchar(20),  
@TenNguoiChi nvarchar(100),    
@LyDo nvarchar(100),  
@ChiPhi money, 
@ChungTu nvarchar(50), 
@Action varchar(10)
)    
As    
Begin    
if @Action='Insert'
Begin    
 Insert into PhieuChiTieu(MaPhieuChiTieu,MaNhanVien,TenNguoiChi,LyDo,ChiPhi,ChungTu) 
 values(@MaPhieuChiTieu,@MaNhanVien,@TenNguoiChi,@LyDo,@ChiPhi,@ChungTu) ;    
End    
if @Action='Update'    
Begin    
 Update PhieuChiTieu set MaNhanVien=@MaNhanVien,TenNguoiChi=@TenNguoiChi,LyDo=@LyDo,ChiPhi=@ChiPhi,ChungTu=@ChungTu
  where MaPhieuChiTieu=@MaPhieuChiTieu    
End    
End  
  

GO
/****** Object:  StoredProcedure [dbo].[sp_Ct_DichVu_HocSinh_NewID]    Script Date: 04/01/2018 12:37:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_Ct_DichVu_HocSinh_NewID]
AS
BEGIN
	declare @ma_next varchar(15)
	set @ma_next ='CT_DV_HS-'+LEFT(NEWID(),6)
	while(exists(select MaCT_DV_HS from CT_DichVu_HocSinh where MaCT_DV_HS=@ma_next))
	begin
		set @ma_next='CT_DV_HS-'+left(NEWID(),6)
	end
	select @ma_next as MaCT_DV_HS
END


GO
/****** Object:  StoredProcedure [dbo].[sp_CT_PhieuThu_HocSinh_NewID]    Script Date: 04/01/2018 12:37:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_CT_PhieuThu_HocSinh_NewID]
AS
BEGIN
	declare @ma_next varchar(13)
	set @ma_next ='Ct_pt_hs-'+LEFT(NEWID(),4)
	while(exists(select MaCT_PhieuThu_HocSinh from CT_PhieuThu_HocSinh where MaCT_PhieuThu_HocSinh=@ma_next))
	begin
		set @ma_next='Ct_pt_hs-'+left(NEWID(),4)
	end
	select @ma_next as MaCT_PhieuThu_HocSinh
END


GO
/****** Object:  StoredProcedure [dbo].[sp_CheckExitsGiaoVien]    Script Date: 04/01/2018 12:37:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_CheckExitsGiaoVien]
	@Id varchar(20)
AS
BEGIN
	select * from NhanVien where MaNhanVien=@Id and (MaChucVu='GVC' or MaChucVu='GVP')
END


GO
/****** Object:  StoredProcedure [dbo].[sp_DichVuNgoai_NewID]    Script Date: 04/01/2018 12:37:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DichVuNgoai_NewID]
AS
BEGIN
	declare @ma_next varchar(6)
	set @ma_next ='DV-'+LEFT(NEWID(),3)
	while(exists(select MaDichVu from DichVuNgoai where MaDichVu=@ma_next))
	begin
		set @ma_next='DV-'+left(NEWID(),3)
	end
	select @ma_next as MaDichVu
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetInfoGiaoVienChuNhiem]    Script Date: 04/01/2018 12:37:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_GetInfoGiaoVienChuNhiem]
	@id varchar(20)
AS
BEGIN
	select nv.MaNhanVien as MaGiaoVien,nv.TenNhanVien as TenGiaoVien,cv.MaChucVu,cv.TenChucVu,lp.MaLop,lp.TenLop,lp.SiSo,nv.DiaChi,nv.Sdt,nv.Email 
                                from(select lp.* from Lop lp 
										inner join NhanVien nv1 on nv1.MaLop=lp.MaLop 
										and (nv1.MaChucVu='GVC' or nv1.MaChucVu='GVP') 
										and nv1.MaNhanVien=@id) lopnew inner join NhanVien nv on nv.MaLop=lopnew.MaLop
										inner join ChucVu cv on nv.MaChucVu = cv.MaChucVu 
										inner join Lop lp on nv.MaLop = lp.MaLop 
										and cv.MaChucVu = 'GVC'
END


GO
/****** Object:  StoredProcedure [dbo].[sp_GetListGVForIdLogin]    Script Date: 04/01/2018 12:37:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetListGVForIdLogin]
	@Id varchar(20)
AS
BEGIN
	select nv.MaNhanVien as MaGiaoVien,nv.TenNhanVien as TenGiaoVien,cv.MaChucVu,cv.TenChucVu,lopNew.MaLop,lopNew.TenLop,lopNew.SiSo,nv.DiaChi,nv.Sdt,nv.Email 
                from (select lp.* from Lop lp 
						inner join NhanVien nv1 on nv1.MaLop=lp.MaLop 
						and (nv1.MaChucVu='GVC' or nv1.MaChucVu='GVP') 
						and nv1.MaNhanVien=@Id) lopnew inner join NhanVien nv on nv.MaLop = lopNew.MaLop 
                        inner join ChucVu cv on cv.MaChucVu = nv.MaChucVu
						and (nv.MaChucVu='GVC' or nv.MaChucVu='GVP');
END


GO
/****** Object:  StoredProcedure [dbo].[sp_GetQuyenNhanVien]    Script Date: 04/01/2018 12:37:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetQuyenNhanVien]
	@id varchar(10)
AS
BEGIN
	select q.MaQuyen from NhanVien nv inner join ChucVu cv on nv.MaChucVu = cv.MaChucVu 
                inner join Quyen_ChucVu qc on cv.MaChucVu = qc.MaChucVu 
                inner join Quyen q on qc.MaQuyen = q.MaQuyen 
                and nv.MaNhanVien = @id
END


GO
/****** Object:  StoredProcedure [dbo].[sp_HocPhi_NewID]    Script Date: 04/01/2018 12:37:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_HocPhi_NewID]
AS
BEGIN
	declare @ma_next varchar(10)
	set @ma_next ='HocPhi-'+LEFT(NEWID(),4)
	while(exists(select MaHocPhi from HocPhi where MaHocPhi=@ma_next))
	begin
		set @ma_next='HocPhi-'+left(NEWID(),4)
	end
	select @ma_next as MaHocPhi
END


GO
/****** Object:  StoredProcedure [dbo].[sp_HocSinh_NewID]    Script Date: 04/01/2018 12:37:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_HocSinh_NewID]
AS
BEGIN
	declare @ma_next varchar(6)
	set @ma_next ='HS-'+LEFT(NEWID(),4)
	while(exists(select MaHocSinh from HocSinh where MaHocSinh=@ma_next))
	begin
		set @ma_next='HS-'+left(NEWID(),4)
	end
	select @ma_next as MaHocSinh
END


GO
/****** Object:  StoredProcedure [dbo].[sp_LoaiHocPhi_NewID]    Script Date: 04/01/2018 12:37:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_LoaiHocPhi_NewID]
AS
BEGIN
	declare @ma_next varchar(15)
	set @ma_next ='LoaiHocPhi-'+LEFT(NEWID(),4)
	while(exists(select MaLoai from LoaiHocPhi where MaLoai=@ma_next))
	begin
		set @ma_next='LoaiHocPhi-'+left(NEWID(),4)
	end
	select @ma_next as MaLoai
END


GO
/****** Object:  StoredProcedure [dbo].[sp_Lop_NewID]    Script Date: 04/01/2018 12:37:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_Lop_NewID]
AS
BEGIN
	declare @ma_next varchar(6)
	set @ma_next ='Lop-'+LEFT(NEWID(),2)
	while(exists(select MaLop from Lop where MaLop=@ma_next))
	begin
		set @ma_next='Lop-'+left(NEWID(),2)
	end
	select @ma_next as MaHocSinh
END


GO
/****** Object:  StoredProcedure [dbo].[sp_NhanVien_NewID]    Script Date: 04/01/2018 12:37:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_NhanVien_NewID]
AS
BEGIN
	declare @ma_next varchar(6)
	set @ma_next ='NV-'+LEFT(NEWID(),4)
	while(exists(select MaNhanVien from NhanVien where MaNhanVien=@ma_next))
	begin
		set @ma_next='NV-'+left(NEWID(),4)
	end
	select @ma_next as MaNhanVien
END


GO
/****** Object:  StoredProcedure [dbo].[sp_PhieuChiTieu_NewID]    Script Date: 04/01/2018 12:37:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_PhieuChiTieu_NewID]
AS
BEGIN
	declare @ma_next varchar(12)
	set @ma_next ='ChiTieu-'+LEFT(NEWID(),4)
	while(exists(select MaPhieuChiTieu from PhieuChiTieu where MaPhieuChiTieu=@ma_next))
	begin
		set @ma_next='ChiTieu-'+left(NEWID(),4)
	end
	select @ma_next as MaPhieuThu
END


GO
/****** Object:  StoredProcedure [dbo].[sp_PhieuThu_NewID]    Script Date: 04/01/2018 12:37:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_PhieuThu_NewID]
AS
BEGIN
	declare @ma_next varchar(12)
	set @ma_next ='PhieuThu-'+LEFT(NEWID(),3)
	while(exists(select MaPhieuThu from PhieuThu where MaPhieuThu=@ma_next))
	begin
		set @ma_next='PhieuThu-'+left(NEWID(),3)
	end
	select @ma_next as MaPhieuThu
END


GO
/****** Object:  StoredProcedure [dbo].[UpdateChucVu]    Script Date: 04/01/2018 12:37:39 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
create PROCEDURE [dbo].[UpdateChucVu]

@MaChucVu varchar(20),
@TenChucVu varchar(20)
as
BEGIN
	update ChucVu set TenChucVu=@TenChucVu where MaChucVu=@MaChucVu
END

GO
USE [master]
GO
ALTER DATABASE [QLMamNon] SET  READ_WRITE 
GO
