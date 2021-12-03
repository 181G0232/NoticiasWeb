using System;
using System.Collections.Generic;

namespace NoticiasWeb.Models
{
    public partial class Editor
    {
        public Editor()
        {
            Noticia = new HashSet<Noticia>();
        }

        public int Id { get; set; }
        public string Nombre { get; set; } = null!;
        public string Correo { get; set; } = null!;

        public virtual ICollection<Noticia> Noticia { get; set; }
    }
}
