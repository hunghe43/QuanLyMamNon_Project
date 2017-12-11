USE [QLMamNon]
GO
/****** Object:  Table [dbo].[ChucVu]    Script Date: 2017/12/11 16:19:41 ******/
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
/****** Object:  Table [dbo].[CT_DichVu_HocSinh]    Script Date: 2017/12/11 16:19:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CT_DichVu_HocSinh](
	[MaHocSinh] [varchar](20) NOT NULL,
	[MaDichVu] [varchar](20) NOT NULL,
	[ThangDangKy] [varchar](7) NULL,
 CONSTRAINT [PK_CT_DichVu_HocSinh] PRIMARY KEY CLUSTERED 
(
	[MaHocSinh] ASC,
	[MaDichVu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CT_NgayTheoDoi]    Script Date: 2017/12/11 16:19:41 ******/
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
/****** Object:  Table [dbo].[DichVuNgoai]    Script Date: 2017/12/11 16:19:41 ******/
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
/****** Object:  Table [dbo].[HocPhi]    Script Date: 2017/12/11 16:19:41 ******/
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
/****** Object:  Table [dbo].[HocSinh]    Script Date: 2017/12/11 16:19:41 ******/
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
	[TrangThai] [bit] NULL CONSTRAINT [DF_HocSinh_TrangThai]  DEFAULT ((0)),
 CONSTRAINT [PK_HocSinh] PRIMARY KEY CLUSTERED 
