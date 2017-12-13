using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanLyMamNon.Models.Dao
{
    public class ViewModelPhieuThu
    {

        public HocSinh hocSinh { get; set; }
        public PhieuThu phieuThu { get; set; }
        public List<DichVuNgoai> listDichVuNgoai { get; set; }
        public List<HocPhi> listHocPhiThang { get; set; }
    }
}