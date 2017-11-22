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
    public class ChucVuReponsitory
    {
        private IDbConnection _db = new SqlConnection
       (ConfigurationManager.ConnectionStrings["SqlConn"].ConnectionString);

        /// <summary>
        /// llấy danh sách chức vụ không phải Admin
        /// </summary>
        /// <returns>list chức vụ</returns>
        public List<ChucVu> getAllChucVu()
        {
            //QR009
            string query = "select * from ChucVu where MaChucVu != 'ADMIN'";
            List<ChucVu> lst = _db.Query<ChucVu>(query).ToList();
            return lst;
        }
        
    }
}