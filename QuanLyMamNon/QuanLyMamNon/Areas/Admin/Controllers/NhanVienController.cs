using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QuanLyMamNon.Reponsitory;
using QuanLyMamNon.Models;

namespace QuanLyMamNon.Areas.Admin.Controllers
{
    public class NhanVienController : Controller
    {
        // GET: Admin/Login
        [HttpGet]
        public ActionResult Login()
        {
            var nhanvien = Session["NhanVien"];
            return View();
        }
     
        public ActionResult Login(string email, string password)
        {
            NhanVienReponsitory nvRespon = new NhanVienReponsitory();
            var nhanvien = new NhanVien();

            if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password))
            {
                ViewBag.messErr = "Bạn chưa nhập đầy đủ thông tin đăng nhập!";
                return View("Login");
            }
            else
            {
                nhanvien = nvRespon.getNhanVienLogin(email, password);
                if (nhanvien == null)
                {
                    ViewBag.messErr = "Đăng nhập thất bại!";
                    return View("Login");
                }
                else
                {
                    Session["NhanVien"] = nhanvien;
                    return RedirectToAction("Index","HomeAdmin");
                }

            }
        }
        public ActionResult Logout()
        {
            Session.Clear();
            Session.Abandon();
            return View("Login");
        }
    }
}