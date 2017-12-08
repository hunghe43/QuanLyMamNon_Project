using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanLyMamNon.Models
{
    public class Infor_GiaoVien
    {
        public string MaGiaoVien { get; set; }
        public string TenGiaoVien { get; set; }
        public string MaChucVu { get; set; }
        public string TenChucVu { get; set; }
        public string MaLop { get; set; }
        public string TenLop { get; set; }
        public int Siso { get; set; }
        public string DiaChi { get; set; }
        public string Sdt { get; set; }
        public string Email { get; set; }

        Infor_GiaoVien()
        {

        }
    }
}