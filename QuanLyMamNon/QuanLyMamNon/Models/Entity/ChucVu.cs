using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanLyMamNon.Models
{
    public class ChucVu
    {
        //public ChucVu()
        //{
        //    this.NhanVien = new HashSet<NhanVien>();
        //    this.Quyen_ChucVu = new HashSet<Quyen_ChucVu>();
        //}

        public string MaChucVu { get; set; }
        public string TenChucVu { get; set; }
        
        //public virtual ICollection<NhanVien> NhanVien { get; set; }
        //public virtual ICollection<Quyen_ChucVu> Quyen_ChucVu { get; set; }
    }
}