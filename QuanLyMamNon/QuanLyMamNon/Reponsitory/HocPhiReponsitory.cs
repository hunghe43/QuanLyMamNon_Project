using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using QuanLyMamNon.Models;
using Dapper;

namespace QuanLyMamNon.Reponsitory
{
    public class HocPhiReponsitory
    {
        private IDbConnection _db = new SqlConnection
       (ConfigurationManager.ConnectionStrings["SqlConn"].ConnectionString);

        /// <summary>
        /// lấy tất cả học phí
        /// </summary>
        /// <returns></returns>
        public List<HocPhi> getAllhocPhi()
        {
            List<HocPhi> listHP = this._db.Query<HocPhi>("SELECT * FROM HocPhi").ToList();
            return listHP;
        }
        /// <summary>
        /// lấy học phí theo loại học phi
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public List<HocPhi> getHocPhiForIdLoaiHP(string id)
        {
            //int dem = this._db.Query<int>("SELECT count(MaHocPhi) FROM HocPhi where LoaiHocPhi like @id", new { @id = id }).SingleOrDefault();
            var listHocPhi = getAllhocPhi().Where(x => x.LoaiHocPhi==id).ToList();            
            return listHocPhi;
        }
        /// <summary>
        /// lấy loại hoc phí theo id
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public LoaiHocPhi getLoaiHocPhiForID(string id)
        {
            var loaihocphi = getAllloaiHocPhi().Find(x => x.MaLoai.Equals(id));
            return loaihocphi;
        }
        /// <summary>
        /// lấy học phí theo id
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public HocPhi getHocPhiForID(string id)
        {
            var hocphi = getAllhocPhi().Find(x => x.MaHocPhi.Equals(id));
            return hocphi;
        }

        /// <summary>
        /// lấy tất cả loại học phí
        /// </summary>
        /// <returns></returns>
        public List<LoaiHocPhi> getAllloaiHocPhi()
        {
            List<LoaiHocPhi> listLoaiHP = this._db.Query<LoaiHocPhi>("SELECT * FROM LoaiHocPhi").ToList();
            return listLoaiHP;
        }
        /// <summary>
        /// sinh mã học phí
        /// </summary>
        /// <returns></returns>
        public string getAutoIdHocPhi()
        {
            string id = _db.Query<string>("sp_HocPhi_NewID", commandType: CommandType.StoredProcedure).Single();
            return id;
        }
        /// <summary>
        /// sinh mã loại học phí
        /// </summary>
        /// <returns></returns>
        public string getAutoIdLoaiHocPhi()
        {
            string id = _db.Query<string>("sp_LoaiHocPhi_NewID", commandType: CommandType.StoredProcedure).Single();
            return id;
        }
        /// <summary>
        /// thêm mới học phi
        /// </summary>
        /// <param name="hocphi"></param>
        public void AddHocPhi(HocPhi hocphi)
        {
            //_db.Open();
            //using (var transaction = _db.BeginTransaction())
            //{
            //    try
            //    {
            //        //using dapper
            //    }
            //    catch (Exception e)
            //    {
            //        transaction.Rollback();
            //    }
            //}
            if (hocphi.MaHocPhi == null)
            {
                hocphi.MaHocPhi = getAutoIdHocPhi();
            }
            var parameters = new DynamicParameters();
            parameters.Add("@MaHocPhi", hocphi.MaHocPhi);
            parameters.Add("@TenHocPhi", hocphi.TenHocPhi);
            parameters.Add("@ChiPhi", hocphi.ChiPhi);
            parameters.Add("@GhiChu", hocphi.GhiChu);
            parameters.Add("@LoaiHocPhi", hocphi.LoaiHocPhi);
            parameters.Add("@Action", "Insert");
            _db.Execute("InsertUpdateHocPhi", parameters, commandType: CommandType.StoredProcedure);
        }
        /// <summary>
        /// edit hoc phi
        /// </summary>
        /// <param name="hocphi"></param>
        public void UpdateHocPhi(HocPhi hocphi)
        {
            _db.Open();
            using (var transaction = _db.BeginTransaction())
            {
                try
                {
                    var parameters = new DynamicParameters();
                    parameters.Add("@MaHocPhi", hocphi.MaHocPhi);
                    parameters.Add("@TenHocPhi", hocphi.TenHocPhi);
                    parameters.Add("@ChiPhi", hocphi.ChiPhi);
                    parameters.Add("@GhiChu", hocphi.GhiChu);
                    parameters.Add("@LoaiHocPhi", hocphi.LoaiHocPhi);
                    parameters.Add("@Action", "Update");
                    _db.Execute("InsertUpdateHocPhi", parameters, commandType: CommandType.StoredProcedure, transaction: transaction);
                    transaction.Commit();
                }
                catch (Exception e)
                {
                    transaction.Rollback();
                }
            }
        }
        /// <summary>
        /// delete hoc phi
        /// </summary>
        /// <param name="MaHocPhi"></param>
        public void deleteHocPhi(string MaHocPhi)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@MaHocPhi", MaHocPhi);
            _db.Execute("DeleteHocPhi", parameters, commandType: CommandType.StoredProcedure);
        }
        /// <summary>
        /// thêm mới loại học phi
        /// </summary>
        /// <param name="Loaihocphi"></param>
        public void AddLoaiHocPhi(LoaiHocPhi loaihocphi)
        {
            loaihocphi.MaLoai = getAutoIdLoaiHocPhi();
            var parameters = new DynamicParameters();
            parameters.Add("@MaLoai", loaihocphi.MaLoai);
            parameters.Add("@TenLoai", loaihocphi.TenLoai);
            parameters.Add("@GhiChu", loaihocphi.GhiChu);
            parameters.Add("@Action", "Insert");
            _db.Execute("InsertUpdateLoaiHocPhi", parameters, commandType: CommandType.StoredProcedure);
        }
        /// <summary>
        /// edit Loai hoc phi
        /// </summary>
        /// <param name="Loaihocphi"></param>
        public void UpdateLoaiHocPhi(LoaiHocPhi loaihocphi)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@MaLoai", loaihocphi.MaLoai);
            parameters.Add("@TenLoai", loaihocphi.TenLoai);
            parameters.Add("@GhiChu", loaihocphi.GhiChu);
            parameters.Add("@Action", "Update");
            _db.Execute("InsertUpdateLoaiHocPhi", parameters, commandType: CommandType.StoredProcedure);
        }
        /// <summary>
        /// delete loaihocphi
        /// </summary>
        /// <param name="MaLoaiHocPhi"></param>
        public void deleteLoaiHocPhi(string MaLoai)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@MaLoai", MaLoai);
            _db.Execute("DeleteLoaiHocPhi", parameters, commandType: CommandType.StoredProcedure);
        }
    }
}