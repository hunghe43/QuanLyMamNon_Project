using QuanLyMamNon.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanLyMamNon.Reponsitory
{
    public interface IHocSinhReponsitory
    {
        List<HocSinh> GetAll();
        HocSinhInfor FindHocSinhInfor(int? id);
        HocSinh Add(HocSinh hs);
        HocSinh Update(HocSinh hs);
        void Remove(int id);
    }
    
}