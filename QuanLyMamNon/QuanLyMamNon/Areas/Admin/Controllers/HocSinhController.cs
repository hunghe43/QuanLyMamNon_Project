using QuanLyMamNon.Models;
using QuanLyMamNon.Models.Dao;
using QuanLyMamNon.Reponsitory;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QuanLyMamNon.Areas.Admin.Controllers
{
    [AuthorizeController]
    public class HocSinhController : Controller
    {
        // GET: Home  CURD hocsinh
        public ActionResult Index()
        {
            HocSinhReponsitory hocSinhRepon = new HocSinhReponsitory();
            LopReponsitory lopRepon = new LopReponsitory();
            //danh sách học sinh chưa được phê duyệt
            var listHocSinhDis = hocSinhRepon.GetAllHocSinhDis();
            //danh sách học sinh đang hoạt động
            string MaLop = Request["listLop"];
            var listLop = lopRepon.getAllLop();
            var lstHS = new List<HocSinh>();
            if (string.IsNullOrEmpty(MaLop) || MaLop == "0")
            {
                MaLop = "0";
                lstHS = hocSinhRepon.GetAllHocSinh();
            }
            else
            {
                lstHS = hocSinhRepon.GetHocSinhForIdLop(MaLop);
            }
            ViewBag.select = MaLop;
            var viewModel = new ViewModelDanhSachHS
            {
                listLop = lopRepon.getAllLop(),
                listHocSinh = lstHS,
                listHocSinhDis=listHocSinhDis
            };
            return View(viewModel);
        }
        // GET: details hocsinh
        public ActionResult Detail(string id)
        {
            LopReponsitory lopRepon = new LopReponsitory();
            HocSinhReponsitory hocSinhRepon = new HocSinhReponsitory();
            var listLop = lopRepon.getAllLop();
            var hocsinh = hocSinhRepon.GetHocSinhForId(id);
            if (hocsinh.MaLop == null)
            {
                ViewData["TenLop"] = "None";
            }
            else
            {
                ViewData["TenLop"] = listLop.SingleOrDefault(x => x.MaLop == hocsinh.MaLop).TenLop.ToString();
            }
            ViewModelDanhSachHS viewModel = new ViewModelDanhSachHS
            {
                hocsinh = hocsinh,
                listLop = listLop
            };
            return PartialView("Partial_DetailHocSinh", viewModel);
        }
        // GET: add hocsinh
        public ActionResult Add()
        {
            LopReponsitory lopRepon = new LopReponsitory();
            var listLop = lopRepon.getAllLop();
            ViewModelDanhSachHS viewModel = new ViewModelDanhSachHS
            {
                listLop = listLop
            };
            return PartialView("Partial_AddHocSinh", viewModel);
        }
        // POST: add hocsinh
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Add(HocSinh HocSinh)
        {
            HocSinhReponsitory hocSinhRepon = new HocSinhReponsitory();
            hocSinhRepon.AddHocSinh(HocSinh);
            return RedirectToAction("Index");
        }
        // GET: edit hocsinh
        public ActionResult Update(string id)
        {
            LopReponsitory lopRepon = new LopReponsitory();
            HocSinhReponsitory hocSinhRepon = new HocSinhReponsitory();
            var listLop = lopRepon.getAllLop();
            var hocsinh = hocSinhRepon.GetHocSinhForId(id);
            ViewModelDanhSachHS viewModel = new ViewModelDanhSachHS
            {
                hocsinh = hocsinh,
                listLop = listLop
            };
            return PartialView("Partial_UpdateHocSinh", viewModel);
        }
        // POST: edit hocsinh
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Update(HocSinh HocSinh)
        {
            HocSinhReponsitory hocSinhRepon = new HocSinhReponsitory();
            hocSinhRepon.UpdateHocSinh(HocSinh);
            return RedirectToAction("Index");
        }

        // POST: delete hocsinh
        [HttpPost]
        public JsonResult Delete(string id)
        {
            HocSinhReponsitory hocSinhRepon = new HocSinhReponsitory();
            hocSinhRepon.deleteHocSinh(id);
            return Json("ok", JsonRequestBehavior.AllowGet);
        }

        /// <summary>
        /// import thông tin học sinh từ file excel
        /// </summary>
        /// <param name="postedFile"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult ImportFileHocSinh(HttpPostedFileBase postedFile)
        {
            HocSinhReponsitory hocSinhRepon = new HocSinhReponsitory();
            string filePath = string.Empty;
            if (postedFile != null)
            {
                string path = Server.MapPath("~/Uploads/");
                if (!Directory.Exists(path))
                {
                    Directory.CreateDirectory(path);
                }

                filePath = path + Path.GetFileName(postedFile.FileName);
                string extension = Path.GetExtension(postedFile.FileName);
                postedFile.SaveAs(filePath);

                string conString = string.Empty;
                switch (extension)
                {
                    case ".xls": //Excel 97-03.
                        conString = ConfigurationManager.ConnectionStrings["Excel03ConString"].ConnectionString;
                        break;
                    case ".xlsx": //Excel 07 and above.
                        conString = ConfigurationManager.ConnectionStrings["Excel07ConString"].ConnectionString;
                        break;
                }
                hocSinhRepon.ImportFileHocSinh(conString, filePath);                
            }
            return RedirectToAction("Index");
        }

        /// <summary>
        /// đăng ký dịch vụ ngoài cho học sinh
        /// </summary>
        /// <returns></returns>
        public ActionResult DangKyDichVu(string id,string thang)
        {
            HocSinhReponsitory hocSinhRepon = new HocSinhReponsitory();
            var nhanvien = (NhanVien)Session["NhanVien"];
            DichVuNgoaiRePonsitory dvRepon = new DichVuNgoaiRePonsitory();
            NhanVienReponsitory nvRepon = new NhanVienReponsitory();

            //thực hiện kiểm tra ngày nhập vào
            DateTime dt = new DateTime();
            DateTime dtNow = new DateTime();

            dtNow = DateTime.Now;
            DateTime dtNowConvert = DateTime.ParseExact(dtNow.ToString("dd/MM/yyyy"), "dd/MM/yyyy", CultureInfo.InvariantCulture);
            if (thang == null)
            {
                dt = DateTime.Now;
                thang = dtNow.ToString("MM/yyyy");
                ViewData["thang"] = thang;
            }
            else
            {
                string dayNow = dtNow.Day.ToString();
                dt=DateTime.ParseExact(dayNow+"/" + thang, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                ViewData["thang"] = thang;
            }
            
            var hocsinh = hocSinhRepon.GetHocSinhForId(id);            
            var listDV = dvRepon.getAllDichVuNgoai();
            var listDV_HS = dvRepon.getListDichVuNgoai_HocSinh(id,thang);
            //check ngày xem kém ngày hiện tại và khong cho phép đang ký mới
            bool checkcompareDate = false;
            //nếu ngày đăng ký dịch vụ < ngày hiện tại, thông báo không cho đăng ký mới
            if (DateTime.Compare(dt, dtNowConvert) <0)
            {
                ViewData["compareDate"] = thang;
                checkcompareDate = true;
            }
            ViewData["compareDate"] = checkcompareDate;
            //kiểm tra đã đăng ký dịch vụ tháng này chưa
            bool checkExist = false;
            if (listDV_HS.Count() != 0)
            {
                checkExist = true;
            }
            ViewData["checkExist"] = checkExist;

            var viewModel = new ViewModelDangKyDV_HS
            {
                hocsinh=hocsinh,
                nhanvien=nhanvien,
                listDV = listDV,
                listDV_HS=listDV_HS
            };
            
            return PartialView("Partial_DangKyDichVu",viewModel);
        }

        [HttpPost]
        public ActionResult SaveDV_HS(List<string> listMaDV, string maHocSinh, string thangdk)
        {
            DichVuNgoaiRePonsitory dvRepon = new DichVuNgoaiRePonsitory();
            foreach(var id_dv in listMaDV)
            {
                dvRepon.InsertDichVu_HocSinh(id_dv, maHocSinh, thangdk);
            } 
            return Json(new { success = true, responseText = "Đăng ký thành công" }, JsonRequestBehavior.AllowGet);
        }

    }
}