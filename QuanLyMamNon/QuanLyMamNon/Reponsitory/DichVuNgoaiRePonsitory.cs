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
    public class DichVuNgoaiRePonsitory
    {
        private IDbConnection _db = new SqlConnection
      (ConfigurationManager.ConnectionStrings["SqlConn"].ConnectionString);

        /// <summary>
        /// lấy tất cả Dịch vụ ngoài
        /// </summary>
        /// <returns></returns>
        public List<DichVuNgoai> getAllDichVuNgoai()
        {
            List<DichVuNgoai> list = this._db.Query<DichVuNgoai>("SELECT * FROM DichVuNgoai").ToList();
            return list;
        }
        /// <summary>
        /// thêm mới 
        /// </summary>
        /// <param name="nhanvien"></param>
        /// <returns></returns>
        public void AddDichVuNgoai(DichVuNgoai DichVuNgoai)
        {
            DichVuNgoai.MaDichVu = getAutoIdDichVuNgoai();
            //thêm mới loại học phí
            HocPhiReponsitory hocphiRepon = new HocPhiReponsitory();
            var hocphi = new HocPhi();
            hocphi.MaHocPhi = DichVuNgoai.MaDichVu;
            hocphi.TenHocPhi = DichVuNgoai.TenDV;
            hocphi.ChiPhi = DichVuNgoai.ChiPhi;
            hocphi.GhiChu = DichVuNgoai.GhiChu;
            hocphiRepon.AddHocPhi(hocphi);

            var parameters = new DynamicParameters();
            parameters.Add("@MaDichVu", DichVuNgoai.MaDichVu);
            parameters.Add("@TenDV", DichVuNgoai.TenDV);
            parameters.Add("@ChiPhi", DichVuNgoai.ChiPhi);
            parameters.Add("@GhiChu", DichVuNgoai.GhiChu);
            parameters.Add("@Action", "Insert");
            _db.Execute("InsertUpdateDichVuNgoai", parameters, commandType: CommandType.StoredProcedure);

        }
        /// <summary>
        /// get theo ma 
        /// </summary>
        /// <param name="MaNhanVien"></param>
        /// <returns></returns>
        public DichVuNgoai getDichVuNgoaiForId(string MaDichVuNgoai)
        {
            var DichVuNgoai = getAllDichVuNgoai().Find(x => x.MaDichVu == MaDichVuNgoai);
            return (DichVuNgoai);
        }
        /// <summary>
        /// update
        /// </summary>
        /// <param name="nhanvien"></param>
        /// <returns></returns>
        public void UpdateDichVuNgoai(DichVuNgoai DichVuNgoai)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@MaDichVu", DichVuNgoai.MaDichVu);
            parameters.Add("@TenDV", DichVuNgoai.TenDV);
            parameters.Add("@ChiPhi", DichVuNgoai.ChiPhi);
            parameters.Add("@GhiChu", DichVuNgoai.GhiChu);
            parameters.Add("@Action", "Update");
            _db.Execute("InsertUpdateDichVuNgoai", parameters, commandType: CommandType.StoredProcedure);
        }
        /// <summary>
        /// delete 
        /// </summary>
        /// <param name="DichVuNgoai"></param>
        /// <returns></returns>
        public void deleteDichVuNgoai(string MaDichVuNgoai)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@MaDichVu", MaDichVuNgoai);
            _db.Execute("DeleteDichVuNgoai", parameters, commandType: CommandType.StoredProcedure);
        }
        /// <summary>
        /// sinh mã tự động cho Dịch vụ ngoài
        /// </summary>
        /// <returns></returns>
        public string getAutoIdDichVuNgoai()
        {
            string maDichVuNgoai = _db.Query<string>("sp_DichVuNgoai_NewID", commandType: CommandType.StoredProcedure).Single();
            return maDichVuNgoai;
        }
    }
}