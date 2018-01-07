using QuanLyMamNon.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanLyMamNon.Models.Dao
{
    public class ViewModelPhieuThu
    {
        public decimal tienAnSang { get { return HocPhiDefaul.tienAnSang; } }
        public decimal tienAnTrua { get { return HocPhiDefaul.tienAnTrua; } }
        public decimal tienHoc1Buoi { get { return HocPhiDefaul.tienHoc1Buoi; } }
        public decimal tong1 { get; set; }
        public decimal tong2 { get; set; }
        public decimal tong3 { get; set; }
        public decimal tong4 { get; set; }

        public HocSinh hocSinh { get; set; }
        public Infor_TheoDoi infor_phieuThu { get; set; }
        public PhieuThu phieuThu { get; set; }
        public List<DichVuNgoai> listDichVuNgoai { get; set; }
        public List<HocPhi> listHocPhiThang { get; set; }
        public List<HocPhi> listHocPhiDauNam { get; set; }
    }
}