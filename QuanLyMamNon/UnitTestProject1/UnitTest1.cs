using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using QuanLyMamNon.Common;
using QuanLyMamNon.Reponsitory;

namespace UnitTestProject1
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void TestMethod1()
        {

            decimal a = HocPhiDefaul.tienAnSang;
            decimal b = 15.0000m;
        }
        [TestMethod]
        public void TestMethod21()
        {
            PhieuChiTieuReponsitory phieuChiTieuRepon = new PhieuChiTieuReponsitory();
            var listPhieuChiTieu = phieuChiTieuRepon.getAllPhieuChiTieu();
        }
    }
}
