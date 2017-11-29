using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanLyMamNon.Models
{
    public class CT_DichVu_HocSinh
    {

        public int MaHocSinh { get; set; }
        public int MaDV { get; set; }
        public string ThangDangKy { get; set; }

        //public virtual DichVuNgoai DichVuNgoai { get; set; }
        //public virtual HocSinh HocSinh { get; set; }
    }
}