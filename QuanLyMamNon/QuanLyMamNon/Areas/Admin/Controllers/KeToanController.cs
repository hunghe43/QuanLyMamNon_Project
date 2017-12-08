using QuanLyMamNon.Models;
using QuanLyMamNon.Models.Dao;
using QuanLyMamNon.Reponsitory;
using System;
using System.Collections.Generic;
using System.Globalization;
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
        public ActionResult DanhSachHocSinh(string groupLop)
        {
            HocSinhReponsitory HsRepon = new HocSinhReponsitory();
            LopReponsitory lopRepon = new LopReponsitory();
            var lstHS = new List<HocSinh>();
            if (groupLop == null || groupLop.Equals("0"))
            {
                groupLop = "0";
                lstHS = HsRepon.GetAllHocSinh();
            }
            else
            {
                lstHS = HsRepon.GetHocSinhForIdLop(groupLop);
            }
            ViewBag.select = groupLop;
            var viewModel = new ViewModelDanhSachHS
            {
                listLop = lopRepon.getAllLop(),
                listHocSinh = lstHS
            };
            return View(viewModel);
        }
      
        public ActionResult HocPhiHocSinh(string MaHocSinh)
        {
            PhieuThuHocPhiReponsitory ptRepon = new PhieuThuHocPhiReponsitory();
            HocSinhReponsitory hsRepon = new HocSinhReponsitory();
            HocSinh hocSinh = hsRepon.GetHocSinhForId(MaHocSinh);
            return View(hocSinh);
        }
        public ActionResult Partial_CT_HocPhi(string MaHocSinh, string date)
        {
            PhieuThuHocPhiReponsitory ptRepon = new PhieuThuHocPhiReponsitory();
            HocSinhReponsitory hsRepon = new HocSinhReponsitory();

            DateTime ngaytaophieu;
            if (date != null)
            {
                ngaytaophieu = DateTime.ParseExact(date, "MM/yyyy", CultureInfo.InvariantCulture);
            }
            else
            {
                ngaytaophieu = DateTime.Now;
                date = ngaytaophieu.ToString("MM/yyyy");
            }
            
            PhieuThu pt = ptRepon.getPhieuThuForIdHocSinh(MaHocSinh, date);

            ViewModelPhieuThu viewModel = new ViewModelPhieuThu
            {
                phieuThu = pt,
                hocSinh = hsRepon.GetHocSinhForId(MaHocSinh),
                listDichVuNgoai = ptRepon.getAllDichVuNgoai(MaHocSinh, date)
            };
            return PartialView(viewModel);
        }
    }
}