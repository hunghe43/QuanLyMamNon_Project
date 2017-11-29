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
        public List<Lop> getAllLop()
        {
            List<Lop> list = this._db.Query<Lop>("SELECT * FROM Lop").ToList();
            return list;
        }

    }
}