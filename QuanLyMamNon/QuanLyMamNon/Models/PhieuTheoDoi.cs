using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanLyMamNon.Models
{
    public class PhieuTheoDoi
    {
        public PhieuTheoDoi()
        {
            this.CT_NgayTheoDoi = new HashSet<CT_NgayTheoDoi>();
        }

        public int MaPhieuTheoDoi { get; set; }
        public string MaGiaoVien { get; set; }
        public Nullable<System.DateTime> NgayTheoDoi { get; set; }
        public Nullable<decimal> ChiPhiDuTinh { get; set; }
        
        public virtual ICollection<CT_NgayTheoDoi> CT_NgayTheoDoi { get; set; }
        public virtual NhanVien NhanVien { get; set; }
    }
}