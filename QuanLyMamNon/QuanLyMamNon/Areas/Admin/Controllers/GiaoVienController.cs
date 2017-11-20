using QuanLyMamNon.Models;
using QuanLyMamNon.Reponsitory;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QuanLyMamNon.Areas.Admin.Controllers
{
    public class GiaoVienController : Controller
    {
        // GET: Admin/GiaoVien
        public ActionResult Index()
        {
            var nhanvien = (NhanVien)Session["NhanVien"];
            TempData["nhanvien"] = nhanvien;
            if (nhanvien == null)
            {
                return RedirectToAction("Login", "NhanVien", null);
            }
            return View();   
        }
        public PartialViewResult ThongTinLop()
        {
            var nhanvien = TempData["nhanvien"] as NhanVien;
            NhanVienReponsitory nvRepon = new NhanVienReponsitory();
            //thông tin gv chính
            var giaoVienChuNhiem = nvRepon.GetGiaoVienChuNhiem(nhanvien.MaNhanVien);
            ViewBag.TenGVCN = giaoVienChuNhiem.TenGiaoVien;
            ViewBag.DiaChi = giaoVienChuNhiem.DiaChi;
            ViewBag.Sdt = giaoVienChuNhiem.Sdt;
            ViewBag.Email = giaoVienChuNhiem.Email;
            ViewBag.TenLop = giaoVienChuNhiem.TenLop;
            ViewBag.Siso = giaoVienChuNhiem.Siso;

            //list gv phụ
            var gvPhu = nvRepon.GetGiaoVienPhuForIdGiaoVien(nhanvien.MaNhanVien);
            ViewData["List GVP"] = gvPhu;
            return PartialView("_Partial_ThongTinLop");
        }
        
        public PartialViewResult DanhSachHocSinh()
        {
            var nhanvien = TempData["nhanvien"] as NhanVien;
            HocSinhReponsitory HsRepon = new HocSinhReponsitory();
            var lstHS = HsRepon.GetAllHocSinhForIdGiaoVien(nhanvien.MaNhanVien);
            ViewData["ListHocSinh"] = lstHS;
            return PartialView("_Partial_DanhSachHocSinh");
        }
        public PartialViewResult DiemDanhLop()
        {
            ///đang sửa.....
            var nhanvien = TempData["nhanvien"] as NhanVien;
            PhieuTheoDoiReponsitory ptdRepon = new PhieuTheoDoiReponsitory();
            var currentDate = DateTime.Now;
            PhieuTheoDoi ptd = new PhieuTheoDoi();
            ptd.MaGiaoVien = nhanvien.MaNhanVien;
            ptd.NgayTheoDoi = currentDate;
            ptd.ChiPhiDuTinh = 0;

            ptdRepon.insertPhieuTheoDoiForIdGiaoVien(ptd);
            return PartialView("_Partial_DiemDanhLop");
        }
    }
}