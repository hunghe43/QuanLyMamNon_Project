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
        /// <summary>
        /// lấy tất cả lớp
        /// </summary>
        /// <returns></returns>
        public List<Lop> getAllLop()
        {
            List<Lop> list = this._db.Query<Lop>("getAllLop", commandType: CommandType.StoredProcedure).ToList();
            return list;
        }
        /// <summary>
        /// thêm mới 
        /// </summary>
        /// <param name="nhanvien"></param>
        /// <returns></returns>
        public void AddLop(Lop lop)
        {
            lop.MaLop = getAutoIdLop();
            //thêm mới loại học phí
            HocPhiReponsitory hocphiRepon = new HocPhiReponsitory();
            var hocphi = new HocPhi();
            hocphi.MaHocPhi = lop.MaLop;
            hocphi.TenHocPhi = lop.TenLop;
            hocphi.GhiChu = lop.GhiChu;
            hocphiRepon.AddHocPhi(hocphi);

            var parameters = new DynamicParameters();
            parameters.Add("@MaLop", lop.MaLop);
            parameters.Add("@TenLop", lop.TenLop);
            parameters.Add("@GhiChu", lop.GhiChu);
            parameters.Add("@SiSo", lop.SiSo);
            parameters.Add("@Action", "Insert");
            _db.Execute("InsertUpdateLop", parameters, commandType: CommandType.StoredProcedure);

        }
        /// <summary>
        /// get theo ma 
        /// </summary>
        /// <param name="MaNhanVien"></param>
        /// <returns></returns>
        public Lop getLopForId(string MaLop)
        {
            var lop = getAllLop().Find(x => x.MaLop == MaLop);
            return (lop);
        }
        /// <summary>
        /// update
        /// </summary>
        /// <param name="nhanvien"></param>
        /// <returns></returns>
        public void UpdateLop(Lop lop)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@MaLop", lop.MaLop);
            parameters.Add("@TenLop", lop.TenLop);
            parameters.Add("@GhiChu", lop.GhiChu);
            parameters.Add("@SiSo", lop.SiSo);
            parameters.Add("@Action", "Update");
            _db.Execute("InsertUpdateLop", parameters, commandType: CommandType.StoredProcedure);
        }
        /// <summary>
        /// delete 
        /// </summary>
        /// <param name="nhanvien"></param>
        /// <returns></returns>
        public void deleteLop(string MaLop)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@MaLop", MaLop);
            _db.Execute("DeleteLop", parameters, commandType: CommandType.StoredProcedure);
        }
        /// <summary>
        /// sinh mã tự động cho Lớp
        /// </summary>
        /// <returns></returns>
        public string getAutoIdLop()
        {
            string malop = _db.Query<string>("sp_Lop_NewID", commandType: CommandType.StoredProcedure).Single();
            return malop;
        }

    }
}