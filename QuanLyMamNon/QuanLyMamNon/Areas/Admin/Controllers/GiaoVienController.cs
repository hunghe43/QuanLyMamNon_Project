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
    public class GiaoVienController : Controller
    {
        // GET: Admin/GiaoVien
        public ActionResult Index()
        {
            var nhanvien = (NhanVien)Session["NhanVien"];
            NhanVienReponsitory nvRepon = new NhanVienReponsitory();
            if (nvRepon.checkExitstGiaoVien(nhanvien.MaNhanVien))
            {
                //thông tin gv chính
                var giaoVienChuNhiem = nvRepon.GetGiaoVienChuNhiem(nhanvien.MaNhanVien);
                //list gv phụ
                var gvPhu = nvRepon.GetListGVForIdLogin(nhanvien.MaNhanVien);
                ViewData["List GVP"] = gvPhu;
                return View(giaoVienChuNhiem);
            }
            else
            {                
                return RedirectToAction("NotificationAuthorize", "Login");
            }
        }

        public PartialViewResult Partial_DanhSachHocSinh()
        {
            var nhanvien = (NhanVien)Session["NhanVien"];
            HocSinhReponsitory HsRepon = new HocSinhReponsitory();
            var lstHS = HsRepon.GetAllHocSinhForIdGiaoVien(nhanvien.MaNhanVien);
            ViewData["ListHocSinh"] = lstHS;
            return PartialView("Partial_DanhSachHocSinh");
        }
                
        public ActionResult Partial_DiemDanhLop(string date)
        {
            DateTime ngayTheoDoi;
            if (date != null)
            {
                ngayTheoDoi = DateTime.ParseExact(date, "yyyy-MM-dd", CultureInfo.InvariantCulture).Date;
            }
            else
            {
                ngayTheoDoi = DateTime.Now.Date;
            }            
            var nhanvien = (NhanVien)Session["NhanVien"];
            HocSinhReponsitory hocSinhRepon = new HocSinhReponsitory();
            PhieuTheoDoiReponsitory ptdRepon = new PhieuTheoDoiReponsitory();
            var listCT_NgayTheoDoi = new List<CT_NgayTheoDoi>();      
            var listHS = hocSinhRepon.GetAllHocSinhForIdGiaoVien(nhanvien.MaNhanVien);
            //kiểm tra xem đã thực hiện điểm danh chưa, là kiểm tra xem tồn tại phiếu theo dõi chưa
            var checkDiemDanh = ptdRepon.checkExistsPhieuTheoDoi(nhanvien.MaNhanVien, ngayTheoDoi);
            
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
            var phieuTheoDoi = new PhieuTheoDoi();
            phieuTheoDoi.NgayTheoDoi = ngayTheoDoi;
            phieuTheoDoi.MaGiaoVien = nhanvien.MaNhanVien;
            //lưu dữ liệu và đẩy lên view
            var viewmodel = new ViewModelDiemDanh
            {
                listCT_NgayTheoDoiModel = listCT_NgayTheoDoi,
                listHocSinhModel = listHS,
                phieuTheoDoiModel= phieuTheoDoi
            };
            return PartialView("Partial_DiemDanhLop", viewmodel);
        }
       
        [HttpPost]
        public ActionResult DiemDanh(ViewModelDiemDanh model)
        {
            PhieuTheoDoiReponsitory ptdRepon = new PhieuTheoDoiReponsitory();
            var nhanvien = (NhanVien)Session["NhanVien"];
            var ngayTheoDoi = model.phieuTheoDoiModel.NgayTheoDoi;
            foreach (var i in model.listCT_NgayTheoDoiModel)
            {
                var ct_ptd = new CT_NgayTheoDoi();
                ct_ptd.MaHocSinh = i.MaHocSinh;
                ct_ptd.DDVang = i.DDVang;
                ct_ptd.DDAnSang = i.DDAnSang;
                ct_ptd.DDAnTrua = i.DDAnTrua;
                ptdRepon.diemdanh(nhanvien.MaNhanVien, ngayTheoDoi, ct_ptd.MaHocSinh, ct_ptd.DDVang, ct_ptd.DDAnSang, ct_ptd.DDAnTrua);                       
            }
            return RedirectToAction("Index", "GiaoVien");
        }
    }
}