using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanLyMamNon.Models
{
    public class NhanVien
    {
        //[System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        //public NhanVien()
        //{
        //    this.HoaDon = new HashSet<HoaDon>();
        //    this.PhieuTheoDoi = new HashSet<PhieuTheoDoi>();
        //    this.PhieuThu = new HashSet<PhieuThu>();
        //}

        public string MaNhanVien { get; set; }
        public string TenNhanVien { get; set; }
        public string DiaChi { get; set; }
        public string Sdt { get; set; }
        public string Email { get; set; }
        public string MaChucVu { get; set; }
        public string MaLop { get; set; }
        public string Password { get; set; }

        //public virtual ChucVu ChucVu { get; set; }
        //public virtual ICollection<HoaDon> HoaDon { get; set; }
        //public virtual Lop Lop { get; set; }
        //public virtual ICollection<PhieuTheoDoi> PhieuTheoDoi { get; set; }
        //public virtual ICollection<PhieuThu> PhieuThu { get; set; }
    }
}