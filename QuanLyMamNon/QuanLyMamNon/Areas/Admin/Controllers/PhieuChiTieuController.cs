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
    public class PhieuChiTieuController : Controller
    {

        PhieuChiTieuReponsitory phieuChiTieuRepon = new PhieuChiTieuReponsitory();
        public ActionResult Index()
        {
            try
            {
                var listPhieuChiTieu = phieuChiTieuRepon.getAllPhieuChiTieu();
                return View(listPhieuChiTieu);

            }
            catch (Exception ex)
            {
                return RedirectToAction("SystemError", "Login");
            }
        }
        // GET: details PhieuChiTieu
        public ActionResult Detail(string id)
        {
            try
            {

                var PhieuChiTieu = phieuChiTieuRepon.getPhieuChiTieuForId(id);
                return PartialView("Partial_DetailPhieuChiTieu", PhieuChiTieu);
            }
            catch (Exception ex)
            {
                return RedirectToAction("SystemError", "Login");
            }
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
            try
            {

                var nhanvien = (NhanVien)Session["NhanVien"];
                PhieuChiTieu.MaNhanVien = nhanvien.MaNhanVien;
                phieuChiTieuRepon.AddPhieuChiTieu(PhieuChiTieu);
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
                var PhieuChiTieu = phieuChiTieuRepon.getPhieuChiTieuForId(id);
                return PartialView("Partial_UpdatePhieuChiTieu", PhieuChiTieu);
            }
            catch (Exception ex)
            {
                return RedirectToAction("SystemError", "Login");
            }
        }
        // POST: edit 
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Update(PhieuChiTieu PhieuChiTieu)
        {
            try
            {

                phieuChiTieuRepon.UpdatePhieuChiTieu(PhieuChiTieu);
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                return RedirectToAction("SystemError", "Login");
            }
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