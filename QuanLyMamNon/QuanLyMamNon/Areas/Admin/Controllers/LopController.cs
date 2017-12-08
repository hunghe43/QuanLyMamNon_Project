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
    public class LopController : Controller
    {
        HocPhiReponsitory hocphiRepon = new HocPhiReponsitory();
        LopReponsitory lopRepon = new LopReponsitory();
        // GET: Home  CURD 
        public ActionResult Index()
        {
            var listLop = lopRepon.getAllLop();
            return View(listLop);
        }
        // GET: details lop
        public ActionResult Detail(string id)
        {
            var lop = lopRepon.getLopForId(id);
            return PartialView("Partial_DetailLop", lop);
        }
        // GET: add 
        public ActionResult Add()
        {
            return PartialView("Partial_AddLop");
        }
        // POST: add 
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Add(Lop lop)
        {
            
            lopRepon.AddLop(lop);
            return RedirectToAction("Index");
        }
        // GET: edit 
        public ActionResult Update(string id)
        {
            var lop = lopRepon.getLopForId(id);
            return PartialView("Partial_UpdateLop", lop);
        }
        // POST: edit 
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Update(Lop lop)
        {
            lopRepon.UpdateLop(lop);
            return RedirectToAction("Index");
        }
        // POST: delete lop
        [HttpPost]
        public JsonResult Delete(string id)
        {
            lopRepon.deleteLop(id);
            return Json("ok", JsonRequestBehavior.AllowGet);
        }

    }
}