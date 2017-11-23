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
                  
        public void diemdanh(string MaGiaoVien,DateTime NgayDD,int MaHocSinh,bool? ddVang,bool? ddAnSang,bool? ddAnTrua)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@MaGiaoVien", MaGiaoVien);
            parameters.Add("@NgayTheoDoi", NgayDD);
            parameters.Add("@MaHocSinh", MaHocSinh);
            parameters.Add("@ddVang", ddVang);
            parameters.Add("@ddAnSang", ddAnSang);
            parameters.Add("@ddAnTrua", ddAnTrua);
            var result = _db.Execute("DiemDanhProc", parameters,commandType: CommandType.StoredProcedure);
        }

    }
}