using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanLyMamNon.Models.Dao
{
    public class ViewModelDiemDanh
    {
        public List<HocSinh> listHocSinhModel { get; set; }
        public List<CT_NgayTheoDoi> listCT_NgayTheoDoiModel { get; set; }
        public PhieuTheoDoi phieuTheoDoiModel { get; set; }
        public List<Infor_GiaoVien> listGV { get; set; }    
        public Lop lop { get; set; }
    }
}