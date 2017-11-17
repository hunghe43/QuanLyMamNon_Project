-------------phục vụ cho chức năng người dùng khách hàng-------------------
--QR001: lấy thông tin học sinh dựa vào mã: tên gVCN, lớp, tên học sinh
select hs.MaHocSinh,hs.Ten as TenHocSinh,hs.NgaySinh,hs.GioiTinh,hs.DiaChi,hs.TinhTrang,hs.ChieuCao,hs.CanNang,hs.TenPhuHuynh,hs.NgaySinhPhuHuynh,hs.Sdt as SdtPhuHuynh,hs.Email as EmailPhuHuynh,hs.GhiChu,lp.MaLop,lp.TenLop,nv.TenNhanVien as TenGiaoVien,nv.Sdt as SdtGiaoVien,nv.Email as EmailGiaoVien 
                                from HocSinh hs inner join Lop lp on hs.MaLop = lp.MaLop 
                                inner join NhanVien nv on lp.MaLop = nv.MaLop 
                                inner join ChucVu cv on nv.MaChucVu = cv.MaChucVu
                                and cv.MaChucVu = 'GVC' and hs.TrangThai = '1'
--QR002: insert thông tin học sinh mới vào database
INSERT INTO[dbo].[HocSinh] ([Ten],[NgaySinh],[GioiTinh],[DiaChi],[TinhTrang],[TenPhuHuynh],[SoCmt] ,[Sdt] ,[Email] ,[NgaySinhPhuHuynh]) VALUES(@Ten , @NgaySinh , @GioiTinh , @DiaChi , @TinhTrang , @TenPhuHuynh , @SoCmt , @Sdt , @Email , @NgaySinhPhuHuynh)
            SELECT CAST(SCOPE_IDENTITY() as int)

-----------Phục vụ cho người đăng nhập hệ thống---------------------------------
		--------------------giáo viên login-------------------
				--QR004: lấy thông tin giáo viên cn phụ trách lớp: tên lớp phụ trách, thông tin giáo viên
				select nv.MaNhanVien as MaGiaoVien,nv.TenNhanVien as TenGiaoVien,cv.MaChucVu,cv.TenChucVu,lp.MaLop,lp.TenLop,lp.SiSo,nv.DiaChi,nv.Sdt,nv.Email 
				from NhanVien nv inner join ChucVu cv on nv.MaChucVu=cv.MaChucVu
								inner join Lop lp on nv.MaLop=lp.MaLop
								and cv.MaChucVu='GVC';
--tìm học sinh có mã là @ID
select hs.*
from HocSinh hs inner join Lop lp
on hs.MaLop=lp.MaLop
and hs.MaHocSinh='1'
and hs.TrangThai=1

--danh sách giáo viên dạy lớp @('truyenvao')
select nv.MaNhanVien,nv.TenNhanVien,lp.MaLop,lp.TenLop
from NhanVien nv inner join Lop lp
on nv.MaLop=lp.MaLop
and lp.MaLop='BE'

--giáo viên chủ nhiệm dạy học sinh @MaHocSinh
select nv.MaNhanVien,nv.TenNhanVien
from HocSinh hs inner join Lop lp
on hs.MaLop=lp.MaLop
inner join NhanVien nv
on lp.MaLop=nv.MaLop
inner join ChucVu cv
on nv.MaChucVu=cv.MaChucVu
and hs.MaHocSinh='7'
and cv.MaChucVu='GVC'

--thông tin đi điểm danh trong tháng
select hs.Ten,pt.SoNgayVang,pt.SoNgayAnSang,pt.SoNgayAnTrua
from HocSinh hs inner join PhieuThu pt
on hs.MaHocSinh=pt.MaHocSinh
and hs.MaHocSinh='1'
and pt.Thang='11'
and pt.Nam='2017'

--thông tin dịch vụ ngoài
select dv.TenDV,dv.ChiPhi
from HocSinh hs inner join CT_DichVu_HocSinh dvhs
on hs.MaHocSinh=dvhs.MaHocSinh
inner join DichVuNgoai dv
on dvhs.MaDV=dv.MaDichVu
and hs.MaHocSinh='1'