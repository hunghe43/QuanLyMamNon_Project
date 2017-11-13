using Dapper;
using QuanLyMamNon.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace QuanLyMamNon.Reponsitory
{
    public class HocSinhReponsitory
    {
        public SqlConnection con;
        //To Handle connection related activities
        private void connection()
        {
            string constr = ConfigurationManager.ConnectionStrings["SqlConn"].ToString();
            con = new SqlConnection(constr);
        }
        
        public void AddHocSinh(HocSinh objHS)
        {
            try
            {
                connection();
                con.Open();
                string sql = "INSERT INTO[dbo].[HocSinh] ([Ten],[NgaySinh],[GioiTinh],[DiaChi],[TinhTrang],[DanToc],[DoiTuong],[TenPhuHuynh],[SoCmt] ,[Sdt] ,[Email] ,[NgaySinhPhuHuynh]) VALUES(@Ten , @NgaySinh , @GioiTinh , @DiaChi , @TinhTrang , @DanToc , @DoiTuong , @TenPhuHuynh , @SoCmt , @Sdt , @Email , @NgaySinhPhuHuynh)";
                con.Execute(sql, objHS);  
                con.Close();
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
    }
}