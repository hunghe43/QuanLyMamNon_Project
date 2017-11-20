using QuanLyMamNon.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QuanLyMamNon.Areas.Admin.Controllers
{
    public class KeToanController : Controller
    {
        // GET: Admin/KeToan
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
    }
}