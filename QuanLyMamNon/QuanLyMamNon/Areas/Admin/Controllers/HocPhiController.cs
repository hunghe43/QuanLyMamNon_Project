using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QuanLyMamNon.Models;
using QuanLyMamNon.Reponsitory;
using QuanLyMamNon.Models.Dao;

namespace QuanLyMamNon.Areas.Admin.Controllers
{
    [AuthorizeController]
    public class HocPhiController : Controller
    {
        HocPhiReponsitory hocphiRepon = new HocPhiReponsitory();
        
        public ActionResult Index()
        {
            string MaLoai = Request["listLoaiHocPhi"];
            var listHocPhi = new List<HocPhi>();
            var listLoaiHocPhi = hocphiRepon.getAllloaiHocPhi();
            var lstHS = new List<HocSinh>();
            if (string.IsNullOrEmpty(MaLoai) || MaLoai == "0")
            {
                MaLoai = "0";
                listHocPhi = hocphiRepon.getAllhocPhi();
            }
            else
            {
                listHocPhi = hocphiRepon.getHocPhiForIdLoaiHP(MaLoai);
            }
            ViewBag.select = MaLoai;
            
           
            var viewModel = new ViewModelHocPhi()
            {
                listHocPhi= listHocPhi,
                listLoaiHocPhi= listLoaiHocPhi
            };
            return View(viewModel);
        }
        //học phí
        public ActionResult AddHocPhi()
        {
            var listLoaiHocPhi = hocphiRepon.getAllloaiHocPhi();
            var viewModel = new ViewModelHocPhi()
            {
                listLoaiHocPhi= listLoaiHocPhi
            };
            return PartialView("Partial_AddHocPhi", viewModel);            
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AddHocPhi(HocPhi hocphi)
        {
            hocphiRepon.AddHocPhi(hocphi);
            return RedirectToAction("Index");
        }
        public ActionResult UpdateHocPhi(string id)
        {
            var listLoaiHocPhi = hocphiRepon.getAllloaiHocPhi();
            var hocphi = hocphiRepon.getHocPhiForID(id);
            var viewModel = new ViewModelHocPhi()
            {
                hocphi=hocphi,
                listLoaiHocPhi = listLoaiHocPhi
            };
            return PartialView("Partial_UpdateHocPhi",viewModel);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult UpdateHocPhi(HocPhi hocphi)
        {
            hocphiRepon.UpdateHocPhi(hocphi);
            return RedirectToAction("Index");
        }
        public JsonResult DeleteHocPhi(string id)
        {
            hocphiRepon.deleteHocPhi(id);
            return Json("ok", JsonRequestBehavior.AllowGet);
        }
        // Loại học phi 
        public ActionResult AddLoaiHocPhi()
        {
            return PartialView("Partial_AddLoaiHocPhi");
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AddLoaiHocPhi(LoaiHocPhi loaihocphi)
        {
            hocphiRepon.AddLoaiHocPhi(loaihocphi);
            return RedirectToAction("Index");
        }
        public ActionResult UpdateLoaiHocPhi(string id)
        {
            var loaihocphi = hocphiRepon.getLoaiHocPhiForID(id);
            return PartialView("Partial_UpdateLoaiHocPhi",loaihocphi);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult UpdateLoaiHocPhi(LoaiHocPhi loaihocphi)
        {
            hocphiRepon.UpdateLoaiHocPhi(loaihocphi);
            return RedirectToAction("Index");
        }
       
        public JsonResult DeleteLoaiHocPhi(string id)
        {
            hocphiRepon.deleteLoaiHocPhi(id);
            return Json("ok", JsonRequestBehavior.AllowGet);
        }
    }
}