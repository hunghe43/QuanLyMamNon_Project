using QuanLyMamNon.Common;
using QuanLyMamNon.Models;
using QuanLyMamNon.Models.Dao;
using QuanLyMamNon.Reponsitory;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;

namespace QuanLyMamNon.Areas.Admin.Controllers
{
    [AuthorizeController]
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

        public ActionResult Partial_CT_HocPhi(string MaHocSinh, string thang)
        {
            PhieuThuHocPhiReponsitory ptRepon = new PhieuThuHocPhiReponsitory();
            DichVuNgoaiRePonsitory dvRepon = new DichVuNgoaiRePonsitory();
            HocSinhReponsitory hsRepon = new HocSinhReponsitory();
            var nhanvien = (NhanVien)Session["NhanVien"];
            DateTime ngaytaophieu;
            if (thang != null)
            {
                ngaytaophieu = DateTime.ParseExact(thang, "MM/yyyy", CultureInfo.InvariantCulture);
            }
            else
            {
                ngaytaophieu = DateTime.Now;
                thang = ngaytaophieu.ToString("MM/yyyy");
            }
            //lấy dịch vụ học sinh đăng ký trong tháng

            decimal tong1 = 0;
            decimal tong2=0;
            decimal tong3 = 0;
            decimal tong4 = 0;
            var listDichVuNgoai = dvRepon.getListDichVuNgoai_HocSinh(MaHocSinh, thang);

            foreach (var dvn in listDichVuNgoai)
            {
                tong3 += dvn.ChiPhi;
            }
            ViewData["tong3"] = tong3;

            //lấy học phí mặc định của tháng
            var listHocPhiThang = ptRepon.getHocPhiThang();

            foreach (var hp in listHocPhiThang)
            {
                tong1 += hp.ChiPhi;
            }
            ViewData["tong1"] = tong1;
            //lấy thông tin điểm danh của học sinh trong tháng
            var pt = ptRepon.Get_Infor_TheoDoi(MaHocSinh, thang);
            if (pt == null)
            {
                pt = new Infor_TheoDoi();
            }
            else
            {
                //công thức tính tiền học khi điểm danh--------VD:
                tong2 = HocPhiDefaul.TinhHocPhiTheoDoi(pt.SoNgayVang, pt.SoNgayAnSang, pt.SoNgayAnTrua);
            }
            ViewData["tong2"] = tong2;


            //lấy học phí đầu năm
            //
            var listHocPhiDauNam = ptRepon.getHocPhiDauNam();

            foreach (var hp in listHocPhiDauNam)
            {
                tong4 += hp.ChiPhi;
            }
            ViewData["tong4"] = tong4;

            ViewData["tong"] = tong1 + tong2 + tong3 + tong4;
            // kiểm tra xem tồn tại phiếu thu chưa...
            if (pt == null)
            {
                pt = new Infor_TheoDoi();
                pt.MaHocSinh = MaHocSinh;
                pt.NgayTaoPhieu = thang;
                //pt.MaNhanVien = nhanvien.MaNhanVien;
                pt.SoNgayAnSang = 0;
                pt.SoNgayAnTrua = 0;
                pt.SoNgayVang = 0;
                //pt.ChiPhi = 0;
            }
            bool checkPhieuThu = false;
            //kiểm tra đóng học phí hay chưa(phieuthu)
            if (ptRepon.checkExistPhieuThu(MaHocSinh, thang))
            {
                checkPhieuThu = true;
            }
            ViewData["checkPhieuThu"] = checkPhieuThu;
            ViewModelPhieuThu viewModel = new ViewModelPhieuThu
            {
                infor_phieuThu = pt,
                listHocPhiThang = listHocPhiThang,
                hocSinh = hsRepon.GetHocSinhForId(MaHocSinh),
                listDichVuNgoai = listDichVuNgoai,
                listHocPhiDauNam=listHocPhiDauNam
            };
            //gửi thông tin viewModel qua bên controller thuphi
            TempData["viewModel"] = viewModel;
            return PartialView(viewModel);
        }

