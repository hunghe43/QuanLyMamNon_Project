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
        /// <summary>
        /// lấy tất cả phiếu theo dõi
        /// </summary>
        /// <returns>list phiếu theo dõi</returns>
        public List<PhieuTheoDoi> getAllPhieuTheoDoi()
        {
            List<PhieuTheoDoi> listHs = _db.Query<PhieuTheoDoi>("SELECT * FROM PhieuTheoDoi").ToList();
            return listHs;
        }
        /// <summary>
        /// check exists phiếu theo dõi
        /// </summary>
        /// <param name="maGiaoVien">mã giáo viên login</param>
        /// <param name="ngayTheoDoi">ngày theo dõi</param>
        /// <returns>true: đã tồn tại phiếu theo doi
        ///         false: chưa tồn tại phiếu theo dõi
        /// </returns>
        public bool checkExistsPhieuTheoDoi(string maGiaoVien,DateTime ngayTheoDoi)
        {
            var listPhieuTheoDoi = getAllPhieuTheoDoi();
            var ptd = listPhieuTheoDoi.Find(n => n.MaGiaoVien.Equals(maGiaoVien) && n.NgayTheoDoi == ngayTheoDoi);
            if (listPhieuTheoDoi.Contains(ptd))
            {
                return true;
            }
            return false;
        }
        /// <summary>
        /// lấy danh sách chi tiết điểm danh theo ngày và gi8aso viên
        /// </summary>
        /// <param name="maGiaoVien"></param>
        /// <param name="ngayTheoDoi"></param>
        /// <returns></returns>
        public List<CT_NgayTheoDoi> getAll_CT_NgayTheoDoi(string maGiaoVien,DateTime ngayTheoDoi)
        {
            string query = "select ct.* from PhieuTheoDoi ptd inner join CT_NgayTheoDoi ct on ptd.MaPhieuTheoDoi = ct.MaPhieuTheoDoi "+
                "where ptd.MaGiaoVien = @MaGiaoVien and ptd.NgayTheoDoi = @NgayTheoDoi";
            List<CT_NgayTheoDoi> lst = _db.Query<CT_NgayTheoDoi>(query, new { @MaGiaoVien = maGiaoVien, @NgayTheoDoi= ngayTheoDoi }).ToList();
            return lst;
        }

        /// <summary>
        /// thục hiện điểm danh
        /// </summary>
        /// <param name="MaGiaoVien"></param>
        /// <param name="NgayDD"></param>
        /// <param name="MaHocSinh"></param>
        /// <param name="ddVang"></param>
        /// <param name="ddAnSang"></param>
        /// <param name="ddAnTrua"></param>
        public void diemdanh(string MaGiaoVien,DateTime NgayDD,int MaHocSinh,bool ddVang,bool ddAnSang,bool ddAnTrua)
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