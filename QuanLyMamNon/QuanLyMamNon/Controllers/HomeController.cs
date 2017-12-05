using QuanLyMamNon.Models;
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
        HocSinhReponsitory rep = new HocSinhReponsitory();
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

        [HttpPost]
        public ActionResult Infomation(string id)
        {
            if (id != null)
            {
                Infor_HocSinh hs = null;
                hs = rep.FindHocSinhInfor(id);
                if (hs != null)
                {
                    return View(hs);
                }
                return View("Index");
            }
            return View("Index");
        }
        public ActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Register(HocSinh objHS)
        {            

            rep.AddHocSinh(objHS);
            return View();
        }

    }

}
