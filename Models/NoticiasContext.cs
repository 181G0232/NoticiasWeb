using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace NoticiasWeb.Models
{
    public partial class NoticiasContext : DbContext
    {
        public NoticiasContext()
        {
        }

        public NoticiasContext(DbContextOptions<NoticiasContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Administrador> Administradores { get; set; } = null!;
        public virtual DbSet<Categoria> Categorias { get; set; } = null!;
        public virtual DbSet<Editor> Editores { get; set; } = null!;
        public virtual DbSet<Noticia> Noticias { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                // #warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                // optionsBuilder.UseMySql("server=localhost;user=root;password=root;database=Noticias", Microsoft.EntityFrameworkCore.ServerVersion.Parse("10.5.12-mariadb"));
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.UseCollation("utf8mb4_general_ci")
                .HasCharSet("utf8mb4");

            modelBuilder.Entity<Administrador>(entity =>
            {
                entity.ToTable("Administrador");

                entity.Property(e => e.Id).HasColumnType("int(11)");

                entity.Property(e => e.Contrasena)
                    .HasMaxLength(64)
                    .IsFixedLength();

                entity.Property(e => e.Nombre).HasMaxLength(30);
            });

            modelBuilder.Entity<Categoria>(entity =>
            {
                entity.Property(e => e.Id).HasColumnType("int(11)");

                entity.Property(e => e.Nombre).HasMaxLength(30);
            });

            modelBuilder.Entity<Editor>(entity =>
            {
                entity.ToTable("Editor");

                entity.Property(e => e.Id).HasColumnType("int(11)");

                entity.Property(e => e.Correo).HasMaxLength(50);

                entity.Property(e => e.Nombre).HasMaxLength(30);
            });

            modelBuilder.Entity<Noticia>(entity =>
            {
                entity.HasIndex(e => e.IdCategoria, "FKNoticiaCategoria");

                entity.HasIndex(e => e.IdEditor, "FKNoticiaEditor");

                entity.Property(e => e.Id).HasColumnType("int(11)");

                entity.Property(e => e.Contenido).HasColumnType("text");

                entity.Property(e => e.Fecha).HasColumnType("datetime");

                entity.Property(e => e.IdCategoria).HasColumnType("int(11)");

                entity.Property(e => e.IdEditor).HasColumnType("int(11)");

                entity.Property(e => e.Titulo).HasMaxLength(50);

                entity.HasOne(d => d.IdCategoriaNavigation)
                    .WithMany(p => p.Noticias)
                    .HasForeignKey(d => d.IdCategoria)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FKNoticiaCategoria");

                entity.HasOne(d => d.IdEditorNavigation)
                    .WithMany(p => p.Noticia)
                    .HasForeignKey(d => d.IdEditor)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FKNoticiaEditor");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
