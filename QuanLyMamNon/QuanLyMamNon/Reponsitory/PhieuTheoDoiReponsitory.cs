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
    public class PhieuTheoDoiReponsitory
    {
        private IDbConnection _db = new SqlConnection
     (ConfigurationManager.ConnectionStrings["SqlConn"].ConnectionString);
            
        public bool insertPhieuTheoDoiForIdGiaoVien(PhieuTheoDoi phieuTheoDoi){
            string query = "INSERT INTO PhieuTheoDoi(MaGiaoVien,NgayTheoDoi,ChiPhiDuTinh) VALUES (@MaGV,@NgayTheoDoi,@ChiPhiDuTinh) "+
                "SELECT CAST(SCOPE_IDENTITY() as int)";
            var affectedRows = _db.Execute(query, new { @MaGV = phieuTheoDoi.MaGiaoVien, @NgayTheoDoi = phieuTheoDoi.NgayTheoDoi, @ChiPhiDuTinh = phieuTheoDoi.ChiPhiDuTinh });
            if (affectedRows == 0)
            {
                return false;
            }
            return true;

        }

    }
}