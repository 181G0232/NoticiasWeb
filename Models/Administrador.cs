using System;
using System.Collections.Generic;

namespace NoticiasWeb.Models
{
    public partial class Administrador
    {
        public int Id { get; set; }
        public string Nombre { get; set; } = null!;
        public string? Contrasena { get; set; }
    }
}
