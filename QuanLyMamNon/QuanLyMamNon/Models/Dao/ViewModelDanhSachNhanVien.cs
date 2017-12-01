using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanLyMamNon.Models.Dao
{
    public class ViewModelDanhSachNhanVien
    {
        public NhanVien nhanvien { get; set; }
        public List<ChucVu> listChucVu { get; set; }
        public List<NhanVien> listNhanVien { get; set; }
        public List<Lop> listLop { get; set; }
    }
}