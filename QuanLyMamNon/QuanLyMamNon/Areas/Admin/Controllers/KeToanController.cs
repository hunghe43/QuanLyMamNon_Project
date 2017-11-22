using QuanLyMamNon.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QuanLyMamNon.Areas.Admin.Controllers
{
    [AuthorizeController]
    public class KeToanController : Controller
    {
        // GET: Admin/KeToan
        public ActionResult Index()
        {
            return View();
        }
    }
}