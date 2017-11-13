﻿using QuanLyMamNon.Models;
using QuanLyMamNon.Reponsitory;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QuanLyMamNon.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            return View();
        }

        public ActionResult Events()
        {
            return View();
        }
        public ActionResult Gallery()
        {
            return View();
        }
        public ActionResult Infomation()
        {
            return View();
        }
        public ActionResult Register()
        {
            return View();
        }
        
        [HttpPost]
        public ActionResult Register(HocSinh objHS)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    HocSinhReponsitory rep = new HocSinhReponsitory();
                    rep.AddHocSinh(objHS);
                    ViewBag.Message = "Records added successfully.";
                }
                return View();
            }
            catch
            {
                return View();
            }
        }

    }
}