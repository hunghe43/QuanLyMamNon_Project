using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanLyMamNon.Models
{
    public class Quyen
    {
        public Quyen()
        {
            this.Quyen_ChucVu = new HashSet<Quyen_ChucVu>();
        }

        public string MaQuyen { get; set; }
        public string MoTa { get; set; }
        
        public virtual ICollection<Quyen_ChucVu> Quyen_ChucVu { get; set; }
    }
}