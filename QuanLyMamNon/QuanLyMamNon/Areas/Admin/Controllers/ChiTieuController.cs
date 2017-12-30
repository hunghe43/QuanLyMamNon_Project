using QuanLyMamNon.Models;
using QuanLyMamNon.Reponsitory;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QuanLyMamNon.Areas.Admin.Controllers
{
    public class ChiTieuController : Controller
    {

        PhieuChiTieuReponsitory phieuChiTieuRepon = new PhieuChiTieuReponsitory();
        public ActionResult Index()
        {
            var listPhieuChiTieu = phieuChiTieuRepon.getAllPhieuChiTieu();
            return View(listPhieuChiTieu);
        }

        // GET: add 
        public ActionResult Add()
        {
            return PartialView("Partial_AddPhieuChiTieu");
        }
        // POST: add 
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Add(PhieuChiTieu PhieuChiTieu)
        {
            phieuChiTieuRepon.AddPhieuChiTieu(PhieuChiTieu);
            return RedirectToAction("Index");
        }
        // GET: edit 
        public ActionResult Update(string id)
        {
            var PhieuChiTieu = phieuChiTieuRepon.getPhieuChiTieuForId(id);
            return PartialView("Partial_UpdatePhieuChiTieu", PhieuChiTieu);
        }
        // POST: edit 
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Update(PhieuChiTieu PhieuChiTieu)
        {
            phieuChiTieuRepon.UpdatePhieuChiTieu(PhieuChiTieu);
            return RedirectToAction("Index");
        }
        // POST: delete PhieuChiTieu
        [HttpPost]
        public JsonResult Delete(string id)
        {
            phieuChiTieuRepon.deletePhieuChiTieu(id);
            return Json("ok", JsonRequestBehavior.AllowGet);
        }
    }
}