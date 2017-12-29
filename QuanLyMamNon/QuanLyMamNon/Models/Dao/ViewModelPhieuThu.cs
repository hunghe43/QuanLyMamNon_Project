using QuanLyMamNon.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanLyMamNon.Models.Dao
{
    public class ViewModelPhieuThu
    {
        public decimal tienAnSang = HocPhiDefaul.tienAnSang;
        public decimal tienAnTrua = HocPhiDefaul.tienAnTrua;
        public decimal tienHoc1Buoi = HocPhiDefaul.tienHoc1Buoi;

        public HocSinh hocSinh { get; set; }
        public Infor_TheoDoi infor_phieuThu { get; set; }
        public PhieuThu phieuThu { get; set; }
        public List<DichVuNgoai> listDichVuNgoai { get; set; }
        public List<HocPhi> listHocPhiThang { get; set; }
    }
}