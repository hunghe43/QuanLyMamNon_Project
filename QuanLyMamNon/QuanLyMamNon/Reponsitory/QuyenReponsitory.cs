using Dapper;
using QuanLyMamNon.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace QuanLyMamNon.Reponsitory
{
    public class QuyenReponsitory
    {
        private IDbConnection _db = new SqlConnection
       (ConfigurationManager.ConnectionStrings["SqlConn"].ConnectionString);

        /// <summary>
        /// lấy danh sách tất cả quyền
        /// </summary>
        /// <returns>list quyền</returns>
        public List<Quyen> GetAllQuyen()
        {
            string query = "select * from Quyen";
            List<Quyen> lst = _db.Query<Quyen>(query).ToList();
            return lst;
        }
        /// <summary>
        /// lấy danh sách quyền theo chức vụ
        /// </summary>
        /// <param name="id"> mã chức vụ</param>
        /// <returns>list quyền</returns>
        public List<Quyen_ChucVu> getAllQuyenChucVu()
        {
            //QR010
            string query = "select qc.* from Quyen_ChucVu qc ";
            List<Quyen_ChucVu> lst = _db.Query<Quyen_ChucVu>(query).ToList();
            return lst;
        }
        public bool addQuyenForIdChucVu(Quyen_ChucVu qc)
        {
            //QR011
            string sqlQuery = "INSERT INTO Quyen_ChucVu (MaChucVu,MaQuyen) VALUES (@MaChucVu,@MaQuyen)";
            var result = _db.Execute(sqlQuery, new { @MaChucVu = qc.MaChucVu, @MaQuyen = qc.MaQuyen });
            if (result != 0)
            {
                return true;
            }
            return false;
        }
        public bool deleteQuyenForIdChucVu(Quyen_ChucVu qc)
        {
            //QR012
            string sqlQuery = "delete from Quyen_ChucVu where MaChucVu=@MaChucVu and MaQuyen=@MaQuyen";
            var result = _db.Execute(sqlQuery, new { @MaChucVu = qc.MaChucVu, @MaQuyen = qc.MaQuyen });
            if (result != 0)
            {
                return true;
            }
            return false;
        }

    }
}