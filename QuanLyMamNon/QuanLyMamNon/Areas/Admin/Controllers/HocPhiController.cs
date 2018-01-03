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
        {try
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
            catch (Exception ex)
            {
                return RedirectToAction("SystemError", "Login");
            }
        }
        //học phí
        public ActionResult AddHocPhi()
        {
            try
            {

            var listLoaiHocPhi = hocphiRepon.getAllloaiHocPhi();
            var viewModel = new ViewModelHocPhi()
            {
                listLoaiHocPhi= listLoaiHocPhi
            };
            return PartialView("Partial_AddHocPhi", viewModel); 
            }
            catch (Exception ex)
            {
                return RedirectToAction("SystemError", "Login");
            }           
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AddHocPhi(HocPhi hocphi)
        {
            try
            {

            hocphiRepon.AddHocPhi(hocphi);
            return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                return RedirectToAction("SystemError", "Login");
            }
        }
        public ActionResult UpdateHocPhi(string id)
        {
            try
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
            catch (Exception ex)
            {
                return RedirectToAction("SystemError", "Login");
            }
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult UpdateHocPhi(HocPhi hocphi)
        {
            try
            {

            hocphiRepon.UpdateHocPhi(hocphi);
            return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                return RedirectToAction("SystemError", "Login");
            }
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
            try
            {

            hocphiRepon.AddLoaiHocPhi(loaihocphi);
            return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                return RedirectToAction("SystemError", "Login");
            }
        }
        public ActionResult UpdateLoaiHocPhi(string id)
        {
            try {

            var loaihocphi = hocphiRepon.getLoaiHocPhiForID(id);
            return PartialView("Partial_UpdateLoaiHocPhi",loaihocphi);
            }
            catch (Exception ex)
            {
                return RedirectToAction("SystemError", "Login");
            }
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult UpdateLoaiHocPhi(LoaiHocPhi loaihocphi)
        {
            try
            {
            hocphiRepon.UpdateLoaiHocPhi(loaihocphi);
            return RedirectToAction("Index");

            }
            catch (Exception ex)
            {
                return RedirectToAction("SystemError", "Login");
            }
        }
       
        public JsonResult DeleteLoaiHocPhi(string id)
        {
            hocphiRepon.deleteLoaiHocPhi(id);
            return Json("ok", JsonRequestBehavior.AllowGet);
        }
    }
}