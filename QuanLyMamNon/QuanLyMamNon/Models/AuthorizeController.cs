using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QuanLyMamNon.Reponsitory;
using System.Web.Routing;

namespace QuanLyMamNon.Models
{
    public class AuthorizeController : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            NhanVienReponsitory nvRepon = new NhanVienReponsitory();
            var nhanVien = (NhanVien)HttpContext.Current.Session["NhanVien"];
            if (nhanVien != null)
            {
                if (!nhanVien.MaChucVu.Equals("ADMIN"))
                {
                    List<string> ls = nvRepon.GetQuyenNhanVien(nhanVien.MaNhanVien);
                    //string[] listpermission = { "Student-Delete", "Student-Edit" };
                    string actionname = filterContext.ActionDescriptor.ControllerDescriptor.ControllerName + "-" +
                        filterContext.ActionDescriptor.ActionName;
                    if (!ls.Contains(actionname))
                    {
                        //filterContext.Result = new RedirectResult("~/Admin/Login/NotificationAuthorize");
                        filterContext.Result = new RedirectToRouteResult(
                            new RouteValueDictionary
                            {
                                { "controller", "Login" },
                                { "action", "NotificationAuthorize" }
                            });
                    }
                }

            }
            else
            {
                filterContext.Result = new RedirectResult("~/Admin/Login/Login");
            }



        }
    }
}