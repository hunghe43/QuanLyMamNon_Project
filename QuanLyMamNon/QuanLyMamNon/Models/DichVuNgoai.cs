using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanLyMamNon.Models
{
    public class DichVuNgoai
    {
        public DichVuNgoai()
        {
            this.CT_DichVu_HocSinh = new HashSet<CT_DichVu_HocSinh>();
        }

        public int MaDichVu { get; set; }
        public string TenDV { get; set; }
        public Nullable<decimal> ChiPhi { get; set; }
        public string MoTa { get; set; }
        
        public virtual ICollection<CT_DichVu_HocSinh> CT_DichVu_HocSinh { get; set; }
    }
}