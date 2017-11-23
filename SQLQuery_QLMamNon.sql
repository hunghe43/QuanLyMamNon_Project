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
				--QR003: lấy thông tin giáo viên cn phụ trách lớp: tên lớp phụ trách, thông tin giáo viên
				select nv.MaNhanVien as MaGiaoVien,nv.TenNhanVien as TenGiaoVien,cv.MaChucVu,cv.TenChucVu,lp.MaLop,lp.TenLop,lp.SiSo,nv.DiaChi,nv.Sdt,nv.Email 
				from NhanVien nv inner join ChucVu cv on nv.MaChucVu=cv.MaChucVu
								inner join Lop lp on nv.MaLop=lp.MaLop
								and cv.MaChucVu='GVP';
				--QR004: Lấy thông tin danh sách giáo viên phụ theo mã giáo viên chính
				select nv.MaNhanVien as MaGiaoVien,nv.TenNhanVien as TenGiaoVien,cv.MaChucVu,cv.TenChucVu,lopNew.MaLop,lopNew.TenLop,lopNew.SiSo,nv.DiaChi,nv.Sdt,nv.Email 
				from 
					(select lp.MaLop,lp.TenLop,lp.SiSo,lp.MaLoaiLop
					from Lop lp inner join NhanVien nv on lp.MaLop=nv.MaLop
					inner join ChucVu cv on nv.MaChucVu=nv.MaChucVu
					and cv.MaChucVu='GVC' and nv.MaNhanVien='GV1') as lopNew inner join NhanVien nv on nv.MaLop=lopNew.MaLop
					inner join ChucVu cv on cv.MaChucVu=nv.MaChucVu
					and cv.MaChucVu='GVP'
				--QR005: lấy danh sách học sinh học lớp do giáo viên chủ nhiệm dạy
				select hs.MaHocSinh,hs.Ten,hs.NgaySinh,hs.GioiTinh,hs.DiaChi,hs.TinhTrang,hs.ChieuCao,hs.CanNang,hs.TenPhuHuynh,hs.SoCmt,hs.Sdt,hs.Email,hs.NgaySinhPhuHuynh,hs.GhiChu,hs.MaLop
				from (select lp.*
						from NhanVien nv inner join ChucVu cv on nv.MaChucVu=cv.MaChucVu
						inner join Lop lp on nv.MaLop=lp.MaLop
						and cv.MaChucVu='GVC' and nv.MaNhanVien='GV1') as lopNew inner join HocSinh hs on hs.MaLop=lopNew.MaLop
				--QR006: danh sách theo dõi học sinh tương ứng với giáo viên chủ nhiệm
				select p.NgayTheoDoi,ct.*
				from (select hs.MaHocSinh,hs.Ten,hs.NgaySinh,hs.GioiTinh,hs.DiaChi,hs.TinhTrang,hs.ChieuCao,hs.CanNang,hs.TenPhuHuynh,hs.SoCmt,hs.Sdt,hs.Email,hs.NgaySinhPhuHuynh,hs.GhiChu,hs.MaLop
						from (select lp.*
						from NhanVien nv inner join ChucVu cv on nv.MaChucVu=cv.MaChucVu
						inner join Lop lp on nv.MaLop=lp.MaLop
						and cv.MaChucVu='GVC' and nv.MaNhanVien='GV1') as lopNew inner join HocSinh hs on hs.MaLop=lopNew.MaLop) hs inner join CT_NgayTheoDoi ct on hs.MaHocSinh=ct.MaHocSinh
				inner join PhieuTheoDoi p on ct.MaPhieuTheoDoi=p.MaPhieuTheoDoi
				inner join NhanVien nv on nv.MaNhanVien=p.MaGiaoVien
				--QR007: tạo phiếu theo dõi
				INSERT INTO PhieuTheoDoi(MaGiaoVien,NgayTheoDoi,ChiPhiDuTinh) VALUES (@MaGV,@NgayTheoDoi,@ChiPhiDuTinh)
				insert into CT_NgayTheoDoi(MaHocSinh,MaPhieuTheoDoi,DDVang,DDAnSang,DDAnTrua) values ()


				------------------Phân Quyền-------------------------

				--QR008: lấy danh sách quyền của nhân viên
				select q.*
				from NhanVien nv inner join ChucVu cv on nv.MaChucVu=cv.MaChucVu
					inner join Quyen_ChucVu qc on cv.MaChucVu=qc.MaChucVu
					inner join Quyen q on qc.MaQuyen=q.MaQuyen
					and nv.MaNhanVien='Admin'
				--QR009: lấy danh sách chức vụ
				select * from ChucVu where MaChucVu != 'ADMIN'
				--QR010: lấy danh sách quyền theo id chức vụ trả về bảng Quyen_ChucVu
				select qc.*
				from  Quyen_ChucVu qc 
				--QR011: thêm mới quyền cho chức vụ theo id chức vụ
				INSERT INTO Quyen_ChucVu (MaChucVu,MaQuyen) VALUES (@MaChucVu,@MaQuyen)
				--QR012: xóa quyền cho chức vụ theo id chức vụ
				delete from Quyen_ChucVu where MaChucVu=@MaChucVu,MaQuyen=@MaQuyen
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