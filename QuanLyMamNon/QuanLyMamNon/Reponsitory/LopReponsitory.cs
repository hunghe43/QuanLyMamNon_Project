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
    public class LopReponsitory : ILopReponsitory
    {
        private IDbConnection _db = new SqlConnection
           (ConfigurationManager.ConnectionStrings["SqlConn"].ConnectionString);
        public Lop Add(Lop lp)
        {
            throw new NotImplementedException();
        }

        public Lop Find(int? id)
        {
            string query = "select hs.* from HocSinh hs inner join Lop lp on hs.MaLop = lp.MaLop and hs.MaHocSinh = @id and hs.TrangThai = 1";
            Lop lp = new Lop();
            lp = _db.Query<Lop>(query, new { @id = id }).SingleOrDefault();
            return lp;
        }

        public List<Lop> GetAll()
        {
            throw new NotImplementedException();
        }

        public void Remove(int id)
        {
            throw new NotImplementedException();
        }

        public Lop Update(Lop lp)
        {
            throw new NotImplementedException();
        }
    }
}