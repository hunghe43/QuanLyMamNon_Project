//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ClassLibrary1
{
    using System;
    using System.Collections.Generic;
    
    public partial class DichVuNgoai
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public DichVuNgoai()
        {
            this.CT_DichVu_HocSinh = new HashSet<CT_DichVu_HocSinh>();
            this.CT_DichVu_HocSinh1 = new HashSet<CT_DichVu_HocSinh>();
        }
    
        public int MaDichVu { get; set; }
        public string TenDV { get; set; }
        public decimal ChiPhi { get; set; }
        public string GhiChu { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CT_DichVu_HocSinh> CT_DichVu_HocSinh { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CT_DichVu_HocSinh> CT_DichVu_HocSinh1 { get; set; }
    }
}
