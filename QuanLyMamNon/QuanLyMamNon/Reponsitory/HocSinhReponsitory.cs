using Dapper;
using QuanLyMamNon.Models;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
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
        /// lấy ra tất cả học sinh đang hoạt động
        /// </summary>
        /// <returns>Danh sách học sinh: List<HocSinh></returns> 
        public List<HocSinh> GetAllHocSinh()
        {
            List<HocSinh> listHs = this._db.Query<HocSinh>("GetAllHocSinh", commandType: CommandType.StoredProcedure).ToList();
            return listHs;
        }
        public List<HocSinh> GetAllHocSinhDis()
        {
            List<HocSinh> listHs = this._db.Query<HocSinh>("GetAllHocSinhDis", commandType: CommandType.StoredProcedure).ToList();
            return listHs;
        }
        /// <summary>
        /// lấy danh sách học sinh do giáo viên dạy theo id giáo viên
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public List<HocSinh> GetAllHocSinhForIdGiaoVien(string id)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@id", id);
            List<HocSinh> lst = _db.Query<HocSinh>("GetAllHocSinhForIdGiaoVien",parameters, commandType: CommandType.StoredProcedure).ToList();
            return lst;
        }
        /// <summary>
        /// lấy học sinh theo lớp
        /// </summary>
        /// <param name="maLop"> mã lớp</param>
        /// <returns>list hoc sinh</returns>
        public List<HocSinh> GetHocSinhForIdLop(string maLop)
        {
            List<HocSinh> lst = GetAllHocSinh().FindAll(x => x.MaLop==maLop);
            return lst;
        }
        /// <summary>
        /// lấy thông tin học sinh theo mã
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public HocSinh GetHocSinhForId(string id)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@id", id);
            HocSinh hs = this._db.Query<HocSinh>("GetHocSinhForId", parameters, commandType: CommandType.StoredProcedure).SingleOrDefault();
            return hs;
        }
        /// <summary>
        /// Tìm thông tin chi tiết học sinh có mã là ID
        /// </summary>
        /// <param name="id"> Mã học sinh truyền vào</param>
        /// <returns> Infor_HocSinh</returns>
        public Infor_HocSinh FindHocSinhInfor(string id)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@id", id);
            var hocsinh = _db.Query<Infor_HocSinh>("FindHocSinhInfor", parameters, commandType: CommandType.StoredProcedure).FirstOrDefault();
            return hocsinh;
        }

        ///// <summary>
        ///// đăng ký một học sinh mới
        ///// </summary>
        ///// <param name="hs"> đối tượng học sinh</param>
        ///// <returns> đối tượng hocsinh</returns>
        //public HocSinh Add(HocSinh hs)
        //{
        //    //QR002
        //    string sqlQuery = "INSERT INTO HocSinh ([Ten],[NgaySinh],[GioiTinh],[DiaChi],[TinhTrang],[TenPhuHuynh],[SoCmt] ,[Sdt] ,[Email] ,[NgaySinhPhuHuynh]) VALUES(@Ten , @NgaySinh , @GioiTinh , @DiaChi , @TinhTrang , @TenPhuHuynh , @SoCmt , @Sdt , @Email , @NgaySinhPhuHuynh) " +
        //    "SELECT CAST(SCOPE_IDENTITY() as int)";
        //    var userId = _db.Query<int>(sqlQuery, hs).Single();
        //    hs.MaHocSinh = userId;
        //    return hs;
        //}

        /// <summary>
        /// thêm mới Hoc sinh
        /// </summary>
        /// <param name="hoc sinh"></param>
        /// <returns></returns>
        public void AddHocSinh(HocSinh hocsinh)
        {
            hocsinh.MaHocSinh = getAutoIdHocSinh();
            var parameters = new DynamicParameters();
            parameters.Add("@MaHocSinh", hocsinh.MaHocSinh);
            parameters.Add("@Ten", hocsinh.Ten);
            parameters.Add("@NgaySinh", hocsinh.NgaySinh);
            parameters.Add("@GioiTinh", hocsinh.GioiTinh);
            parameters.Add("@DiaChi", hocsinh.DiaChi);
            parameters.Add("@TinhTrang", hocsinh.TinhTrang);
            parameters.Add("@ChieuCao", hocsinh.ChieuCao);
            parameters.Add("@CanNang", hocsinh.CanNang);
            parameters.Add("@TenPhuHuynh", hocsinh.TenPhuHuynh);
            parameters.Add("@SoCmt", hocsinh.SoCmt);
            parameters.Add("@Sdt", hocsinh.Sdt);
            parameters.Add("@Email", hocsinh.Email.Trim());
            parameters.Add("@NgaySinhPhuHuynh", hocsinh.NgaySinhPhuHuynh);
            parameters.Add("@GhiChu", hocsinh.GhiChu);
            parameters.Add("@MaLop", hocsinh.MaLop);
            parameters.Add("@DoiTuongMta", hocsinh.DoiTuongMTA);
            parameters.Add("@TrangThai", hocsinh.TrangThai);
            parameters.Add("@Action", "Insert");
            _db.Execute("InsertUpdateHocSinh", parameters, commandType: CommandType.StoredProcedure);
        }
        /// <summary>
        /// update hoc sinh
        /// </summary>
        /// <param name="hocsinh"></param>
        /// <returns></returns>
        public void UpdateHocSinh(HocSinh hocsinh)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@MaHocSinh", hocsinh.MaHocSinh);
            parameters.Add("@Ten", hocsinh.Ten);
            parameters.Add("@NgaySinh", hocsinh.NgaySinh);
            parameters.Add("@GioiTinh", hocsinh.GioiTinh);
            parameters.Add("@DiaChi", hocsinh.DiaChi);
            parameters.Add("@TinhTrang", hocsinh.TinhTrang);
            parameters.Add("@ChieuCao", hocsinh.ChieuCao);
            parameters.Add("@CanNang", hocsinh.CanNang);
            parameters.Add("@TenPhuHuynh", hocsinh.TenPhuHuynh);
            parameters.Add("@SoCmt", hocsinh.SoCmt);
            parameters.Add("@Sdt", hocsinh.Sdt);
            parameters.Add("@Email", hocsinh.Email);
            parameters.Add("@NgaySinhPhuHuynh", hocsinh.NgaySinhPhuHuynh);
            parameters.Add("@GhiChu", hocsinh.GhiChu);
            parameters.Add("@MaLop", hocsinh.MaLop);
            parameters.Add("@DoiTuongMta", hocsinh.DoiTuongMTA);
            parameters.Add("@TrangThai", hocsinh.TrangThai);
            parameters.Add("@Action", "Update");
            _db.Execute("InsertUpdateHocSinh", parameters, commandType: CommandType.StoredProcedure);

        }
        /// <summary>
        /// delete hocsinh
        /// </summary>
        /// <param name="hocsinh"></param>
        /// <returns></returns>
        public void deleteHocSinh(string MaHocSinh)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@MaHocSinh", MaHocSinh);
            _db.Execute("DeleteHocSinh", parameters, commandType: CommandType.StoredProcedure);
        }
        /// <summary>
        /// sinh mã tự động cho học sinh
        /// </summary>
        /// <returns></returns>
        public string getAutoIdHocSinh()
        {
            string manv = _db.Query<string>("sp_HocSinh_NewID", commandType: CommandType.StoredProcedure).Single();
            return manv;
        }

        public void ImportFileHocSinh(string conString,string filePath)
        {
            DataTable dt = new DataTable();
            conString = string.Format(conString, filePath);

            using (OleDbConnection connExcel = new OleDbConnection(conString))
            {
                using (OleDbCommand cmdExcel = new OleDbCommand())
                {
                    using (OleDbDataAdapter odaExcel = new OleDbDataAdapter())
                    {
                        cmdExcel.Connection = connExcel;

                        //Get the name of First Sheet.
                        connExcel.Open();
                        DataTable dtExcelSchema;
                        dtExcelSchema = connExcel.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);
                        string sheetName = dtExcelSchema.Rows[0]["TABLE_NAME"].ToString();
                        connExcel.Close();

                        //Read Data from First Sheet.
                        connExcel.Open();
                        cmdExcel.CommandText = "SELECT * From [" + sheetName + "]";
                        odaExcel.SelectCommand = cmdExcel;
                        odaExcel.Fill(dt);
                        connExcel.Close();
                    }
                }
            }

            conString = ConfigurationManager.ConnectionStrings["SqlConn"].ConnectionString;
            using (SqlConnection con = new SqlConnection(conString))
            {
                using (SqlBulkCopy sqlBulkCopy = new SqlBulkCopy(con))
                {
                    //Set the database table name.
                    sqlBulkCopy.DestinationTableName = "HocSinh";

                    //[OPTIONAL]: Map the Excel columns with that of the database table
                    sqlBulkCopy.ColumnMappings.Add("MaHocSinh", "MaHocSinh");
                    sqlBulkCopy.ColumnMappings.Add("Ten", "Ten");
                    sqlBulkCopy.ColumnMappings.Add("NgaySinh", "NgaySinh");
                    sqlBulkCopy.ColumnMappings.Add("GioiTinh", "GioiTinh");
                    sqlBulkCopy.ColumnMappings.Add("DiaChi", "DiaChi");
                    sqlBulkCopy.ColumnMappings.Add("TinhTrang", "TinhTrang");
                    sqlBulkCopy.ColumnMappings.Add("ChieuCao", "ChieuCao");
                    sqlBulkCopy.ColumnMappings.Add("CanNang", "CanNang");
                    sqlBulkCopy.ColumnMappings.Add("TenPhuHuynh", "TenPhuHuynh");
                    sqlBulkCopy.ColumnMappings.Add("SoCmt", "SoCmt");
                    sqlBulkCopy.ColumnMappings.Add("Sdt", "Sdt");
                    sqlBulkCopy.ColumnMappings.Add("Email", "Email");
                    sqlBulkCopy.ColumnMappings.Add("NgaySinhPhuHuynh", "NgaySinhPhuHuynh");
                    sqlBulkCopy.ColumnMappings.Add("GhiChu", "GhiChu");
                    sqlBulkCopy.ColumnMappings.Add("MaLop", "MaLop");
                    sqlBulkCopy.ColumnMappings.Add("DoiTuongMTA", "DoiTuongMTA");
                    sqlBulkCopy.ColumnMappings.Add("TrangThai", "TrangThai");

                    con.Open();
                    try
                    {
                        sqlBulkCopy.WriteToServer(dt);
                    }
                    catch(Exception ex)
                    {
                        throw;
                    }
                    
                    con.Close();
                }
            }
        }
    }
}
