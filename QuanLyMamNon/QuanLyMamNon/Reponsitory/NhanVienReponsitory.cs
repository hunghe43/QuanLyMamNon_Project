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
    public class NhanVienReponsitory
    {
        private IDbConnection _db = new SqlConnection
       (ConfigurationManager.ConnectionStrings["SqlConn"].ConnectionString);
        /// <summary>
        /// lấy tất cả nhân viên
        /// </summary>
        /// <returns> list<nhanvien></returns>
        public List<NhanVien> getAllNhanVien()
        {
            List<NhanVien> listHs = _db.Query<NhanVien>("GetAllNhanVien", commandType: CommandType.StoredProcedure).ToList();
            return listHs;
        }
        /// <summary>
        /// sinh mã tự động cho nhân viên
        /// </summary>
        /// <returns></returns>
        public string getAutoIdNhanVien()
        {
            string manv= _db.Query<string>("sp_NhanVien_NewID", commandType: CommandType.StoredProcedure).Single();
            return manv;
        }
        /// <summary>
        /// lấy danh sách nhân vien theo mã chức vụ
        /// </summary>
        /// <param name="maChucVu"></param>
        /// <returns></returns>
        public List<NhanVien> getNhanVienForIDChucVu(string maChucVu)
        {
            var listNV = getAllNhanVien().Where(x => x.MaChucVu == maChucVu).ToList();
            return listNV;
        }
        /// <summary>
        /// thêm mới nhân viên
        /// </summary>
        /// <param name="nhanvien"></param>
        /// <returns></returns>
        public void  AddNhanVien(NhanVien nhanvien)
        {
            nhanvien.MaNhanVien = getAutoIdNhanVien();
            var parameters = new DynamicParameters();
            parameters.Add("@MaNhanVien", nhanvien.MaNhanVien);
            parameters.Add("@TenNhanVien", nhanvien.TenNhanVien);
            parameters.Add("@DiaChi", nhanvien.DiaChi);
            parameters.Add("@Sdt", nhanvien.Sdt);
            parameters.Add("@Email", nhanvien.Email.Trim());
            parameters.Add("@MaChucVu", nhanvien.MaChucVu);
            parameters.Add("@MaLop", nhanvien.MaLop);
            parameters.Add("@Password", nhanvien.Password.Trim());
            parameters.Add("@Action", "Insert");
            _db.Execute("InsertUpdateNhanVien", parameters, commandType: CommandType.StoredProcedure);
           
        }
        /// <summary>
        /// get nhan vien theo ma nhan vien
        /// </summary>
        /// <param name="MaNhanVien"></param>
        /// <returns></returns>
        public NhanVien getNhanvienForId(string MaNhanVien)
        {
            var nhanvien = getAllNhanVien().Find(x => x.MaNhanVien == MaNhanVien);
            return (nhanvien);
        }
        /// <summary>
        /// update nhan vien
        /// </summary>
        /// <param name="nhanvien"></param>
        /// <returns></returns>
        public void UpdateNhanVien(NhanVien nhanvien)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@MaNhanVien", nhanvien.MaNhanVien);
            parameters.Add("@TenNhanVien", nhanvien.TenNhanVien);
            parameters.Add("@DiaChi", nhanvien.DiaChi);
            parameters.Add("@Sdt", nhanvien.Sdt);
            parameters.Add("@Email", nhanvien.Email.Trim());
            parameters.Add("@MaChucVu", nhanvien.MaChucVu);
            parameters.Add("@MaLop", nhanvien.MaLop);
            parameters.Add("@Password", nhanvien.Password.Trim());
            parameters.Add("@Action", "Update");
            _db.Execute("InsertUpdateNhanVien", parameters, commandType: CommandType.StoredProcedure);
            
        }
        /// <summary>
        /// delete nhan vien
        /// </summary>
        /// <param name="nhanvien"></param>
        /// <returns></returns>
        public void deleteNhanVien(string MaNhanVien)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@MaNhanVien", MaNhanVien);
            _db.Execute("DeleteNhanVien", parameters, commandType: CommandType.StoredProcedure);            
        }

        /// <summary>
        /// lấy thông tin đăng nhập của nhân viên
        /// </summary>
        /// <param name="userName">userName</param>
        /// <param name="password">password</param>
        /// <returns>đối tượng nhân viên</returns>
        public NhanVien getNhanVienLogin(string email,string password)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@email", email);
            parameters.Add("@password", password);
            NhanVien nhanvien = _db.Query<NhanVien>("getNhanVienLogin", parameters, commandType: CommandType.StoredProcedure).SingleOrDefault();
            return nhanvien;
        }
        /// <summary>
        /// lấy thông tin lớp của giáo viên đặng nhập
        /// </summary>
        /// <returns></returns>
        public Lop getLopForIdGiaoVien(string id)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@id", id);
            Lop obj = _db.Query<Lop>("getLopForIdGiaoVien", parameters, commandType: CommandType.StoredProcedure).SingleOrDefault();
            return obj;
        }
        /// <summary>
        /// kiểm tra xem login có phải giáo viên hay không
        /// </summary>
        /// <returns> true: là gv
        /// false: không phải gv</returns>
        public bool checkExitstGiaoVien(string id)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            NhanVien obj = _db.Query<NhanVien>("sp_CheckExitsGiaoVien", parameters, commandType: CommandType.StoredProcedure).SingleOrDefault();
            if (obj != null)
            {
                return true;
            }
            return false;
        }
        /// <summary>
        /// lấy thông tin giáo viên chủ nhiệm với mã truyền vào
        /// </summary>
        /// <param name="id">mã giáo viên khi đăng nhập</param>
        /// <returns> đối tượng infor_GiaoVien</returns>
        public Infor_GiaoVien GetGiaoVienChuNhiem(string id)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@id", id);
            Infor_GiaoVien inforGiaoVien = _db.Query<Infor_GiaoVien>("sp_GetInfoGiaoVienChuNhiem", parameters, commandType: CommandType.StoredProcedure).SingleOrDefault();         
            return inforGiaoVien;
        }
        /// <summary>
        ///lấy danh sách giáo viên phụ dạy cùng giáo viên chính
        /// </summary>
        /// <param name="id"> id giáo viên chính</param>
        /// <returns> danh sách giáo viên infor</returns>
        public List<Infor_GiaoVien> GetListGVForIdLogin(string id)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            List<Infor_GiaoVien> lst = _db.Query<Infor_GiaoVien>("sp_GetListGVForIdLogin", parameters, commandType: CommandType.StoredProcedure).ToList();
            return lst;
        }
       
        /// <summary>
        /// lấy danh sách quyền của nhân viên
        /// </summary>
        /// <param name="id">id nhanvien</param>
        /// <returns>list String</returns>
        public List<string> GetQuyenNhanVien(string id)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@id", id);
            var lst = _db.Query<string>("sp_GetQuyenNhanVien", parameters, commandType: CommandType.StoredProcedure).ToList();
            return lst;
        }
        /// <summary>
        /// kiểm tra xem email đã tồn tại chưa
        /// </summary>
        /// <param name="email"></param>
        /// <returns>true: đã tồn tại
        /// false: chưa tồn tại</returns>
        public bool checkExistEmail(string email)
        {
            var nhanvien = getAllNhanVien().Where(x => x.Email.Equals(email)).SingleOrDefault();
            if (nhanvien != null)
            {
                return true;
            }
            return false;
            
        }
    }
}