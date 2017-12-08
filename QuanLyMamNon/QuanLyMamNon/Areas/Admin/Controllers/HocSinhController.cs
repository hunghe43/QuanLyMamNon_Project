using QuanLyMamNon.Models;
using QuanLyMamNon.Models.Dao;
using QuanLyMamNon.Reponsitory;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QuanLyMamNon.Areas.Admin.Controllers
{
    [AuthorizeController]
    public class HocSinhController : Controller
    {
        HocSinhReponsitory hocSinhRepon = new HocSinhReponsitory();
        LopReponsitory lopRepon = new LopReponsitory();
        // GET: Home  CURD hocsinh
        public ActionResult Index()
        {
            HocSinhReponsitory HsRepon = new HocSinhReponsitory();
            LopReponsitory lopRepon = new LopReponsitory();
            //danh sách học sinh chưa được phê duyệt
            var listHocSinhDis = hocSinhRepon.GetAllHocSinhDis();
            //danh sách học sinh đang hoạt động
            string MaLop = Request["listLop"];
            var listLop = lopRepon.getAllLop();
            var lstHS = new List<HocSinh>();
            if (string.IsNullOrEmpty(MaLop) || MaLop == "0")
            {
                MaLop = "0";
                lstHS = HsRepon.GetAllHocSinh();
            }
            else
            {
                lstHS = HsRepon.GetHocSinhForIdLop(MaLop);
            }
            ViewBag.select = MaLop;
            var viewModel = new ViewModelDanhSachHS
            {
                listLop = lopRepon.getAllLop(),
                listHocSinh = lstHS,
                listHocSinhDis=listHocSinhDis
            };
            return View(viewModel);
        }
        // GET: details hocsinh
        public ActionResult Detail(string id)
        {
            var listLop = lopRepon.getAllLop();
            var hocsinh = hocSinhRepon.GetHocSinhForId(id);
            if (hocsinh.MaLop == null)
            {
                ViewData["TenLop"] = "None";
            }
            else
            {
                ViewData["TenLop"] = listLop.SingleOrDefault(x => x.MaLop == hocsinh.MaLop).TenLop.ToString();
            }
            ViewModelDanhSachHS viewModel = new ViewModelDanhSachHS
            {
                hocsinh = hocsinh,
                listLop = listLop
            };
            return PartialView("Partial_DetailHocSinh", viewModel);
        }
        // GET: add hocsinh
        public ActionResult Add()
        {
            var listLop = lopRepon.getAllLop();
            ViewModelDanhSachHS viewModel = new ViewModelDanhSachHS
            {
                listLop = listLop
            };
            return PartialView("Partial_AddHocSinh", viewModel);
        }
        // POST: add hocsinh
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Add(HocSinh HocSinh)
        {
            hocSinhRepon.AddHocSinh(HocSinh);
            return RedirectToAction("Index");
        }
        // GET: edit hocsinh
        public ActionResult Update(string id)
        {
            var listLop = lopRepon.getAllLop();
            var hocsinh = hocSinhRepon.GetHocSinhForId(id);
            ViewModelDanhSachHS viewModel = new ViewModelDanhSachHS
            {
                hocsinh = hocsinh,
                listLop = listLop
            };
            return PartialView("Partial_UpdateHocSinh", viewModel);
        }
        // POST: edit hocsinh
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Update(HocSinh HocSinh)
        {
            hocSinhRepon.UpdateHocSinh(HocSinh);
            return RedirectToAction("Index");
        }

        // POST: delete hocsinh
        [HttpPost]
        public JsonResult Delete(string id)
        {
            hocSinhRepon.deleteHocSinh(id);
            return Json("ok", JsonRequestBehavior.AllowGet);
        }
    }
}