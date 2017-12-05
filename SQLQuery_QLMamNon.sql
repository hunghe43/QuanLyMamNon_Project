-------------phục vụ cho chức năng người dùng khách hàng-------------------
--QR001: lấy thông tin học sinh dựa vào mã: tên gVCN, lớp, tên học sinh
select hs.MaHocSinh,hs.Ten as TenHocSinh,hs.NgaySinh,hs.GioiTinh,hs.DiaChi,hs.TinhTrang,hs.ChieuCao,hs.CanNang,hs.TenPhuHuynh,hs.NgaySinhPhuHuynh,hs.Sdt as SdtPhuHuynh,hs.Email as EmailPhuHuynh,hs.GhiChu,lp.MaLop,lp.TenLop,nv.TenNhanVien as TenGiaoVien,nv.Sdt as SdtGiaoVien,nv.Email as EmailGiaoVien 
          from HocSinh hs inner join Lop lp on hs.MaLop = lp.MaLop 
          inner join NhanVien nv on lp.MaLop = nv.MaLop 
          inner join ChucVu cv on nv.MaChucVu = cv.MaChucVu
          and cv.MaChucVu = 'GVC' and hs.TrangThai = '1'
--QR002: insert thông tin học sinh mới vào database
INSERT INTO dbo . HocSinh  ( Ten , NgaySinh , GioiTinh , DiaChi , TinhTrang , TenPhuHuynh , SoCmt  , Sdt  , Email  , NgaySinhPhuHuynh ) VALUES(@Ten , @NgaySinh , @GioiTinh , @DiaChi , @TinhTrang , @TenPhuHuynh , @SoCmt , @Sdt , @Email , @NgaySinhPhuHuynh)
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
				--QR007: tạo phiếu theo dõi:  đã sử dụng store procceduce DiemDanh

				--QR013: lấy danh sách theo dõi trong ngày của giáo viên điểm danh
				select ct.*
				from PhieuTheoDoi ptd inner join CT_NgayTheoDoi ct on ptd.MaPhieuTheoDoi=ct.MaPhieuTheoDoi
					where ptd.MaGiaoVien=@MaGiaoVien and ptd.NgayTheoDoi=@NgayTheoDoi				
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

				------------------ kế toán-------------------------------
				--QR014: lấy tất cả học sinh
				select *
				from HocSinh
				--QR015:thống kê theo dõi với mã học sinh và tháng theo dõi(đã sử dụng proc  GetPhieuThuForIdHocSinh  )
				--QR016: thống kê danh sách dịch vụ ngoài mà học sinh đăng ký, 				
				select dv.*
				from DichVuNgoai dv inner join CT_DichVu_HocSinh ct on dv.MaDichVu=ct.MaDichVu
					inner join HocSinh hs on hs.MaHocSinh=ct.MaHocSinh
					where hs.MaHocSinh=1 and ct.ThangDangKy='11/2017'
				DECLARE @myid uniqueidentifier  
				SET @myid = NEWID()  
				PRINT 'Value of @myid is: '+ CONVERT(varchar(255), @myid)  
				
