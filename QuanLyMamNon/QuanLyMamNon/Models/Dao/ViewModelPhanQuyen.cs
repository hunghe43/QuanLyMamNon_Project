using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanLyMamNon.Models.Dao
{
    public class ViewModelPhanQuyen
    {
        public List<ChucVu> listChucVu { get; set; }
        public List<Quyen> listQuyen { get; set; }
        public List<Quyen_ChucVu> listQuyenForChucVu { get; set; }
    }
}