        [HttpPost]
        public ActionResult ThuPhi()
        {
            var nhanvien = (NhanVien)Session["NhanVien"];
            ViewModelPhieuThu viewModel = (ViewModelPhieuThu)TempData["viewModel"];
            List<CT_PhieuThu_HocSinh> list_Ct_PhieuThu_HocSinh = new List<CT_PhieuThu_HocSinh>();
            CT_PhieuThu_HocSinh ct_pt_hs = null;
            PhieuThuHocPhiReponsitory phieuthuRepon = new PhieuThuHocPhiReponsitory();

            //kiểm tra tồn tại của phiếu thu
            if (!phieuthuRepon.checkExistPhieuThu(viewModel.infor_phieuThu.MaHocSinh, viewModel.infor_phieuThu.NgayTaoPhieu))
            {
                //thêm mới phiếu thu từ thông tin điểm danh trong tháng (info_phieuthu)
                var phieuThu = new PhieuThu();
                phieuThu.MaHocSinh = viewModel.infor_phieuThu.MaHocSinh;
                phieuThu.MaNhanVien = nhanvien.MaNhanVien;
                phieuThu.NgayTaoPhieu = viewModel.infor_phieuThu.NgayTaoPhieu;

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
                ct_pt_hs.TenLoaiPhi = "DD_Vắng";
                ct_pt_hs.SoLuong = viewModel.infor_phieuThu.SoNgayVang;
                ct_pt_hs.ChiPhi = HocPhiDefaul.tienHoc1Buoi;//nhập chi phí vắng từng buổi//.....
                list_Ct_PhieuThu_HocSinh.Add(ct_pt_hs);

                ct_pt_hs = new CT_PhieuThu_HocSinh();
                ct_pt_hs.TenLoaiPhi = "DD_Ăn sáng";
                ct_pt_hs.SoLuong = viewModel.infor_phieuThu.SoNgayAnSang;
                ct_pt_hs.ChiPhi = HocPhiDefaul.tienAnSang;//nhập chi phí ăn sáng từng buổi
                list_Ct_PhieuThu_HocSinh.Add(ct_pt_hs);

                ct_pt_hs = new CT_PhieuThu_HocSinh();
                ct_pt_hs.TenLoaiPhi = "DD_Ăn trưa";
                ct_pt_hs.SoLuong = viewModel.infor_phieuThu.SoNgayAnTrua;
                ct_pt_hs.ChiPhi = HocPhiDefaul.tienAnTrua;//nhập chi phí ăn trưa từng buổi
                list_Ct_PhieuThu_HocSinh.Add(ct_pt_hs);

                PhieuThuHocPhiReponsitory ptHocPhiRepon = new PhieuThuHocPhiReponsitory();
                ptHocPhiRepon.saveThuPhiHocSinh(phieuThu, list_Ct_PhieuThu_HocSinh);
                //thực hiện lưu thông tin học phí
                //thực hiện lưu bảng phieuThu

                //thực hiện lưu bảng CT_phieuthu_hocSinh
                return Json(new { success = true, responseText = "Thu mới thành công" }, JsonRequestBehavior.AllowGet);
            }
            return Json(new { success = false, responseText = "Đã thu!" }, JsonRequestBehavior.AllowGet);
        }
        /// <summary>
        /// xuất hóa đơn sang excel
        /// </summary>
        public void ExportToExcel()
        {
            ViewModelPhieuThu viewModel = (ViewModelPhieuThu)TempData["viewModel"];
            string Filename = "ExcelFrom" + DateTime.Now.ToString("mm_dd_yyy_hh_ss_tt") + ".xls";
            string FolderPath = HttpContext.Server.MapPath("/ExcelFiles/");
            string FilePath = Path.Combine(FolderPath, Filename);

            //Step-1: Checking: the file name exist in server, if it is found then remove from server.------------------
            if (System.IO.File.Exists(FilePath))
            {
                System.IO.File.Delete(FilePath);
            }

            //Step-2: Get Html Data & Converted to String----------------------------------------------------------------
            string HtmlResult = RenderRazorViewToString("~/Areas/Admin/Views/KeToan/GenerateExcel.cshtml", viewModel);

            //Step-4: Html Result store in Byte[] array------------------------------------------------------------------
            byte[] ExcelBytes = Encoding.ASCII.GetBytes(HtmlResult);

            //Step-5: byte[] array converted to file Stream and save in Server------------------------------------------- 
            using (Stream file = System.IO.File.OpenWrite(FilePath))
            {
                file.Write(ExcelBytes, 0, ExcelBytes.Length);
            }

            //Step-6: Download Excel file 
            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(Filename));
            Response.WriteFile(FilePath);
            Response.End();
            Response.Flush();
        }

        protected string RenderRazorViewToString(string viewName, object model)
        {
            if (model != null)
            {
                ViewData.Model = model;
            }
            using (StringWriter sw = new StringWriter())
            {
                ViewEngineResult viewResult = ViewEngines.Engines.FindPartialView(ControllerContext, viewName);
                ViewContext viewContext = new ViewContext(ControllerContext, viewResult.View, ViewData, TempData, sw);
                viewResult.View.Render(viewContext, sw);
                viewResult.ViewEngine.ReleaseView(ControllerContext, viewResult.View);
                return sw.GetStringBuilder().ToString();
            }
        }
    }
}