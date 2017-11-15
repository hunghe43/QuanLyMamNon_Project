using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanLyMamNon.Models
{
    public class HoaDon
    {
        public int MaHoaDon { get; set; }
        public string TenHoaDon { get; set; }
        public Nullable<System.DateTime> NgayGiaoDich { get; set; }
        public string MaNhanVien { get; set; }
        public Nullable<decimal> ThanhTien { get; set; }

        public virtual NhanVien NhanVien { get; set; }
    }
}