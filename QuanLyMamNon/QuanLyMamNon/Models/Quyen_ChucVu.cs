using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanLyMamNon.Models
{
    public class Quyen_ChucVu
    {
        public string MaQuyen { get; set; }
        public string MaChucVu { get; set; }
        public Nullable<System.DateTime> NgayTao { get; set; }
        public string NguoiTao { get; set; }

        public virtual ChucVu ChucVu { get; set; }
        public virtual Quyen Quyen { get; set; }
    }
}