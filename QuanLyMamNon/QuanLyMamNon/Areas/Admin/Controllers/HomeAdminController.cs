using QuanLyMamNon.Models;
using QuanLyMamNon.Models.Dao;
using QuanLyMamNon.Reponsitory;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QuanLyMamNon.Areas.Admin.Controllers
{
    //[AuthorizeController]
    public class HomeAdminController : Controller
    {
        ChucVuReponsitory chucVuRepon = new ChucVuReponsitory();
        NhanVienReponsitory nhanVienRepon = new NhanVienReponsitory();
        LopReponsitory lopRepon = new LopReponsitory();
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult PhanQuyenTheoChucVu(FormCollection f)
        {
            ChucVuReponsitory chucVuRepon = new ChucVuReponsitory();
            QuyenReponsitory quyenRepon = new QuyenReponsitory();
            string maChucVu;
            if (f["SL"] == null)
            {
                maChucVu = "ADMIN";
            }
            else
            {
                maChucVu = f["SL"].ToString();
                ViewBag.hienthi = maChucVu;
            }
            var viewModel = new ViewModelPhanQuyen
            {
                listChucVu = chucVuRepon.getAllChucVu(),
                listQuyen = quyenRepon.GetAllQuyen(),
                listQuyenForChucVu = quyenRepon.getAllQuyenChucVu().Where(x => x.MaChucVu == maChucVu).ToList(),
            };

            return View(viewModel);
        }
        public JsonResult Save(List<string> role_id, string usergroupid, List<string> role_id_uncheck)
        {
            ChucVuReponsitory chucVuRepon = new ChucVuReponsitory();
            QuyenReponsitory quyenRepon = new QuyenReponsitory();
            List<Quyen_ChucVu> lst = quyenRepon.getAllQuyenChucVu().Where(x => x.MaChucVu == usergroupid).ToList();
            foreach (var i in role_id)
            {
                if (!lst.Any(n => n.MaQuyen.Contains(i)))
                {
                    Quyen_ChucVu p = new Quyen_ChucVu();
                    p.MaChucVu = usergroupid;
                    p.MaQuyen = i;
                    quyenRepon.addQuyenForIdChucVu(p);
                }
            }

            if (role_id_uncheck != null)
            {
                foreach (var j in role_id_uncheck)
                {
                    if (lst.Any(n => n.MaQuyen.Contains(j)))
                    {
                        Quyen_ChucVu per = quyenRepon.getAllQuyenChucVu().Single(x => x.MaQuyen == j && x.MaChucVu == usergroupid);
                        quyenRepon.deleteQuyenForIdChucVu(per);
                    }
                }
            }
            return Json("ok", JsonRequestBehavior.AllowGet);
        }

        // GET: Home  CURD Nhan vien
        public ActionResult CURDNhanVien_Index()
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
        public ActionResult DetailNhanVien(string id)
        {
            var listLop = lopRepon.getAllLop();
            var nhanvien = nhanVienRepon.getNhanvienForId(id);
            var listChucVu = chucVuRepon.getAllChucVu();
            ViewModelDanhSachNhanVien viewModel = new ViewModelDanhSachNhanVien
            {
                listChucVu = listChucVu,
                nhanvien = nhanvien,
                listLop = listLop
            };
            return PartialView("Partial_DetailNhanVien", viewModel);
        }
        // GET: add Nhan vien
        public ActionResult AddNhanVien()
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
        public ActionResult AddNhanVien(NhanVien nhanvien)
        {
            string a = nhanVienRepon.getmanv();
            nhanVienRepon.AddNhanVien(nhanvien);
            return RedirectToAction("CURDNhanVien_Index");
        }
        // GET: edit Nhan vien
        public ActionResult UpdateNhanVien(string id)
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
        public ActionResult UpdateNhanVien(NhanVien nhanvien)
        {
            nhanVienRepon.UpdateNhanVien(nhanvien);
            return RedirectToAction("CURDNhanVien_Index");
        }
    }
}