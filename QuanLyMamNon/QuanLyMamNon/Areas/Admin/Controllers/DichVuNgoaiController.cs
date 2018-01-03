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
    public class DichVuNgoaiController : Controller
    {
        DichVuNgoaiRePonsitory hocphiRepon = new DichVuNgoaiRePonsitory();
        // GET: Home  CURD 
        public ActionResult Index()
        {
            try
            {

                var listDichVuNgoai = hocphiRepon.getAllDichVuNgoai();
                return View(listDichVuNgoai);
            }
            catch (Exception ex)
            {
                return RedirectToAction("SystemError", "Login");
            }
        }

        // GET: add 
        public ActionResult Add()
        {
            try
            {

                return PartialView("Partial_AddDichVuNgoai");
            }
            catch (Exception ex)
            {
                return RedirectToAction("SystemError", "Login");
            }
        }
        // POST: add 
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Add(DichVuNgoai dichvungoai)
        {
            try
            {

                hocphiRepon.AddDichVuNgoai(dichvungoai);
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

                var DichVuNgoai = hocphiRepon.getDichVuNgoaiForId(id);
                return PartialView("Partial_UpdateDichVuNgoai", DichVuNgoai);
            }
            catch (Exception ex)
            {
                return RedirectToAction("SystemError", "Login");
            }
        }
        // POST: edit 
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Update(DichVuNgoai dichvungoai)
        {
            try
            {

                hocphiRepon.UpdateDichVuNgoai(dichvungoai);
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                return RedirectToAction("SystemError", "Login");
            }
        }
        // POST: delete DichVuNgoai
        [HttpPost]
        public JsonResult Delete(string id)
        {
            hocphiRepon.deleteDichVuNgoai(id);
            return Json("ok", JsonRequestBehavior.AllowGet);
        }
    }
}