using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanLyMamNon.Models
{
    public class PhieuThu
    {
        public Nullable<int> Thang { get; set; }
        public Nullable<int> Nam { get; set; }
        public int MaHocSinh { get; set; }
        public string MaNhanVien { get; set; }
        public Nullable<int> SoNgayVang { get; set; }
        public Nullable<int> SoNgayAnSang { get; set; }
        public Nullable<int> SoNgayAnTrua { get; set; }
        public string GhiChu { get; set; }

        public virtual HocSinh HocSinh { get; set; }
        public virtual NhanVien NhanVien { get; set; }
    }
}