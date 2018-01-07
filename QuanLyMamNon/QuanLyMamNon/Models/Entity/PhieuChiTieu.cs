using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanLyMamNon.Models
{
    public class PhieuChiTieu
    {
        public string MaPhieuChiTieu { get; set; }
        
        public DateTime NgayTaoPhieu { get; set; }
        
        public string MaNhanVien { get; set; }
        
        public string TenNguoiChi { get; set; }
        
        public string LyDo { get; set; }
        
        public decimal ChiPhi { get; set; }
        
        
    }
}