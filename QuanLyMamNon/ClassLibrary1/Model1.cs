namespace ClassLibrary1
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class Model1 : DbContext
    {
        public Model1()
            : base("name=Model1")
        {
        }

        public virtual DbSet<NhanVien> NhanVien { get; set; }
        public virtual DbSet<PhieuChiTieu> PhieuChiTieu { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<NhanVien>()
                .Property(e => e.MaNhanVien)
                .IsUnicode(false);

            modelBuilder.Entity<NhanVien>()
                .Property(e => e.MaChucVu)
                .IsUnicode(false);

            modelBuilder.Entity<NhanVien>()
                .Property(e => e.MaLop)
                .IsUnicode(false);

            modelBuilder.Entity<NhanVien>()
                .HasMany(e => e.PhieuChiTieu)
                .WithRequired(e => e.NhanVien)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<PhieuChiTieu>()
                .Property(e => e.MaPhieuChiTieu)
                .IsUnicode(false);

            modelBuilder.Entity<PhieuChiTieu>()
                .Property(e => e.MaNhanVien)
                .IsUnicode(false);

            modelBuilder.Entity<PhieuChiTieu>()
                .Property(e => e.ChiPhi)
                .HasPrecision(19, 4);
        }
    }
}
