using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanLyMamNon.Models
{
    public class Infor_HocSinh
    {
        public string MaHocSinh { get; set; }         
        public string TenHocSinh { get; set; }         
        public Nullable<System.DateTime> NgaySinh { get; set; }
        public string GioiTinh { get; set; }
        public string DiaChi { get; set; }
        public string TinhTrang { get; set; }
        public Nullable<int> ChieuCao { get; set; }
        public Nullable<int> CanNang { get; set; }
        public string DoiTuong { get; set; }
        public string TenPhuHuynh { get; set; }
        public string SdtPhuHuynh { get; set; }
        public string EmailPhuHuynh { get; set; }
        public Nullable<System.DateTime> NgaySinhPhuHuynh { get; set; }
        public string GhiChu { get; set; }
        public string MaLop { get; set; }
        public string TenLop { get; set; }
        public string TenGiaoVien { get; set; }
        public string SdtGiaoVien { get; set; }
        public string EmailGiaoVien { get; set; }

        
    }
}