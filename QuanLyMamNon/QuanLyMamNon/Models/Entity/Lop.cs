using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanLyMamNon.Models
{
    public class Lop
    {
        //public Lop()
        //{
        //    this.HocSinh = new HashSet<HocSinh>();
        //    this.NhanVien = new HashSet<NhanVien>();
        //}

        public string MaLop { get; set; }
        public string TenLop { get; set; }
        public string GhiChu { get; set; }
        public Nullable<int> SiSo { get; set; }
        
        //public virtual ICollection<HocSinh> HocSinh { get; set; }
        //public virtual LoaiLop LoaiLop { get; set; }
        //public virtual ICollection<NhanVien> NhanVien { get; set; }
    }
}