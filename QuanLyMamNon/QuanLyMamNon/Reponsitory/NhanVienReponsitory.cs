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
            List<NhanVien> listHs = _db.Query<NhanVien>("SELECT * FROM NhanVien").ToList();
            return listHs;
        }
        public string getmanv()
        {
            string query = "EXEC sp_NhanVien_NewID";
            string manv= _db.Query<string>("sp_NhanVien_NewID", commandType: CommandType.StoredProcedure).SingleOrDefault();
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
            var parameters = new DynamicParameters();
            parameters.Add("@MaNhanVien", nhanvien.MaNhanVien);
            parameters.Add("@TenNhanVien", nhanvien.TenNhanVien);
            parameters.Add("@DiaChi", nhanvien.DiaChi);
            parameters.Add("@Sdt", nhanvien.Sdt);
            parameters.Add("@Email", nhanvien.Email);
            parameters.Add("@MaChucVu", nhanvien.MaChucVu);
            parameters.Add("@MaLop", nhanvien.MaLop);
            parameters.Add("@Password", nhanvien.Password);
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
            parameters.Add("@Email", nhanvien.Email);
            parameters.Add("@MaChucVu", nhanvien.MaChucVu);
            parameters.Add("@MaLop", nhanvien.MaLop);
            parameters.Add("@Password", nhanvien.Password);
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
            var lstNhanVien = getAllNhanVien().ToList();
            var nhanvien = lstNhanVien.Find(x => x.Email==email && x.Password.Equals(password));            
            return nhanvien;
        }

        /// <summary>
        /// lấy thông tin giáo viên chủ nhiệm với mã truyền vào
        /// </summary>
        /// <param name="id">mã giáo viên khi đăng nhập</param>
        /// <returns> đối tượng infor_GiaoVien</returns>
        public Infor_GiaoVien GetGiaoVienChuNhiem(string id)
        {
            //QR003
            string query = "select nv.MaNhanVien as MaGiaoVien,nv.TenNhanVien as TenGiaoVien,cv.MaChucVu,cv.TenChucVu,lp.MaLop,lp.TenLop,lp.SiSo,nv.DiaChi,nv.Sdt,nv.Email "+
                                "from NhanVien nv inner join ChucVu cv on nv.MaChucVu = cv.MaChucVu "+
                                "inner join Lop lp on nv.MaLop = lp.MaLop "+
                                "and cv.MaChucVu = 'GVC'; ";
            var listGiaoVienCN = _db.Query<Infor_GiaoVien>(query).ToList();
            var inforGiaoVien = listGiaoVienCN.Find(x => x.MaGiaoVien.Equals(id));
            return inforGiaoVien;
        }
        /// <summary>
        ///lấy danh sách giáo viên phụ dạy cùng giáo viên chính
        /// </summary>
        /// <param name="id"> id giáo viên chính</param>
        /// <returns> danh sách giáo viên infor</returns>
        public List<Infor_GiaoVien> GetGiaoVienPhuForIdGiaoVien(string id)
        {
            //QR004
            string query = "select nv.MaNhanVien as MaGiaoVien,nv.TenNhanVien as TenGiaoVien,cv.MaChucVu,cv.TenChucVu,lopNew.MaLop,lopNew.TenLop,lopNew.SiSo,nv.DiaChi,nv.Sdt,nv.Email "+
                "from (select lp.MaLop, lp.TenLop, lp.SiSo, lp.MaLoaiLop "+
                        "from Lop lp inner join NhanVien nv on lp.MaLop = nv.MaLop "+
                        "inner join ChucVu cv on nv.MaChucVu = nv.MaChucVu "+
                        "and cv.MaChucVu = 'GVC' and nv.MaNhanVien = @id) as lopNew inner join NhanVien nv on nv.MaLop = lopNew.MaLop "+
                        "inner join ChucVu cv on cv.MaChucVu = nv.MaChucVu "+
                        "and cv.MaChucVu = 'GVP'";
            List<Infor_GiaoVien> lst = _db.Query<Infor_GiaoVien>(query,new { @id=id}).ToList();
            return lst;
        }
       
        /// <summary>
        /// lấy danh sách quyền của nhân viên
        /// </summary>
        /// <param name="id">id nhanvien</param>
        /// <returns>list String</returns>
        public List<string> GetQuyenNhanVien(string id)
        {            
            string query = "select q.MaQuyen from NhanVien nv inner join ChucVu cv on nv.MaChucVu = cv.MaChucVu "+
                "inner join Quyen_ChucVu qc on cv.MaChucVu = qc.MaChucVu "+
                "inner join Quyen q on qc.MaQuyen = q.MaQuyen "+
                "and nv.MaNhanVien = @id";
            List<string> lst = _db.Query<string>(query, new { @id = id }).ToList();
            return lst;
        }
    }
}