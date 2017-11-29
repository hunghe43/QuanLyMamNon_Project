using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanLyMamNon.Models
{
    public class PhieuThu
    {
        public string NgayTaoPhieu { get; set; }
        public int MaHocSinh { get; set; }
        public string MaNhanVien { get; set; }
        public int SoNgayVang { get; set; }
        public int SoNgayAnSang { get; set; }
        public int SoNgayAnTrua { get; set; }
        public decimal ChiPhi { get; set; }

        //public virtual HocSinh HocSinh { get; set; }
        //public virtual NhanVien NhanVien { get; set; }
    }
}