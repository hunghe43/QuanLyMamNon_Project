﻿using QuanLyMamNon.Models;
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
    }
}