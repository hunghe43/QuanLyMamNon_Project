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
    //[AuthorizeController]
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
            var nhanvien = (NhanVien)Session["NhanVien"];
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
            var listHocPhiThang = ptRepon.getHocPhiThang();
            var pt = ptRepon.getPhieuThuForIdHocSinh(MaHocSinh, nhanvien.MaNhanVien, date);
            // kiểm tra xem tồn tại phiếu thu chưa...
            if (pt == null)
            {
                pt = new Infor_PhieuThu();
                pt.MaHocSinh = MaHocSinh;
                pt.NgayTaoPhieu = date;
                pt.MaNhanVien = nhanvien.MaNhanVien;
                pt.SoNgayAnSang = 0;
                pt.SoNgayAnTrua = 0;
                pt.SoNgayVang = 0;
                pt.ChiPhi = 0;
            }
            ViewModelPhieuThu viewModel = new ViewModelPhieuThu
            {
                infor_phieuThu = pt,
                listHocPhiThang = listHocPhiThang,
                hocSinh = hsRepon.GetHocSinhForId(MaHocSinh),
                listDichVuNgoai = ptRepon.getListDichVuNgoai_HocSinh(MaHocSinh, date)
            };
            //gửi thông tin viewModel qua bên thu phi
            TempData["viewModel"] = viewModel;
            return PartialView(viewModel);
        }

        [HttpPost]
        public ActionResult ThuPhi(ViewModelPhieuThu viewModel)
        {
            viewModel = (ViewModelPhieuThu)TempData["viewModel"];
            List<CT_PhieuThu_HocSinh> list_Ct_PhieuThu_HocSinh = new List<CT_PhieuThu_HocSinh>();
            CT_PhieuThu_HocSinh ct_pt_hs = null;
            //thêm mới phiếu thu từ infor phiếu thu
            var phieuThu = new PhieuThu();
            phieuThu.MaHocSinh = viewModel.infor_phieuThu.MaHocSinh;
            phieuThu.MaNhanVien = viewModel.infor_phieuThu.MaNhanVien;
            phieuThu.NgayTaoPhieu = viewModel.infor_phieuThu.NgayTaoPhieu;
            //chắc không cần thiết
            phieuThu.ChiPhi = viewModel.infor_phieuThu.ChiPhi;

            //bắt đầu thêm mới danh sách ct_Phieuthu_hocSinh
            foreach (var HocPhiThang in viewModel.listHocPhiThang)
            {
                ct_pt_hs = new CT_PhieuThu_HocSinh();
                ct_pt_hs.TenLoaiPhi = HocPhiThang.TenHocPhi;
                ct_pt_hs.SoLuong = 1;
                ct_pt_hs.ChiPhi = HocPhiThang.ChiPhi;
                list_Ct_PhieuThu_HocSinh.Add(ct_pt_hs);
            }
            foreach (var dichVuNgoai in viewModel.listDichVuNgoai)
            {
                ct_pt_hs = new CT_PhieuThu_HocSinh();
                ct_pt_hs.TenLoaiPhi = dichVuNgoai.TenDV;
                ct_pt_hs.SoLuong = 1;
                ct_pt_hs.ChiPhi = dichVuNgoai.ChiPhi;
                list_Ct_PhieuThu_HocSinh.Add(ct_pt_hs);
            }
            ct_pt_hs = new CT_PhieuThu_HocSinh();
            //lấy thông tin theo dõi, vang, ansang, antrua
            ct_pt_hs.TenLoaiPhi ="Vắng";
            ct_pt_hs.SoLuong = viewModel.infor_phieuThu.SoNgayVang;            
            ct_pt_hs.ChiPhi = 15;//nhập chi phí vắng từng buổi//.....
            list_Ct_PhieuThu_HocSinh.Add(ct_pt_hs);

            ct_pt_hs = new CT_PhieuThu_HocSinh();
            ct_pt_hs.TenLoaiPhi = "Ăn sáng";
            ct_pt_hs.SoLuong = viewModel.infor_phieuThu.SoNgayAnSang;
            ct_pt_hs.ChiPhi = 15;//nhập chi phí ăn sáng từng buổi
            list_Ct_PhieuThu_HocSinh.Add(ct_pt_hs);

            ct_pt_hs = new CT_PhieuThu_HocSinh();
            ct_pt_hs.TenLoaiPhi = "Ăn trưa";
            ct_pt_hs.SoLuong = viewModel.infor_phieuThu.SoNgayAnTrua;
            ct_pt_hs.ChiPhi = 15;//nhập chi phí ăn trưa từng buổi
            list_Ct_PhieuThu_HocSinh.Add(ct_pt_hs);

            PhieuThuHocPhiReponsitory ptHocPhiRepon = new PhieuThuHocPhiReponsitory();
            ptHocPhiRepon.saveThuPhiHocSinh(phieuThu, list_Ct_PhieuThu_HocSinh);
            //thực hiện lưu thông tin học phí
            //thực hiện lưu bảng phieuThu

            //thực hiện lưu bảng CT_phieuthu_hocSinh

            return HocPhiHocSinh(viewModel.hocSinh.MaHocSinh);
        }
    }
}