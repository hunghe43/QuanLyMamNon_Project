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
    public class NhanVienController : Controller
    {
        ChucVuReponsitory chucVuRepon = new ChucVuReponsitory();
        NhanVienReponsitory nhanVienRepon = new NhanVienReponsitory();
        LopReponsitory lopRepon = new LopReponsitory();        
        // GET: Home  CURD Nhan vien
        public ActionResult Index()
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
        // GET: details Nhan vien
        public ActionResult Detail(string id)
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
        // GET: add Nhan vien
        public ActionResult Add()
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
        // POST: add Nhan vien
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Add(NhanVien nhanvien)
        {
            if (nhanVienRepon.checkExistEmail(nhanvien.Email)) // đã tồn tại email
            {
                return RedirectToAction("Index");
            }
            else
            {
                nhanVienRepon.AddNhanVien(nhanvien);
                return RedirectToAction("Index");
            }            
        }
        // GET: edit Nhan vien
        public ActionResult Update(string id)
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
        // POST: edit Nhan vien
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Update(NhanVien nhanvien)
        {
            nhanVienRepon.UpdateNhanVien(nhanvien);
            return RedirectToAction("Index");
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