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
    
    public class PhieuThuHocPhiReponsitory
    {
        private IDbConnection _db = new SqlConnection
      (ConfigurationManager.ConnectionStrings["SqlConn"].ConnectionString);
        /// <summary>
        /// laays ra thoong tin phieu Theo doi trong tháng của học sinh để tính tiền
        /// </summary>
        /// <param name="MaHocSinh"></param>
        /// <param name="date"></param>
        /// <returns></returns>
        public PhieuThu getPhieuThuForIdHocSinh(string MaHocSinh,string MaNhanVien,string date)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@MaHocSinh", MaHocSinh);
            parameters.Add("@MaNhanVien", MaNhanVien);
            parameters.Add("@date", date);
            PhieuThu pt = _db.Query<PhieuThu>("GetPhieuThuForIdHocSinh", parameters, commandType: CommandType.StoredProcedure).SingleOrDefault();
            return pt;
        }
        /// <summary>
        /// lấy tất cả học phí mặc định của tháng
        /// </summary>
        /// <returns></returns>
        public List<HocPhi> getHocPhiThang()
        {
            List<HocPhi> list = _db.Query<HocPhi>("getHocPhiThang", commandType: CommandType.StoredProcedure).ToList();
            return list;
        }
        /// <summary>
        /// lấy tất cả danh sách dịch vụ ngoài
        /// </summary>
        /// <returns></returns>
        public List<DichVuNgoai> getAllDichVuNgoai()
        {
            List<DichVuNgoai> list = _db.Query<DichVuNgoai>("getAllDichVuNgoai", commandType: CommandType.StoredProcedure).ToList();
            return list;
        }
        /// <summary>
        /// lấy danh sách dịch vụ ngoài học sinh đã đăng ký trong tháng dược chọn
        /// </summary>
        /// <param name="MaHocSinh"></param>
        /// <param name="date"></param>
        /// <returns></returns>
        public List<DichVuNgoai> getListDichVuNgoai_HocSinh(string MaHocSinh, string date)
        {
            //QR016
            string query = "select dv.* from DichVuNgoai dv inner join CT_DichVu_HocSinh ct on dv.MaDichVu = ct.MaDichVu " +
                "inner join HocSinh hs on hs.MaHocSinh = ct.MaHocSinh where hs.MaHocSinh = @MaHocSinh and ct.ThangDangKy = @Thang";
            var listDVNgoai = _db.Query<DichVuNgoai>(query, new {@MaHocSinh=MaHocSinh,@Thang=date }).ToList();
            return listDVNgoai;
        }


    }
}