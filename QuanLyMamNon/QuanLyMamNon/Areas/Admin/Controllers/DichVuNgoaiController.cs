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
            var listDichVuNgoai = hocphiRepon.getAllDichVuNgoai();
            return View(listDichVuNgoai);
        }

        // GET: add 
        public ActionResult Add()
        {
            return PartialView("Partial_AddDichVuNgoai");
        }
        // POST: add 
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Add(DichVuNgoai dichvungoai)
        {

            hocphiRepon.AddDichVuNgoai(dichvungoai);
            return RedirectToAction("Index");
        }
        // GET: edit 
        public ActionResult Update(string id)
        {
            var DichVuNgoai = hocphiRepon.getDichVuNgoaiForId(id);
            return PartialView("Partial_UpdateDichVuNgoai", DichVuNgoai);
        }
        // POST: edit 
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Update(DichVuNgoai dichvungoai)
        {
            hocphiRepon.UpdateDichVuNgoai(dichvungoai);
            return RedirectToAction("Index");
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