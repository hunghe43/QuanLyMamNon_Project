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
    }
        
}