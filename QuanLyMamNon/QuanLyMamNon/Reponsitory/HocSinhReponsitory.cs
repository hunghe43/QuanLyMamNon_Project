using Dapper;
using QuanLyMamNon.Models;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace QuanLyMamNon.Reponsitory
{
    public class HocSinhReponsitory
    {
        private IDbConnection _db = new SqlConnection
        (ConfigurationManager.ConnectionStrings["SqlConn"].ConnectionString);

        /// <summary>
        /// lấy ra tất cả học sinh
        /// </summary>
        /// <returns>Danh sách học sinh: List<HocSinh></returns>
        public List<HocSinh> GetAllHocSinh()
        {
            List<HocSinh> listHs = this._db.Query<HocSinh>("SELECT * FROM HocSinh").ToList();
            return listHs;
        }
        /// <summary>
        /// lấy danh sách học sinh do giáo viên chủ nhiệm dạy theo id giáo viên
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public List<HocSinh> GetAllHocSinhForIdGiaoVien(string id)
        {
            //QR005
            string query = "select hs.MaHocSinh,hs.Ten,hs.NgaySinh,hs.GioiTinh,hs.DiaChi,hs.TinhTrang,hs.ChieuCao,hs.CanNang,hs.TenPhuHuynh,hs.SoCmt,hs.Sdt,hs.Email,hs.NgaySinhPhuHuynh,hs.GhiChu,hs.MaLop "+
                                "from(select lp.* "+
                                    "from NhanVien nv inner join ChucVu cv on nv.MaChucVu = cv.MaChucVu "+
                                    "inner join Lop lp on nv.MaLop = lp.MaLop "+
                                    "and cv.MaChucVu = 'GVC' and nv.MaNhanVien = @id) as lopNew inner join HocSinh hs on hs.MaLop = lopNew.MaLop";
            List<HocSinh> lst = _db.Query<HocSinh>(query, new { @id = id }).ToList();
            return lst;
        }

        /// <summary>
        /// Tìm thông tin chi tiết học sinh có mã là ID
        /// </summary>
        /// <param name="id"> Mã học sinh truyền vào</param>
        /// <returns> Infor_HocSinh</returns>
        public Infor_HocSinh FindHocSinhInfor(int? id)
        {
            //QR001 
            string query = "select hs.MaHocSinh,hs.Ten as TenHocSinh,hs.NgaySinh,hs.GioiTinh,hs.DiaChi,hs.TinhTrang,hs.ChieuCao,hs.CanNang,hs.TenPhuHuynh,hs.NgaySinhPhuHuynh,hs.Sdt as SdtPhuHuynh,hs.Email as EmailPhuHuynh,hs.GhiChu,lp.MaLop,lp.TenLop,nv.TenNhanVien as TenGiaoVien,nv.Sdt as SdtGiaoVien,nv.Email as EmailGiaoVien " +
                                "from HocSinh hs inner join Lop lp on hs.MaLop = lp.MaLop " +
                                "inner join NhanVien nv on lp.MaLop = nv.MaLop " +
                                "inner join ChucVu cv on nv.MaChucVu = cv.MaChucVu " +
                                "and cv.MaChucVu = 'GVC' and hs.TrangThai = '1'";
            var hocsinhinfor = _db.Query<Infor_HocSinh>(query).ToList();
            var hocsinh = hocsinhinfor.Where(x => x.MaHocSinh.Equals(id)).Single();
            return hocsinh;
        }

        /// <summary>
        /// đăng ký một học sinh mới
        /// </summary>
        /// <param name="hs"> đối tượng học sinh</param>
        /// <returns> đối tượng hocsinh</returns>
        public HocSinh Add(HocSinh hs)
        {
            //QR002
            string sqlQuery = "INSERT INTO HocSinh ([Ten],[NgaySinh],[GioiTinh],[DiaChi],[TinhTrang],[TenPhuHuynh],[SoCmt] ,[Sdt] ,[Email] ,[NgaySinhPhuHuynh]) VALUES(@Ten , @NgaySinh , @GioiTinh , @DiaChi , @TinhTrang , @TenPhuHuynh , @SoCmt , @Sdt , @Email , @NgaySinhPhuHuynh) " +
            "SELECT CAST(SCOPE_IDENTITY() as int)";
            var userId = _db.Query<int>(sqlQuery, hs).Single();
            hs.MaHocSinh = userId;
            return hs;
        }

        public HocSinh Update(HocSinh hs)
        {
            var sqlQuery = "";
            this._db.Execute(sqlQuery, hs);
            return hs;

        }

        public void Remove(int id)
        {
            var sqlQuery = ("Delete From HosSinh Where MaHocSinh = @id");
            this._db.Execute(sqlQuery, new { @id = id });
        }
    }
}
