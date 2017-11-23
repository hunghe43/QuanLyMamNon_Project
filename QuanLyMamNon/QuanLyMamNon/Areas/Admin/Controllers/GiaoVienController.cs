using QuanLyMamNon.Models;
using QuanLyMamNon.Reponsitory;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QuanLyMamNon.Areas.Admin.Controllers
{
    //[AuthorizeController]
    public class GiaoVienController : Controller
    {
        // GET: Admin/GiaoVien
        public ActionResult Index()
        {
            var nhanvien = (NhanVien)Session["NhanVien"];
            TempData["nhanvien"] = nhanvien;
            return View();
        }
        public PartialViewResult Partial_ThongTinLop()
        {
            var nhanvien = TempData["nhanvien"] as NhanVien;
            NhanVienReponsitory nvRepon = new NhanVienReponsitory();
            //thông tin gv chính
            var giaoVienChuNhiem = nvRepon.GetGiaoVienChuNhiem(nhanvien.MaNhanVien);
            if (giaoVienChuNhiem != null)
            {
                ViewBag.TenGVCN = giaoVienChuNhiem.TenGiaoVien;
                ViewBag.DiaChi = giaoVienChuNhiem.DiaChi;
                ViewBag.Sdt = giaoVienChuNhiem.Sdt;
                ViewBag.Email = giaoVienChuNhiem.Email;
                ViewBag.TenLop = giaoVienChuNhiem.TenLop;
                ViewBag.Siso = giaoVienChuNhiem.Siso;
            }
            //list gv phụ
            var gvPhu = nvRepon.GetGiaoVienPhuForIdGiaoVien(nhanvien.MaNhanVien);
            ViewData["List GVP"] = gvPhu;
            return PartialView("Partial_ThongTinLop");
        }

        public PartialViewResult Partial_DanhSachHocSinh()
        {
            var nhanvien = TempData["nhanvien"] as NhanVien;
            HocSinhReponsitory HsRepon = new HocSinhReponsitory();
            var lstHS = HsRepon.GetAllHocSinhForIdGiaoVien(nhanvien.MaNhanVien);
            ViewData["ListHocSinh"] = lstHS;
            return PartialView("Partial_DanhSachHocSinh");
        }
        public PartialViewResult Partial_DiemDanhLop()
        {
            HocSinhReponsitory hocSinhRepon = new HocSinhReponsitory();
            var nhanvien = TempData["nhanvien"] as NhanVien;
            //lấy danh sách tất cả học sinh do giáo viên login phụ trách
            var listHS = hocSinhRepon.GetAllHocSinhForIdGiaoVien(nhanvien.MaNhanVien);
            ViewData["listHS"] = listHS;
            return PartialView();
        }
        public ActionResult DiemDanh()
        {
            PhieuTheoDoiReponsitory ptdRepon = new PhieuTheoDoiReponsitory();

            List<CT_NgayTheoDoi> lstCT_Ptd = new List<CT_NgayTheoDoi>();
            HocSinhReponsitory hocSinhRepon = new HocSinhReponsitory();
            var nhanvien = (NhanVien)Session["NhanVien"];
            //lấy danh sách tất cả học sinh do giáo viên login phụ trách
            var listHS = hocSinhRepon.GetAllHocSinhForIdGiaoVien(nhanvien.MaNhanVien);
            foreach(HocSinh hs in listHS)
            {
                var ct_ptd = new CT_NgayTheoDoi();
                ct_ptd.MaHocSinh = hs.MaHocSinh;
                ct_ptd.DDVang = false;
                ct_ptd.DDAnSang = true;
                ct_ptd.DDAnTrua = false;
                lstCT_Ptd.Add(ct_ptd);
            }

            return View(lstCT_Ptd);
        }

        [HttpPost]
        public ActionResult DiemDanh(List<CT_NgayTheoDoi> lstCT_Ptd)
        {
            
            return View(lstCT_Ptd);
        }

        //public JsonResult SaveDiemDanh(List<bool> check, string MaGiaoVien, DateTime currentdate)
        //{
        //    PhieuTheoDoiReponsitory theoDoiRepon = new PhieuTheoDoiReponsitory();

        //    //insert phiếu theo dõi
        //    //insertphieutheodoi(string maGiaoVien,DateTime ngayDiemDanh){    }

        //    //insert ct_phiếu theo dõi
        //    //foreach(hs in listhocsinh){
        //    //insertCT_PhieuTheoDoi(int maHocSinh,bool DDVang,bool,DDAnSang,bool DDAnTrua){
        //    //
        //    //}
        //    //}
        //    foreach (var hs in listHS)
        //    {

        //    }
        //    return Json("ok", JsonRequestBehavior.AllowGet);
        //}
        //public void Before()
        //{
        //    List<CT_NgayTheoDoi> lit = new List<CT_NgayTheoDoi>();
        //    foreach (var item in lit)
        //    {

        //    }
        //    DiemDanh();
        //}
       
            //store(phieutheodoi.param1, phieutheodoi.param2,ct.para);
            //for (var i = 0; i < count; i++)
            //{
            //    if (success)
            //        i++;
            //    else
            //    {
            //        i++;
            //        SaveList(i)
            //    }
            //}
            //if (SaveList.COunt() > 0)
            //    DiemDanh(SaveList);
        
    }
}