using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanLyMamNon.Models.Dao
{
    public class ViewModelDangKyDV_HS
    {
        public HocSinh hocsinh { get; set; }
        public NhanVien nhanvien { get; set; }
        public List<DichVuNgoai> listDV { get; set; }
        public List<DichVuNgoai> listDV_HS { get; set; }
        //public CT_DichVu_HocSinh Ct_dv_hs { get; set; }
    }
}