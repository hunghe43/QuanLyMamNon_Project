namespace ClassLibrary1
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("PhieuChiTieu")]
    public partial class PhieuChiTieu
    {
        [Key]
        [StringLength(20)]
        public string MaPhieuChiTieu { get; set; }

        [Column(TypeName = "date")]
        public DateTime? NgayTaoPhieu { get; set; }

        [Required]
        [StringLength(20)]
        public string MaNhanVien { get; set; }

        [Required]
        [StringLength(100)]
        public string TenNguoiChi { get; set; }

        [StringLength(100)]
        public string LyDo { get; set; }

        [Column(TypeName = "money")]
        public decimal? ChiPhi { get; set; }

        [StringLength(50)]
        public string ChungTu { get; set; }

        public virtual NhanVien NhanVien { get; set; }
    }
}