(
	[MaHocSinh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoaiHocPhi]    Script Date: 2017/12/11 16:19:41 ******/
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
/****** Object:  Table [dbo].[Lop]    Script Date: 2017/12/11 16:19:41 ******/
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
/****** Object:  Table [dbo].[NhanVien]    Script Date: 2017/12/11 16:19:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNhanVien] [varchar](10) NOT NULL CONSTRAINT [DF_NhanVien_MaNhanVien]  DEFAULT ('DBO.AUTO_IDNhanVien'),
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
/****** Object:  Table [dbo].[PhieuChiTieu]    Script Date: 2017/12/11 16:19:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PhieuChiTieu](
	[MaPhieuChiTieu] [varchar](20) NOT NULL,
	[NgayTaoPhieu] [date] NULL,
	[MaNhanVien] [nchar](10) NULL,
 CONSTRAINT [PK_PhieuChiTieu] PRIMARY KEY CLUSTERED 
(
	[MaPhieuChiTieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PhieuTheoDoi]    Script Date: 2017/12/11 16:19:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PhieuTheoDoi](
	[MaPhieuTheoDoi] [int] IDENTITY(1,1) NOT NULL,
	[MaGiaoVien] [varchar](10) NOT NULL,
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
/****** Object:  Table [dbo].[PhieuThu]    Script Date: 2017/12/11 16:19:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PhieuThu](
	[NgayTaoPhieu] [varchar](7) NULL,
	[MaHocSinh] [varchar](20) NOT NULL,
	[MaNhanVien] [varchar](10) NOT NULL,
	[SoNgayVang] [int] NOT NULL CONSTRAINT [DF_PhieuThu_SoNgayVang]  DEFAULT ((0)),
	[SoNgayAnSang] [int] NOT NULL CONSTRAINT [DF_PhieuThu_SoNgayAnSang]  DEFAULT ((0)),
	[SoNgayAnTrua] [int] NOT NULL CONSTRAINT [DF_PhieuThu_SoNgayAnTrua]  DEFAULT ((0)),
	[ChiPhi] [money] NOT NULL CONSTRAINT [DF_PhieuThu_ChiPhi]  DEFAULT ((0)),
 CONSTRAINT [PK_PhieuThu] PRIMARY KEY CLUSTERED 
(
	[MaHocSinh] ASC,
	[MaNhanVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Quyen]    Script Date: 2017/12/11 16:19:41 ******/
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
/****** Object:  Table [dbo].[Quyen_ChucVu]    Script Date: 2017/12/11 16:19:41 ******/
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
INSERT [dbo].[ChucVu] ([MaChucVu], [TenChucVu]) VALUES (N'ADMIN', N'SupperAdmin')
INSERT [dbo].[ChucVu] ([MaChucVu], [TenChucVu]) VALUES (N'GVC', N'Giáo viên chính')
INSERT [dbo].[ChucVu] ([MaChucVu], [TenChucVu]) VALUES (N'GVP', N'Giáo viên phụ')
INSERT [dbo].[ChucVu] ([MaChucVu], [TenChucVu]) VALUES (N'KETOAN', N'kế toán')
INSERT [dbo].[ChucVu] ([MaChucVu], [TenChucVu]) VALUES (N'TONUOI', N'Tổ nuôi')
INSERT [dbo].[CT_DichVu_HocSinh] ([MaHocSinh], [MaDichVu], [ThangDangKy]) VALUES (N'1', N'1', N'11/2017')
INSERT [dbo].[CT_DichVu_HocSinh] ([MaHocSinh], [MaDichVu], [ThangDangKy]) VALUES (N'1', N'2', N'11/2017')
INSERT [dbo].[CT_DichVu_HocSinh] ([MaHocSinh], [MaDichVu], [ThangDangKy]) VALUES (N'2', N'1', NULL)
INSERT [dbo].[CT_DichVu_HocSinh] ([MaHocSinh], [MaDichVu], [ThangDangKy]) VALUES (N'2', N'2', NULL)
INSERT [dbo].[CT_DichVu_HocSinh] ([MaHocSinh], [MaDichVu], [ThangDangKy]) VALUES (N'2', N'3', NULL)
INSERT [dbo].[CT_DichVu_HocSinh] ([MaHocSinh], [MaDichVu], [ThangDangKy]) VALUES (N'4', N'1', NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (35, N'1', 1, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (35, N'2', 0, 0, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (35, N'3', 1, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (35, N'4', 0, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (35, N'5', 0, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (36, N'1', 0, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (36, N'2', 0, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (36, N'3', 0, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (36, N'4', 0, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (36, N'5', 0, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (37, N'1', 0, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (37, N'2', 0, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (37, N'3', 0, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (37, N'4', 0, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (37, N'5', 0, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (38, N'1', 1, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (38, N'2', 1, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (38, N'3', 1, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (38, N'4', 1, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (38, N'5', 1, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (39, N'1', 1, 1, 1, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (39, N'2', 0, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (39, N'3', 0, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (39, N'4', 0, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (39, N'5', 0, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (40, N'1', 1, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (40, N'2', 0, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (40, N'3', 1, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (40, N'4', 0, 1, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (40, N'5', 0, 1, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (41, N'1', 0, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (41, N'2', 0, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (41, N'3', 1, 1, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (41, N'4', 1, 1, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (41, N'5', 1, 1, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (42, N'1', 1, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (42, N'2', 1, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (42, N'3', 1, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (42, N'4', 1, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (42, N'5', 0, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (43, N'1', 1, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (43, N'2', 1, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (43, N'3', 1, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (43, N'4', 1, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (43, N'5', 1, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (44, N'1', 1, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (44, N'2', 1, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (44, N'3', 1, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (44, N'4', 0, 0, 0, NULL, NULL)
INSERT [dbo].[CT_NgayTheoDoi] ([MaPhieuTheoDoi], [MaHocSinh], [DDVang], [DDAnSang], [DDAnTrua], [GhiChu], [ChiPhi]) VALUES (44, N'5', 0, 0, 0, NULL, NULL)
INSERT [dbo].[DichVuNgoai] ([MaDichVu], [TenDV], [ChiPhi], [GhiChu]) VALUES (N'1', N'Môn tạo hình', 0.0000, N'tính theo tháng abc')
INSERT [dbo].[DichVuNgoai] ([MaDichVu], [TenDV], [ChiPhi], [GhiChu]) VALUES (N'2', N'Môn vẽ', 0.0000, N'tính theo tháng')
INSERT [dbo].[DichVuNgoai] ([MaDichVu], [TenDV], [ChiPhi], [GhiChu]) VALUES (N'3', N'Môn tiếng Anh', 0.0000, N'tính theo tháng')
INSERT [dbo].[DichVuNgoai] ([MaDichVu], [TenDV], [ChiPhi], [GhiChu]) VALUES (N'4', N'Môn aerobics', 0.0000, N'tính theo tháng')
INSERT [dbo].[DichVuNgoai] ([MaDichVu], [TenDV], [ChiPhi], [GhiChu]) VALUES (N'5', N'Học thêm thứ 7', 0.0000, N'tính theo ngày')
INSERT [dbo].[DichVuNgoai] ([MaDichVu], [TenDV], [ChiPhi], [GhiChu]) VALUES (N'DV-837', N'Học thêm thứ 7', 100.0000, N'tính theo ngày')
INSERT [dbo].[HocPhi] ([MaHocPhi], [TenHocPhi], [ChiPhi], [GhiChu], [LoaiHocphi]) VALUES (N'asd', N'asd', 22.0000, NULL, N'LoaiHocPhi-20D1')
INSERT [dbo].[HocPhi] ([MaHocPhi], [TenHocPhi], [ChiPhi], [GhiChu], [LoaiHocphi]) VALUES (N'DV-837', N'Học thêm thứ 7', 100.0000, N'tính theo ngày', NULL)
INSERT [dbo].[HocPhi] ([MaHocPhi], [TenHocPhi], [ChiPhi], [GhiChu], [LoaiHocphi]) VALUES (N'DV-8B4', N'học thêm thứ 7', 100.0000, N'tính theo ngày', NULL)
INSERT [dbo].[HocPhi] ([MaHocPhi], [TenHocPhi], [ChiPhi], [GhiChu], [LoaiHocphi]) VALUES (N'HocPhi-02F', N'tiền ăn sáng', 120000.0000, N'mau phiếu', NULL)
INSERT [dbo].[HocPhi] ([MaHocPhi], [TenHocPhi], [ChiPhi], [GhiChu], [LoaiHocphi]) VALUES (N'HocPhi-3C6', N'mới 1', 1.0000, NULL, N'LoaiHocPhi-20D1')
INSERT [dbo].[HocPhi] ([MaHocPhi], [TenHocPhi], [ChiPhi], [GhiChu], [LoaiHocphi]) VALUES (N'HocPhi-9BF', N'mới', 2.0000, NULL, N'LoaiHocPhi-20D1')
INSERT [dbo].[HocPhi] ([MaHocPhi], [TenHocPhi], [ChiPhi], [GhiChu], [LoaiHocphi]) VALUES (N'HocPhi-F48', N'asdasd', 123.0000, NULL, N'LoaiHocPhi-472E')
INSERT [dbo].[HocPhi] ([MaHocPhi], [TenHocPhi], [ChiPhi], [GhiChu], [LoaiHocphi]) VALUES (N'Lop-82', N'lớp mới', 0.0000, N'giá 10000', NULL)
INSERT [dbo].[HocPhi] ([MaHocPhi], [TenHocPhi], [ChiPhi], [GhiChu], [LoaiHocphi]) VALUES (N'MGB', N'Học phí lớp mẫu giáo bé', 20000.0000, NULL, NULL)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [TrangThai]) VALUES (N'1', N'hung1', CAST(N'1994-01-12' AS Date), N'Nữ', N'43 trần nhật duật, phường nam ngạn , thành phố thanh hóa', NULL, 75, 30, N'sdfgsdf', N'173363724', N'01676983088', N'hungth11b@gmail', CAST(N'1996-11-02' AS Date), NULL, NULL, 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [TrangThai]) VALUES (N'2', N'hung2', CAST(N'2017-12-31' AS Date), N'Nam', N'jkhkj', NULL, NULL, NULL, NULL, N'87686', N'87687', N'hung@gd.com', CAST(N'2017-12-31' AS Date), NULL, N'BE', 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [TrangThai]) VALUES (N'3', N'hung3', CAST(N'2017-12-31' AS Date), N'Nam', N'jkhkj', NULL, NULL, NULL, NULL, N'87686', N'87687', N'hung@gd.com', CAST(N'2017-12-31' AS Date), NULL, N'BE', 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [TrangThai]) VALUES (N'4', N'hung4', CAST(N'2017-12-31' AS Date), N'Nam', N'jkhkj', NULL, NULL, NULL, NULL, N'87686', N'87687', N'hung@gd.com', CAST(N'2017-12-31' AS Date), NULL, N'BE', 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [TrangThai]) VALUES (N'5', N'hung5', CAST(N'2017-12-31' AS Date), N'Nam', N'jkhkj', NULL, NULL, NULL, NULL, N'87686', N'87687', N'hung@gd.com', CAST(N'2017-12-31' AS Date), NULL, N'BE', 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [TrangThai]) VALUES (N'6', N'hung6', CAST(N'2017-12-31' AS Date), N'Nam', N'jkhkj', NULL, NULL, NULL, NULL, N'87686', N'87687', N'hung@gd.com', CAST(N'2017-12-31' AS Date), NULL, N'MGLA', 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [TrangThai]) VALUES (N'7', N'hung7', CAST(N'2017-12-31' AS Date), N'Nam', N'jkhkj', NULL, NULL, NULL, NULL, N'87686', N'87687', N'hung@gd.com', CAST(N'2017-12-31' AS Date), NULL, N'MGLA', 1)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [TrangThai]) VALUES (N'8', N'hung8', CAST(N'2017-12-31' AS Date), N'Nam', N'jkhkj', NULL, 0, 0, N'asdsad', N'87686', N'123123123', N'hung@gd.com', CAST(N'2017-12-31' AS Date), NULL, N'MGNB', 0)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [TrangThai]) VALUES (N'9', N'hung89', CAST(N'2017-12-31' AS Date), N'Nam', N'jkhkj', NULL, NULL, NULL, NULL, N'87686', N'87687', N'hung@gd.com', CAST(N'2017-12-31' AS Date), NULL, NULL, 0)
INSERT [dbo].[HocSinh] ([MaHocSinh], [Ten], [NgaySinh], [GioiTinh], [DiaChi], [TinhTrang], [ChieuCao], [CanNang], [TenPhuHuynh], [SoCmt], [Sdt], [Email], [NgaySinhPhuHuynh], [GhiChu], [MaLop], [TrangThai]) VALUES (N'HS-8CC', N'hung2', CAST(N'2017-12-31' AS Date), N'Nam', N'ádas', NULL, -2, 0, N'nguyễn văn thiên', N'123123', N'01676983088', N'hung@gmaia.com', CAST(N'2017-11-01' AS Date), NULL, N'BE', 0)
INSERT [dbo].[LoaiHocPhi] ([MaLoai], [TenLoai], [GhiChu]) VALUES (N'LoaiHocPhi-20D1', N'asdasd', NULL)
INSERT [dbo].[LoaiHocPhi] ([MaLoai], [TenLoai], [GhiChu]) VALUES (N'LoaiHocPhi-2FAA', N'Đóng theo tháng', N'bắt buộc')
INSERT [dbo].[LoaiHocPhi] ([MaLoai], [TenLoai], [GhiChu]) VALUES (N'LoaiHocPhi-472E', N'Đóng theo tháng', N'bắt buộcasdasdasdasdasd')
INSERT [dbo].[Lop] ([MaLop], [TenLop], [GhiChu], [SiSo]) VALUES (N'BE', N'Mẫu giáo bé', NULL, NULL)
INSERT [dbo].[Lop] ([MaLop], [TenLop], [GhiChu], [SiSo]) VALUES (N'Lop-7D', N'sdv', NULL, NULL)
INSERT [dbo].[Lop] ([MaLop], [TenLop], [GhiChu], [SiSo]) VALUES (N'Lop-82', N'lớp mới', N'giá 10000', 12)
INSERT [dbo].[Lop] ([MaLop], [TenLop], [GhiChu], [SiSo]) VALUES (N'Lop-D5', N'fgh', NULL, NULL)
INSERT [dbo].[Lop] ([MaLop], [TenLop], [GhiChu], [SiSo]) VALUES (N'MGLA', N'Mẫu giáo lớn A', NULL, NULL)
INSERT [dbo].[Lop] ([MaLop], [TenLop], [GhiChu], [SiSo]) VALUES (N'MGLB', N'Mẫu giáo lớn B', NULL, NULL)
INSERT [dbo].[Lop] ([MaLop], [TenLop], [GhiChu], [SiSo]) VALUES (N'MGNA', N'Mẫu giáo nhỡ A', NULL, NULL)
INSERT [dbo].[Lop] ([MaLop], [TenLop], [GhiChu], [SiSo]) VALUES (N'MGNB', N'Mẫu giáo nhỡ B', NULL, NULL)
INSERT [dbo].[Lop] ([MaLop], [TenLop], [GhiChu], [SiSo]) VALUES (N'NHATREA', N'Lớp trẻ A ', NULL, NULL)
INSERT [dbo].[Lop] ([MaLop], [TenLop], [GhiChu], [SiSo]) VALUES (N'NHATREB', N'Lớp trẻ B ', NULL, NULL)
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'Admin', N'Admin', NULL, N'01676983088', N'admin@gmail.com', N'ADMIN', NULL, N'123123')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'GV1', N'Nguyễn Chính', N'43 trần nhật duật, phường nam ngạn , thành phố thành hóa ', N'01676983088 ', N'giaovien@gmail.com', N'GVC', N'BE', N'123123')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'GV10', N'giáo viên 10', N'43 trần nhật duật, phường nam ngạn , thành phố thành hóa', N'01676983088', N'', N'GVC', N'MGNB', N'123123')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'GV11', N'giáo viên 11', N'43 trần nhật duật, phường nam ngạn , thành phố thành hóa', N'01676983088', N'giaovienphu@gmail.com', N'GVP', N'MGNB', N'123123')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'GV12', N'giáo viên 12', N'43 trần nhật duật, phường nam ngạn , thành phố thành hóa', N'01676983088', N'', N'GVC', N'NHATREA', N'123123')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'GV13', N'giáo viên13', N'43 trần nhật duật, phường nam ngạn , thành phố thành hóa', N'01676983088', N'', N'GVP', N'NHATREA', N'123123')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'GV14', N'giáo viên14', N'43 trần nhật duật, phường nam ngạn , thành phố thành hóa', N'01676983088', N'', N'GVC', N'NHATREB', N'123123')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'GV15', N'giáo viên15', N'43 trần nhật duật, phường nam ngạn , thành phố thành hóa', N'01676983088', N'', N'GVP', N'NHATREB', N'123123')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'GV2', N'Nguyễn Phụ', N'43 trần nhật duật, phường nam ngạn , thành phố thành hóa', N'01676983088', N'', N'GVP', N'BE', N'123123')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'GV3', N'Nguyễn Phụ Phụ', N'43 trần nhật duật, phường nam ngạn , thành phố thành hóa', N'01676983088', N'', N'GVP', N'BE', N'123123')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'GV4', N'giáo viên 4', N'43 trần nhật duật, phường nam ngạn , thành phố thành hóa', N'01676983088', N'', N'GVC', N'MGLA', N'123123')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'GV5', N'giáo viên 5', N'43 trần nhật duật, phường nam ngạn , thành phố thành hóa', N'01676983088', N'', N'GVP', N'MGLA', N'123123')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'GV6', N'giáo viên 6', N'43 trần nhật duật, phường nam ngạn , thành phố thành hóa', N'01676983088', N'', N'GVC', N'MGLB', N'123123')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'GV7', N'giáo viên 7', N'43 trần nhật duật, phường nam ngạn , thành phố thành hóa', N'01676983088', N'', N'GVP', N'MGLB', N'123123')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'GV8', N'giáo viên 8', N'43 trần nhật duật, phường nam ngạn , thành phố thành hóa', N'01676983088', N'', N'GVC', N'MGNA', N'123123')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'GV9', N'giáo viên 9', N'43 trần nhật duật, phường nam ngạn , thành phố thành hóa', N'01676983088', N'', N'GVP', N'MGNA', N'123123')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'KT1', N'kế toán', N'43 trần nhật duật, phường nam ngạn , thành phố thành hóa', N'01676983088', N'ketoan@gmail.com', N'KETOAN', NULL, N'123123')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'NV-637', NULL, N'sd', N'sdf', N'sdfdsf', N'GVC', NULL, N'sdf')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'NV-EFD', N'ádasd', N'hà nội', N'01676983088', N'hung@gmaia.com', N'TONUOI', N'MGLA', N'123123')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'NV18AC', N'nguyễn minh hiếu', N'43 trần nhật duật, phường nam ngạn , thành phố thành hóa', N'01676983088', N'', N'KETOAN', NULL, N'123123')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Sdt], [Email], [MaChucVu], [MaLop], [Password]) VALUES (N'TN1', N'tổ nuôi', N'43 trần nhật duật, phường nam ngạn , thành phố thành hóa', N'01676983088', N'tonuoi@gmail.com', N'TONUOI', NULL, N'123123')
SET IDENTITY_INSERT [dbo].[PhieuTheoDoi] ON 

INSERT [dbo].[PhieuTheoDoi] ([MaPhieuTheoDoi], [MaGiaoVien], [NgayTheoDoi], [ChiPhiDuTinh]) VALUES (35, N'GV1', CAST(N'2017-11-27' AS Date), NULL)
INSERT [dbo].[PhieuTheoDoi] ([MaPhieuTheoDoi], [MaGiaoVien], [NgayTheoDoi], [ChiPhiDuTinh]) VALUES (36, N'GV1', CAST(N'2017-11-25' AS Date), NULL)
INSERT [dbo].[PhieuTheoDoi] ([MaPhieuTheoDoi], [MaGiaoVien], [NgayTheoDoi], [ChiPhiDuTinh]) VALUES (37, N'GV1', CAST(N'2017-11-18' AS Date), NULL)
INSERT [dbo].[PhieuTheoDoi] ([MaPhieuTheoDoi], [MaGiaoVien], [NgayTheoDoi], [ChiPhiDuTinh]) VALUES (38, N'GV1', CAST(N'2017-10-31' AS Date), NULL)
INSERT [dbo].[PhieuTheoDoi] ([MaPhieuTheoDoi], [MaGiaoVien], [NgayTheoDoi], [ChiPhiDuTinh]) VALUES (39, N'GV1', CAST(N'2017-11-01' AS Date), NULL)
INSERT [dbo].[PhieuTheoDoi] ([MaPhieuTheoDoi], [MaGiaoVien], [NgayTheoDoi], [ChiPhiDuTinh]) VALUES (40, N'GV1', CAST(N'2017-11-30' AS Date), NULL)
INSERT [dbo].[PhieuTheoDoi] ([MaPhieuTheoDoi], [MaGiaoVien], [NgayTheoDoi], [ChiPhiDuTinh]) VALUES (41, N'GV1', CAST(N'2017-12-01' AS Date), NULL)
INSERT [dbo].[PhieuTheoDoi] ([MaPhieuTheoDoi], [MaGiaoVien], [NgayTheoDoi], [ChiPhiDuTinh]) VALUES (42, N'GV1', CAST(N'2017-12-31' AS Date), NULL)
INSERT [dbo].[PhieuTheoDoi] ([MaPhieuTheoDoi], [MaGiaoVien], [NgayTheoDoi], [ChiPhiDuTinh]) VALUES (43, N'GV1', CAST(N'2018-01-01' AS Date), NULL)
INSERT [dbo].[PhieuTheoDoi] ([MaPhieuTheoDoi], [MaGiaoVien], [NgayTheoDoi], [ChiPhiDuTinh]) VALUES (44, N'GV1', CAST(N'2018-01-18' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[PhieuTheoDoi] OFF
INSERT [dbo].[PhieuThu] ([NgayTaoPhieu], [MaHocSinh], [MaNhanVien], [SoNgayVang], [SoNgayAnSang], [SoNgayAnTrua], [ChiPhi]) VALUES (N'2017-0', N'1', N'GV1', 3, 29, 29, 0.0000)
INSERT [dbo].[PhieuThu] ([NgayTaoPhieu], [MaHocSinh], [MaNhanVien], [SoNgayVang], [SoNgayAnSang], [SoNgayAnTrua], [ChiPhi]) VALUES (N'2017-0', N'2', N'GV1', 4, 28, 28, 0.0000)
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'GiaoVien', N'Nghiệp vụ giáo viên', NULL)
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'GiaoVien-DiemDanh', N'Giáo viên điển danh', N'GiaoVien')
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'GiaoVien-Index', N'Xem trang chủ giáo viên', N'GiaoVien')
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'GiaoVien-Partial_DanhSachHocSinh', N'GiaoVien xem danh sách học sinh', N'GiaoVien')
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'GiaoVien-Partial_DiemDanhLop', N'Điểm danh', N'GiaoVien')
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
INSERT [dbo].[Quyen] ([MaQuyen], [MoTa], [ParentId]) VALUES (N'HomeAdmin-PhanQuyenTheoChucVu', N'Phân quyền chức vụ', N'HomeAdmin')
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
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'GVC', N'HomeAdmin-Index')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'GVP', N'HomeAdmin-Index')
INSERT [dbo].[Quyen_ChucVu] ([MaChucVu], [MaQuyen]) VALUES (N'GVC', N'HomeAdmin-PhanQuyenTheoChucVu')
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
ALTER TABLE [dbo].[HocPhi]  WITH CHECK ADD  CONSTRAINT [FK_HocPhi_LoaiHocPhi] FOREIGN KEY([LoaiHocphi])
REFERENCES [dbo].[LoaiHocPhi] ([MaLoai])
GO
ALTER TABLE [dbo].[HocPhi] CHECK CONSTRAINT [FK_HocPhi_LoaiHocPhi]
GO
ALTER TABLE [dbo].[HocSinh]  WITH CHECK ADD  CONSTRAINT [FK_HocSinh_Lop1] FOREIGN KEY([MaLop])
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
