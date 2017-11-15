using QuanLyMamNon.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
namespace QuanLyMamNon.Reponsitory
{

    public interface ILopReponsitory
    {

        List<Lop> GetAll();
        Lop Find(int? id);
        Lop Add(Lop lp);
        Lop Update(Lop lp);
        void Remove(int id);
    }
}