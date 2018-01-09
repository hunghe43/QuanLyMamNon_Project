using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QuanLyMamNon.Reponsitory;
using QuanLyMamNon.Models;
using QuanLyMamNon.Models.Dao;

namespace QuanLyMamNon.Areas.Admin.Controllers
{
    [AuthorizeController]
    public class NhanVienController : Controller
    {
        ChucVuReponsitory chucVuRepon = new ChucVuReponsitory();
        NhanVienReponsitory nhanVienRepon = new NhanVienReponsitory();
        LopReponsitory lopRepon = new LopReponsitory();
        // GET: Home  CURD Nhan vien
        public ActionResult Index()
        {
            try
            {

                string maChucVu = Request["listChucVu"];
                var listLop = lopRepon.getAllLop();
                var listChucVu = chucVuRepon.getAllChucVu();
                var listNV = new List<NhanVien>();
                var nhanvien = new NhanVien();
                if (string.IsNullOrEmpty(maChucVu) || maChucVu == "0")
                {
                    maChucVu = "0";
                    listNV = nhanVienRepon.getAllNhanVien();
                }
                else
                {
                    listNV = nhanVienRepon.getNhanVienForIDChucVu(maChucVu);
                }
                ViewBag.select = maChucVu;
                ViewModelDanhSachNhanVien viewModel = new ViewModelDanhSachNhanVien
                {
                    listChucVu = listChucVu,
                    listNhanVien = listNV,
                    listLop = listLop,
                    nhanvien = nhanvien
                };

                return View(viewModel);
            }
            catch (Exception ex)
            {
                return RedirectToAction("SystemError", "Login");
            }
        }
        // GET: details Nhan vien
        public ActionResult Detail(string id)
        {
            try
            {

                var listLop = lopRepon.getAllLop();
                var nhanvien = nhanVienRepon.getNhanvienForId(id);
                var listChucVu = chucVuRepon.getAllChucVu();
                if (nhanvien.MaLop == null)
                {
                    ViewData["TenLop"] = "None";
                }
                else
                {
                    ViewData["TenLop"] = listLop.SingleOrDefault(x => x.MaLop == nhanvien.MaLop).TenLop.ToString();
                }
                ViewModelDanhSachNhanVien viewModel = new ViewModelDanhSachNhanVien
                {
                    listChucVu = listChucVu,
                    nhanvien = nhanvien,
                    listLop = listLop
                };
                return PartialView("Partial_DetailNhanVien", viewModel);
            }
            catch (Exception ex)
            {
                return RedirectToAction("SystemError", "Login");
            }
        }
        // GET: add Nhan vien
        public ActionResult Add()
        {
            try
            {

                var listLop = lopRepon.getAllLop();
                var listChucVu = chucVuRepon.getAllChucVu();
                ViewModelDanhSachNhanVien viewModel = new ViewModelDanhSachNhanVien
                {
                    listChucVu = listChucVu,
                    listLop = listLop
                };
                return PartialView("Partial_AddNhanVien", viewModel);
            }
            catch (Exception ex)
            {
                return RedirectToAction("SystemError", "Login");
            }
        }
        // POST: add Nhan vien
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Add(NhanVien nhanvien)
        {
            try
            {

                if (nhanVienRepon.checkExistEmail(nhanvien.Email)) // đã tồn tại email
                {
                    TempData["MessErr"] = "Email đã tồn tại";
                    return RedirectToAction("Index");
                }
                else
                {
                    nhanVienRepon.AddNhanVien(nhanvien);
                    return RedirectToAction("Index");
                }
            }
            catch (Exception ex)
            {
                return RedirectToAction("SystemError", "Login");
            }
        }
        // GET: edit Nhan vien
        public ActionResult Update(string id)
        {
            try
            {

                var listLop = lopRepon.getAllLop();
                var listChucVu = chucVuRepon.getAllChucVu();
                var nhanvien = nhanVienRepon.getNhanvienForId(id);
                ViewModelDanhSachNhanVien viewModel = new ViewModelDanhSachNhanVien
                {
                    listChucVu = listChucVu,
                    nhanvien = nhanvien,
                    listLop = listLop
                };
                return PartialView("Partial_UpdateNhanVien", viewModel);
            }
            catch (Exception ex)
            {
                return RedirectToAction("SystemError", "Login");
            }
        }
        // POST: edit Nhan vien
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Update(NhanVien nhanvien)
        {
            try
            {
                if (nhanVienRepon.checkExistEmail(nhanvien.Email)) // đã tồn tại email
                {
                    TempData["MessErr"] = "Email đã tồn tại";
                    return RedirectToAction("Index");
                }
                else
                {
                    nhanVienRepon.UpdateNhanVien(nhanvien);
                    return RedirectToAction("Index");
                }
            }
            catch (Exception ex)
            {
                return RedirectToAction("SystemError", "Login");
            }
        }

        // POST: delete Nhan vien
        [HttpPost]
        public JsonResult Delete(string id)
        {
            nhanVienRepon.deleteNhanVien(id);
            return Json("ok", JsonRequestBehavior.AllowGet);
        }

    }
}