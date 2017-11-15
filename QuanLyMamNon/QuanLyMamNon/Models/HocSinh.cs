using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanLyMamNon.Models
{
    public class HocSinh
    {
       public HocSinh()
        {
            this.CT_DichVu_HocSinh = new HashSet<CT_DichVu_HocSinh>();
            this.CT_NgayTheoDoi = new HashSet<CT_NgayTheoDoi>();
            this.PhieuThu = new HashSet<PhieuThu>();
        }

        public int MaHocSinh { get; set; }
        public string Ten { get; set; }
        public Nullable<System.DateTime> NgaySinh { get; set; }
        public string GioiTinh { get; set; }
        public string DiaChi { get; set; }
        public string TinhTrang { get; set; }
        public Nullable<int> ChieuCao { get; set; }
        public Nullable<int> CanNang { get; set; }
        public string TenPhuHuynh { get; set; }
        public string SoCmt { get; set; }
        public string Sdt { get; set; }
        public string Email { get; set; }
        public Nullable<System.DateTime> NgaySinhPhuHuynh { get; set; }
        public string GhiChu { get; set; }
        public string MaLop { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public Nullable<int> TrangThai { get; set; }
        
        public virtual ICollection<CT_DichVu_HocSinh> CT_DichVu_HocSinh { get; set; }
        public virtual ICollection<CT_NgayTheoDoi> CT_NgayTheoDoi { get; set; }
        public virtual Lop Lop { get; set; }
        public virtual ICollection<PhieuThu> PhieuThu { get; set; }
    }
}