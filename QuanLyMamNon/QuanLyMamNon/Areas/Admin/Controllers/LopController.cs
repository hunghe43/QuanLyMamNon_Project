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
            try
            {
            var listLop = lopRepon.getAllLop();
            return View(listLop);

            }
            catch (Exception ex)
            {
                return RedirectToAction("SystemError", "Login");
            }
        }
        // GET: details lop
        public ActionResult Detail(string id)
        {
            try
            {

            var lop = lopRepon.getLopForId(id);
            return PartialView("Partial_DetailLop", lop);
            }
            catch (Exception ex)
            {
                return RedirectToAction("SystemError", "Login");
            }
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
            try
            {

            lopRepon.AddLop(lop);
            return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                return RedirectToAction("SystemError", "Login");
            }
        }
        // GET: edit 
        public ActionResult Update(string id)
        {
            try
            {

            var lop = lopRepon.getLopForId(id);
            return PartialView("Partial_UpdateLop", lop);
            }
            catch (Exception ex)
            {
                return RedirectToAction("SystemError", "Login");
            }
        }
        // POST: edit 
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Update(Lop lop)
        {
            try
            {

            lopRepon.UpdateLop(lop);
            return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                return RedirectToAction("SystemError", "Login");
            }
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