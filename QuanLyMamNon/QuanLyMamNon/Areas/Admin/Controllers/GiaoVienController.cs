﻿using QuanLyMamNon.Models;
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
            try
            {

                var nhanvien = (NhanVien)Session["NhanVien"];
                NhanVienReponsitory nvRepon = new NhanVienReponsitory();
                HocSinhReponsitory HsRepon = new HocSinhReponsitory();

                if (nvRepon.checkExitstGiaoVien(nhanvien.MaNhanVien))
                {
                    //lấy danh sách học sinh theo giáo viên login
                    var listHS = HsRepon.GetAllHocSinhForIdGiaoVien(nhanvien.MaNhanVien);
                    //lấy thông tin lớp học
                    var lop = nvRepon.getLopForIdGiaoVien(nhanvien.MaNhanVien);
                    //list gv
                    var listGV = nvRepon.GetListGVForIdLogin(nhanvien.MaNhanVien);
                    //ViewData["List GVP"] = gvPhu;
                    var viewModel = new ViewModelDiemDanh()
                    {
                        listHocSinhModel = listHS,
                        listGV = listGV,
                        lop = lop
                    };
                    return View(viewModel);
                }
                else
                {
                    return RedirectToAction("NotificationAuthorize", "Login");
                }
            }
            catch (Exception ex)
            {
                return RedirectToAction("SystemError", "Login");
            }
        }

        public ActionResult Partial_DiemDanhLop(string date)
        {
            try
            {

                DateTime ngayTheoDoi = new DateTime();
                if (date != null)
                {
                    ngayTheoDoi = DateTime.Parse(date).Date;
                }
                else
                {

                    ngayTheoDoi = DateTime.Now.Date;
                    date = ngayTheoDoi.ToString("yyyy-MM-dd");
                }

                //convert date type 2013-01-08 pass to vjew.
                ViewData["date"] = date;
                TempData["ngayTheoDoi"] = ngayTheoDoi;
                var nhanvien = (NhanVien)Session["NhanVien"];
                HocSinhReponsitory hocSinhRepon = new HocSinhReponsitory();
                PhieuTheoDoiReponsitory ptdRepon = new PhieuTheoDoiReponsitory();
                var listCT_NgayTheoDoi = new List<CT_NgayTheoDoi>();
                //lấy danh sách học sinh do giáo viên phụ trách
                var listHS = hocSinhRepon.GetAllHocSinhForIdGiaoVien(nhanvien.MaNhanVien);
                //kiểm tra xem đã thực hiện điểm danh chưa, là kiểm tra xem tồn tại phiếu theo dõi chưa
                var checkDiemDanh = ptdRepon.checkExistsPhieuTheoDoi(ngayTheoDoi);

                //đã điểm danh
                if (checkDiemDanh)
                {
                    //lấy danh sách đã điểm danh
                    listCT_NgayTheoDoi = ptdRepon.getAll_CT_NgayTheoDoi(ngayTheoDoi);
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
                    phieuTheoDoiModel = phieuTheoDoi
                };
                return PartialView("Partial_DiemDanhLop", viewmodel);
            }
            catch (Exception ex)
            {
                return RedirectToAction("SystemError", "Login");
            }
        }

        [HttpPost]
        public ActionResult DiemDanh(ViewModelDiemDanh model)
        {
            try
            {
                PhieuTheoDoiReponsitory ptdRepon = new PhieuTheoDoiReponsitory();
                var nhanvien = (NhanVien)Session["NhanVien"];
                var ngayTheoDoi = (DateTime)TempData["ngayTheoDoi"];

                //var ngayTheoDoi = model.phieuTheoDoiModel.NgayTheoDoi;
                foreach (var i in model.listCT_NgayTheoDoiModel)
                {
                    var ct_ptd = new CT_NgayTheoDoi();
                    ct_ptd.MaHocSinh = i.MaHocSinh;
                    if (i.DDVang==false)
                    {
                        ct_ptd.DDVang = i.DDVang;
                        ct_ptd.DDAnSang = i.DDAnSang;
                        ct_ptd.DDAnTrua = i.DDAnTrua;
                    }
                    else
                    {
                        ct_ptd.DDVang = i.DDVang;
                        ct_ptd.DDAnSang = false;
                        ct_ptd.DDAnTrua = false;
                    }
                    
                    ptdRepon.diemdanh(nhanvien.MaNhanVien, ngayTheoDoi, ct_ptd.MaHocSinh, ct_ptd.DDVang, ct_ptd.DDAnSang, ct_ptd.DDAnTrua);
                }
                return RedirectToAction("Index", "GiaoVien");
            }
            catch (Exception ex)
            {
                return RedirectToAction("SystemError", "Login");
            }

        }
    }
}