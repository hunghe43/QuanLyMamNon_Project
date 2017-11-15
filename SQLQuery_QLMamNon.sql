--QR001--lấy thông tin chi tiết học sinh--
select hs.MaHocSinh,hs.Ten as TenHocSinh,hs.NgaySinh,hs.GioiTinh,hs.DiaChi,hs.TinhTrang,hs.ChieuCao,hs.CanNang,hs.TenPhuHuynh,hs.NgaySinhPhuHuynh,hs.Sdt as SdtPhuHuynh,hs.Email as EmailPhuHuynh,hs.GhiChu,lp.MaLop,lp.TenLop,nv.TenNhanVien as TenGiaoVien,nv.Sdt as SdtGiaoVien,nv.Email as EmailGiaoVien,dv.TenDV,ct.NgayDK
from HocSinh hs inner join Lop lp
on hs.MaLop=lp.MaLop 
inner join NhanVien nv on lp.MaLop=nv.MaLop
inner join ChucVu cv on nv.MaChucVu=cv.MaChucVu
left join CT_DichVu_HocSinh ct on ct.MaHocSinh=hs.MaHocSinh
left join DichVuNgoai dv on dv.MaDichVu= ct.MaDV
and cv.MaChucVu='GVC'
and hs.TrangThai='1'

-- QR002-- đăng ký tuyển sinh, thông tin cơ bản của học sinh
INSERT INTO[dbo].[HocSinh] ([Ten],[NgaySinh],[GioiTinh],[DiaChi],[TinhTrang],[TenPhuHuynh],[SoCmt] ,[Sdt] ,[Email] ,[NgaySinhPhuHuynh]) VALUES(@Ten , @NgaySinh , @GioiTinh , @DiaChi , @TinhTrang , @TenPhuHuynh , @SoCmt , @Sdt , @Email , @NgaySinhPhuHuynh) 
SELECT CAST(SCOPE_IDENTITY() as int)

--thông tin đi điểm danh trong tháng
select hs.Ten,pt.SoNgayVang,pt.SoNgayAnSang,pt.SoNgayAnTrua
from HocSinh hs inner join PhieuThu pt
on hs.MaHocSinh=pt.MaHocSinh
and hs.MaHocSinh='1'
and pt.Thang='11'
and pt.Nam='2017'

--thông tin dịch vụ ngoài
select  hs.MaHocSinh,hs.Ten,dv.MaDichVu, dv.TenDV,dvhs.NgayDK,dvhs.NgayHetHan,dv.ChiPhi,dv.MoTa
from HocSinh hs inner join CT_DichVu_HocSinh dvhs on hs.MaHocSinh=dvhs.MaHocSinh
inner join DichVuNgoai dv on dvhs.MaDV=dv.MaDichVu
and hs.TrangThai='1'



