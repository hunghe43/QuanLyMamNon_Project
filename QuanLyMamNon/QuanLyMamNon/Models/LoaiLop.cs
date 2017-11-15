using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanLyMamNon.Models
{
    public class LoaiLop
    {
        public LoaiLop()
        {
            this.Lop = new HashSet<Lop>();
        }

        public string MaLoaiLop { get; set; }
        public string TenLoaiLop { get; set; }
        
        public virtual ICollection<Lop> Lop { get; set; }
    }
}