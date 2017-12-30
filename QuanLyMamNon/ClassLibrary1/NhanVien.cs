namespace ClassLibrary1
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("NhanVien")]
    public partial class NhanVien
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public NhanVien()
        {
            PhieuChiTieu = new HashSet<PhieuChiTieu>();
        }

        [Key]
        [StringLength(20)]
        public string MaNhanVien { get; set; }

        [StringLength(50)]
        public string TenNhanVien { get; set; }

        [StringLength(200)]
        public string DiaChi { get; set; }

        [StringLength(50)]
        public string Sdt { get; set; }

        [StringLength(50)]
        public string Email { get; set; }

        [StringLength(20)]
        public string MaChucVu { get; set; }

        [StringLength(20)]
        public string MaLop { get; set; }

        [StringLength(50)]
        public string Password { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PhieuChiTieu> PhieuChiTieu { get; set; }
    }
}
