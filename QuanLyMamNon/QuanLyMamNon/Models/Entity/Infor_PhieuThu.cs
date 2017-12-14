using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanLyMamNon.Models
{
    public class Infor_PhieuThu
    {
        public string NgayTaoPhieu { get; set; }
        public string MaHocSinh { get; set; }
        public string MaNhanVien { get; set; }
        public int SoNgayVang { get; set; }
        public int SoNgayAnSang { get; set; }
        public int SoNgayAnTrua { get; set; }
        public decimal ChiPhi { get; set; }
    }
}