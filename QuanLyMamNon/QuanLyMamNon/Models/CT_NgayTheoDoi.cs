using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanLyMamNon.Models
{
    public class CT_NgayTheoDoi
    {
        public int MaPhieuTheoDoi { get; set; }
        public int MaHocSinh { get; set; }
        public Nullable<bool> DDVang { get; set; }
        public Nullable<bool> DDAnSang { get; set; }
        public Nullable<bool> DDAnTrua { get; set; }
        public string GhiChu { get; set; }
        public Nullable<decimal> ChiPhi { get; set; }

        public virtual HocSinh HocSinh { get; set; }
        public virtual PhieuTheoDoi PhieuTheoDoi { get; set; }
    }
}