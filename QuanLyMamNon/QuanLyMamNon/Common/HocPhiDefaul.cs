﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanLyMamNon.Common
{
    public static class HocPhiDefaul
    {
        public static decimal tienAnSang = 15.0000m;
        public static decimal tienAnTrua = 15.0000m;
        public  static decimal tienHoc1Buoi = 50.0000m;
        public static decimal TinhHocPhiTheoDoi(int SoNgayVang, int SoNgayAnSang, int SoNgayAnTrua)
        {
            return (22 - SoNgayVang) * tienHoc1Buoi + SoNgayAnSang * tienAnSang + SoNgayAnTrua * tienAnTrua;
        }
    }
}