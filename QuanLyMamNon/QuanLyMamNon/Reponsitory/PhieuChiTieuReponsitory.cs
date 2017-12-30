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
    public class PhieuChiTieuReponsitory
    {
        private IDbConnection _db = new SqlConnection
   (ConfigurationManager.ConnectionStrings["SqlConn"].ConnectionString);

        /// <summary>
        /// lấy tất cả PhieuChiTieu
        /// </summary>
        /// <returns></returns>
        public List<PhieuChiTieu> getAllPhieuChiTieu()
        {
            List<PhieuChiTieu> list = this._db.Query<PhieuChiTieu>("getAllPhieuChiTieu", commandType: CommandType.StoredProcedure).ToList();
            return list;
        }
        /// <summary>
        /// thêm mới 
        /// </summary>
        /// <param name="nhanvien"></param>
        /// <returns></returns>
        public void AddPhieuChiTieu(PhieuChiTieu PhieuChiTieu)
        {
            PhieuChiTieu.MaPhieuChiTieu = getAutoIdPhieuChiTieu();

            var parameters = new DynamicParameters();
            parameters.Add("@MaPhieuChiTieu", PhieuChiTieu.MaPhieuChiTieu);
            parameters.Add("@NgayTaoPhieu", PhieuChiTieu.NgayTaoPhieu);
            parameters.Add("@MaNhanVien", PhieuChiTieu.MaNhanVien);
            parameters.Add("@TenNguoiChi", PhieuChiTieu.TenNguoiChi);
            parameters.Add("@LyDo", PhieuChiTieu.LyDo);
            parameters.Add("@ChiPhi", PhieuChiTieu.ChiPhi);
            parameters.Add("@ChungTu", PhieuChiTieu.ChungTu);
            parameters.Add("@Action", "Insert");
            _db.Execute("InsertUpdatePhieuChiTieu", parameters, commandType: CommandType.StoredProcedure);

        }
        /// <summary>
        /// get theo tdate 
        /// </summary>
        /// <param name="MaNhanVien"></param>
        /// <returns></returns>
        public PhieuChiTieu getPhieuChiTieuForDate(string thang)
        {
            //convert datetjme to strjng 'thang'
            var PhieuChiTieu = new PhieuChiTieu();
            return (PhieuChiTieu);
        }
        /// <summary>
        /// get theo ma 
        /// </summary>
        /// <param name="MaNhanVien"></param>
        /// <returns></returns>
        public PhieuChiTieu getPhieuChiTieuForId(string id)
        {
            //lấy ra...?
            var PhieuChiTieu = new PhieuChiTieu();
            return (PhieuChiTieu);
        }
        /// <summary>
        /// update
        /// </summary>
        /// <param name="nhanvien"></param>
        /// <returns></returns>
        public void UpdatePhieuChiTieu(PhieuChiTieu PhieuChiTieu)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@MaPhieuChiTieu", PhieuChiTieu.MaPhieuChiTieu);
            parameters.Add("@NgayTaoPhieu", PhieuChiTieu.NgayTaoPhieu);
            parameters.Add("@MaNhanVien", PhieuChiTieu.MaNhanVien);
            parameters.Add("@TenNguoiChi", PhieuChiTieu.TenNguoiChi);
            parameters.Add("@LyDo", PhieuChiTieu.LyDo);
            parameters.Add("@ChiPhi", PhieuChiTieu.ChiPhi);
            parameters.Add("@ChungTu", PhieuChiTieu.ChungTu);
            parameters.Add("@Action", "Update");
            _db.Execute("InsertUpdatePhieuChiTieu", parameters, commandType: CommandType.StoredProcedure);
        }
        /// <summary>
        /// delete 
        /// </summary>
        /// <param name="nhanvien"></param>
        /// <returns></returns>
        public void deletePhieuChiTieu(string MaPhieuChiTieu)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@MaPhieuChiTieu", MaPhieuChiTieu);
            _db.Execute("DeletePhieuChiTieu", parameters, commandType: CommandType.StoredProcedure);
        }
        /// <summary>
        /// sinh mã tự động cho Lớp
        /// </summary>
        /// <returns></returns>
        public string getAutoIdPhieuChiTieu()
        {
            string maPhieuChiTieu = _db.Query<string>("sp_PhieuChiTieu_NewID", commandType: CommandType.StoredProcedure).Single();
            return maPhieuChiTieu;
        }

    }
}