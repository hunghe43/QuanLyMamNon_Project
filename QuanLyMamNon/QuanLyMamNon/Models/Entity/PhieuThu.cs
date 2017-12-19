using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanLyMamNon.Models
{
    public class PhieuThu
    {
        public string MaPhieuThu { get; set; }
        public string NgayTaoPhieu { get; set; }
        public string MaHocSinh { get; set; }
        public string MaNhanVien { get; set; }
        public string GhiChu { get; set; }
        //public virtual HocSinh HocSinh { get; set; }
        //public virtual NhanVien NhanVien { get; set; }
    }
}