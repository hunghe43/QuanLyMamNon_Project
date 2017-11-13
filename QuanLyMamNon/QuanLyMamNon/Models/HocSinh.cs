using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace QuanLyMamNon.Models
{
    public class HocSinh
    {
        public int MaHocSinh { get; set; }
        [Required(ErrorMessage = "Bắt buộc nhập!")]
        public string Ten { get; set; }
        [Required(ErrorMessage = "Bắt buộc nhập!")]
        public Nullable<System.DateTime> NgaySinh { get; set; }
        public string GioiTinh { get; set; }
        [Required(ErrorMessage = "Bắt buộc nhập!")]
        public string DiaChi { get; set; }
        [Required(ErrorMessage = "Bắt buộc nhập!")]
        public string TinhTrang { get; set; }
        [Required(ErrorMessage = "Bắt buộc nhập!")]
        public string DanToc { get; set; }
        public string DoiTuong { get; set; }
        [Required(ErrorMessage = "Bắt buộc nhập!")]
        public string TenPhuHuynh { get; set; }
        [Required(ErrorMessage = "Bắt buộc nhập!")]
        public string SoCmt { get; set; }

        [Required(ErrorMessage = "Bắt buộc nhập!")]
        [RegularExpression("(\\+84|0)\\d{9,10}", ErrorMessage = "Entered phone format is not valid.")]
        public string Sdt { get; set; }
        public string Email { get; set; }
        public Nullable<System.DateTime> NgaySinhPhuHuynh { get; set; }
        public string GhiChu { get; set; }
        public int MaLop { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public Nullable<int> TrangThai { get; set; }
    }
}