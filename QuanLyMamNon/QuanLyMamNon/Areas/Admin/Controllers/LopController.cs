//using QuanLyMamNon.Reponsitory;
//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Web;
//using System.Web.Mvc;

//namespace QuanLyMamNon.Areas.Admin.Controllers
//{
//    public class LopController : Controller
//    {
//        LopReponsitory lopRepon = new LopReponsitory();
//        // GET: Home  CURD 
//        public ActionResult Index()
//        {
//            string maChucVu = Request["listChucVu"];
//            var listLop = lopRepon.getAllLop();
//            var listChucVu = chucVuRepon.getAllChucVu();
//            var listNV = new List<NhanVien>();
//            var nhanvien = new NhanVien();
//            if (string.IsNullOrEmpty(maChucVu) || maChucVu == "0")
//            {
//                maChucVu = "0";
//                listNV = nhanVienRepon.getAllNhanVien();
//            }
//            else
//            {
//                listNV = nhanVienRepon.getNhanVienForIDChucVu(maChucVu);
//            }
//            ViewBag.select = maChucVu;
//            ViewModelDanhSachNhanVien viewModel = new ViewModelDanhSachNhanVien
//            {
//                listChucVu = listChucVu,
//                listNhanVien = listNV,
//                listLop = listLop,
//                nhanvien = nhanvien
//            };

//            return View(viewModel);
//        }
//        // GET: add 
//        public ActionResult Add()
//        {
//            var listLop = lopRepon.getAllLop();
//            var listChucVu = chucVuRepon.getAllChucVu();
//            ViewModelDanhSachNhanVien viewModel = new ViewModelDanhSachNhanVien
//            {
//                listChucVu = listChucVu,
//                listLop = listLop
//            };
//            return PartialView("Partial_AddNhanVien", viewModel);
//        }
//        // POST: add 
//        [HttpPost]
//        [ValidateAntiForgeryToken]
//        public ActionResult Add(NhanVien nhanvien)
//        {
//            nhanvien.MaNhanVien = nhanVienRepon.getAutoIdNhanVien();
//            nhanVienRepon.AddNhanVien(nhanvien);
//            return RedirectToAction("Index");
//        }
//        // GET: edit 
//        public ActionResult Update(string id)
//        {
//            var listLop = lopRepon.getAllLop();
//            var listChucVu = chucVuRepon.getAllChucVu();
//            var nhanvien = nhanVienRepon.getNhanvienForId(id);
//            ViewModelDanhSachNhanVien viewModel = new ViewModelDanhSachNhanVien
//            {
//                listChucVu = listChucVu,
//                nhanvien = nhanvien,
//                listLop = listLop
//            };
//            return PartialView("Partial_UpdateNhanVien", viewModel);
//        }
//        // POST: edit 
//        [HttpPost]
//        [ValidateAntiForgeryToken]
//        public ActionResult Update(NhanVien nhanvien)
//        {
//            nhanVienRepon.UpdateNhanVien(nhanvien);
//            return RedirectToAction("Index");
//        }

//        // POST: delete 
//        [HttpPost]
//        public ActionResult Delete(string id)
//        {
//            nhanVienRepon.deleteNhanVien(id);
//            return RedirectToAction("Index");
//        }
//    }
//}