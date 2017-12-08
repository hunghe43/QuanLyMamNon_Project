using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanLyMamNon.Models.Dao
{
    public class ViewModelHocPhi
    {
        public List<LoaiHocPhi> listLoaiHocPhi { get; set; }
        public List<HocPhi> listHocPhi { get; set; }
        public HocPhi hocphi { get; set; }
    }
}