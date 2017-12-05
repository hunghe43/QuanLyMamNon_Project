using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using QuanLyMamNon.Models;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using Dapper;

namespace QuanLyMamNon.Reponsitory
{
    public class LopReponsitory
    {
        private IDbConnection _db = new SqlConnection
           (ConfigurationManager.ConnectionStrings["SqlConn"].ConnectionString);
        /// <summary>
        /// lấy tất cả lớp
        /// </summary>
        /// <returns></returns>
        public List<Lop> getAllLop()
        {
            List<Lop> list = this._db.Query<Lop>("SELECT * FROM Lop").ToList();
            return list;
        }
        /// <summary>
        /// thêm mới 
        /// </summary>
        /// <param name="nhanvien"></param>
        /// <returns></returns>
        public void AddLop(NhanVien nhanvien)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@MaNhanVien", nhanvien.MaNhanVien);
            parameters.Add("@TenNhanVien", nhanvien.TenNhanVien);
            parameters.Add("@DiaChi", nhanvien.DiaChi);
            parameters.Add("@Sdt", nhanvien.Sdt);
            parameters.Add("@Email", nhanvien.Email);
            parameters.Add("@MaChucVu", nhanvien.MaChucVu);
            parameters.Add("@MaLop", nhanvien.MaLop);
            parameters.Add("@Password", nhanvien.Password);
            parameters.Add("@Action", "Insert");
            _db.Execute("InsertUpdateNhanVien", parameters, commandType: CommandType.StoredProcedure);

        }
        /// <summary>
        /// get theo ma 
        /// </summary>
        /// <param name="MaNhanVien"></param>
        /// <returns></returns>
        //public NhanVien getNhanvienForId(string MaNhanVien)
        //{
        //    var nhanvien = getAllNhanVien().Find(x => x.MaNhanVien == MaNhanVien);
        //    return (nhanvien);
        //}
        /// <summary>
        /// update
        /// </summary>
        /// <param name="nhanvien"></param>
        /// <returns></returns>
        public void UpdateNhanVien(NhanVien nhanvien)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@MaNhanVien", nhanvien.MaNhanVien);
            parameters.Add("@TenNhanVien", nhanvien.TenNhanVien);
            parameters.Add("@DiaChi", nhanvien.DiaChi);
            parameters.Add("@Sdt", nhanvien.Sdt);
            parameters.Add("@Email", nhanvien.Email);
            parameters.Add("@MaChucVu", nhanvien.MaChucVu);
            parameters.Add("@MaLop", nhanvien.MaLop);
            parameters.Add("@Password", nhanvien.Password);
            parameters.Add("@Action", "Update");
            _db.Execute("InsertUpdateNhanVien", parameters, commandType: CommandType.StoredProcedure);

        }
        /// <summary>
        /// delete 
        /// </summary>
        /// <param name="nhanvien"></param>
        /// <returns></returns>
        public void deleteNhanVien(string MaNhanVien)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@MaNhanVien", MaNhanVien);
            _db.Execute("DeleteNhanVien", parameters, commandType: CommandType.StoredProcedure);
        }

    }
}