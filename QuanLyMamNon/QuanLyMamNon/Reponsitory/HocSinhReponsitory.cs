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
    public class HocSinhReponsitory : IHocSinhReponsitory
    {
        private IDbConnection _db = new SqlConnection
        (ConfigurationManager.ConnectionStrings["SqlConn"].ConnectionString);

        /// <summary>
        /// lấy ra tất cả học sinh
        /// </summary>
        /// <returns>Danh sách học sinh: List<HocSinh></returns>
        public List<HocSinh> GetAll()
        {
            List<HocSinh> listHs = this._db.Query<HocSinh>("SELECT * FROM HocSinh").ToList();
            return listHs;

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
            string sqlQuery = "INSERT INTO[dbo].[HocSinh] ([Ten],[NgaySinh],[GioiTinh],[DiaChi],[TinhTrang],[TenPhuHuynh],[SoCmt] ,[Sdt] ,[Email] ,[NgaySinhPhuHuynh]) VALUES(@Ten , @NgaySinh , @GioiTinh , @DiaChi , @TinhTrang , @TenPhuHuynh , @SoCmt , @Sdt , @Email , @NgaySinhPhuHuynh) " +
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
    //public SqlConnection con;
    ////To Handle connection related activities
    //private void connection()
    //{
    //    string constr = ConfigurationManager.ConnectionStrings["SqlConn"].ToString();
    //    con = new SqlConnection(constr);
    //}

    //public void AddHocSinh(HocSinh objHS)
    //{
    //    try
    //    {
    //        connection();
    //        con.Open();
    //        string sql = "INSERT INTO[dbo].[HocSinh] ([Ten],[NgaySinh],[GioiTinh],[DiaChi],[TinhTrang],[DanToc],[DoiTuong],[TenPhuHuynh],[SoCmt] ,[Sdt] ,[Email] ,[NgaySinhPhuHuynh]) VALUES(@Ten , @NgaySinh , @GioiTinh , @DiaChi , @TinhTrang , @DanToc , @DoiTuong , @TenPhuHuynh , @SoCmt , @Sdt , @Email , @NgaySinhPhuHuynh)";
    //        con.Execute(sql, objHS);  
    //        con.Close();
    //    }
    //    catch (Exception ex)
    //    {
    //        throw ex;
    //    }
    //}
}
