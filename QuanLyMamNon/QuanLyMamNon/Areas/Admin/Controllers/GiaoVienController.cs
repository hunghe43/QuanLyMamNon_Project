using QuanLyMamNon.Models;
using QuanLyMamNon.Reponsitory;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QuanLyMamNon.Areas.Admin.Controllers
{
    [AuthorizeController]
    public class GiaoVienController : Controller
    {
        // GET: Admin/GiaoVien
        public ActionResult Index()
        {
            var nhanvien = (NhanVien)Session["NhanVien"];
            TempData["nhanvien"] = nhanvien;
            return View();   
        }
        public PartialViewResult Partial_ThongTinLop()
        {
            var nhanvien = TempData["nhanvien"] as NhanVien;
            NhanVienReponsitory nvRepon = new NhanVienReponsitory();
            //thông tin gv chính
            var giaoVienChuNhiem = nvRepon.GetGiaoVienChuNhiem(nhanvien.MaNhanVien);
            if (giaoVienChuNhiem != null)
            {
                ViewBag.TenGVCN = giaoVienChuNhiem.TenGiaoVien;
                ViewBag.DiaChi = giaoVienChuNhiem.DiaChi;
                ViewBag.Sdt = giaoVienChuNhiem.Sdt;
                ViewBag.Email = giaoVienChuNhiem.Email;
                ViewBag.TenLop = giaoVienChuNhiem.TenLop;
                ViewBag.Siso = giaoVienChuNhiem.Siso;
            }
            //list gv phụ
            var gvPhu = nvRepon.GetGiaoVienPhuForIdGiaoVien(nhanvien.MaNhanVien);
            ViewData["List GVP"] = gvPhu;
            return PartialView("Partial_ThongTinLop");
        }
        
        public PartialViewResult Partial_DanhSachHocSinh()
        {
            var nhanvien = TempData["nhanvien"] as NhanVien;
            HocSinhReponsitory HsRepon = new HocSinhReponsitory();
            var lstHS = HsRepon.GetAllHocSinhForIdGiaoVien(nhanvien.MaNhanVien);
            ViewData["ListHocSinh"] = lstHS;
            return PartialView("Partial_DanhSachHocSinh");
        }
        public PartialViewResult Partial_DiemDanhLop()
        {
            //đang sửa.....
            HocSinhReponsitory hocSinhRepon = new HocSinhReponsitory();
            var nhanvien = TempData["nhanvien"] as NhanVien;
            var listHS = hocSinhRepon.GetAllHocSinhForIdGiaoVien(nhanvien.MaNhanVien);
            var currentDate = DateTime.Now;
            //lấy danh sách tất cả học sinh do giáo viên chủ nhiệm

            return PartialView(listHS);
        }
    }
}