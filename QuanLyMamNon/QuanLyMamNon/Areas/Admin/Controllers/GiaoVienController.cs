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
            var nhanvien = (NhanVien)Session["NhanVien"];
            HocSinhReponsitory hocSinhRepon = new HocSinhReponsitory();
            PhieuTheoDoiReponsitory ptdRepon = new PhieuTheoDoiReponsitory();
            var listCT_NgayTheoDoi = new List<CT_NgayTheoDoi>();
            var ngayTheoDoi = DateTime.Now.Date;
            string thongbao = "";
            var listHS = hocSinhRepon.GetAllHocSinhForIdGiaoVien(nhanvien.MaNhanVien);
            //biến kiểm tra điểm danh, gửi qua view
            var checkDiemDanh = ptdRepon.checkExistsPhieuTheoDoi(nhanvien.MaNhanVien, ngayTheoDoi);

            //kiểm tra xem đã thực hiện điểm danh chưa, là kiểm tra xem tồn tại phiếu theo dõi chưa
            //đã điểm danh
            if (checkDiemDanh)
            {
                //lấy danh sách đã điểm danh
                listCT_NgayTheoDoi = ptdRepon.getAll_CT_NgayTheoDoi(nhanvien.MaNhanVien, ngayTheoDoi);                
            }
            else //chưa điểm danh
            {
                //lấy danh sách tất cả học sinh do giáo viên login phụ trách
                foreach (HocSinh hs in listHS)
                {
                    var ct_ptd = new CT_NgayTheoDoi();
                    ct_ptd.MaHocSinh = hs.MaHocSinh;
                    ct_ptd.DDVang = false;
                    ct_ptd.DDAnSang = false;
                    ct_ptd.DDAnTrua = false;
                    listCT_NgayTheoDoi.Add(ct_ptd);
                }
            }
            ViewData["checkDiemDanh"] = checkDiemDanh;
            //lưu dữ liệu và đẩy lên view
            var viewmodel = new ViewModelDiemDanh
            {
                listCT_NgayTheoDoiModel = listCT_NgayTheoDoi,
                listHocSinhModel = listHS
            };
            return PartialView(viewmodel);
        }
       
        [HttpPost]
        public ActionResult DiemDanh(ViewModelDiemDanh model)
        {
            PhieuTheoDoiReponsitory ptdRepon = new PhieuTheoDoiReponsitory();
            var nhanvien = (NhanVien)Session["NhanVien"];
            DateTime ngayTheoDoi = DateTime.Now;
            List<CT_NgayTheoDoi> lstCT_Ptd = new List<CT_NgayTheoDoi>();
            foreach (var i in model.listCT_NgayTheoDoiModel)
            {
                var ct_ptd = new CT_NgayTheoDoi();
                ct_ptd.MaHocSinh = i.MaHocSinh;
                ct_ptd.DDVang = i.DDVang;
                ct_ptd.DDAnSang = i.DDAnSang;
                ct_ptd.DDAnTrua = i.DDAnTrua;
                //thực hiện thêm mới điểm danh học sinh(ct_ngaytheodoi)
                ptdRepon.diemdanh(nhanvien.MaNhanVien, ngayTheoDoi, ct_ptd.MaHocSinh, ct_ptd.DDVang, ct_ptd.DDAnSang, ct_ptd.DDAnTrua);
            }
            return RedirectToAction("Index","GiaoVien");
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