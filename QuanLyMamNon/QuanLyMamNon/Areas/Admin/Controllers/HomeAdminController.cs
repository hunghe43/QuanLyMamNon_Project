using QuanLyMamNon.Models;
using QuanLyMamNon.Reponsitory;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QuanLyMamNon.Areas.Admin.Controllers
{
    public class HomeAdminController : Controller
    {
        // GET: Admin/HomeAdmin
        public ActionResult Index()
        {
            var nhanvien = Session["NhanVien"];
            if (nhanvien == null)
            {
                return RedirectToAction("Login","NhanVien",null);
            }
            return View();
        }
        public ActionResult HomeGiaoVien()
        {
            var nhanvien = (NhanVien)Session["NhanVien"];
            if (nhanvien == null)
            {
                return RedirectToAction("Login", "NhanVien", null);
            }
            NhanVienReponsitory nvRepon = new NhanVienReponsitory();
            
            var giaoVienChuNhiem = nvRepon.GetGiaoVienChuNhiem(nhanvien.MaNhanVien);
            ViewBag.TenGVCN = giaoVienChuNhiem.TenGiaoVien;
            ViewBag.DiaChi = giaoVienChuNhiem.DiaChi;
            ViewBag.Sdt = giaoVienChuNhiem.Sdt;
            ViewBag.Email = giaoVienChuNhiem.Email;
            ViewBag.TenLop = giaoVienChuNhiem.TenLop;
            ViewBag.Siso = giaoVienChuNhiem.Siso;
            return View();
        }
    }
}