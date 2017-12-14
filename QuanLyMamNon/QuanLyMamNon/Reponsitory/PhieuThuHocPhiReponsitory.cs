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
        public Infor_PhieuThu getPhieuThuForIdHocSinh(string MaHocSinh, string MaNhanVien, string date)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@MaHocSinh", MaHocSinh);
            parameters.Add("@MaNhanVien", MaNhanVien);
            parameters.Add("@date", date);
            Infor_PhieuThu pt = _db.Query<Infor_PhieuThu>("GetPhieuThuForIdHocSinh", parameters, commandType: CommandType.StoredProcedure).SingleOrDefault();
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
        public List<DichVuNgoai> getListDichVuNgoai_HocSinh(string MaHocSinh, string Thang)
        {
            //QR016
            var parameters = new DynamicParameters();
            parameters.Add("@MaHocSinh", MaHocSinh);
            parameters.Add("@Thang", Thang);
            var listDVNgoai = _db.Query<DichVuNgoai>("getListDichVuNgoai_HocSinh", parameters, commandType: CommandType.StoredProcedure).ToList();
            return listDVNgoai;
        }

        //luu phieu thu
        public void saveThuPhiHocSinh(PhieuThu phieuthu, List<CT_PhieuThu_HocSinh> listCt_PhieuThu_HocSinh)
        {
            var parameters = new DynamicParameters();
            phieuthu.MaPhieuThu = getAutoIdPhieuThu();
            parameters.Add("@MaPhieuThu", phieuthu.MaPhieuThu);
            //convert nvarchar todate in c# and sql
            parameters.Add("@NgayTaoPhieu", phieuthu.NgayTaoPhieu);
            parameters.Add("@MaHocSinh", phieuthu.MaHocSinh);
            parameters.Add("@MaNhanVien", phieuthu.MaNhanVien);
            parameters.Add("@GhiChu", phieuthu.GhiChu);

            //lấy danh sách ct phiếu thu
            //listCt_PhieuThu_HocSinh = getListCt_PhieuThu_HocSinh();
            //............. theem ct phieuthu hocsinh
         
                _db.Execute("InsertPhieuThu", parameters, commandType: CommandType.StoredProcedure);//trong khi...
                foreach (var ctPhieu in listCt_PhieuThu_HocSinh)
                {
                    ctPhieu.MaCT_PhieuThu_HocSinh = getAutoIdCT_PhieuThu_HocSinh();
                    insertCT_phieuThu_hocSinh(ctPhieu);
                }

        }

        public void insertCT_phieuThu_hocSinh(CT_PhieuThu_HocSinh ctpt)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@MaCT_PhieuThu_HocSinh", ctpt.MaCT_PhieuThu_HocSinh);
            parameters.Add("@TenLoaiPhi", ctpt.TenLoaiPhi);
            parameters.Add("@SoLuong", ctpt.SoLuong);
            parameters.Add("@ChiPhi", ctpt.ChiPhi);
            parameters.Add("@MaPhieuThu", ctpt.MaPhieuThu);
            _db.Execute("Insert_Ct_phieuThu_hocSinh", parameters, commandType: CommandType.StoredProcedure);
        }

        /// <summary>
        /// sinh mã tự động cho phiếu thu
        /// </summary>
        /// <returns></returns>
        public string getAutoIdPhieuThu()
        {
            string ma = _db.Query<string>("sp_PhieuThu_NewID", commandType: CommandType.StoredProcedure).Single();
            return ma;
        }
        /// <summary>
        /// sinh mã tự động cho ct_phieuThu_hócinh
        /// </summary>
        /// <returns></returns>
        public string getAutoIdCT_PhieuThu_HocSinh()
        {
            string ma = _db.Query<string>("sp_CT_PhieuThu_HocSinh_NewID", commandType: CommandType.StoredProcedure).Single();
            return ma;
        }

    }
}